`timescale 1ns / 1ps
/*
* Copyright (c) 2022, Shiv Nadar University, Delhi NCR, India. All Rights
* Reserved. Permission to use, copy, modify and distribute this software for
* educational, research, and not-for-profit purposes, without fee and without a
* signed license agreement, is hereby granted, provided that this paragraph and
* the following two paragraphs appear in all copies, modifications, and
* distributions.
*
* IN NO EVENT SHALL SHIV NADAR UNIVERSITY BE LIABLE TO ANY PARTY FOR DIRECT,
* INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST
* PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE.
*
* SHIV NADAR UNIVERSITY SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT
* NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
* PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS PROVIDED "AS IS". SHIV
* NADAR UNIVERSITY HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
* ENHANCEMENTS, OR MODIFICATIONS.
*/
module traffic_light_controller(input clk, input rst, output reg [2:0]light_M1, output reg [2:0]light_S, output reg [2:0]light_MT, output reg [2:0]light_M2);
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4,S6=5;
    reg [16:0]count;
    reg[2:0] ps;
    parameter  thr1 = 10,thr2 = 5,thr3 = 10,thr4 = 3;
    always@(posedge clk or posedge rst)
        begin
            if(rst == 1)
            begin
                ps <= S1;
                count <= 0;
            end
        else      
            case(ps)
                S1: if(count < thr1)
                        begin
                            ps <= S1;
                            count <= count+1;
                        end
                    else
                        begin
                            ps <= S2;
                            count <= 0;
                        end
                S2: if(count < thr3)
                        begin
                            ps <= S2;
                            count <= count+1;
                        end
                    else
                        begin
                            ps <= S3;
                            count <= 0;
                        end
                S3: if(count < thr2)
                        begin
                            ps <= S3;
                            count <= count+1;
                        end
                    else
                        begin
                            ps<=S4;
                            count<=0;
                        end
                S4:if(count < thr3)
                        begin
                            ps<=S4;
                            count<=count+1;
                        end
                    else
                        begin
                            ps<=S5;
                            count<=0;
                        end
                S5:if(count < thr4)
                        begin
                            ps <= S5;
                            count <= count+1;
                        end
                    else
                        begin
                            ps <= S6;
                            count <= 0;
                        end
                S6:if(count < thr3)
                        begin
                            ps <= S6;
                            count <= count+1;
                        end
                    else
                        begin
                            ps <= S1;
                            count <= 0;
                        end
                default: ps <= S1;
                endcase
            end   
            always@(ps)    
            begin
                case(ps)
                    S1:
                        begin
                           light_M1 <= 3'b001;
                           light_M2 <= 3'b001;
                           light_MT <= 3'b100;
                           light_S <= 3'b100;
                        end
                    S2:
                        begin 
                           light_M1 <= 3'b001;
                           light_M2 <= 3'b010;
                           light_MT <= 3'b100;
                           light_S <= 3'b100;
                        end
                    S3:
                        begin
                           light_M1 <= 3'b001;
                           light_M2 <= 3'b100;
                           light_MT <= 3'b001;
                           light_S <= 3'b100;
                        end
                    S4:
                        begin
                           light_M1 <= 3'b010;
                           light_M2 <= 3'b100;
                           light_MT <= 3'b010;
                           light_S <= 3'b100;
                        end
                    S5:
                        begin
                           light_M1 <= 3'b100;
                           light_M2 <= 3'b100;
                           light_MT <= 3'b100;
                           light_S <= 3'b001;
                        end
                    S6:
                        begin 
                           light_M1 <= 3'b100;
                           light_M2 <= 3'b100;
                           light_MT <= 3'b100;
                           light_S <= 3'b010;
                        end
                    default:
                        begin 
                           light_M1 <= 3'b000;
                           light_M2 <= 3'b000;
                           light_MT <= 3'b000;
                           light_S <= 3'b000;
                        end
               endcase
            end                
endmodule
