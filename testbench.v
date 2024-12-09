module testbench;

    reg signed [11:0] i_arg0;         // Wejście 12-bitowe
    reg signed [11:0] i_arg1;         // Wejście 12-bitowe
    reg [2:0] i_oper;                 // Kod operacji (3 bity)
    wire signed [9:0] o_result;       // Wynik 10-bitowy
    wire [3:0] o_flag;                // Flagi (4 bity)

    // Instancja modułu ALU
    ALU alu (
        .i_arg0(i_arg0), 
        .i_arg1(i_arg1), 
        .i_oper(i_oper), 
        .o_result(o_result),
        .o_flag(o_flag)
    );

    // Inicjalizacja i wykonanie testów
    initial begin
        // Test 1: Dodawanie (1000 + 2000)
        i_arg0 = 12'sd1000;
        i_arg1 = 12'sd2000;
        i_oper = 3'b000; // Operacja dodawania
        #10;
        $display("Test 1: Dodawanie (1000 + 2000) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 2: Odejmowanie (-1000 - 500)
        i_arg0 = 12'sd-1000;
        i_arg1 = 12'sd500;
        i_oper = 3'b001; // Operacja odejmowania
        #10;
        $display("Test 2: Odejmowanie (-1000 - 500) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 3: Mnożenie (100 * 100)
        i_arg0 = 12'sd100;
        i_arg1 = 12'sd100;
        i_oper = 3'b100; // Operacja mnożenia
        #10;
        $display("Test 3: Mnożenie (100 * 100) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 4: Dzielenie (100 / 10)
        i_arg0 = 12'sd100;
        i_arg1 = 12'sd10;
        i_oper = 3'b101; // Operacja dzielenia
        #10;
        $display("Test 4: Dzielenie (100 / 10) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 5: Dzielenie przez zero (100 / 0)
        i_arg0 = 12'sd100;
        i_arg1 = 12'sd0;
        i_oper = 3'b101; // Operacja dzielenia
        #10;
        $display("Test 5: Dzielenie przez zero (100 / 0) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 6: AND (5 & 3)
        i_arg0 = 12'sd5;
        i_arg1 = 12'sd3;
        i_oper = 3'b010; // Operacja AND
        #10;
        $display("Test 6: AND (5 & 3) => wynik = %d, flagi = %b", o_result, o_flag);

        // Test 7: Flaga przepełnienia przy mnożeniu (500 * 500)
        i_arg0 = 12'sd500;
        i_arg1 = 12'sd500;
        i_oper = 3'b100; // Operacja mnożenia
        #10;
        $display("Test 7: Flaga przepełnienia przy mnożeniu (500 * 500) => wynik = %d, flagi = %b", o_result, o_flag);

        // Koniec symulacji
        $finish;
    end

endmodule
