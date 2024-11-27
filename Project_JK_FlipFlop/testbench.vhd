library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_JK_FlipFlop is
end TB_JK_FlipFlop;

architecture Sim of TB_JK_FlipFlop is
    component JK_FlipFlop is
        Port (
            J   : in STD_LOGIC;
            K   : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

    signal J, K : STD_LOGIC := '0';  
    signal Clk  : STD_LOGIC := '0';  
    signal Q, Qn : STD_LOGIC;      

begin
    DUT: JK_FlipFlop Port Map(
        J   => J,
        K   => K,
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
        J <= '1'; K <= '0';
        wait for 20 ns;

        J <= '0'; K <= '1';
        wait for 20 ns;

        J <= '1'; K <= '1';
        wait for 40 ns;

        J <= '0'; K <= '0';
        wait for 20 ns;

        wait;
    end process;

end Sim;
