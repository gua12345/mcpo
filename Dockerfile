FROM python:3.11-slim

WORKDIR /app

COPY . .

# ---------------------------
# 1)  安装必要的系统依赖 + Node.js (自带 npx) 
# ---------------------------
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# ---------------------------
# 2)  安装 bun (bunx) 
# ---------------------------
RUN curl -fsSL https://bun.sh/install | bash
# bun 默认安装到 /root/.bun
ENV BUN_INSTALL="/root/.bun"
ENV PATH="${BUN_INSTALL}/bin:${PATH}"

# ---------------------------
# 3)  安装 Python 依赖
# ---------------------------
RUN pip install --no-cache-dir mcpo uv

# ---------------------------
# 4)  启动 mcpo
# ---------------------------
CMD ["/app/start.sh"]