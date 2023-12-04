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
    
    func testGit() throws {
        @Command(\.git) var git
        @Command(\.bash) var bash
        let tempFolderPath = NSTemporaryDirectory()
        bash.run("cd \(tempFolderPath.escapingSpaces) && rm -rf GitTestOrigin")
        bash.run("cd \(tempFolderPath.escapingSpaces) && rm -rf GitTestClone")

        let originPath = tempFolderPath + "GitTestOrigin"
        let mkdirCommand = "mkdir".appending(argument: "GitTestOrigin")
        bash.run("cd \(tempFolderPath.escapingSpaces) && \(mkdirCommand)")
        git.`init`(at: originPath)
        var echoCommand = "echo"
        echoCommand.append(argument: "Hello world")
        echoCommand.append(" > ")
        echoCommand.append(argument: "Test")
        bash.run("cd \(originPath.escapingSpaces) && \(echoCommand)")
        git.add(at: originPath)
        git.commit(at: originPath, "Commit")
        let clonePath = tempFolderPath + "GitTestClone"
        let cloneURL = URL(fileURLWithPath: originPath)
        git.clone(at: tempFolderPath, cloneURL, to: "GitTestClone")

        let filePath = clonePath + "/Test"
        XCTAssertEqual(bash.run("cat \(filePath)").output, "Hello world")
    }

    func testSwiftPackageManagerCommands() throws {
        @Command(\.bash) var bash
        @Command(\.package) var swiftPackage
        let tempFolderPath = NSTemporaryDirectory()
        bash.run("cd \(tempFolderPath.escapingSpaces) && rm -rf SwiftPackageManagerTest")
        bash.run("cd \(tempFolderPath.escapingSpaces) && mkdir SwiftPackageManagerTest")
        
        let packagePath = tempFolderPath + "/SwiftPackageManagerTest"
        swiftPackage.create(at: packagePath)
        XCTAssertFalse(bash.run("cat \(packagePath)/Package.swift").output.isEmpty)
        
        swiftPackage.build(at: packagePath)
        XCTAssertTrue(bash.run("cd \(packagePath.escapingSpaces) && ls -a").output.contains(".build"))
    }
}
