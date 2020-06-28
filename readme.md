conflux-rust
===
Rust implementation of the Conflux protocol.

### How to run

```sh
$ docker run -v /local/node/folder:/root/run --name container-name conflux-rust
```

You can attach a folder on local machine to container, in which folder should include conflux config file, or even genesis_secret, genesis_account file。When conflux client run up, chain data will also save to this folder。



