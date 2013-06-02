
module system_strob_gen
(
//  fd - in Hz, period - in samples, freqoffset - in mHz 
// error_val - size of whole window(in two ways +/-) where strob generate, in samples
// p_loss - probability of loss strob, value 65535 is 100%, 0 meens that loss=0 

input wire clk,

input wire [31:0] period,
input wire [31:0] fd,
input wire [31:0] freqoffset,
input wire [31:0] error_val,
input wire [31:0] p_loss,
input wire [31:0] start_delay,

input wire ce,
output reg strob
);


initial begin
end


always @ ( posedge clk ) begin
	if ($syst_strob_gen(period,fd,freqoffset,error_val,p_loss,start_delay)>0)
		strob<=1'b1;
	else
		strob<=1'b0;
end



endmodule 
