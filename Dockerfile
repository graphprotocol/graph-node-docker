FROM rust:latest

# Clone and build the graph-node repository
RUN git clone https://github.com/graphprotocol/graph-node \
    && pushd graph-node \
    && $HOME/.cargo/bin/cargo install --release --path node \
    && popd \
    && rm -rf graph-node

ENV POSTGRES_USER
ENV POSTGRES_PASSWORD
ENV POSTGRES_HOST
ENV POSTGRES_DB

ENV IPFS_URL
ENV ETHEREUM_RPC_URL

# Start everything on startup
ADD start-graph-node /usr/local/bin
CMD ["start-graph-node"]
