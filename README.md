# aa
iverilog -o my_simulation.vvp SCKPROJ.v testbench.v
vvp my_simulation.vvp

Kroki kompilacji i symulacji w VCS (Synopsys)

    Uruchom terminal i wejdź do katalogu, w którym znajdują się pliki Verilog.

    Kompilacja: W terminalu wpisz komendę, aby skompilować pliki Verilog:

vcs -full64 -debug_pp SCKPROJ.v testbench.v

Ta komenda skompiluje oba pliki. W razie potrzeby możesz dodać inne opcje kompilacji, takie jak -sv (SystemVerilog), jeśli korzystasz z rozszerzeń SystemVerilog.

Symulacja: Po kompilacji, uruchom symulację:

    ./simv

    Symulacja uruchomi się w terminalu, a wyniki z $display będą widoczne w konsoli.

5. Kroki kompilacji i symulacji w XSIM (Xilinx Vivado)

    Uruchom Vivado.

    Utwórz projekt w Vivado:
        Wybierz "Create New Project" i nadaj nazwę.
        Wybierz odpowiednią rodzinę układów (np. Zynq, Spartan itp.).
        Dodaj pliki Verilog do projektu.

    Kompilacja:
        Kliknij "Run Synthesis" i "Run Implementation", aby sprawdzić, czy pliki są poprawne.

    Uruchom symulację:
        Wybierz "Run Simulation" i kliknij "Simulation" > "Run Simulation".
        Okno symulacji wyświetli wynik testbench w formie fal czasowych.

6. Kroki kompilacji i symulacji w Verilator (open-source)

    Zainstaluj Verilator: W systemie Linux lub macOS możesz zainstalować Verilator za pomocą narzędzia apt lub brew.

sudo apt install verilator

Kompilacja: Użyj polecenia verilator do kompilacji plików Verilog:

verilator -Wall --cc SCKPROJ.v --exe testbench.v
make -j -C obj_dir

Symulacja: Uruchom symulację przy użyciu:

./obj_dir/Vtestbench
