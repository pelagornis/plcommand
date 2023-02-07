import XCTest
@testable import PLCommand

final class PLCommandTests: XCTestCase {
    func testBash() throws {
        let bash = PLCommand.Bash
        
        let echo = bash.run("echo Hello world")
        XCTAssertEqual(echo.output, "Hello world")
        
        let ls = bash.run("ls")
        XCTAssertFalse(ls.output.isEmpty)
    }
    
    func testZsh() throws {
        let zsh = PLCommand.ZSH
        
        let pwd = zsh.run("pwd").output
        let path = FileManager.default.currentDirectoryPath
        XCTAssertEqual(pwd, path)
    }
}
