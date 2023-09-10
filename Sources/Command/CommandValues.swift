import Foundation

/// A collection of globally available commands.
public struct CommandValues: Sendable {
    @TaskLocal public static var current = Self()
    //MARK: - Initializer
    /// Creates a command values instance.
    public init() {}
}
