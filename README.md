# PLCommand
![Official](https://img.shields.io/badge/project-official-green.svg?colorA=303033&colorB=226af6&label=Pelagornis)
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
        .package(url: "https://github.com/pelagornis/plcommand.git", from: "1.2.0")
    ],
    ...
)
```
Then import the PLCommand from thr location you want to use.

```swift
import Command
```
## Documentation
The documentation for releases and ``main`` are available here:
- [``main``](https://pelagornis.github.io/plcommand/main/documentation/command)


## Using
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


## Frequently Used Commands
PLCommand supports frequently used features.

Support ``Git`` Command
```swift
@Command(\.git) var git

git.`init`()
git.add()
git.clone(repositoryURL)
git.commit("comment")
git.push()
git.pull(remote: "origin")
git.checkout(branch: "gh-page")
```

Support ``Swift Package`` Command

```swift
@Command(\.package) var swiftPackage

swiftPackage.create()
swiftPackage.create(type: .executable)
swiftPackage.update()
swiftPackage.generateXcodeproj()
swiftPackage.build()
swiftPackage.test()
```

### Extension
PLCommand is easier to scale.

```swift
extension CommandValues {
    var swift: Alias {
        Alias(executableURL: "/usr/bin/swift")
    }
}


// Usage
@Command(\.swift) var swiftCommand
```

## License
**plcommand** is under MIT license. See the [LICENSE](LICENSE) file for more info.
