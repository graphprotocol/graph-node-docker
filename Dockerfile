FROM rust:latest

# Install clang (required for dependencies)
RUN apt-get update \
    && apt-get install -y clang libclang-dev

# Clone and build the graph-node repository
RUN git clone https://github.com/graphprotocol/graph-node \
    && cd graph-node \
    && cargo install --path node \
    && cd .. \
    && rm -rf graph-node

ENV postgres ""
ENV ipfs ""
ENV ethereum ""

# HTTP port
EXPOSE 8000

# WebSocket port
EXPOSE 8001

# JSON-RPC port
EXPOSE 8020

# Start everything on startup
ADD start-graph-node /usr/local/bin
CMD graph-node \
      --postgres-url $postgres \
      --ethereum-rpc $ethereum \
      --ipfs $ipfs