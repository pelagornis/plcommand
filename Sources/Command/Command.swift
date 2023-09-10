import Foundation

/// A property wrapper for accessing dependencies.
///
/// All Commands are stored in  ``CommandValues`` and one uses this property wrapper.
///
/// ```swift
/// final class Feature {
///    @Command(\.zsh) var zsh
///    @Command(\.bash) var bash
///
///    // ...
/// }
/// ```
///
/// ```swift
/// struct Feature {
///    @Command(\.zsh) var zsh
///    @Command(\.bash) var bash
///
///    // ...
/// }
/// ```
/// It can be used in other situations too
/// ```swift
/// func run() {
///    @Command(\.zsh) var zsh
///    zsh.run("command")
/// }
/// ```
@propertyWrapper
public struct Command<Value>: @unchecked Sendable {

    private let keyPath: KeyPath<CommandValues, Value>

    /// Creates a command property to read the specified key path.
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
