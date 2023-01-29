import Foundation

protocol CommandExecute {
    func run(
        command: String,
        argument: [String],
        path: String,
        process: Process,
        outputHandler: FileHandle?,
        errorHandler: FileHandle?
    ) throws -> String
}
