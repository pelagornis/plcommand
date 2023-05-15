#  Getting started

Learn how to quickly execute commands on Swift using PLCommand.

## Installation
PLCommand was deployed as Swift Package Manager. Package to install in a project. Add as a dependent item within the swift manifest.
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/Pelagornis/PLCommand.git", from: "1.0.1")
    ],
    ...
)
```
Then import the PLCommand from thr location you want to use.

```swift
import PLCommand
```

## Using PLCommand
PLCommand offers the most commonly used Bash and ZSH, which in addition helps users scale easily.

### Bash
If you want to use Bash.

```swift
let bash = PLCommand.Bash
bash.run("{Command}")
```

### Zsh
If you want to use Zsh.

```swift
let zsh = PLCommand.ZSH
zsh.run("{command}")
```

### Request
You can modify the request directly.

```swift
let req = PLCommand.Request(
    executableURL: "/bin/bash",
    dashc: "-c",
    arguments: "pwd"
)
PLCommand.Task.run(req)
```

### Extension
Expand the PLCommand to add the features you want.

```swift
extension PLCommand {
    static let Swift = PLCommand.Alias(executableURL: "/usr/bin/swift")
}
```

How to use it when expanded like an example.
```swift
PLCommand.Swift.run("{command}")
```
