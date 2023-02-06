import PLCommand
import Foundation

do {
    try MockBashDemo().run()
} catch let error {
    print(error)
    exit(1)
}
