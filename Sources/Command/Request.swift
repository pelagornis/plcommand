import Foundation

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

    /// Directory to run the command in.
    public let directory: String?

    /// Whether the command should be audited.
    public let audited: Bool
    
    public init(
        environment: Environment? = .global,
        executableURL: String,
        dashc: Arguments? = nil,
        arguments: Arguments? = nil,
        directory: String? = nil,
        audited: Bool = true
    ) {
        self.environment = environment
        self.executableURL = executableURL
        self.dashc = dashc
        self.arguments = arguments
        self.directory = directory
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
        for path in paths {
            let absoluteExecutableURL = "\(path)/\(executableURL)"
            if FileManager.default.fileExists(atPath: absoluteExecutableURL) {
                return absoluteExecutableURL
            }
        }
        return executableURL
    }
}
