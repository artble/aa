module ALU (
    input wire signed [11:0] i_arg0,   // Wejście 12-bitowe
    input wire signed [11:0] i_arg1,   // Wejście 12-bitowe
    input wire [2:0] i_oper,           // Kod operacji (3 bity)
    output reg signed [9:0] o_result,  // Wynik 10-bitowy
    output reg [3:0] o_flag            // Flagi (4 bity)
);

always @(*) begin
    // Reset flag
    o_flag = 4'b0000;
    o_result = 10'sd0;

    case (i_oper)
        3'b000: begin // Dodawanie
            o_result = i_arg0 + i_arg1;
        end

        3'b001: begin // Odejmowanie
            o_result = i_arg0 - i_arg1;
        end

        3'b010: begin // AND
            o_result = i_arg0 & i_arg1;
        end

        3'b011: begin // Przesunięcie (w lewo lub w prawo)
            if (i_arg1 > 0) begin
                o_result = i_arg0 <<< i_arg1; 
            end
            else if (i_arg1 < 0) begin
                o_result = i_arg0 >>> -i_arg1;
            end
            else begin
                o_result = i_arg0;
            end
        end

        3'b100: begin // Mnożenie
            o_result = i_arg0 * i_arg1;
        end

        3'b101: begin // Dzielenie
            if (i_arg1 == 0) begin
                o_result = 10'sd0;  // Domyślny wynik przy dzieleniu przez zero
                o_flag[3] = 1'b1; // Flaga dzielenia przez zero
            end
            else begin
                o_result = i_arg0 / i_arg1;
            end
        end

        3'b110: begin // OR
            o_result = i_arg0 | i_arg1;
        end

        3'b111: begin // XOR
            o_result = i_arg0 ^ i_arg1;
        end

        default: begin
            o_result = 10'sd0;
        end
    endcase

    // Flagi
    if (o_result < 0) begin
        o_flag[0] = 1'b1; // Flaga negatywna
    end

    if (o_result > 0) begin
        o_flag[1] = 1'b1; // Flaga pozytywna
    end

    if (o_result == 0) begin
        o_flag[2] = 1'b1; // Flaga zero
    end

    // Flaga przepełnienia dla dodawania/odejmowania
    if ((i_arg0 > 0 && i_arg1 > 0 && o_result < 0) || 
        (i_arg0 < 0 && i_arg1 < 0 && o_result > 0)) begin
        o_flag[3] = 1'b1; // Flaga przepełnienia
    end
end

endmodule
