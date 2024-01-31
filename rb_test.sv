`include "mycpu.svh"

import mycpu_pkg::*;

program rb_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic [15:0] d_in,
   output logic 	 rw_in,
   output logic [11:0] 	 rs_in,
   input logic [15:0]  a_out,
   input logic [15:0]  b_out
   );

   logic [15:0] patterns [16];
 
   initial
     begin
	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	
	d_in = '0;
	rw_in = '0;
	rs_in = '0;
	wait (rst_n);
        @(negedge clk);
	///////////////////////////////////////////////////////////////////////	
	$info("T2: Read-Write Test");
	///////////////////////////////////////////////////////////////////////
        
	 for (int i = 0; i < 16; i++)
	  begin
	     @(posedge clk);
	     rw_in = '1;
	     rs_in[11:8] = i ;
	     patterns[i] = $urandom();
	     d_in = patterns[i];
	     @(negedge clk);
	  end
	for (int i = 0; i < 16; i++)
	  begin
	     @(posedge clk);
	     rw_in = '0;
	     rs_in[7:4] = i ;
	     #(CLK_PERIOD/2);
	assert(a_out == rs_in) else $error("Read test : a_out value %16b wrong for rs_in code %16b", a_out, rs_in);
	     @(negedge clk);
	  end
	for (int i = 0; i < 16; i++)
	  begin
	     @(posedge clk);
	     rw_in = '0;
	     rs_in[3:0] = i ;
	     #(CLK_PERIOD/2);
	assert(b_out == rs_in) else $error("Read test : b_out value %16b wrong for rs_in code %16b", b_out, rs_in);
	    @(negedge clk);
	  end
	
		     
	$finish;
     end
endprogram
