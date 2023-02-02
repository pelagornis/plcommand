import Foundation

extension Data {
    var output: String {
        guard let output = String(
            data: self,
            encoding: .utf8
        )?.trimmingCharacters(in: .whitespacesAndNewlines) else { return "" }
        return output
    }
}
