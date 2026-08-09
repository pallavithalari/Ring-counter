# 4-Bit Ring Counter using Verilog

## Overview

This project implements a **4-bit Ring Counter** using Verilog HDL.

A ring counter is a shift register in which the output of the last flip-flop is connected back to the input of the first flip-flop. A single logic `1` circulates through the register on every rising edge of the clock.

The counter produces the following repeating sequence:

```text
1000
0100
0010
0001
1000
...
```

## Features

* 4-bit Ring Counter
* Verilog HDL implementation
* Asynchronous active-high reset
* Separate RTL design and testbench
* Self-contained simulation
* VCD waveform generation
* Compatible with Icarus Verilog
* GTKWave waveform support

## Project Structure

```text
ring-counter-verilog/
├── rtl/
│   └── ring_counter.v
├── tb/
│   └── tb_ring_counter.v
├── simulation/
│   └── simulation_output.txt
├── README.md
└── Makefile
```

## Working Principle

The ring counter consists of four flip-flops connected as a shift register.

After reset, the counter is initialized to:

```text
1000
```

On every positive edge of the clock, the `1` moves to the next flip-flop:

```text
1000 → 0100 → 0010 → 0001 → 1000
```

After reaching `0001`, the `1` is fed back to the first position, producing `1000` again.

## RTL Design

The main Verilog module is located at:

```text
rtl/ring_counter.v
```

Inputs:

| Signal  | Description                    |
| ------- | ------------------------------ |
| `clk`   | Clock input                    |
| `reset` | Active-high asynchronous reset |

Output:

| Signal   | Description               |
| -------- | ------------------------- |
| `q[3:0]` | 4-bit ring-counter output |

## Reset Operation

When `reset = 1`, the output is initialized to:

```text
q = 1000
```

When `reset = 0`, the counter starts rotating the `1` bit on every rising edge of `clk`.

## Simulation

The testbench is located at:

```text
tb/tb_ring_counter.v
```

The testbench:

1. Generates a 10 ns clock.
2. Applies reset.
3. Releases reset.
4. Observes the ring-counter output.
5. Generates a VCD waveform file.
6. Displays the simulation results.
7. Terminates the simulation.

## Simulation Using Icarus Verilog

Compile the design and testbench:

```bash
iverilog -o ring_counter_sim rtl/ring_counter.v tb/tb_ring_counter.v
```

Run the simulation:

```bash
vvp ring_counter_sim
```

The expected output sequence is:

```text
1000
0100
0010
0001
1000
0100
0010
0001
```

## View Waveform

The testbench generates:

```text
ring_counter.vcd
```

Open it using GTKWave:

```bash
gtkwave ring_counter.vcd
```

Add the following signals to the waveform viewer:

```text
clk
reset
q
```

The output `q` should continuously rotate:

```text
1000 → 0100 → 0010 → 0001 → 1000
```

## Simulation Result

The simulation verifies that the ring counter correctly shifts the logic `1` through all four positions and returns to the initial state after four clock cycles.

### Result

**PASS — 4-bit Ring Counter operates correctly.**

## Applications

Ring counters can be used in:

* Sequence generators
* LED chasers
* Timing circuits
* Control circuits
* Clock-divider and sequencing applications
* Digital system control logic

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## Author

Add your name here:

```text
Name: Your Name
Department: Electronics / Electrical / Computer Engineering
```

## License

This project is provided for educational and academic purposes.
