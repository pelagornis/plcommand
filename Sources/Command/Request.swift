/// The request from a command.
public struct Request {

    /// The environment to use for the command.
    public var environment: Environment? {
        didSet {
            if audited {
                self.executableURL = getAbsoluteExecutableURL()
            }
        }
    }

    /// The URL of the executable to run.
    public var executableURL: String {
        didSet {
            if audited {
                self.executableURL = getAbsoluteExecutableURL()
            }
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

private extension Request {
    func getAbsoluteExecutableURL() -> String {
        if FileManager.default.fileExists(atPath: executableURL) {
            return executableURL
        }
        guard let environment = environment else {
            return executableURL
        }
        let paths = environment["PATH"]?.split(separator: ":").map{ String($0) } ?? []
        guard paths.count > 0 else {
            return executableURL 
        }
        paths.forEach {
            let absoluteExecutableURL = "\($0)/\(executableURL)"
            if FileManager.default.fileExists(atPath: absoluteExecutableURL) {
                return absoluteExecutableURL
            }
        }
        return executableURL
    }
}
