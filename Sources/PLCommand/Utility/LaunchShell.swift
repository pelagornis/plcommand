import Foundation

extension Process {
    func launchShell() throws -> String {

        
        return try ""
    }
}

private extension Process {
    func createPath(_ type: ShellType) {
        if #available(macOS 10.13, *) {
            executableURL = URL(fileURLWithPath: "/bin/\(type.rawValue)")
        } else {
            launchPath = "/bin/\(type.rawValue)"
        }
    }
}
