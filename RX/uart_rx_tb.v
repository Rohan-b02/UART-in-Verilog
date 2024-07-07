// Code your testbench here
// or browse Examples
module test_rx();

 reg clk,reset,rxd;
 wire [7:0] data_out;
 wire rx_done;

 uart_rx UUT (clk,reset,rxd,rx_done,data_out,tick);

always #10 clk = ~clk;

 initial begin
   
   clk = 0;
   reset = 1;
   #11 reset = 0;
   #20 rxd =0;
   rdata(1);
   rdata(0);
   rdata(1);
   rdata(0);
   rdata(1);
   rdata(0);
   rdata(1);
   rdata(0);

   rdata(1);//stop bit
   
   #10000000 $stop;




 end

 task rdata;
 input inp;
 begin
   @(posedge tick)
   		rxd = inp;

 end

 endtask

 initial begin
   $dumpfile("dump.vcd");
   $dumpvars(1,test_rx);
 end
endmodule
