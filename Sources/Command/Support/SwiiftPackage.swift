import Foundation

public struct SwiftPackage {
    @Command(\.bash) private var bash

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
    public func create(type: SwiftPackageType = .library) -> Result {
        let command: Arguments = "swift package init --type \(type.rawValue)"
        return bash.run(command)
    }

    /// Update package dependencies
    @discardableResult
    public func update() -> Result {
        bash.run("swift package update")
    }

    /// Generate Xcode Project for a Swift Package
    @discardableResult
    public func generateXcodeproj() -> Result {
        bash.run("swift package generate-xcodeproj")
    }

    /// Build a Swift Package
    ///
    /// - Parameter configuration: swift build configuration options
    @discardableResult
    public func build(configuration: SwiftBuildConfiguration = .debug) -> Result {
        return bash.run("swift build -c \(configuration.rawValue)")
    }

    /// Test a Swift Package
    ///
    /// - Parameter configuration: swift test configuration options
    @discardableResult
    public func test(configuration: SwiftBuildConfiguration = .debug) -> Result {
        return bash.run("swift test -c \(configuration.rawValue)")
    }
}

extension CommandValues {
    /// Support Swift Package Command
    public var package: SwiftPackage {
        SwiftPackage()
    }
}
