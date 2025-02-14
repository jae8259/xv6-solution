FROM ubuntu:latest

RUN apt-get -qq update

# Install necessary toolchains
RUN apt-get install -y  \
                  git \
                  build-essential \
                  gdb-multiarch \
                  qemu-system-misc  \
                  gcc-riscv64-linux-gnu \
                  binutils-riscv64-linux-gnu \
                  vim

# Customize .bashrc
COPY config_terminal.sh /init-scripts/config_terminal.sh
RUN cat /init-scripts/config_terminal.sh >> ~/.bashrc

RUN echo "add-auto-load-safe-path /xv6-riscv/.gdbinit" > ~/.gdbinit

ENV TOOLPREFIX=

CMD ["/bin/bash"]
