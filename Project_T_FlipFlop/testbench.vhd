library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_T_FlipFlop is
end TB_T_FlipFlop;

architecture Sim of TB_T_FlipFlop is
    component T_FlipFlop is
        Port (
            T   : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

    signal T : STD_LOGIC := '0';  
    signal Clk : STD_LOGIC := '0'; 
    signal Q, Qn : STD_LOGIC; 

begin
    DUT: T_FlipFlop Port Map(
        T   => T,
        Clk => Clk,
        Q   => Q,
        Qn  => Qn
    );

    Clk_Process: process
    begin
        Clk <= '0';
        wait for 10 ns; 
        Clk <= '1';
        wait for 10 ns;
    end process;

    Stimulus: process
    begin
        T <= '1';
        wait for 40 ns;

        T <= '0';
        wait for 40 ns;

        T <= '1';
        wait for 40 ns;

        wait;
    end process;

end Sim;
