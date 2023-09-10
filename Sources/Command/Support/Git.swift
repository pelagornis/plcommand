import Foundation

public struct Git {
    @Command(\.bash) var bash

    /// Initialize a git repository
    @discardableResult
    public func `init`() -> Result {
        return bash.run("git init")
    }

    /// Adds a change in the working directory tothe staging area.
    ///
    /// - Parameter path: a path
    @discardableResult
    public func add(_ path: String = ".") -> Result {
        return bash.run("git add \(path)")
    }

    /// Clone a git repository at a given URL
    @discardableResult
    public func clone(_ url: URL, to path: String? = nil, allowingPrompt: Bool = true) -> Result {
        var arguments: String = "\(git(allowingPrompt: allowingPrompt)) clone \(url.absoluteString)"
        path.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        let command = Arguments(arguments)
        return bash.run(command)
    }

    /// Create a git commit with given message
    @discardableResult
    public func commit(_ message: String) -> Result {
        var arguments = "git commit -m"
        arguments.append(argument: message)
        arguments.append(" --quiet")
        let command = Arguments(arguments)
        return bash.run(command)
    }

    /// Perform a git push
    @discardableResult
    public func push(remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true) -> Result {
        var arguments = "\(git(allowingPrompt: allowingPrompt)) push"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        let command = Arguments(arguments)
        return bash.run(command)
    }
    
    /// Perform a git pull
    @discardableResult
    public func pull(remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true) -> Result {
        var arguments = "\(git(allowingPrompt: allowingPrompt)) pull"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        let command = Arguments(arguments)
        return bash.run(command)
    }
    
    /// Checkout a given git branch
    @discardableResult
    public func checkout(branch: String) -> Result {
        let arguments = "git checkout"
            .appending(argument: branch)
            .appending(argument: " --quiet")
        let command = Arguments(arguments)
        return bash.run(command)
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
