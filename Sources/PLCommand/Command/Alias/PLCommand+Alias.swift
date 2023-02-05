import Foundation

extension PLCommand {
    public struct Alias {
        public let executableURL: String
        public let dashc: PLCommand.Arguments?
        
        public init(
            executableURL: String,
            dashc: PLCommand.Arguments? = nil
        ) {
            self.executableURL = executableURL
            self.dashc = dashc
        }
    }
}


public extension PLCommand.Alias {
    
}
