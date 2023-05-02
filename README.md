# PLCommand

![Swift](https://img.shields.io/badge/Swift-5.8-orange.svg)

﹥: Running Command from Swift

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

## Using
If you want to use Bash.
```swift
let bash = PLCommand.Bash
bash.run("{command}")
```
Or if you want to use zsh.
```swift
let zsh = PLCommand.ZSH
zsh.run("{command}")
```

### Extension
PLCommand is easier to scale.

```swift
extension PLCommand {
    static let Swift = PLCommand.Alias(executableURL: "/usr/bin/swift")
}

PLCommand.Swift.run("{command}")
```


## License
**PLCommand** is under MIT license. See the [LICENSE](LICENSE) file for more info.

