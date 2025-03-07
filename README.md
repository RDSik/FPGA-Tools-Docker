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
* [MyHDL](https://github.com/myhdl/myhdl.git) - Package for using Python as a hardware description and verification language.
* [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane.git) - Automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen and custom methodology scripts for design exploration and optimization. 
* [UVM-Python](https://github.com/tpoikela/uvm-python.git) - Python and cocotb-based port of the SystemVerilog Universal Verification Methodology (UVM) 1.2.
* [VUnit](https://github.com/VUnit/vunit.git) - Unit testing framework for VHDL/SystemVerilog.

### Clone repository:
```bash
git clone https://github.com/RDSik/FPGA-Tools-Docker.git
cd FPGA-Tools-Docker
```
### Or pull image:
```bash
docker pull r0d0s/fpga_tools
```

### Build image:
```bash
docker build -t r0d0s/fpga_tools .
```

### Run container:
```bash
docker run -it r0d0s/fpga_tools
```
