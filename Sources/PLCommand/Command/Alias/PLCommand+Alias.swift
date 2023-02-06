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
    func prepare(
        _ arguments: PLCommand.Arguments? = nil,
        environment: PLCommand.Environment = .global
    ) -> PLCommand.Request {
        PLCommand.Request(
            environment: environment,
            executableURL: executableURL,
            dashc: dashc,
            arguments: arguments
        )
    }
    
    @discardableResult
    func run(
        _ arguments: PLCommand.Arguments? = nil,
        environment: PLCommand.Environment = .global
    ) -> PLCommand.Result {
        let req = prepare(arguments, environment: environment)
        return PLCommand.Task.run(req)
    }
}
