/// The request from a command.
public struct Request {

    /// The environment to use for the command.
    public var environment: Environment? {
        didSet {
            self.executableURL = ""
        }
    }

    /// The URL of the executable to run.
    public var executableURL: String {
        didSet {
            self.executableURL = ""
        }
    }

    /// Arguments to pass to the command with the `-c` flag.
    public var dashc: Arguments?

    /// Arguments to pass to the command.
    public var arguments: Arguments?

    /// Whether the command should be audited.
    public let audited: Bool
    
    public init(
        environment: Environment? = .global,
        executableURL: String,
        dashc: Arguments? = nil,
        arguments: Arguments? = nil,
        audited: Bool = true
    ) {
        self.environment = environment
        self.executableURL = executableURL
        self.dashc = dashc
        self.arguments = arguments
        self.audited = audited
    }
}
