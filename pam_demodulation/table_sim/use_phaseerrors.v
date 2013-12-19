//
// Copyright 1991-2010 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE
// PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO
// LICENSE TERMS.
//
// Simple Verilog PLI Example - Verilog test module for fibonacci seq.
//
module use_phaseerrors
(
input wire clk,
input wire [8:0] input_angles,
input wire [8:0] phase_acum_mod,
output wire [8:0] phi_error,
output wire [9:0] val_engle
);

//reg [9*2-1:0] tab_result;

reg [31:0] s_phi_error;
reg [31:0] s_val_engle;

initial begin
end

assign phi_error=s_phi_error[8:0];
assign val_engle=s_val_engle[9:0];

always @ ( posedge clk ) begin
		$func_phaseerrors({phase_acum_mod,input_angles}, s_phi_error, s_val_engle);
end



endmodule 
