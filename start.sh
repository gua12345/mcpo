#!/bin/bash

# 设置mcpo命令的默认参数
DEFAULT_PORT=8000
DEFAULT_API_KEY="top-secret"

# 从环境变量中读取参数，如果不存在则使用默认值
PORT=${MCPO_PORT:-$DEFAULT_PORT}
API_KEY=${MCPO_API_KEY:-$DEFAULT_API_KEY}

# 构建mcpo启动命令
CMD="mcpo --port $PORT --api-key \"$API_KEY\" --config \"/app/config.json\""

if [ -n "$MCP_SERVER_COMMAND" ]; then
    CMD="$CMD -- $MCP_SERVER_COMMAND"
fi

# 打印并执行最终的命令
echo "正在执行: $CMD"
eval $CMD