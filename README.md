[![Build tools](https://github.com/RDSik/Verilator-Iverilog-Verible-Docker/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/RDSik/Verilator-Iverilog-Verible-Docker.git/actions/workflows/main.yml)

# Docker Container for Icarus Verilog, Verilator and Verible.

About tools:

* [Iverilog](https://github.com/steveicarus/iverilog.git) - Tool for compiling ALL of the Verilog HDL, as described in the IEEE-1364 standard.
* [Verilator](https://github.com/verilator/verilator.git) - Open-source SystemVerilog simulator and lint system.
* [Verible](https://github.com/chipsalliance/verible.git) - Suite of SystemVerilog developer tools, including a parser, style-linter, formatter and language server.

## Build image
```bash
docker build -t fpga_tools:v1 .
```

## Run container
```bash
docker run fpga_tools:v1
```
