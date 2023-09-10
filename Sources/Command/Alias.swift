import Foundation

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
    /// Prepares a `PLCommand.Request` for the alias.
    ///
    /// - Parameters:
    ///   - arguments: The arguments to pass to the command.
    ///   - environment: The environment in which to run the command.
    /// - Returns: A `PLCommand.Request` for the alias.
    func prepare(
        _ arguments: Arguments? = nil,
        environment: Environment = .global
    ) -> Request {
        Request(
            environment: environment,
            executableURL: executableURL,
            dashc: dashc,
            arguments: arguments
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
        environment: Environment = .global
    ) -> Result {
        let req = prepare(arguments, environment: environment)
        return Task.run(req)
    }
}
