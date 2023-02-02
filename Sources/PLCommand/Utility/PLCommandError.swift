import Foundation

struct PLCommandError: Error {
    public let terminationStatus: Int32
    public let error: String
    public let output: String
}
