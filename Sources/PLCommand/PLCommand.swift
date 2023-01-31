import Foundation

public struct PLCommand {
    public struct Bash {}
    public struct Zsh {}
}

/// Supporting Bash
extension PLCommand.Bash: CommandExecute {
    static func run(
        command: String,
        argument: [String] = [],
        path: String = ".",
        process: Process = .init(),
        outputHandler: FileHandle? = nil,
        errorHandler: FileHandle? = nil
    ) throws -> String {
        return  ""
    }
}

/// Supporting Zsh
extension PLCommand.Zsh: CommandExecute {
    static func run(
        command: String,
        argument: [String] = [],
        path: String = ".",
        process: Process = .init(),
        outputHandler: FileHandle? = nil,
        errorHandler: FileHandle? = nil
    ) throws -> String {
        return ""
    }
}
