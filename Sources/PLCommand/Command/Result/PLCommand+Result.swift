import Foundation

public extension PLCommand {
    enum Result {
        case success(_ req: Request, _ res: Response)
        case failure(_ req: Request, _ res: Response)
    }
}

public extension PLCommand.Result {
    var request: PLCommand.Request {
      switch self {
      case .success(let request, _):
        return request
      case .failure(let request, _):
        return request
      }
    }
    
    var response: PLCommand.Response {
      switch self {
      case .success(_, let response):
        return response
      case .failure(_, let response):
        return response
      }
    }
    
    var statusCode: Int32 {
      return response.statusCode
    }
    
    var output: String {
      return response.output
    }
    
    var errorOutput: String {
      return response.error
    }
}

extension PLCommand.Request: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.environment == rhs.environment
        && lhs.executableURL == rhs.executableURL
        && lhs.dashc == rhs.dashc
        && lhs.arguments == rhs.arguments
        && lhs.audited == rhs.audited
    }
}
