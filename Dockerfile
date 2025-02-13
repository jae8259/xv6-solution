FROM ubuntu:latest

RUN apt-get -qq update

# Install necessary toolchains
RUN apt-get install -y \
                  git \
                  build-essential \
                  gdb-multiarch \
                  qemu-system-misc \
                  gcc-riscv64-linux-gnu \
                  binutils-riscv64-linux-gnu


ADD  ./xv6-riscv-solution/ /xv6-riscv

WORKDIR /xv6-riscv

ENV TOOLPREFIX=

CMD ["/bin/bash"]
