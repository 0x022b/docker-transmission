# docker-template

A minimal and secure [Alpine Linux][alpine] based [Docker][docker] image.

## Configuration

### Host user mapping

Host user and group can be mapped to a container by defining `HOST_UID` and
`HOST_GID` environment variables. If the variables are left undefined the
container will execute its command as `nobody:nobody`.

### Default gateway

Container's default gateway can be changed by defining a `CONTAINER_GATEWAY`
environment variable. Its value can be either an IP address or a hostname.
For to be able to change the gateway the container needs to have `NET_ADMIN`
capabilities.

### Connection forwarding

Container can be configured to act as a router by defining a `ENABLE_FORWARDING`
environment variable. Its value must be a non null value.

## Logging

Container is compatible with `docker logs` command although logging is disabled
by default if the container is started with `docker-compose` command. To find
out more about logging see the command [reference][docker-logs].

## License

This project is licensed under the MIT License.

[alpine]: https://alpinelinux.org/
[docker]: https://www.docker.com/
[docker-logs]: https://docs.docker.com/engine/reference/commandline/logs/
