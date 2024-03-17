# Docker
## Normal Usage
Spin up the container with the following command:
```bash
docker compose up -d
```

Attach to the container with the following command:
```bash
docker exec -it xv6-riscv-vf2 /bin/bash
```

Whenever you want to stop the container, execute the following command:
```bash
docker compose down
```

(Optional) Add alias to your `.bashrc` or `.zshrc` file to make the process easier:
**Note**: Make sure to execute the following commands in the `docker` directory of the project.
```bash
echo "alias xv6-up='docker compose --project-directory $(pwd) up -d'" >> ~/.bashrc
echo "alias xv6-attach='docker exec -it xv6-riscv-vf2 /bin/bash'" >> ~/.bashrc
echo "alias xv6-down='docker compose --project-directory $(pwd) down'" >> ~/.bashrc
```
```bash
echo "alias xv6-up='docker compose --project-directory $(pwd) up -d'" >> ~/.zshrc
echo "alias xv6-attach='docker exec -it xv6-riscv-vf2 /bin/bash'" >> ~/.zshrc
echo "alias xv6-down='docker compose --project-directory $(pwd) down'" >> ~/.zshrc
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
docker build -t xv6-riscv-vf2 . 
```

Start Docker container and mount sources to `/home/user` directory in the container.
Make sure to execute the following command in the root directory of the project.
```bash
docker run -it --name xv6-riscv-vf2 --mount source=$(pwd)/,target=/home/user xv6-riscv-vf2 /bin/bash
```