`define GREATER 3'b010
`define EQUAL 3'b001
`define LESS 3'b011
module comp(reset,clk,a,b,greater,equal,less);
input reset,clk,a,b;
output reg greater,equal,less;
reg[2:0] state;
//parameter GREATER=3'b010;
//parameter EQUAL=3'b001;
//parameter LESS=3'b011;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
state<=`EQUAL;
greater <=0;
less <=0;
equal <=1;
end
else
begin
if(state==`GREATER) begin
if(a>b) begin
state<=`GREATER;
greater=1;
equal=0;
less=0;	end
else if(a==b) begin
state<=`GREATER;
greater=1;
equal=0;
less=0; end
else if(a<b) begin
state<=`LESS;
greater=0;
equal=0;
less=1;
end
end
else if(state==`LESS) begin
if(a>b) begin
state<=`GREATER;
greater=1;
equal=0;
less=0;	end
else if(a==b) begin
state<=`LESS;
greater=0;
equal=0;
less=1; end
else if(a<b) begin
state<=`LESS;
greater=0;
equal=0;
less=1;
end
end

else if(state==`EQUAL) begin
if(a>b) begin
state<=`GREATER;
greater=1;
equal=0;
less=0;	end
else if(a==b) begin
state<=`EQUAL;
greater=0;
equal=1;
less=0; end
else if(a<b) begin
state<=`LESS;
greater=0;
equal=0;
less=1;
end
end
end
end

endmodule
