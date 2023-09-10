# Getting started

Learn how to quickly execute commands on Swift using PLCommand.

## Installation
PLCommand was deployed as Swift Package Manager. Package to install in a project. Add as a dependent item within the swift manifest.
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/pelagornis/plcommand.git", from: "1.2.1")
    ],
    ...
)
```
Then import the PLCommand from thr location you want to use.

```swift
import Command
```

## Using PLCommand
PLCommand offers the most commonly used `bash` and `zsh`, which in addition helps users scale easily.

If you want to use Bash.
```swift
@Command(\.bash) var bashCommand
bashCommand.run("command")
```
Or if you want to use zsh.
```swift
@Command(\.zsh) var zshCommand
zshCommand.run("command")
```


### Extension
PLCommand is easier to scale.

```swift
extension CommandValues {
    var swift: Alias {
        Alias(executableURL: "/usr/bin/swift")
    }
}

@Command(\.swift) var swiftCommand
```


## License
**plcommand** is under MIT license. See the [LICENSE](LICENSE) file for more info.
