import Foundation

extension Data {
  /// A string representation of the data, trimmed of leading/trailing whitespace and newlines.
  var output: String {
    guard let output = String(
      data: self,
      encoding: .utf8
    )?.trimmingCharacters(in: .whitespacesAndNewlines) else { return "" }
    return output
  }
}
