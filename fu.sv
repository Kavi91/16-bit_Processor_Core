`include "mycpu.svh"

import mycpu_pkg::*;

module fu
  (
   input logic [15:0]  a_in,
   input logic [15:0]  b_in, 
   input logic [3:0] 	 fs_in,
   output logic [15:0] f_out,
   output logic 	 z_out,
   output logic 	 n_out
   );
  
  reg signed [31:0] temp_m;
  localparam logic signed [15:0] MUL_max = $signed ({1'b0,{15{1'b1}}}); 
  localparam logic signed [15:0] MUL_min = $signed ({1'b1,{15{1'b0}}}); 

  logic CarryOut ;
  logic [16:0 ]fout_Result ;

  	
  fs_t fs;
  assign fs = fs_t'(fs_in);

  always_comb
   begin :fu_logic
	temp_m = $signed (32'b0);
	CarryOut = '0;
        fout_Result = '0;
		

    case (fs)
     FMOVA: f_out = a_in;
      FINC:  
	begin
	 fout_Result = a_in + 1;
	 f_out = fout_Result[15:0];
         CarryOut = fout_Result[16];
	end
     FADD:  
	begin
	 fout_Result = a_in + b_in;
	 f_out = fout_Result[15:0];
	 CarryOut = fout_Result[16];
	end
     FMUL: 
       begin
        temp_m = $signed(a_in) * $signed(b_in);	
         if (temp_m > MUL_max)
	  f_out = $unsigned(MUL_max);
	 else if (temp_m < MUL_min)
	  f_out = $unsigned (MUL_min);
	 else
          f_out = $unsigned (temp_m[15:0]);
      end
   FSRA: f_out = $unsigned($signed (b_in) >>> 1);
   FSUB: 
      begin
        fout_Result = a_in - b_in;
        f_out = fout_Result[15:0];
        CarryOut = fout_Result[16];
      end
   FDEC: 
      begin
       fout_Result = a_in - 1;
       f_out = fout_Result[15:0];
       CarryOut = fout_Result[16];
      end
   FSLA: f_out = $unsigned($signed(b_in) <<< 1);
   FAND: f_out = a_in & b_in;
   FOR:	 f_out = a_in | b_in;
   FXOR: f_out = a_in ^ b_in;
   FNOT: f_out = ~a_in;
   FMOVB:f_out	= b_in;
   FSHR: f_out	= b_in >> 1;
   FSHL: f_out	= b_in << 1;
   FCLR: f_out	= 0;
   default:
	 f_out = 0;
  endcase					
 end : fu_logic

	assign z_out = (f_out[15:0] == 0) ? '1 : '0;
	assign n_out = (f_out[15]) ? '1 : '0;

 
   
endmodule
