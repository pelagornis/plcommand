import Foundation

extension PLCommand {
    public struct Response {
        public let statusCode: Int32
        public let output: String
        public let error: String
    }
}

extension PLCommand.Response: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
}
