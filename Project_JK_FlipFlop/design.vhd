library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port (
        J   : in STD_LOGIC;  
        K   : in STD_LOGIC; 
        Clk : in STD_LOGIC; 
        Q   : out STD_LOGIC; 
        Qn  : out STD_LOGIC   
    );
end JK_FlipFlop;

architecture LogicGates of JK_FlipFlop is
    signal J_and_Clk, K_and_Clk, S, R : STD_LOGIC;
    signal Q_int, Qn_int : STD_LOGIC;
begin
    J_and_Clk <= J nand Clk; 
    K_and_Clk <= K nand Clk; 

    S <= J_and_Clk nand Qn_int; 
    R <= K_and_Clk nand Q_int;  

    Q_int <= S nand Qn_int; 
    Qn_int <= R nand Q_int;

    Q <= Q_int;
    Qn <= Qn_int;

end LogicGates;
