# MCPO Docker

这是一个用于快速配置和运行 [mcpo](https://github.com/open-webui/mcpo) 的 Docker 容器化项目。

## 特性

-   通过环境变量轻松配置 `mcpo` 的所有参数。
-   包含 `docker-compose.yml`，方便一键启动。
-   使用 `start.sh` 脚本启动，逻辑清晰，易于扩展。

## 使用教程

### 方法一：使用 `docker-compose`

这是推荐的使用方式。

1.  **编辑 `docker-compose.yml`**

    打开 `docker-compose.yml` 文件，在 `environment` 部分根据你的需求设置环境变量。

    ```yaml
    services:
    mcpo:
        image: gua12345/mcpo:latest
        container_name: mcpo
        volumes:
        - ./config.json:/app/config.json
        ports:
        - "8000:8000"
        environment:
          - MCPO_PORT=8000
          - MCPO_API_KEY=your-secret-api-key
        restart: unless-stopped
    ```

2.  **启动容器**

    ```bash
    docker-compose up -d
    ```

### 方法二：使用 `docker run`
1.  **运行容器**

    使用 `-e` 参数来传递环境变量。

    ```bash
    docker run -d \
      --name mcpo \
      -p 8000:8000 \
      -v $(pwd)/config.json:/app/config.json \
      -e MCPO_API_KEY="your-secret-api-key" \
      gua12345/mcpo:latest
    ```

## 环境变量配置

你可以通过以下环境变量来配置 `mcpo` 的启动参数：

| 环境变量 | 默认值 | 描述 |
| :--- | :--- | :--- |
| `MCPO_PORT` | `8000` | `mcpo` 服务的端口。 |
| `MCPO_API_KEY` | `top-secret` | `mcpo` 服务的 API Key。 |
