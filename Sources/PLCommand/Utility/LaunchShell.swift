import Foundation

extension Process {
    func launchShell(
        executableURL: String,
        arguments: [String],
        environment: [String: String],
        path: String
    ) throws -> String {
        
        return try ""
    }
}

private extension Process {
    func createPath(
        executableURL: String,
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
        
    }
    
    func fileHandle(data: Data, fileHandle: FileHandle) throws -> String {
        var data: Data?
        if #available(macOS 10.15.4, *) {
            data = try fileHandle.readToEnd()
        } else {
            data = fileHandle.readDataToEndOfFile()
        }
        
        return try ""
    }
    
    
    func run() throws {
        if #available(macOS 10.13, *) {
            try self.run()
        } else {
            self.launch()
        }
        waitUntilExit()
    }
}
