`timescale 1ns / 1ps

module clk_div();



integer div = DIV/2;

reg [WIDTH-1:0] rreg;
wire [WIDTH-1:0] nxt;
reg track;
 
always @(posedge clock_in or posedge reset)
 
begin
  if (reset)
     begin
        rreg <= 0;
	track <= 1'b0;
     end
 
  else if (nxt == div)
 	   begin
	     rreg <= 0;
	     track <= ~track;
	   end
 
  else 
      rreg <= nxt;
end
 
 assign nxt = rreg+1;   	      
 assign clk_out = track;

endmodule