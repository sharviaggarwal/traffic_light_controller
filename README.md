# Traffic Light Controller using Verilog

## Overview

This project implements a **two-road Traffic Light Controller** using **Verilog HDL**.

The controller is designed using a **Finite State Machine (FSM)** along with a counter to control the duration of each traffic-light state.

The design controls traffic lights for **Road A** and **Road B**.

## Features

* Verilog HDL based design
* FSM-based traffic light control
* 4 different traffic states
* Counter-based timing
* Reset functionality
* Controls Red, Yellow, and Green lights for two roads
* Designed for simulation using Xilinx Vivado

## Traffic Light Sequence

The controller follows this sequence:

**Road A GREEN + Road B RED**
↓
**Road A YELLOW + Road B RED**
↓
**Road A RED + Road B GREEN**
↓
**Road A RED + Road B YELLOW**
↓
**Back to Road A GREEN**

## FSM States

| State | Road A | Road B | Counter Limit |
| ----- | ------ | ------ | ------------: |
| S0    | GREEN  | RED    |             4 |
| S1    | YELLOW | RED    |             1 |
| S2    | RED    | GREEN  |             4 |
| S3    | RED    | YELLOW |             1 |

## State Diagram

```text
             count = 4
       ┌──────────────────┐
       │                  ↓
    ┌──────┐          ┌──────┐
    │  S0  │ ────────> │  S1  │
    │A=G   │  count=4  │A=Y   │
    │B=R   │            │B=R   │
    └──────┘            └──────┘
                           │
                        count=1
                           ↓
                       ┌──────┐
                       │  S2  │
                       │A=R   │
                       │B=G   │
                       └──────┘
                           │
                        count=4
                           ↓
                       ┌──────┐
                       │  S3  │
                       │A=R   │
                       │B=Y   │
                       └──────┘
                           │
                        count=1
                           │
                           └────────> S0
```

## Reset Operation

When `rst = 1`:

* `current_state` is set to `S0`
* `count` is reset to `0`

Therefore, after reset the controller starts with:

**Road A = GREEN**
**Road B = RED**

## Counter Operation

The counter determines how long the controller remains in each state.

For states **S0** and **S2**, the counter runs until `4`.

For states **S1** and **S3**, the counter runs until `1`.

When the counter reaches the required value, the FSM moves to the next state.

## Inputs

| Signal | Description  |
| ------ | ------------ |
| `clk`  | Clock signal |
| `rst`  | Reset signal |

## Outputs

### Road A

* `A_red`
* `A_yellow`
* `A_green`

### Road B

* `B_red`
* `B_yellow`
* `B_green`

## Project Files

* `traffic_light_controller.v` — Main Traffic Light Controller design
* `traffic_light_controller_tb.v` — Testbench used for simulation

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Vivado Simulator

## Design Concepts Used

* Finite State Machine (FSM)
* Sequential Logic
* Combinational Logic
* Counters
* State Registers
* Reset Logic

## Future Improvements

* Configurable traffic-light timing
* Pedestrian crossing support
* Emergency vehicle priority
* Multiple traffic lanes
* FPGA implementation

## Author

**Sharvi Aggarwal**

B.Tech ECE | VLSI & Verilog Enthusiast

