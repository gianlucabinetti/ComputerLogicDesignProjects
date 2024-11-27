library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is
    Port (
        Data : in STD_LOGIC; 
        Clk  : in STD_LOGIC; 
        Q    : out STD_LOGIC; 
        Qn   : out STD_LOGIC  
    );
end D_FlipFlop;

architecture LogicGates of D_FlipFlop is
    signal Data_n, S, R : STD_LOGIC;
    signal Q_int, Qn_int : STD_LOGIC;
begin
    Data_n <= Data nand Data;

    S <= Data nand Clk;       
    R <= Data_n nand Clk;     

    Q_int <= S nand Qn_int; 
    Qn_int <= R nand Q_int;   

    Q <= Q_int;
    Qn <= Qn_int;

end LogicGates;
