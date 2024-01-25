public extension CommandValues {
    /// An alias for running commands in Make.
    var make: Alias {
        Alias(executableURL: "/usr/bin/make")
    }
}
