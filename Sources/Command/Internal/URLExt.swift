import Foundation

extension URL {

  /// Creates a `URL` instance from a file path.
  ///
  /// - Parameter path: The file path to create the `URL` from.
  init(path: String) {
    if #available(macOS 13.0, *) {
      self.init(filePath: path)
    } else {
      self.init(fileURLWithPath: path)
    }
  }
}
