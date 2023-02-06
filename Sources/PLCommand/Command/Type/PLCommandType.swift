import Foundation

public extension PLCommand {
    static let Bash = PLCommand.Alias(executableURL: "/bin/bash", dashc: "-c")
    static let ZSH = PLCommand.Alias(executableURL: "/bin/zsh", dashc: "-c")
}
