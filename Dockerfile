# 使用 Python 官方的基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制本地的 requirements.txt 文件到容器内
COPY . /app/

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 设置环境变量
ENV PORT=8080

# 启动 Gunicorn 服务器，绑定到指定的主机和端口
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
