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

# Clone and install wait-for-it
RUN git clone https://github.com/vishnubob/wait-for-it \
    && cp wait-for-it/wait-for-it.sh /usr/local/bin \
    && chmod +x /usr/local/bin/wait-for-it.sh \
    && rm -rf wait-for-it

ENV postgres_host ""
ENV postgres_user ""
ENV postgres_pass ""
ENV postgres_db ""
ENV ipfs ""
ENV ethereum ""

# HTTP port
EXPOSE 8000

# WebSocket port
EXPOSE 8001

# JSON-RPC port
EXPOSE 8020

# Start everything on startup
CMD wait-for-it.sh $ipfs -t 30 -- \
    wait-for-it.sh $postgres_host -t 30 -- \
      graph-node \
        --postgres-url postgresql://$postgres_user:$postgres_pass@$postgres_host/$postgres_db \
        --ethereum-rpc $ethereum \
        --ipfs $ipfs
