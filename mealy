`define GREATER 3'b010
`define EQUAL 3'b001
`define LESS 3'b011
module comp(reset,clk,a,b,greater,equal,less);
input reset,clk,a,b;
output reg greater,less,equal;
reg[1:0] state;
always @(posedge clk,posedge reset) begin
if(reset)
state<=`EQUAL;
else
case(state)
`EQUAL:
if(a<b)
state<=`LESS ;
else if(a>b)
state<=`GREATER;
else
state<=`EQUAL;
`LESS:
if(a>b)
state<=`GREATER;
else if(a<b | a==b)
state<=`LESS;
`GREATER:
if(a<b)
state<=`LESS;
else if(a>b | a==b)
state<=`GREATER;
endcase
end

always@(*) begin
if(reset) begin
less<=0;
greater<=0;
equal<=1;end
else begin
case(state)
`EQUAL:
if(a>b) begin
greater<=1;
less<=0;
equal<=0;end

else if(a<b) begin
greater<=0;
less<=1;
equal<=0;end

else if(a==b) begin
greater<=0;
less<=0;
equal<=1;end

`GREATER:
 if(a<b) begin
greater<=0;
less<=1;
equal<=0;end
else if(a==b | a>b) begin
greater<=1;
less<=0;
equal<=0;end

`LESS:
if(a>b) begin
greater<=1;
less<=0;
equal<=0;end
else if(a<b | a==b) begin
greater<=0;
less<=1;
equal<=0;end

endcase
end
end
endmodule
