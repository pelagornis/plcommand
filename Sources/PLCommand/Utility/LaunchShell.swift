import Foundation

extension Process {
    func launchShell(
        executableURL: String,
        arguments: [String] = [],
        environment: [String: String]? = nil
    ) throws -> String {
        createPath(
            executableURL: executableURL,
            arguments: arguments,
            environment: environment
        )
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        
        standardOutput = outputPipe
        standardError = errorPipe
        
        try running()

        let outputActual = try fileHandleData(fileHandle: outputPipe.fileHandleForReading)
        let errorActual = try fileHandleData(fileHandle: errorPipe.fileHandleForReading)
        
        if terminationStatus != 0 {
            throw PLCommandError(
                terminationStatus: terminationStatus,
                error: errorActual ?? "",
                output: outputActual ?? ""
            )
        }
        return outputActual ?? ""
    }
}

private extension Process {

    func createPath(
        executableURL: String,
        arguments: [String],
        environment: [String: String]?
    ) {
        if #available(macOS 10.13, *) {
            self.executableURL = URL(fileURLWithPath: executableURL)
        } else {
            launchPath = executableURL
        }
        if let environment = environment {
            self.environment = environment
        }
        self.arguments = arguments
    }

    func fileHandleData(fileHandle: FileHandle) throws -> String? {
        var data: Data?
        if #available(macOS 10.15.4, *) {
            data = try fileHandle.readToEnd()
        } else {
            data = fileHandle.readDataToEndOfFile()
        }
        return data?.output
    }

    func running() throws {
        if #available(macOS 10.13, *) {
            try self.run()
        } else {
            self.launch()
        }
        waitUntilExit()
    }
}
