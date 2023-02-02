import Foundation
import PLCommand

final class MockBashDemo {
    static func mkdir() throws  {
        let argument: [String] = ["-c", "cd /Users/ji-hoonahn/Desktop/ && mkdir S"]
        try PLCommand.Bash.run(argument: argument)
    }
}

final class MockZshDemo {
    
}
