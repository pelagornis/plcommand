import Foundation

extension PLCommand {
    public struct Request {
        public var environment: Environment? {
            didSet {
                self.executableURL = ""
            }
        }
        public var executableURL: String {
            didSet {
                self.executableURL = ""
            }
        }
        public var dashc: Arguments?
        public var arguments: Arguments?
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
}
