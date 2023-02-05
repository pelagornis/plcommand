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
    }
}
