module vdf_2_fsm(
    input wire clk,
    input wire rst,
    input wire [1:0] in,
    output wire [1:0] out
);
reg [7:0] state;
reg [1:0] outery;
reg [1:0] outer;
reg [7:0] new_state;
parameter s1 = 8'b00000001,s2=8'b00000010,s3=8'b00000100,s4=8'b00001000;
parameter s5 = 8'b00010000,s6=8'b00100000,s7=8'b01000000,s8=8'b10000000;
always@(posedge clk or posedge rst)
    begin
        if(rst==1'b1)
            begin
                state <= s1;
                outery <= 2'b00;
            end
        else
            begin
                state <= new_state;
                outery <= outer;
            end
    end
always@(*)
    begin
        case (state)
            s1:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s1;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = s2;
                                outer = 2'b01;
                            end 
                        2'b10:
                            begin
                                new_state = s6;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = s3;
                                outer = 2'b00;
                            end 
                    endcase
                end
            s2:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s1;
                                outer = 2'b11;
                            end 
                        2'b01:
                            begin
                                new_state = s3;
                                outer = 2'b11;
                            end 
                        2'b10:
                            begin
                                new_state = s2;
                                outer = 2'b10;
                            end 
                        2'b11:
                            begin
                                new_state = s4;
                                outer = 2'b10;
                            end
                    endcase
                end 
            s3:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s6;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = s5;
                                outer = 2'b01;
                            end 
                        2'b10:
                            begin
                                new_state = s3;
                                outer = 2'b00;
                            end 
                        2'b11:
                            begin
                                new_state = s4;
                                outer = 2'b00;
                            end
                    endcase
                end
            s4:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s3;
                                outer = 2'b11;
                            end 
                        2'b01:
                            begin
                                new_state = s5;
                                outer = 2'b01;
                            end 
                        2'b10:
                            begin
                                new_state = s7;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = s4;
                                outer = 2'b11;
                            end
                    endcase
                end
            s5:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s6;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = s8;
                                outer = 2'b00;
                            end 
                        2'b10:
                            begin
                                new_state = s8;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = s7;
                                outer = 2'b10;
                            end
                    endcase
                end
            s6:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s6;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = s1;
                                outer = 2'b00;
                            end 
                        2'b10:
                            begin
                                new_state = s8;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = s8;
                                outer = 2'b11;
                            end
                    endcase
                end 
            s7:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s7;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = s5;
                                outer = 2'b11;
                            end 
                        2'b10:
                            begin
                                new_state = s8;
                                outer = 2'b00;
                            end 
                        2'b11:
                            begin
                                new_state = s7;
                                outer = 2'b11;
                            end
                    endcase
                end
            s8:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = s7;
                                outer = 2'b11;
                            end 
                        2'b01:
                            begin
                                new_state = s8;
                                outer = 2'b00;
                            end 
                        2'b10:
                            begin
                                new_state = s8;
                                outer = 2'b00;
                            end 
                        2'b11:
                            begin
                                new_state = s8;
                                outer = 2'b10;
                            end
                    endcase
                end
            default:
                begin
                    new_state = s1;
                    outer = 2'b00;
                end 
        endcase
    end
assign out=outery;
endmodule