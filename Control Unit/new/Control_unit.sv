`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2024 03:09:47 PM
// Design Name: 
// Module Name: Control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
typedef enum {
    Add,
    Sub,
    Lshf,
    Mul,
    Div
} OpCode;


module ALU(
    input logic [3:0]opcode,
    input logic [15:0]operand1,
    input logic [15:0]operand2,
    output logic [15:0]result
    );
    
    always_comb begin
        case(opcode)
            Add:    result = operand1 + operand2;
            Sub:    result = operand1 - operand2;
            Mul:    result = operand1 * operand2;
            Lshf:   result = (operand1 << 8) + operand2[7:0];
            Div: begin //If div by 0 then result == 0
                if(operand2 == 0) begin
                    result = 16'h0000;
                end else begin
                    result = operand1 / operand2;            
                end
            end
        endcase
    end
    
endmodule
//module control_unit();
//endmodule
//    input logic clk,
//    input logic rst_n,
    
//    input logic MMU_rdy,
//    input logic [15:0] MMU_rx_data,
//    output logic [15:0] MMU_tx_data,
//    output logic [15:0] MMU_addr,
//    output logic MMU_get,
//    output logic MMU_set

    
    
//State Encoding
//typedef enum logic [4:0] {
//    FETCH, 
//    FETCH_B,
//    FETCH_C,
//    DECODE
//} state_t;
    
//    //Control Unit registers
//    logic [15:0] CU_o1;
//    logic [15:0] CU_o2;
//    logic [15:0] IPR;
//    logic [15:0] IR;
    
//    state_t current_state, next_state;
    
    
//    //State Machine
//    always_comb begin
//        case(current_state)
//            FETCH: begin
//                MMU_addr = IPR;
//                MMU_get = 1;
//                next_state = FETCH_B;
//            end
//            FETCH_B: begin
//                if(MMU_rdy == 1) begin
//                    IR = MMU_rx_data;
//                    next_state = FETCH_C;
//                end else begin
//                    next_state = FETCH_B;
//                end
//            end
//            FETCH_C: begin
//                IPR = IPR + 1;
//                next_state = DECODE;
//            end      
//            DECODE: begin
//                next_state = DECODE;
//            end
//         endcase
//    end
    
    

    
//    //NEXT state FF
//    always_ff @(posedge clk or negedge rst_n) begin
//        if(!rst_n) begin
//            IPR = 0;
//            current_state = FETCH;
//        end else begin
//            current_state = next_state;
//        end
//    end
    
