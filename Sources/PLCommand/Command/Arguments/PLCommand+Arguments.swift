import Foundation

/// A command-line command with arguments.
public extension PLCommand {

  /// The arguments for a command.
  struct Arguments {

    /// The raw values of the arguments.
    public let rawValue: [String]

    /// Create arguments from a single string.
    ///
    /// - Parameter value: The string to use as the argument.
    public init(_ value: String) {
      self.init([value])
    }

    /// Create arguments from an array of strings.
    ///
    /// - Parameter values: The array of strings to use as arguments.
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

extension PLCommand.Arguments: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: String...) {
    self.init(elements)
  }
}
