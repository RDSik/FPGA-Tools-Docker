[![Build tools](https://github.com/RDSik/FPGA-Tools-Docker/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/RDSik/FPGA-Tools-Docker/actions/workflows/build.yml)
[![Test tools](https://github.com/RDSik/FPGA-Tools-Docker/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/RDSik/FPGA-Tools-Docker/actions/workflows/test.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/RDSik/FPGA-Tools-Docker/blob/master/LICENSE.txt)

# Docker Container with FPGA tools

## About tools:

* [Iverilog](https://github.com/steveicarus/iverilog.git) - Tool for compiling ALL of the Verilog HDL, as described in the IEEE-1364 standard.
* [Yosys](https://github.com/YosysHQ/yosys.git) - Open SYnthesis Suite.
* [Verilator](https://github.com/verilator/verilator.git) - Open-source SystemVerilog simulator and lint system.
* [Verible](https://github.com/chipsalliance/verible.git) - Suite of SystemVerilog developer tools, including a parser, style-linter, formatter and language server.
* [Cocotb](https://github.com/cocotb/cocotb.git) - Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python.
* [PyUVM](https://github.com/pyuvm/pyuvm.git) - The UVM written in Python.

### Clone repository and build image:
```bash
git clone https://github.com/RDSik/FPGA-Tools-Docker.git
cd FPGA-Tools-Docker
docker build -t r0d0s/fpga_tools:latest .
```
### Or pull image:
```bash
docker pull r0d0s/fpga_tools:latest
```

### Run container:
```bash
docker run -it r0d0s/fpga_tools:latest
```
