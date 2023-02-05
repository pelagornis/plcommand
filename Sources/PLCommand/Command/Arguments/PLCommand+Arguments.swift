import Foundation

public extension PLCommand {
    struct Arguments {
        public let rawValue: [String]
        
        public init(_ value: String) {
            self.init([value])
        }
        
        public init(_ values: [String]) {
            rawValue = values
        }
    }
}

extension PLCommand.Arguments: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension PLCommand.Arguments: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}

extension PLCommand.Arguments: ExpressibleByStringInterpolation {
    public init(stringInterpolation: DefaultStringInterpolation) {
        self.init(stringInterpolation.description)
    }
}

extension PLCommand.Arguments: Swift.ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: String...) {
    self.init(elements)
  }
}
