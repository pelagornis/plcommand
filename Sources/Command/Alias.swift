/// An alias for a command that can be run with `Command`.
public struct Alias {
    /// The URL of the executable to run.
    public let executableURL: String
    
    /// The arguments to pass to the `-c` option of the command.
    public let dashc: Arguments?
    
    /// Creates a new `Alias`.
    ///
    /// - Parameters:
    ///   - executableURL: The URL of the executable to run.
    ///   - dashc: The arguments to pass to the `-c` option of the command.
    public init(
        executableURL: String,
        dashc: Arguments? = nil
    ) {
        self.executableURL = executableURL
        self.dashc = dashc
    }
}


public extension Alias {
    /// Prepares a `Command.Request` for the alias.
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to the command.
    ///   - environment: The environment in which to run the command.
    ///   - directory: The directory in which to run the command.
    /// - Returns: A `Command.Request` for the alias.
    func prepare(
        _ arguments: Arguments?,
        environment: Environment?,
        directory: String?
    ) -> Request {
        Request(
            environment: environment,
            executableURL: executableURL,
            dashc: dashc,
            arguments: arguments,
            directory: directory
        )
    }
    
    /// Runs the alias.
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to the command.
    ///   - environment: The environment in which to run the command.
    /// - Returns: The result of running the alias.
    @discardableResult
    func run(
        _ arguments: Arguments? = nil,
        environment: Environment = .global,
        log: Bool = false
    ) -> Result {
        let req = prepare(arguments, environment: environment)
        return Task().run(req, log: log)
    }

    /// Runs the alias.
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to the command.
    ///   - environment: The environment in which to run the command.
    ///   - directory: The directory in which to run the command.
    /// - Returns: The result of running the alias.
    @discardableResult
    func run(
        _ arguments: Arguments? = nil,
        environment: Environment = .global,
        directory: String? = nil,
        log: Bool = false
    ) -> Result {
        let req = prepare(
            arguments,
            environment: environment,
            directory: directory
        )
        return Task().run(req, log: log)
    }
}
