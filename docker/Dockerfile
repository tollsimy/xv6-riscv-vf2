FROM ubuntu:22.04

ENV TZ="Europe/Rome"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y --no-install-recommends \
    bash pkg-config ccache wget rsync \
    autoconf automake autotools-dev curl python3 python3-pip \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison \
    flex texinfo gperf libtool patchutils bc zlib1g-dev \
    libexpat-dev ninja-build git cmake libglib2.0-dev

WORKDIR /tmp
RUN wget https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.03.01/riscv64-elf-ubuntu-22.04-gcc-nightly-2024.03.01-nightly.tar.gz
RUN tar -xzvf riscv64-elf-ubuntu-22.04-gcc-nightly-2024.03.01-nightly.tar.gz
RUN cd riscv && rsync -av . /usr/local/
RUN rm -rf riscv64-elf-ubuntu-22.04-gcc-nightly-2024.03.01-nightly.tar.gz riscv
ENV TOOLPREFIX=/usr/local/bin/riscv64-unknown-elf-

RUN git clone https://github.com/qemu/qemu && \
    cd qemu && git checkout v8.2.2 && \
    ./configure --target-list=riscv64-softmmu && \
    make -j $(nproc) && \
    make install && \
    cd .. && rm -rf qemu
