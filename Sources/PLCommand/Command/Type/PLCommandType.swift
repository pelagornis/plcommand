import Foundation

public extension PLCommand {

  /// An alias for running commands in Bash.
  static let Bash = PLCommand.Alias(executableURL: "/bin/bash", dashc: "-c")

  /// An alias for running commands in Zsh.
  static let ZSH = PLCommand.Alias(executableURL: "/bin/zsh", dashc: "-c")
}
