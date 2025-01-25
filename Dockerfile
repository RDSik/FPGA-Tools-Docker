FROM ubuntu:latest

# Build Icarus Verilog
RUN apt-get update -y && \
    apt-get install -y \
    make \
    g++ \
    git \
    bison \
    flex \
    gperf \
    libreadline-dev \
    autoconf

RUN git clone https://github.com/steveicarus/iverilog && \
    cd iverilog && \
    autoconf && \
    ./configure && \
    make check && \
    make install 

RUN cd ../

# Build Verilator
RUN apt-get update -y && \
    apt-get install -y \
    git \
    help2man \
    perl \
    python3 \
    make \
    autoconf \
    g++ \
    flex \
    bison \
    ccache \
    libgoogle-perftools-dev \
    numactl \
    perl-doc
    
RUN git clone https://github.com/verilator/verilator && \
    cd verilator && \
    autoconf && \
    ./configure && \
    make -j `nproc` && \
    make install 

RUN cd ../

# Build Bazel (for verible)
RUN apt-get update -y && \
    apt install -y \
    git \ 
    g++ \
    unzip \
    zip \
    pkg-config \
    wget \
    zlib1g-dev \
    python3

RUN wget https://github.com/bazelbuild/bazel/releases/download/8.0.1/bazel-8.0.1-installer-linux-x86_64.sh && \
    chmod u+x bazel-8.0.1-installer-linux-x86_64.sh && \
    ./bazel-8.0.1-installer-linux-x86_64.sh --user

# Build Verible 
RUN git clone https://github.com/chipsalliance/verible.git && \
    /root/.bazel/bin/bazel-complete.bash build -c opt :install-binaries && \
    .github/bin/simple-install.sh ~/bin