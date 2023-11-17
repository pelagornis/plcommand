import Foundation

public struct Fastlane {
    @Command(\.bash) var bash
    
    /// Setting up fastlane
    @discardableResult
    public func `init`() -> Result {
        run("init")
    }
    
    /// Running iOS tests using fastlane
    @discardableResult
    public func tests() -> Result {
        run("tests")
    }
    
    /// Running Snapshot
    @discardableResult
    public func snapshot() -> Result {
        run("snapshot")
    }
    
    /// Upload Screenshots to the App Store
    @discardableResult
    public func deliver() -> Result {
        run("deliver")
    }
    
    /// Screenshots Into Device Frames
    @discardableResult
    public func frameit() -> Result {
        run("frameit")
    }
    
    /// Run Fastlane using a given lane
    @discardableResult
    public func run(_ lane: String) -> Result {
        return bash.run("fastlane \(lane)")
    }
}
