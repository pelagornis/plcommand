import Foundation

/// The Task is Operation to execute PLCommand.
public enum Task {
    /// running command.
    @discardableResult
    static func run(_ request: Request) -> Result {
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
                return Result.success(request, res)
            } else {
                let res = Response(statusCode: process.terminationStatus, output: errorActual, error: errorActual)
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
    static func prepare(_ request: Request) -> Process {
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
    static func fileHandleData(fileHandle: FileHandle) throws -> String? {
        var data: Data?
        if #available(macOS 10.15.4, *) {
            data = try fileHandle.readToEnd()
        } else {
            data = fileHandle.readDataToEndOfFile()
        }
        return data?.output
    }

    /// Process preprocessing
    static func run(process: Process) throws {
        if #available(macOS 10.13, *) {
            try process.run()
        } else {
            process.launch()
        }
        process.waitUntilExit()
    }
}
