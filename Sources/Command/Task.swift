import Foundation
import Logging

/// The Task is Operation to execute Command.
public struct Task {
    let logger: Logger?

    public init(logger: Logger? = nil) {
        self.logger = logger
    }

    /// running command.
    @discardableResult
    public func run(
        _ request: Request,
        log: Bool
    ) -> Result {
        let process = prepare(request)

        let outputPipe = Pipe()
        let errorPipe = Pipe()

        process.standardOutput = outputPipe
        process.standardError = errorPipe

        do {
            try run(process: process)

            let outputActual = try fileHandleData(fileHandle: outputPipe.fileHandleForReading) ?? ""
            let errorActual = try fileHandleData(fileHandle: errorPipe.fileHandleForReading) ?? ""

            if process.terminationStatus == EXIT_SUCCESS {
                let res = Response(statusCode: process.terminationStatus, output: outputActual, error: errorActual)
                if let logger, log {
                    logger.debug(
                        "\(res.output)",
                        source: "command: \(request.arguments?.rawValue.joined(separator: " ") ?? "")"
                    )
                }
                return Result.success(request, res)
            } else {
                let res = Response(statusCode: process.terminationStatus, output: errorActual, error: errorActual)
                if let logger, log {
                    logger.error(
                        "\(res.error)",
                        source: "command: \(request.arguments?.rawValue.joined(separator: " ") ?? "")"
                    )
                }
                return Result.failure(request, res)
            }
        } catch let error {
            let res = Response(statusCode: EXIT_FAILURE, output: "", error: error.localizedDescription)
            return Result.failure(request, res)
        }
    }
}

public extension Task {
    /// Set the required parts before running the process
    func prepare(_ request: Request) -> Process {
        let process = Process()
        if #available(macOS 10.13, *) {
            process.executableURL = URL(path: request.executableURL)
        } else {
            process.launchPath = request.executableURL
        }
        if let environment = request.environment?.data {
            process.environment = environment
        }
        if let dashc = request.dashc {
            var arguments = dashc.rawValue
            arguments.append(contentsOf: request.arguments?.rawValue ?? [])
            process.arguments = arguments
        }
        return process
    }

    /// FileHandle preprocessing
    func fileHandleData(fileHandle: FileHandle) throws -> String? {
        var data: Data?
        if #available(macOS 10.15.4, *) {
            data = try fileHandle.readToEnd()
        } else {
            data = fileHandle.readDataToEndOfFile()
        }
        return data?.output
    }

    /// Process preprocessing
    func run(process: Process) throws {
        if #available(macOS 10.13, *) {
            try process.run()
        } else {
            process.launch()
        }
        process.waitUntilExit()
    }
}
