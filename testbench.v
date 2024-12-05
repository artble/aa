module testbench;

    // Rejestry wejściowe
    reg signed [9:0] i_arg0; // 10-bitowy rejestr wejściowy
    reg signed [9:0] i_arg1; // 10-bitowy rejestr wejściowy
    reg [2:0] i_oper;        // Kod operacji (3 bity)
    
    // Rejestry wyjściowe
    wire signed [9:0] o_result; // 10-bitowy wynik operacji
    wire [3:0] o_flag;         // Flagi (4 bity)

    // Instancja modułu ALU
    ALU alu1 (
        .i_arg0(i_arg0), 
        .i_arg1(i_arg1), 
        .i_oper(i_oper), 
        .o_result(o_result),
        .o_flag(o_flag)
    );

    // Inicjalizacja i wykonywanie testów
    initial begin
        // Test 1: Dodawanie (512 + 512)
        i_arg0 = 10'sd512;
        i_arg1 = 10'sd512;
        i_oper = 3'b000; // Kod operacji: dodawanie
        #10; // Czekanie 10 jednostek czasowych
        $display("Test 1: Dodawanie (512 + 512) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 2: Dodawanie (0 + 1)
        i_arg0 = 10'sd0;
        i_arg1 = 10'sd1;
        i_oper = 3'b000; // Kod operacji: dodawanie
        #10;
        $display("Test 2: Dodawanie (0 + 1) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 3: Odejmowanie (1 - 10)
        i_arg0 = 10'sd1;
        i_arg1 = 10'sd10;
        i_oper = 3'b001; // Kod operacji: odejmowanie
        #10;
        $display("Test 3: Odejmowanie (1 - 10) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 4: Przesunięcie w lewo (2 << 1)
        i_arg0 = 10'sd2;
        i_arg1 = 10'sd1;
        i_oper = 3'b011; // Kod operacji: przesunięcie
        #10;
        $display("Test 4: Przesunięcie w lewo (2 << 1) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 5: Operacja AND (5 & 3)
        i_arg0 = 10'sd5;
        i_arg1 = 10'sd3;
        i_oper = 3'b010; // Kod operacji: AND
        #10;
        $display("Test 5: Operacja AND (5 & 3) => wynik = %d, flagi = %b", o_result, o_flag);
        
        // Test 6: Operacja OR (7 | 2)
        i_arg0 = 10'sd7;
        i_arg1 = 10'sd2;
        i_oper = 3'b110; // Kod operacji: OR
        #10;
        $display("Test 6: Operacja OR (7 | 2) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 7: Operacja XOR (7 ^ 2)
        i_arg0 = 10'sd7;
        i_arg1 = 10'sd2;
        i_oper = 3'b111; // Kod operacji: XOR
        #10;
        $display("Test 7: Operacja XOR (7 ^ 2) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 8: Odejmowanie (8 - 8)
        i_arg0 = 10'sd8;
        i_arg1 = 10'sd8;
        i_oper = 3'b001; // Kod operacji: odejmowanie
        #10;
        $display("Test 8: Odejmowanie (8 - 8) => wynik = %d, flagi = %b", o_result, o_flag);

        // Zakończenie symulacji
        $finish;
    end

endmodule
