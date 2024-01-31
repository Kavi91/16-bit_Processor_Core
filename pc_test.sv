`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program pc_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic [1:0] 	 ps_in,
   output logic [15:0] ia_in,
   output logic [15:0] ra_in, 
   input logic [15:0]  pc_out      
   );

   initial
     begin


	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	
	ps_in = 2'b00;
	ia_in = 16'b00000000_00000000;
	ra_in = 16'b00000000_00000000;
	wait (rst_n);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T2: No Change Test");
	///////////////////////////////////////////////////////////////////////	
	ps_in = 2'b00;
	ia_in = 16'b11111111_11111111;
        ra_in = 16'b11111111_11111111;
	@(posedge clk);
        assert (pc_out == 16'b00000000_00000000) else $error("No Change test: %16b", pc_out);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T3: Increment test");
	///////////////////////////////////////////////////////////////////////		
	ps_in = 2'b01;
	ia_in = 16'b00000000_00000000;
        ra_in = 16'b00000000_00000000;
	@(posedge clk);
	assert (pc_out == 16'b00000000_00000001) else $error("INC test: pc_out increment by one");
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////		
	$info("T4: Branch Address added test");	
	///////////////////////////////////////////////////////////////////////
	ps_in = 2'b10;
	for (int i=0; i < 63; ++i)
	  begin
	     logic signed [15:0] ad;
	     logic signed [15:0] temp;
	     ad = i;
	     temp = pc_out;
	     ia_in = $unsigned(ad);	     
	     @(posedge clk);
	     assert( pc_out == $unsigned($signed(temp)+$signed(ad)))else $error("pc_out value %16b wrong for ia_in code %16b", pc_out, ia_in);
	     @(negedge clk);
          end
	///////////////////////////////////////////////////////////////////////	
	$info("T5: Jump address test");		
	/////////////////////////////////////////////////////////////////////// 	
	ps_in = 2'b11;
	for (int i=0; i < 63; ++i)
	  begin
	     ra_in = i;	     
	     @(posedge clk);
	     assert(pc_out == ra_in) else $error("pc_out value %16b wrong for ra_in code %16b", pc_out, ra_in);
	     @(negedge clk);
         end
	
	$finish;	
     end   
   
endprogram


`endif
