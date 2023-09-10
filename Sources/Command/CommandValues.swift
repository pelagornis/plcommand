import Foundation

public struct CommandValues: Sendable {
    @TaskLocal public static var current = Self()
    //MARK: - Initializer
    public init() {}
}
