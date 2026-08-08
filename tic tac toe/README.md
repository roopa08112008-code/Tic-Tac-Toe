# Tic-Tac-Toe Game in Verilog

## Overview

This project implements a digital Tic-Tac-Toe game using Verilog HDL.
The design supports two players, updates the game board based on player
moves, and detects winning and draw conditions.

## Features

- Two-player Tic-Tac-Toe game
- 3 × 3 game board
- Player turn management
- Move validation
- Win detection
- Draw detection
- Game status output
- Verilog testbench
- Simulation waveform

## Board Representation

The 3 × 3 board contains 9 positions:

       0 | 1 | 2
      ---+---+---
       3 | 4 | 5
      ---+---+---
       6 | 7 | 8

Player 1 is represented by `1`.

Player 2 is represented by `2`.

An empty position is represented by `0`.

## Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| `clk` | 1 | System clock |
| `reset` | 1 | Reset game |
| `move_valid` | 1 | Indicates a valid move |
| `position` | 4 | Board position (0-8) |

## Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| `board` | 18 | Current board state |
| `player` | 1 | Current player |
| `winner` | 2 | Winner indication |
| `game_over` | 1 | Indicates game completion |

## Game Status

| Winner | Meaning |
|--------|---------|
| 00 | No winner |
| 01 | Player 1 wins |
| 10 | Player 2 wins |
| 11 | Draw |

## Tools Used

- Verilog HDL
- ModelSim / Vivado / Icarus Verilog
- GTKWave

## Project Files

- `tic_tac_toe.v` - Tic-Tac-Toe game controller
- `tic_tac_toe_tb.v` - Testbench
- `simulation/waveform.png` - Simulation waveform
- `simulation/output.log` - Simulation output

## Simulation

The testbench performs a complete game sequence and verifies player turns,
board updates, and winner detection.
