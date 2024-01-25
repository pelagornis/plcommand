public extension CommandValues {
    /// An alias for running commands in Bash.
    var bash: Alias {
        Alias(executableURL: "/bin/bash", dashc: "-c")
    }
}
