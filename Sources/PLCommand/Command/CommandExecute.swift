import Foundation

protocol CommandExecute {
    static func run(
        command: String,
        argument: [String],
        path: String,
        process: Process,
        outputHandler: FileHandle?,
        errorHandler: FileHandle?
    ) throws -> String
}
