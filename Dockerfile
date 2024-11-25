FROM --platform=linux/amd64 ubuntu:20.04

WORKDIR /root

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get install -y wget unzip curl tar&& \
    wget https://github.com/github/codeql/archive/refs/tags/codeql-cli/v2.19.2.tar.gz -O ql.tar.gz && \
    wget https://github.com/github/codeql-cli-binaries/releases/download/v2.19.2/codeql-linux64.zip -O codeql.zip && \
    tar -xf ql.tar.gz && \
    unzip -q codeql.zip && \
    rm -f codeql.zip ql.tar.gz && \
    apt-get clean && rm -rf /var/lib/apt/lists/* \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash \
    nvm install --lts \
    wget https://go.dev/dl/go1.23.3.linux-amd64.tar.gz \
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz

ENV PATH=/root/codeql:$PATH
ENV PATH=$PATH:/usr/local/go/bin
# COPY ./choccy_linux_amd64 ./choccy

# RUN chmod +x choccy

# choccy_version=tmp
# docker build . -t l3yx/choccy:${choccy_version}
# docker run --rm -e TZ=Asia/Shanghai -p 22222:80 l3yx/choccy:${choccy_version} ./choccy
# docker tag l3yx/choccy:${choccy_version} l3yx/choccy:latest
# docker push l3yx/choccy:${choccy_version}
# docker push l3yx/choccy:latest
