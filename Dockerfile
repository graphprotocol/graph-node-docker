FROM rust:latest

# Clone and build the graph-node repository
RUN git clone https://github.com/graphprotocol/graph-node \
    && cd graph-node \
    && cargo install --release --path node \
    && cd .. \
    && rm -rf graph-node

ENV POSTGRES_USER ""
ENV POSTGRES_PASSWORD ""
ENV POSTGRES_HOST ""
ENV POSTGRES_DB ""

ENV IPFS_URL ""
ENV ETHEREUM_RPC_URL ""

EXPOSE 8000 # HTTP port
EXPOSE 8001 # WebSocket port
EXPOSE 8020 # JSON-RPC port

# Start everything on startup
ADD start-graph-node /usr/local/bin
CMD ["start-graph-node"]
