# 5-stage Pipeline CPU

## Abstract

This is the lab work for Computer Organization. Our goal is to implement RISC-V Pipeline CPU by Verilog.

## Supported Instruction

- R-type
  - add
  - sub
  - and
  - or
  - slt
  - xor
  - sll
- I-type
  - addi
  - andi
  - ori
  - xori
  - slti
  - slli
- S-type
  - sw
- B-type
  - beq
- J-type
  - jal

## Architechure Diagram
![image](https://github.com/yichi170/5-stage_Pipeline_CPU/blob/main/Architechure%20Diagram.png)
## Data Hazard

Our Implementation supports data forwarding to prevent data hazard. Therefore, Hazard Detection Unit can avoid load-use data hazard.

## For testing

1. put your .v files in Lab5Code
2. ```bash ./lab5TestScript.sh```


* details of testcase can be find in Lab5Answer

