# 16-bit_Processor_Core
The primary objective of this project revolves around the development of a 16-bit instruction set processor.

## The primary objective of this project revolves around the development of a 16-bit instruction set processor. (see Figure 1)
This design comprises the following key components:
1. Program Counter (PC) - Responsible for tracking the program's execution.
2. Instruction Register (IR) - Stores the current instruction being processed.
3. Control Unit (CU) - Manages and coordinates the processor's operations.
4. Register Bank (RB) - Houses registers for data storage and manipulation.
5. Function Unit (FU) - Handles various computational functions.
6. 2x16 Multiplexer (MUXM) - Used for data selection and routing.
7. 3x16 Multiplexer (MUXD) - Enables versatile data selection and control.
8. 2x16 Multiplexer (MUXB) - Facilitates flexible data routing.

--

The architectural design of this processor core incorporates a SystemVerilog model created at the register level, which underwent synthesis using the QuestaSim Integrated Development Environment (IDE) from Siemens. To verify the functionality of each RTL (Register-Transfer Level) model, manual testbenches and test programs were written. The generated waveforms within the IDE were utilized to validate the functionality of individual RTL modules and the overall design.
