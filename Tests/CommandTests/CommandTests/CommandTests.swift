import XCTest
@testable import Command

final class CommandTests: XCTestCase {
    func testBash() throws {
        @Command(\.bash) var bash
        let echo = bash.run("echo Hello world")
        XCTAssertEqual(echo.output, "Hello world")
        
        let ls = bash.run("ls")
        XCTAssertFalse(ls.output.isEmpty)
    }
    
    func testZsh() throws {
        @Command(\.zsh) var zsh
        
        let pwd = zsh.run("pwd").output
        let path = FileManager.default.currentDirectoryPath
        XCTAssertEqual("/private" + pwd, path)
    }
}
