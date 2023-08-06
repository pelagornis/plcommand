# PLCommand
![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)
![Swift](https://img.shields.io/badge/Swift-5.7-orange.svg)
[![License](https://img.shields.io/github/license/pelagornis/PLCommand)](https://github.com/pelagornis/PLCommand/blob/main/LICENSE)
![Platform](https://img.shields.io/badge/platforms-macOS%2010.5-red)

﹥: Running Command from Swift

## Installation
PLCommand was deployed as Swift Package Manager. Package to install in a project. Add as a dependent item within the swift manifest.
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/pelagornis/plcommand.git", from: "1.1.1")
    ],
    ...
)
```
Then import the PLCommand from thr location you want to use.

```swift
import PLCommand
```
## Documentation
The documentation for releases and ``main`` are available here:
- [``main``](https://pelagornis.github.io/plcommand/main/documentation/plcommand)


## Using
If you want to use Bash.
```swift
let bash = PLCommand.Bash
bash.run("command")
```
Or if you want to use zsh.
```swift
let zsh = PLCommand.ZSH
zsh.run("command")
```

## Frequently Used Commands
PLCommand supports frequently used features.

### Git
```swift
PLCommand.Git.`init`()
PLCommand.Git.add()
PLCommand.Git.clone(repositoryURL)
PLCommand.Git.commit("comment")
PLCommand.Git.push()
PLCommand.Git.pull(remote: "origin")
PLCommand.Git.checkout(branch: "gh-page")
```

### Swift Package Manager
```swift
PLCommand.SwiftPackage.create()
PLCommand.SwiftPackage.create(type: .executable)
PLCommand.SwiftPackage.update()
PLCommand.SwiftPackage.generateXcodeproj()
PLCommand.SwiftPackage.build()
PLCommand.SwiftPackage.test()
```

> PLCommand will provide more functionality in the future.


### Extension
PLCommand is easier to scale.

```swift
extension PLCommand {
    static let Swift = PLCommand.Alias(executableURL: "/usr/bin/swift")
}

PLCommand.Swift.run("{command}")
```


## License
**plcommand** is under MIT license. See the [LICENSE](LICENSE) file for more info.
