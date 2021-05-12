----------------------------------------------------------------------------------
-- Coventry University
-- Computer Hardware and Software Engineering
-- Analogue and Digital Electronics 2
-- 
-- Paul Johannes Aru
-- 03.11.2018
-- Testbench.vhd
----------------------------------------------------------------------------------

-- Libraries:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench is
    -- Half period of the clock
    constant half_period : Time := 50ns;
end Testbench;

-- Main Code:
architecture Behavioral of Testbench is
    component studentIDCounter is
        Port(Output : out std_logic_vector(0 to 2); CLK : in std_logic);
    end component;
    -- Input Signal
    signal Clock : std_logic := '0';
    -- Output Signal
    signal SID : std_logic_vector(0 to 2);
    begin
        uut: StudentIDCounter PORT MAP(CLK=>Clock, Output=>SID);
        -- After half period clock switches its position
        Clock <= not Clock after half_period;
        stim_proc:process
    begin
        wait;
    end process;
end Behavioral;
