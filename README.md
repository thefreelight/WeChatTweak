# WeChatTweak

[![README](https://img.shields.io/badge/GitHub-black?logo=github&logoColor=white)](https://github.com/thefreelight/WeChatTweak)
[![README](https://img.shields.io/badge/Telegram-black?logo=telegram&logoColor=white)](https://t.me/+_biDl1PEk_JiMzBk)
[![README](https://img.shields.io/badge/FAQ-black?logo=googledocs&logoColor=white)](https://github.com/thefreelight/WeChatTweak/wiki/FAQ)

A command-line tool for tweaking WeChat.

## 功能

- 阻止消息撤回
- 阻止自动更新
- 客户端多开

## 安装&使用

当前支持微信 macOS `4.1.11.80`（构建号 `269136`）的防撤回与多开，仅支持 `x86_64`。原生 `arm64` 补丁尚未开放；微信 `4.1.12.53`（构建号 `269365`）尚未验证，不应执行 Patch。

```bash
# 安装
brew install thefreelight/tap/wechattweak

# 更新
brew upgrade wechattweak

# 执行 Patch
wechattweak patch

# 查看所有支持的 WeChat 版本
wechattweak versions
```

## 参考

- [微信 macOS 客户端无限多开功能实践](https://blog.sunnyyoung.net/wei-xin-macos-ke-hu-duan-wu-xian-duo-kai-gong-neng-shi-jian/)
- [微信 macOS 客户端拦截撤回功能实践](https://blog.sunnyyoung.net/wei-xin-macos-ke-hu-duan-lan-jie-che-hui-gong-neng-shi-jian/)
- [让微信 macOS 客户端支持 Alfred](https://blog.sunnyyoung.net/rang-wei-xin-macos-ke-hu-duan-zhi-chi-alfred/)

## 贡献者

This project exists thanks to all the people who contribute.

[![Contributors](https://contrib.rocks/image?repo=thefreelight/WeChatTweak)](https://github.com/thefreelight/WeChatTweak/graphs/contributors)

## License

The [AGPL-3.0](LICENSE).
