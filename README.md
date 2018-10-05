# Graph Node Docker Image

Preconfigured Docker image for running a Graph Node.

## Usage

```sh
docker run -it \
  -e postgres_host=<HOST>[:<PORT>] \
  -e postgres_user=<USER> \
  -e postgres_pass=<PASSWORD> \
  -e postgres_db=<DBNAME> \
  -e ipfs=<HOST>:<PORT> \
  -e ethereum=<NETWORK_NAME>:<ETHEREUM_RPC_URL>
```

### Example usage

```sh
docker run -it \
  -e postgres_host=host.docker.internal:5432
  -e postgres_user=graph-node \
  -e postgres_pass=oh-hello \
  -e postgres_db=graph-node \
  -e ipfs=host.docker.internal:5001 \
  -e ethereum=mainnet:https://mainnet.infura.io
```
