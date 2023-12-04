import Foundation

/// Support Git Command
public struct Git {
    @Command(\.bash) var bash

    /// Initialize a git repository
    @discardableResult
    public func `init`(at path: String = ".") -> Result {
        return run(at: path, ["init"])
    }

    /// Adds a change in the working directory tothe staging area.
    ///
    /// - Parameter addPath: a path
    @discardableResult
    public func add(_ addPath: String = ".", at path: String = ".") -> Result {
        return run(at: path, ["add", "\(addPath)"])
    }

    /// Clone a git repository at a given URL
    @discardableResult
    public func clone(_ url: URL, to clonePath: String? = nil, allowingPrompt: Bool = true, at path: String = ".") -> Result {
        var arguments: String = "\(git(allowingPrompt: allowingPrompt)) clone \(url.absoluteString)"
        clonePath.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        return run(at: path, [arguments])
    }

    /// Create a git commit with given message
    @discardableResult
    public func commit(_ message: String, at path: String = ".") -> Result {
        var arguments = "git commit -m"
        arguments.append(argument: message)
        arguments.append(" --quiet")
        return run(at: path, [arguments])
    }

    /// Perform a git push
    @discardableResult
    public func push(remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true, at path: String = ".") -> Result {
        var arguments = "\(git(allowingPrompt: allowingPrompt)) push"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        return run(at: path, [arguments])
    }

    /// Perform a git pull
    @discardableResult
    public func pull(remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true, at path: String = ".") -> Result {
        var arguments = "\(git(allowingPrompt: allowingPrompt)) pull"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        return run(at: path, [arguments])
    }

    /// Checkout a given git branch
    @discardableResult
    public func checkout(branch: String, at path: String = ".") -> Result {
        let arguments = "checkout"
            .appending(argument: branch)
            .appending(argument: " --quiet")
        return run(at: path, [arguments])
    }

    /// Running Git Command
    @discardableResult
    public func run(at path: String = ".", _ arguments: [String]) -> Result {
        let command = ["cd \(path.escapingSpaces)", "&&" , "git"] + arguments
        let arguments = Arguments(command)
        return bash.run(arguments)
    }

    private func git(allowingPrompt: Bool) -> String {
        return allowingPrompt ? "git" : "env GIT_TERMINAL_PROMPT=0 git"
    }
}

extension CommandValues {
    /// Support Git Command
    public var git: Git {
        Git()
    }
}
