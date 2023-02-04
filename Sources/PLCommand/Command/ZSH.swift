import Foundation
/// Supporting Zsh
extension PLCommand.Zsh {
    @discardableResult
    public static func run(
        argument: [String],
        environment: [String : String] = [:],
        process: Process = .init()
    ) throws -> String {
        return try process.launchShell(
            executableURL: "/bin/zsh",
            arguments: argument,
            currentDirectoryPath: "./",
            environment: environment
        )
    }
}
