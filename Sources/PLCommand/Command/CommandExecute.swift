import Foundation

protocol CommandExecute {
    static func run(
        argument: [String],
        environment: [String : String],
        process: Process
    ) throws -> String
}
