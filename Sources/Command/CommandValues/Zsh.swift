import Foundation

public extension CommandValues {
    /// An alias for running commands in Zsh.
    var zsh: Alias {
        Alias(executableURL: "/bin/zsh", dashc: "-c")
    }
}
