# Xiaopeng P5 · 无感解锁（非 Root / LSPatch）

目标机：魅族 21 · Android 16  
方案：电脑用 LSPatch 把 SpoofMyDevice 打进小鹏 App → 手机安装 → 伪装白名单机型 → 开启蓝牙无感解闭锁。

## 已就绪产物

| 路径 | 说明 |
|------|------|
| `tools/jdk-21/` | Temurin JDK 21（跑 LSPatch） |
| `tools/lspatch-v1.2-487-release.jar` | LSPatch CLI |
| `tools/manager-v1.2-487-release.apk` | LSPatch 手机端（可选） |
| `modules/SpoofMyDevice-v2.0.1.apk` | 机型伪装模块 |
| `apk/in/` | 官方/镜像小鹏原包 |
| `apk/out/*-lspatched.apk` | **要装到手机的改签包** |
| `profiles/huawei-p40-pro.json` | 推荐伪装字段 |
| `scripts/patch.bat` | 一键重打包 |

手机需安装：

1. `apk/out/xiaopeng-mycarinfo-appchina-487-lspatched.apk`
2. `modules/SpoofMyDevice-v2.0.1.apk`

## 重打包

```bat
scripts\patch.bat
```

需要代理时（本机示例）：

```powershell
$env:HTTP_PROXY="http://127.0.0.1:7897"
$env:HTTPS_PROXY="http://127.0.0.1:7897"
```

## 文档

- `docs/01-workflow.md` — 工作流
- `docs/02-acceptance.md` — 真车验收

## 注意

- 仅供本人车辆调试；非官方方案，测距未标定。
- 大体积 APK / JDK 默认不进 Git（见 `.gitignore`）；需要自行按文档下载或从本机拷贝。
- 物理钥匙请保留兜底。
