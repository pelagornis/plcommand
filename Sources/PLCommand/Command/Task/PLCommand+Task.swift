import Foundation

public extension PLCommand {
    enum Task {}
}

public extension PLCommand.Task {
    @discardableResult
    static func run(_ request: PLCommand.Request) throws -> String {
        let process = prepare(request)
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()

        process.standardOutput = outputPipe
        process.standardError = errorPipe
        
        do {
            try run(process: process)
            
            let outputActual = try fileHandleData(fileHandle: outputPipe.fileHandleForReading) ?? ""
            let errorActual = try fileHandleData(fileHandle: errorPipe.fileHandleForReading) ?? ""
            
            if process.terminationStatus != 0 {
                throw PLCommandError(
                    terminationStatus: process.terminationStatus,
                    error: errorActual,
                    output: outputActual
                )
            }
            return outputActual
        } catch {
            throw PLCommandError(
                terminationStatus: EXIT_FAILURE,
                error: error.localizedDescription,
                output: ""
            )
        }
    }
}

public extension PLCommand.Task {
    static func prepare(_ request: PLCommand.Request) -> Process {
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
    
    static func fileHandleData(fileHandle: FileHandle) throws -> String? {
        var data: Data?
        if #available(macOS 10.15.4, *) {
            data = try fileHandle.readToEnd()
        } else {
            data = fileHandle.readDataToEndOfFile()
        }
        return data?.output
    }
    
    static func run(process: Process) throws {
        if #available(macOS 10.13, *) {
            try process.run()
        } else {
            process.launch()
        }
        process.waitUntilExit()
    }
}
