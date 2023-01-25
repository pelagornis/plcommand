import Foundation

protocol CommandExecute {
    func make(command: String, argument: [String], path: String) throws -> String
    func run() throws -> String
}
