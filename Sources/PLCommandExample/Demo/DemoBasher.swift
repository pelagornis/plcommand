import Foundation
import PLCommand

final class MockBashDemo {
    let bash = PLCommand.Bash
    
    func run() throws {
        print(bash.run("pwd").output == FileManager.default.currentDirectoryPath)
        bash.run("pwd")
    }
}

final class MockZshDemo {
    
}
