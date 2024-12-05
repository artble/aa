module ALU (
    input wire signed [9:0] i_arg0,  // Pierwszy argument (wejście 10-bitowe)
    input wire signed [9:0] i_arg1,  // Drugi argument (wejście 10-bitowe)
    input wire [2:0] i_oper,         // Kod operacji (3 bity)
    output reg signed [9:0] o_result, // Wynik operacji (10-bitowe wyjście)
    output reg [3:0] o_flag           // Flagi (4 bity)
);

always @(*) begin
    o_flag = 4'b0000;

    // Wykonywanie operacji w zależności od kodu operacji
    case (i_oper)
        3'b000: begin // Dodawanie
            o_result = i_arg0 + i_arg1;
        end

        3'b001: begin // Odejmowanie
            o_result = i_arg0 - i_arg1;
        end

        3'b011: begin // Przesunięcie bitowe
            if (i_arg1 > 0) begin
                o_result = i_arg0 <<< i_arg1;  // Przesunięcie w lewo
            end else if (i_arg1 < 0) begin
                o_result = i_arg0 >>> -i_arg1; // Przesunięcie w prawo
            end else begin
                o_result = i_arg0; // Brak przesunięcia
            end
        end

        3'b010: begin // Operacja AND
            o_result = i_arg0 & i_arg1;
        end

        3'b110: begin // Operacja OR
            o_result = i_arg0 | i_arg1;
        end

        3'b111: begin // Operacja XOR
            o_result = i_arg0 ^ i_arg1;
        end

        default: begin 
            o_result = 10'd0; 
        end
    endcase

    // Ustawianie flag
    if (o_result < 1'sd0) begin
        o_flag[0] = 1'b1; // Ujemny wynik
    end

    if (o_result > 1'sd0) begin
        o_flag[1] = 1'b1; // Dodatni wynik
    end

    if (o_result == 0) begin
        o_flag[2] = 1'b1; // Wynik równy zero
    end

    if (i_arg0 < 11'sd0 && i_arg1 < 11'sd0 && o_result > 11'sd0) begin
        o_flag[3] = 1'b1; // Overflow (przepełnienie)
    end

    if (i_arg0 > 11'sd0 && i_arg1 > 11'sd0 && o_result < 11'sd0) begin
        o_flag[3] = 1'b1; // Overflow (przepełnienie)
    end

end

endmodule
