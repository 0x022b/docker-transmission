# docker-transmission

A minimal and secure [Alpine Linux][alpine] based [Docker][docker] image with
[Transmission][transmission] BitTorrent client.

## Configuration

### Host user mapping

Host user and group can be mapped to a container by defining `HOST_UID` and
`HOST_GID` environment variables. If the variables are left undefined the
container will execute its command as `nobody:nobody`.

### RPC request credentials

To improve security Transmission is configured to use authenticated RPC
requests. The credentials are defined using `RPC_USERNAME` and `RPC_PASSWORD`
environment variables. If `RPC_USERNAME` is not defined, then a default username
`transmission` is used. However, if `RPC_PASSWORD` environment variable is not
defined, a random password is generated every time the container starts.

## Logging

Container is compatible with `docker logs` command although logging is disabled
by default if the container is started with `docker-compose` command. To find
out more about logging see the command [reference][docker-logs].

## License

This project is licensed under the MIT License.

[alpine]: https://alpinelinux.org/
[docker]: https://www.docker.com/
[transmission]: https://transmissionbt.com/
[docker-logs]: https://docs.docker.com/engine/reference/commandline/logs/
