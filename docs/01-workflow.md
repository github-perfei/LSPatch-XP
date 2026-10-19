# 工作流（电脑打包 → 手机安装）

## 准备

1. 从手机或 APKMirror / 官方渠道拿到**当前在用**的小鹏汽车 APK，放到 `apk/in/`，文件名建议带版本号。
2. 打开 https://github.com/BuSung-dev/SpoofMyDevice/releases ，下载 Release 里的模块 APK 到 `modules/`。
3. 下载 LSPatch 或 NPatch（GUI 或 jar/cli）放到 `tools/`。Android 16 优先试较新的 LSPatch / NPatch 构建。

## 打包（电脑）

1. 打开 LSPatch：选择 `apk/in/` 里的小鹏包。
2. 嵌入模块：勾选 `modules/` 里的 SpoofMyDevice。
3. 使用「便携模式 / Portable」一类选项（若有），便于改签后独立运行。
4. 输出到 `apk/out/`，记下包名是否仍为原包名（一般是，签名变了）。

也可用命令行（以你放入 `tools/` 的实际 jar 名为准，示例）：

```bat
scripts\patch.bat
```

先编辑 `scripts\patch.bat` 里的 jar 路径和文件名再跑。

## 手机安装（魅族 21）

1. 卸载商店版「小鹏汽车」（改签包与官方签名冲突）。
2. 允许安装未知来源，安装 `apk/out/` 产物。
3. 安装 SpoofMyDevice（同一 Release），打开一次。
4. 在 SpoofMyDevice：新建/导入配置 → 使用 `profiles/huawei-p40-pro.json` 中的字段 → 把「改签后的小鹏」绑到该配置。
5. 强制停止小鹏 → 再打开 → 登录 → 开无感开关。
6. Flyme：蓝牙、附近设备、自启动、后台、电量无限制。

## 升级小鹏 App 时

1. 新原包装进 `apk/in/`
2. 电脑重新 LSPatch
3. 覆盖安装或先卸再装（视签名是否变化）
4. 重新绑定 Spoof 配置并验收
