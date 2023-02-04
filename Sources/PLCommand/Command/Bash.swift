import Foundation

/// Supporting Bash
extension PLCommand.Bash {
    @discardableResult
    public static func run(
        command: String,
        argument: [String],
        environment: [String : String] = [:],
        process: Process = .init()
    ) throws -> String {
        let command = "cd"
        let arguments: [String] = ["-c", command]
        
        return try process.launchShell(
            executableURL: "/bin/bash",
            arguments: arguments,
            currentDirectoryPath: "./",
            environment: environment
        )
    }
}
