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
    public func add(at path: String = ".", _ addPath: String = ".") -> Result {
        return run(at: path, ["add", "\(addPath)"])
    }

    /// Clone a git repository at a given URL
    @discardableResult
    public func clone(at path: String = ".", _ url: URL, to clonePath: String? = nil, allowingPrompt: Bool = true) -> Result {
        var arguments: String = "clone \(url.absoluteString)"
        clonePath.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        return run(at: path, [arguments], allowingPrompt)
    }

    /// Create a git commit with given message
    @discardableResult
    public func commit(at path: String = ".", _ message: String) -> Result {
        var arguments = "commit -m"
        arguments.append(argument: message)
        arguments.append(" --quiet")
        return run(at: path, [arguments])
    }

    /// Perform a git push
    @discardableResult
    public func push(at path: String = ".", remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true) -> Result {
        var arguments = "push"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        return run(at: path, [arguments], allowingPrompt)
    }

    /// Perform a git pull
    @discardableResult
    public func pull(
        at path: String = ".", 
        remote: String? = nil, 
        branch: String? = nil, 
        allowingPrompt: Bool = true
    ) -> Result {
        var arguments = "pull"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        return run(at: path, [arguments], allowingPrompt)
    }

    /// Checkout a given git branch
    @discardableResult
    public func checkout(
        at path: String = ".",
        branch: String
    ) -> Result {
        let arguments = "checkout"
            .appending(argument: branch)
            .appending(argument: " --quiet")
        return run(at: path, [arguments])
    }

    /// Running Git Command
    @discardableResult
    public func run(
        at path: String?,
        _ arguments: [String],
        _ allowingPrompt: Bool = true
    ) -> Result {
        let command = [git(allowingPrompt: allowingPrompt)] + arguments
        let arguments = Arguments(command)
        return bash.run(arguments, directory: path)
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
