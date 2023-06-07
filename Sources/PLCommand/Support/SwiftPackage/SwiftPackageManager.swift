import Foundation

public extension PLCommand {
    struct SwiftPackage {}
}

public extension PLCommand.SwiftPackage {
    /// Enum defining available package types when using the Swift Package Manager
    enum SwiftPackageType: String {
        case library
        case executable
        case empty
    }

    /// Enum defining available build configurations when using the Swift Package Manager
    enum SwiftBuildConfiguration: String {
        case debug
        case release
    }

    /// Create a Swift package
    ///
    /// - Parameter type: Swift Package Type for options
    static func create(type: SwiftPackageType = .library) -> PLCommand.Result {
        let command: PLCommand.Arguments = "swift package init --type \(type.rawValue)"
        return PLCommand.Bash.run(command)
    }

    /// Update package dependencies
    static func update() -> PLCommand.Result {
        PLCommand.Bash.run("swift package update")
    }

    /// Generate Xcode Project for a Swift Package
    static func generateXcodeproj() -> PLCommand.Result {
        PLCommand.Bash.run("swift package generate-xcodeproj")
    }

    /// Build a Swift Package
    ///
    /// - Parameter configuration: swift build configuration options
    static func build(configuration: SwiftBuildConfiguration = .debug) -> PLCommand.Result {
        return PLCommand.Bash.run("swift build -c \(configuration.rawValue)")
    }

    /// Test a Swift Package
    ///
    /// - Parameter configuration: swift test configuration options
    static func test(configuration: SwiftBuildConfiguration = .debug) -> PLCommand.Result {
        return PLCommand.Bash.run("swift test -c \(configuration.rawValue)")
    }
}
