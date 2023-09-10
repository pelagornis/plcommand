/// https://github.com/JohnSundell/ShellOut/blob/master/Sources/ShellOut.swift
import Foundation

extension String {
    var escapingSpaces: String {
        replacingOccurrences(of: "", with: "\\ ")
    }
    
    func appending(argument: String) -> String {
        return "\(self) \"\(argument)\""
    }
    
    func appending(arguments: [String]) -> String {
        return appending(argument: arguments.joined(separator: "\" \""))
    }
    
    mutating func append(argument: String) {
        self = appending(argument: argument)
    }
    
    mutating func append(arguments: [String]) {
        self = appending(arguments: arguments)
    }
}
