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

# RUN apt-get update -y && \
    # apt install -y \
    # git \ 
    # g++ \
    # unzip \
    # zip \
    # pkg-config \
    # wget \
    # zlib1g-dev \
    # python3

# RUN wget https://github.com/bazelbuild/bazel/releases/download/8.0.1/bazel-8.0.1-installer-linux-x86_64.sh && \
    # chmod u+x bazel-8.0.1-installer-linux-x86_64.sh && \
    # ./bazel-8.0.1-installer-linux-x86_64.sh --user
# 
# ENV PATH="$PATH:$HOME/bin"

# Build Bazel (for verible)
RUN apt install apt-transport-https curl gnupg -y && \
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
    mv bazel-archive-keyring.gpg /usr/share/keyrings && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list && \
    apt update && \
    apt install bazel -y

# Build Verible 
RUN git clone https://github.com/chipsalliance/verible.git && \
    bazel build -c opt :install-binaries && \
    .github/bin/simple-install.sh ~/bin