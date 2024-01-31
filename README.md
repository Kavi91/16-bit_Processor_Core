# 16-bit_Processor_Core
The primary objective of this project revolves around the development of a 16-bit instruction set processor.

<img width="622" alt="Screenshot 2024-01-31 at 15 15 19" src="https://github.com/Kavi91/16-bit_Processor_Core/assets/153508129/62da057e-2b8c-4913-9efa-573b541e56bd">


## The primary objective of this project revolves around the development of a 16-bit instruction set processor. 
This design comprises the following key components:
1. Program Counter (PC) - Responsible for tracking the program's execution.
2. Instruction Register (IR) - Stores the current instruction being processed.
3. Control Unit (CU) - Manages and coordinates the processor's operations.
4. Register Bank (RB) - Houses registers for data storage and manipulation.
5. Function Unit (FU) - Handles various computational functions.
6. 2x16 Multiplexer (MUXM) - Used for data selection and routing.
7. 3x16 Multiplexer (MUXD) - Enables versatile data selection and control.
8. 2x16 Multiplexer (MUXB) - Facilitates flexible data routing.
   


The architectural design of this processor core incorporates a SystemVerilog model created at the register level, which underwent synthesis using the QuestaSim Integrated Development Environment (IDE) from Siemens. To verify the functionality of each RTL (Register-Transfer Level) model, manual testbenches and test programs were written. The generated waveforms within the IDE were utilized to validate the functionality of individual RTL modules and the overall design.

Moreover, gate-level validation was utilized for specific tasks to ensure the precision of the simulation outcomes derived from RTL synthesis. Subsequently, the connectivity and potential errors within the RTL model were examined via a formality report generated by the Qautocheck wizard. At this point, an analysis of the design's cost and performance is conducted using the Synopsys Design Vision tool. The main focus of this analysis is to observe the design area, resource utilization, power consumption, and timing in order to develop an optimized version of the processor.
