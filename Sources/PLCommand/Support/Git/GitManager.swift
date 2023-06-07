/// https://github.com/JohnSundell/ShellOut/blob/master/Sources/ShellOut.swift
import Foundation

public extension PLCommand {
    struct Git {}
}

public extension PLCommand.Git {
    /// Initialize a git repository
    static func `init`() -> PLCommand.Result {
        return PLCommand.Bash.run("git init")
    }

    /// Adds a change in the working directory tothe staging area.
    static func add(_ path: String = ".") -> PLCommand.Result {
        return PLCommand.Bash.run("git add \(path)")
    }

    /// Clone a git repository at a given URL
    static func clone(_ url: URL, to path: String? = nil, allowingPrompt: Bool = true) -> PLCommand.Result {
        var arguments: String = "\(git(allowingPrompt: allowingPrompt)) clone \(url.absoluteString)"
        path.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        let command = PLCommand.Arguments(arguments)
        return PLCommand.Bash.run(command)
    }

    /// Create a git commit with given message
    static func commit(_ message: String) -> PLCommand.Result{
        var arguments = "git commit -m"
        arguments.append(argument: message)
        arguments.append(" --quiet")
        let command = PLCommand.Arguments(arguments)
        return PLCommand.Bash.run(command)
    }

    /// Perform a git push
    static func push(remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true) -> PLCommand.Result {
        var arguments = "\(git(allowingPrompt: allowingPrompt)) push"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        let command = PLCommand.Arguments(arguments)
        return PLCommand.Bash.run(command)
    }
    
    /// Perform a git pull
    static func pull(remote: String? = nil, branch: String? = nil, allowingPrompt: Bool = true) -> PLCommand.Result {
        var arguments = "\(git(allowingPrompt: allowingPrompt)) pull"
        remote.map { arguments.append(argument: $0) }
        branch.map { arguments.append(argument: $0) }
        arguments.append(" --quiet")
        let command = PLCommand.Arguments(arguments)
        return PLCommand.Bash.run(command)
    }
    
    /// Checkout a given git branch
    static func checkout(branch: String) -> PLCommand.Result {
        let arguments = "git checkout"
            .appending(argument: branch)
            .appending(argument: " --quiet")
        let command = PLCommand.Arguments(arguments)
        return PLCommand.Bash.run(command)
    }
    
    private static func git(allowingPrompt: Bool) -> String {
        return allowingPrompt ? "git" : "env GIT_TERMINAL_PROMPT=0 git"
    }
}