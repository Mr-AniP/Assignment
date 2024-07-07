module vdf_2_fsm(
    input wire clk,
    input wire rst,
    input wire [1:0] in,
    output wire [1:0] out
);
reg [2:0] state;
reg [1:0] outery;
reg [1:0] outer;
reg [2:0] new_state;
always@(posedge clk or posedge rst)
    begin
        if(rst==1'b1)
            begin
                state <= 3'b000;
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
        new_state = 3'b000;
        outer = 2'b00;
        case (state)
            3'b000:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b000;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b001;
                                outer = 2'b01;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b101;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b010;
                                outer = 2'b00;
                            end 
                    endcase
                end
            3'b001:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b000;
                                outer = 2'b11;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b010;
                                outer = 2'b11;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b001;
                                outer = 2'b10;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b011;
                                outer = 2'b10;
                            end
                    endcase
                end 
            3'b010:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b101;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b100;
                                outer = 2'b01;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b010;
                                outer = 2'b00;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b011;
                                outer = 2'b00;
                            end
                    endcase
                end
            3'b011:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b010;
                                outer = 2'b11;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b100;
                                outer = 2'b01;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b110;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b011;
                                outer = 2'b11;
                            end
                    endcase
                end
            3'b100:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b101;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b111;
                                outer = 2'b00;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b111;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b110;
                                outer = 2'b10;
                            end
                    endcase
                end
            3'b101:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b101;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b000;
                                outer = 2'b00;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b111;
                                outer = 2'b11;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b111;
                                outer = 2'b11;
                            end
                    endcase
                end 
            3'b110:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b110;
                                outer = 2'b01;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b100;
                                outer = 2'b11;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b111;
                                outer = 2'b00;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b110;
                                outer = 2'b11;
                            end
                    endcase
                end
            3'b111:
                begin
                    case(in)
                        2'b00:
                            begin
                                new_state = 3'b110;
                                outer = 2'b11;
                            end 
                        2'b01:
                            begin
                                new_state = 3'b111;
                                outer = 2'b00;
                            end 
                        2'b10:
                            begin
                                new_state = 3'b111;
                                outer = 2'b00;
                            end 
                        2'b11:
                            begin
                                new_state = 3'b111;
                                outer = 2'b10;
                            end
                    endcase
                end
        endcase
    end
assign out=outery;
endmodule