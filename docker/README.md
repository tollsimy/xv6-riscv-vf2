# Docker
This guide will use Podman as a replacement of Docker to simplify ownership and permissions of files in the mounted volume, however, you are free to use Docker instead.

## Normal Usage
Spin up the container with the following command:
```bash
podman-compose up -d
```

Attach to the container with the following command:
```bash
podman exec -it xv6-riscv-vf2 /bin/bash
```

Whenever you want to stop the container, execute the following command:
```bash
podman-compose down
```

(Optional) Add alias to your `.bashrc` or `.zshrc` file to make the process easier:
**Note**: Make sure to execute the following commands in the `docker` directory of the project.
```bash
echo "alias xv6-up='podman-compose -f $(pwd)/docker-compose.yml up -d'" >> ~/.bashrc
echo "alias xv6-attach='podman exec -it xv6-riscv-vf2 /bin/bash'" >> ~/.bashrc
echo "alias xv6-down='podman-compose -f $(pwd)/docker-compose.yml down'" >> ~/.bashrc
```
```bash
echo "alias xv6-up='podman-compose -f $(pwd)/docker-compose.yml up -d'" >> ~/.zshrc
echo "alias xv6-attach='podman exec -it xv6-riscv-vf2 /bin/bash'" >> ~/.zshrc
echo "alias xv6-down='podman-compose -f $(pwd)/docker-compose.yml down'" >> ~/.zshrc
```
You can then use the following commands to start, attach and stop the container from any directory:
```bash
xv6-up
``` 
```bash
xv6-attach
```
```bash
xv6-down
```

## Build your own Docker image
Build Docker image for building (and executing in QEMU) xv6-riscv-vf2 OS:
```bash
podman build -t xv6-riscv-vf2 . 
```

Start Docker container and mount sources to `/home/user` directory in the container.
Make sure to execute the following command in the root directory of the project.
```bash
podman run -it --name xv6-riscv-vf2 --mount source=$(pwd)/,target=/home/user xv6-riscv-vf2 /bin/bash
```