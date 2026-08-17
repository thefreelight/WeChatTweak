import Foundation
import Testing
@testable import WeChatTweak

struct ConfigTests {
    @Test func defaultsToMainExecutable() async throws {
        let config = try await loadConfig(json: """
        [{"version":"1","targets":[]}]
        """)

        #expect(config.binary == Config.defaultBinary)
    }

    @Test func decodesVersionSpecificBinary() async throws {
        let config = try await loadConfig(json: """
        [{"version":"269136","binary":"Contents/Resources/wechat.dylib","targets":[]}]
        """)

        #expect(config.binary == "Contents/Resources/wechat.dylib")
    }

    private func loadConfig(json: String) async throws -> Config {
        let file = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("json")
        try Data(json.utf8).write(to: file, options: .atomic)
        defer { try? FileManager.default.removeItem(at: file) }
        return try #require(await Config.load(url: file).first)
    }
}
