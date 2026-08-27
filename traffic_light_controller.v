module traffic_light_controller(input clk,
input rst,
 output reg A_red,
 output reg A_yellow,
 output reg A_green,

 output reg B_red,
 output reg B_yellow,
 output reg B_green
);

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

reg [1:0] current_state;
reg [1:0] next_state;

always @(posedge clk or posedge rst) begin             //state register vala part done
    if (rst)
        current_state <= s0;
    else
        current_state <= next_state;
end

reg [2:0] count;       //counter vala part done
 always @(posedge clk or posedge rst) begin

        if (rst) begin
            count <= 0;
        end

        else begin
        
        case (current_state)
        s0 : begin
        if (count == 4)
        count <= 0;
        else count <= count+1; end 
        
        s1 : begin 
         if (count == 1)
        count <= 0;
        else count <= count+1; end 
           s2: begin
                    if (count == 4)
                        count <= 0;
                    else
                        count <= count + 1;
                end

                s3: begin
                    if (count == 1)
                        count <= 0;
                    else
                        count <= count + 1;
                end

                default:
                    count <= 0;

            endcase
             end
end


always @(*)
begin 
case (current_state)
s0: begin 
if (count == 4) 
next_state = s1;
else
next_state = s0;
end

s1: begin 
if (count == 1) 
next_state = s2;
else
next_state = s1;
end

s2: begin 
if (count == 4) 
next_state = s3;
else
next_state = s2;
end

s3: begin 
if (count == 1) 
next_state = s0;
else
next_state = s3;
end


            default:
                next_state = s0;

        endcase

    end
// output logic
 always @(*) begin

        // Default: all lights OFF

        A_red    = 0;
        A_yellow = 0;
        A_green  = 0;

        B_red    = 0;
        B_yellow = 0;
        B_green  = 0;


        case (current_state)

            // S0: Road A GREEN, Road B RED
            s0: begin
                A_green = 1;
                B_red   = 1;
            end


            // S1: Road A YELLOW, Road B RED
            s1: begin
                A_yellow = 1;
                B_red    = 1;
            end


            // S2: Road A RED, Road B GREEN
            s2: begin
                A_red   = 1;
                B_green = 1;
            end


            // S3: Road A RED, Road B YELLOW
            s3: begin
                A_red    = 1;
                B_yellow = 1;
            end


            default: begin
                A_red = 0;
                A_yellow = 0;
                A_green = 0;

                B_red = 0;
                B_yellow = 0;
                B_green = 0;
            end

        endcase

    end

endmodule
