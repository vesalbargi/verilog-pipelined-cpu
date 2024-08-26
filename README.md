# Pipelined CPU Project

This is a ModelSim project that implements a MIPS pipelined CPU using Verilog. This project builds upon the concepts from the single-cycle CPU to create a more efficient CPU by using pipelining.

## Phase 1

- IF/ID (Instruction Fetch/Instruction Decode): This register holds the instruction fetched from memory and the incremented PC value, passing them to the next stage.
- ID/EX (Instruction Decode/Execution): This register stores the decoded instruction, read data from the registers, and control signals, preparing them for the execution stage.
- EX/MEM (Execution/Memory Access): This register captures the results of the ALU operations, the data to be written to memory, and control signals, moving them to the memory access stage.
- MEM/WB (Memory Access/Write Back): This register holds the data read from memory or the ALU result, along with control signals, and passes them to the final stage for writing back to the register file.

## Phase 2

- MUX 32 3 Inputs: This module is a multiplexer that selects one of three 32-bit inputs based on a control signal. It is used for dynamic data routing in a pipelined CPU.
- Forwarding Unit: This unit is responsible for resolving data hazards by determining if data can be forwarded from later pipeline stages, avoiding stalls. It examines the register status to manage dependencies and improve performance.

## Phase 3

- MUX 8 2 Inputs: This module is a multiplexer that selects between two 8-bit inputs based on a control signal. It is used for dynamic data routing in the pipelined CPU.
- Hazard Detection Unit: This unit is responsible for detecting data hazards that may occur during instruction execution. It monitors the pipeline registers and control signals to determine if a stall is necessary to prevent incorrect data usage.
- Comparator: This module compares two input values and provides an output based on the comparison result. It is useful for conditional operations and decision-making processes within the CPU.
- Main: The main module integrates all components of the pipelined CPU, coordinating the flow of data and control signals across the pipeline stages (Fetch, Decode, Execute, Memory Access, and Write Back).

## Datapath

![Datapath](https://i.imgur.com/yyXykNn.jpeg)

## Requirements

- ModelSim
- Verilog compiler
- A basic understanding of Verilog and digital logic

## Running the Project

Clone the project

```bash
git clone https://github.com/vesalbargi/verilog-pipelined-cpu.git
```

Open ModelSim and load the project

```bash
ModelSim> project open Pipeline_Phase_3.mpf
```

Compile all Verilog files

```bash
ModelSim> vlog *.v
```

Run the simulation

```bash
ModelSim> vsim test_Main
ModelSim> run -all
```

## Testing

- Testbenches are provided for each module.
- Ensure all testbenches pass before running the full CPU simulation.

## License

This project is licensed under the MIT License.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
