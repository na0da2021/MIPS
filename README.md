# 32-bit Single Cycle MIPS Processor

This repository contains the Verilog code for a 32-bit single cycle MIPS processor. The processor is capable of executing instructions in a single cycle and is designed as a teaching aid for understanding the MIPS architecture.

## Processor Design

The MIPS processor is implemented in Verilog and includes the following modules:

- **Control Unit**: Decodes the instruction and generates control signals.
- **Register File**: Stores the processor's registers and handles read/write operations.
- **ALU**: Performs arithmetic and logical operations.
- **Data Memory**: Simulates the data memory for load/store operations.
- **Instruction Memory**: Simulates the instruction memory.
- **PC (Program Counter)**: Manages the instruction sequence.
- **Other helping modules**:such as `sign extension`, `shifter`, `adder`, `mux`.

## Installation
1. Clone this repository to your local machine:

   git clone https://github.com/na0da2021/MIPS.git

2. Navigate to the cloned directory and explore the Verilog source files.


## Simulation
1. Run the provided testbenchs using your preferred Verilog simulation tool (e.g., ModelSim) to verify the functionality of each sub_module or the testbench of the top_module(`MIPS_TB`) which provides testing through calculating factorial of 7 or calculation the GCD of 120 and 180 through the provided `.hex` files.
you should only change the programme that the instruction memory reads to verify the functionality through any of the programmes.

## Contributing
Contributions are welcome. Fork the repository, make your changes, and submit a pull request for review.

## About The Author

- **Author**: Nada Omar
- **Email**: na0da2021@gmail.com
- **Education**: Electronics and Communication Department
- **College**: Faculty of Engineering, Alexandria University, Egypt
