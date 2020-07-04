import XCTest
@testable import MobileProvision

final class MobileProvisionTests: XCTestCase {
    func testRead() {
        let provision = MobileProvision.read()
        XCTAssertNil(provision)
    }

    func testReadWith() {
        let fileName = "Test.mobileprovision"
        #if os(macOS) || targetEnvironment(macCatalyst)
        let filePath = "Contents/Resources/MobileProvision_MobileProvisionTests.bundle/Contents/Resources/\(fileName)"
        #else
        let filePath = "MobileProvision_MobileProvisionTests.bundle/\(fileName)"
        #endif
        let path = Bundle(for: Self.self).bundleURL.appendingPathComponent(filePath).path
        guard FileManager.default.fileExists(atPath: path) else {
            XCTAssert(false, "Read file error, should set your `Test.mobileprovision` file path.")
            return
        }
        let provision = MobileProvision.read(from: path)
        XCTAssertNotNil(provision, "MobileProvision parse faile.")
    }

    static var allTests = [
        ("testRead", testRead),
        ("testReadWith", testReadWith)
    ]
}
