import Foundation

extension PLCommand {
    public struct Environment {
        //MARK: - Property
        public private(set) var data: [String : String] = [:]
        public static var global = PLCommand.Environment()

        //MARK: - Initalizer
        public init(
            _ data: [String : String] = ProcessInfo.processInfo.environment
        ) {
            self.data = data
        }
        
        subscript(_ key: String) -> String? {
            get {
                return data[key]
            }
            set(newValue) {
                data[key] = newValue
            }
        }
        
        mutating func add(_ path: String) {
            data["PATH"] = data["PATH"] == nil ? path : "\(path):\(data["PATH"]!)"
        }
    }
}

extension PLCommand.Environment: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, String)...) {
        self.init(elements.reduce(into: [String : String](), { $0[$1.0] = $1.1 }))
    }
}

extension PLCommand.Environment: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.data == rhs.data
    }
}
