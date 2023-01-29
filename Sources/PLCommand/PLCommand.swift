import Foundation

public struct PLCommand {
    public struct Bash {}
    public struct Zsh {}
}

/// Supporting Bash
extension PLCommand.Bash: CommandExecute {
    func run(
        command: String,
        argument: [String] = [],
        path: String = ".",
        process: Process = .init(),
        outputHandler: FileHandle? = nil,
        errorHandler: FileHandle? = nil
    ) throws -> String {
//        let command = "cd \(path.replacingCharacters(in: " ", with: "\\"))"
        return try process.launchShell()
    }
}

/// Supporting Zsh
extension PLCommand.Zsh: CommandExecute {
    func run(
        command: String,
        argument: [String] = [],
        path: String = ".",
        process: Process = .init(),
        outputHandler: FileHandle? = nil,
        errorHandler: FileHandle? = nil
    ) throws -> String {
        return try process.launchShell()
    }
}
