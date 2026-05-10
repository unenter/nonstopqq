# NonStopQQ Docker

[![Docker Pulls](https://img.shields.io/docker/pulls/reenter/nonstopqq.svg)](https://hub.docker.com/r/reenter/nonstopqq)

**NonStopQQ** 是一个基于 Docker 的 Linux 版 QQ 远程运行方案。它集成了无头（Headless）运行环境和 Web 访问界面，让你可以在服务器、NAS 或私有云上 7x24 小时挂机 QQ，并通过浏览器随时进行管理。

## 🚀 功能特点

- **Web 访问**：无需安装客户端，直接通过浏览器（VNC Web）即可操作 QQ。
- **持久化存储**：保存登录状态、聊天记录和配置文件，重启不丢失。
- **资源占用低**：基于 Linux 版 QQ 优化，适合低配服务器运行。
- **简单易用**：一行 Docker 命令即可完成部署。

---

## 🛠️ 快速开始

运行以下命令启动容器：

```bash
docker run -d \
  --name nonstop-qq \
  -p 5800:5800 \
  -v /opt/qq_data:/config \
  -e VNC_PASSWORD=password \
  reenter/nonstopqq:latest
```

### 访问方式
启动后，在浏览器地址栏输入：
`http://服务器IP:5800`
（初次进入需输入你设置的 `VNC_PASSWORD`）

---

## ⚙️ 配置说明

### 环境变量 (Environment Variables)

| 变量名 | 说明 | 默认值 |
| :--- | :--- | :--- |
| `VNC_PASSWORD` | Web 界面访问密码 | `nonstopqq` |
| `TZ` | 系统时区（解决消息时间不对的问题） | `Asia/Shanghai` |
| `KEEP_APP_RUNNING` | QQ 崩溃后是否自动重启应用 | `1` |
| `DISPLAY_WIDTH` | 界面宽度 | `1024` |
| `DISPLAY_HEIGHT` | 界面高度 | `768` |

### 卷映射 (Volumes)

| 路径 | 说明 |
| :--- | :--- |
| `/config` | 存放 QQ 配置信息、聊天记录及 VNC 设置 |

---

## 📝 常见问题 (FAQ)

### 1. 浏览器打不开界面？
- 检查服务器防火墙是否开放了 **5800** 端口。
- 如果是阿里云/腾讯云用户，请在云控制台的“安全组”中添加放行规则。

### 2. 扫码登录失败？
- 请确保容器网络可以正常访问互联网。
- 如果扫描后提示环境异常，请尝试清理本地映射目录 `/opt/qq_data` 并重新启动容器。

### 3. 如何查看运行日志？
通过以下命令查看容器实时日志：
```bash
docker logs -f nonstop-qq
```

---

## ⚖️ 免责声明
本项目仅用于技术交流与个人便捷使用，请勿用于任何非法用途。QQ 软件版权归腾讯公司所有，请遵守相关服务协议。

## 🤝 贡献与反馈
欢迎提交 Issue 或 Pull Request 来改进本项目！
