# Graph Node Docker Image

Preconfigured Docker image for running a Graph Node.

## Usage

```sh
docker run -it \
  -e postgres=postgresql://<USER>[:<PASS>]@<HOST>:<PORT>/<DBNAME> \
  -e ipfs=<HOST>:<PORT> \
  -e ethereum=<NETWORK_NAME>:<ETHEREUM_RPC_URL>
```

Example:

```sh
docker run -it \
  -e postgres=postgresql://thegraph:pw@host.docker.internal:5432/thegraph \
  -e ipfs=host.docker.internal:5001 \
  -e ethereum=mainnet:https://mainnet.infura.io
```
