import Foundation

extension Process {
    func launchShell(
        executableURL: String,
        arguments: [String],
        environment: [String: String],
        path: String
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
        
        
        return ""
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
    
    func fileHandleData(data: Data, fileHandle: FileHandle) throws -> String? {
        var data: Data?
        if #available(macOS 10.15.4, *) {
            data = try fileHandle.readToEnd()
        } else {
            data = fileHandle.readDataToEndOfFile()
        }
        if let outputData = data {
            return String(data: outputData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return nil
    }
    
    func fileHandleDataReading(pipe: Pipe, data: Data, fileHandler: FileHandle) {
        pipe.fileHandleForReading.readabilityHandler = { handler in
            
        }
    }
    
    func run() throws {
        if #available(macOS 10.13, *) {
            try? self.run()
        } else {
            self.launch()
        }
        waitUntilExit()
    }
}
