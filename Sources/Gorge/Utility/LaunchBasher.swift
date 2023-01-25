import Foundation
import Dispatch

extension Process {
    func launchBasher(
        command: String,
        outputHandle: FileHandle? = nil,
        errorHandle: FileHandle? = nil
    ) throws -> String {
        if #available(macOS 10.13, *) {
            executableURL = URL(string: "/bin/bash")
        } else {
            launchPath = "/bin/bash"
        }
        arguments = ["-c", command]
        
        var outputData = Data()
        var errorData = Data()
        
        let outputPipe = Pipe()
        standardOutput = outputPipe
        
        let errorPipe = Pipe()
        standardError = errorPipe
        
        #if !os(Linux)
        outputPipe.fileHandleForReading.readabilityHandler = { handler in
            let data = handler.availableData
            
        }
        
        #endif
        
        return try ""
    }
}
