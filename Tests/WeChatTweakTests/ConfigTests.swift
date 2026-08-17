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

    @Test func decodesWeChatFourOneTwelvePatch() async throws {
        let config = try await loadConfig(json: """
        [{"version":"269365","binary":"Contents/Resources/wechat.dylib","targets":[{"identifier":"revoke","entries":[{"arch":"x86_64","addr":"4f1c4a0","asm":"B801000000C3"}]}]}]
        """)

        #expect(config.version == "269365")
        #expect(config.binary == "Contents/Resources/wechat.dylib")
        #expect(config.targets.map(\.identifier) == ["revoke"])
        #expect(config.targets[0].entries[0].arch == .x86_64)
        #expect(config.targets[0].entries[0].addr == 0x4f1c4a0)
        #expect(config.targets[0].entries[0].asm == Data([0xB8, 0x01, 0x00, 0x00, 0x00, 0xC3]))
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
