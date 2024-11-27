library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FlipFlop is
    Port (
        T   : in STD_LOGIC; 
        Clk : in STD_LOGIC; 
        Q   : out STD_LOGIC; 
        Qn  : out STD_LOGIC   
    );
end T_FlipFlop;

architecture LogicGates of T_FlipFlop is
    signal T_and_Clk, S, R : STD_LOGIC;
    signal Q_int, Qn_int : STD_LOGIC; 
begin
    T_and_Clk <= T nand Clk;
    
    S <= T_and_Clk nand Qn_int; 
    R <= T_and_Clk nand Q_int;   

    Q_int <= S nand Qn_int;  
    Qn_int <= R nand Q_int; 

    Q <= Q_int;
    Qn <= Qn_int;

end LogicGates;
