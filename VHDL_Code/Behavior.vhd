----------------------------------------------------------------------------------
-- Coventry University
-- Computer Hardware and Software Engineering
-- Analogue and Digital Electronics 2
-- 
-- Paul Johannes Aru
-- 03.11.2018
-- Behavior.vhd
----------------------------------------------------------------------------------

-- Libraries:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Inputs and Outputs:
entity StudentIDCounter is
    Port(Output : out std_logic_vector(0 to 2); CLK : in std_logic);
end StudentIDCounter;

-- Main Code:
architecture Behavioral of StudentIDCounter is
-- State Variable
signal State: std_logic_vector(0 to 2):= "000";
    begin process(CLK)
    begin
        -- If statement that ensures that Output is synchronised to the Clock
        if(rising_edge(CLK)) then 
            -- Case statement that outputs the Student ID, based on the State
            case State is
                -- State 0
                when "000" =>
                    Output <= "010";
                -- State 1
                when "001" =>
                    Output <= "001";
                -- State 2
                when "010" =>
                    Output <= "011";
                -- State 3
                when "011" =>
                    Output <= "101";
                -- State 4
                when "100" =>
                    Output <= "101";
                -- State 5
                when "101" =>
                    Output <= "001";
                -- State 6
                when "110" =>
                    Output <= "111";
                -- State 7, this value should never appear.
                when others =>
                    Output <= "000";
            end case;
            -- If statement that creates a loop from State 6 to State 0
            if State = "110" then
                State <= "000";
            else
                State <= State + 1;
            end if;
        end if;
    end process;
end Behavioral;
