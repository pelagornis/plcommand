/// The response from a command.
public struct Response {
    
    /// The status code returned by the command.
    public let statusCode: Int32
    
    /// The output of the command.
    public let output: String
    
    /// Any error messages generated by the command.
    public let error: String
}

extension Response: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
}
