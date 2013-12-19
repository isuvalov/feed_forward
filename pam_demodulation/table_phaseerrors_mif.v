module table_phaseerrors
(
input wire clk,
input wire[8:0] input_angles,
input wire[8:0] phase_acum_mod,

output reg [8:0] phi_error,
output reg [9:0] val_engle
);

wire [17:0] test_pos;

(* ram_init_file = "mem.mif"*)
reg [18:0] ram [262143:0];
initial begin
end

assign test_pos={phase_acum_mod,input_angles};

always @ ( posedge clk ) begin
	begin
		{phi_error,val_engle}<=ram[{phase_acum_mod,input_angles}];		
	end
			
end

endmodule 
