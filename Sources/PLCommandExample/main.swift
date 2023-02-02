import PLCommand
import Foundation

do {
    try MockBashDemo.mkdir()
} catch let error {
    print(error)
    exit(1)
}
