import Foundation

/// Quickly execute frequently used Swift Package commands from within Swift code.
public struct SwiftPackage {
    /// Enum defining available package types when using the Swift Package Manager
    public enum SwiftPackageType: String {
        case library
        case executable
        case empty
    }

    /// Enum defining available build configurations when using the Swift Package Manager
    public enum SwiftBuildConfiguration: String {
        case debug
        case release
    }

    /// Create a Swift package
    ///
    /// - Parameter type: Swift Package Type for options
    @discardableResult
    public static func create(type: SwiftPackageType = .library) -> PLCommand.Result {
        let command: PLCommand.Arguments = "swift package init --type \(type.rawValue)"
        return PLCommand.Bash.run(command)
    }

    /// Update package dependencies
    @discardableResult
    public static func update() -> PLCommand.Result {
        PLCommand.Bash.run("swift package update")
    }

    /// Generate Xcode Project for a Swift Package
    @discardableResult
    public static func generateXcodeproj() -> PLCommand.Result {
        PLCommand.Bash.run("swift package generate-xcodeproj")
    }

    /// Build a Swift Package
    ///
    /// - Parameter configuration: swift build configuration options
    @discardableResult
    public static func build(configuration: SwiftBuildConfiguration = .debug) -> PLCommand.Result {
        return PLCommand.Bash.run("swift build -c \(configuration.rawValue)")
    }

    /// Test a Swift Package
    ///
    /// - Parameter configuration: swift test configuration options
    @discardableResult
    public static func test(configuration: SwiftBuildConfiguration = .debug) -> PLCommand.Result {
        return PLCommand.Bash.run("swift test -c \(configuration.rawValue)")
    }
}
