# MIT License

# Copyright (c) 2025 Dmitry Ryabikov

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM ubuntu:latest

LABEL maintainer="dmitryryabickov@yandex.ru"

# Build Gowin Education
RUN apt-get update -y && \
    apt-get install wget -y

RUN wget https://cdn.gowinsemi.com.cn/Gowin_V1.9.10.03_Education_linux.tar.gz && \
    mkdir gowin && \
    tar -xf Gowin_V1.9.10.03_Education_linux.tar.gz -C gowin

ENV PATH="/gowin/IDE/bin:$PATH"
ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libfreetype.so.6"

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
    make install && \
    cd ../

# Build Yosys
RUN apt-get update -y && \
    apt-get install -y \
    gperf \
    build-essential \
    bison \
    flex \
    libreadline-dev \
    gawk \
    tcl-dev \
    libffi-dev \
    git \
    graphviz \
    xdot \
    pkg-config \
    python3 \
    libboost-system-dev \
    libboost-python-dev \
    libboost-filesystem-dev \
    zlib1g-dev

RUN git clone --recurse-submodules https://github.com/YosysHQ/yosys.git && \
    cd yosys && \
    make && \
    make install && \
    cd ../

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
    git checkout stable && \
    autoconf && \
    ./configure && \
    make -j `nproc` && \
    make install && \
    cd ../

# Build Bazel (for Verible)
RUN apt install apt-transport-https curl gnupg -y && \
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
    mv bazel-archive-keyring.gpg /usr/share/keyrings && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update -y && \
    apt-get install bazel -y

# Build Verible 
RUN git clone https://github.com/chipsalliance/verible.git && \
    cd verible && \
    bazel build -c opt :install-binaries && \
    .github/bin/simple-install.sh ../usr/local/bin && \
    cd ../

RUN apt-get update -y && \
    apt-get install -y \
    python3 \
    python3-venv \
    python3-pip

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt ./
RUN pip install -r requirements.txt
