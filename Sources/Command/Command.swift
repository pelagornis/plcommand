import Foundation

@propertyWrapper
public struct Command<Value>: @unchecked Sendable {
    private let keyPath: KeyPath<CommandValues, Value>
    /// - Parameter keyPath: A key path to a specific resulting value.
    public init(_ keyPath: KeyPath<CommandValues, Value>) {
        self.keyPath = keyPath
    }
    /// The current value of the command property.
    public var wrappedValue: Value {
        let current = CommandValues.current
        return CommandValues.$current.withValue(current) {
            CommandValues.current[keyPath: self.keyPath]
        }
    }
}
