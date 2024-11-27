library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_D_FlipFlop is
end TB_D_FlipFlop;

architecture Sim of TB_D_FlipFlop is
    component D_FlipFlop is
        Port (
            Data : in STD_LOGIC;
            Clk  : in STD_LOGIC;
            Q    : out STD_LOGIC;
            Qn   : out STD_LOGIC
        );
    end component;

    signal Data : STD_LOGIC := '0';  
    signal Clk  : STD_LOGIC := '0'; 
    signal Q    : STD_LOGIC;      
    signal Qn   : STD_LOGIC;       

begin
    DUT: D_FlipFlop Port Map(
        Data => Data,
        Clk  => Clk,
        Q    => Q,
        Qn   => Qn
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
        Data <= '1';
        wait for 20 ns;

        Data <= '0';
        wait for 20 ns;

        Data <= '1';
        wait for 20 ns;

        Data <= '1';
        wait for 40 ns;

        Data <= '0';
        wait for 5 ns; 
        wait for 15 ns; 

        wait;
    end process;

end Sim;
