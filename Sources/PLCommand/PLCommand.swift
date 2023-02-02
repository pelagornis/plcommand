import Foundation

public struct PLCommand {
    public struct Bash {}
    public struct Zsh {}
}

/// Supporting Bash
extension PLCommand.Bash: CommandExecute {
    @discardableResult
    public static func run(
        argument: [String],
        environment: [String : String] = [:],
        process: Process = .init()
    ) throws -> String {        
        return try process.launchShell(
            executableURL: "/bin/bash",
            arguments: argument,
            environment: environment
        )
    }
}

/// Supporting Zsh
extension PLCommand.Zsh: CommandExecute {
    @discardableResult
    public static func run(
        argument: [String],
        environment: [String : String] = [:],
        process: Process = .init()
    ) throws -> String {
        return try process.launchShell(
            executableURL: "/bin/zsh",
            arguments: argument,
            environment: environment
        )
    }
}
