`include "mycpu.svh"

import mycpu_pkg::*;

module ir
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic 	       il_in,
   input logic [15:0]  ins_in,
   output logic [15:0] ins_out,
   output logic [15:0] ia_out,
   output logic [15:0] iv_out   
   );
   
   logic [15:0] ir_r;
   logic signed [15:0] ia;
   logic unsigned [15:0] iv;
   logic signed [5:0] temp; 

   always_ff @ (posedge clk or negedge rst_n)
    begin:ir_regs
     if(rst_n =='0)
      ir_r <= '0;
     else
      if(il_in == '1)
       ir_r <= ins_in;
    end:ir_regs

  always_comb
    begin:ia_logic
      temp = $signed({ir_r[8:6],ir_r[2:0]}) ;
      ia =  $signed(temp[5:0]);
    end:ia_logic

  always_comb
    begin:iv_logic
      iv = ir_r[2:0];
    end:iv_logic   

  assign ins_out = ir_r;
  assign ia_out = $unsigned(ia);
  assign iv_out = iv;
 
endmodule


