-- ***************************************************************************************
-- * PROJECT: LW9 - Single-Cycle Processor Design - FPGA
-- * FILENAME: synchronizer.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 5/8/2018
-- * DESCRIPTION: 
-- * - top-level schematic of the single-cycle processor
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity synchronizer is
port(   
        SYSRST : in  std_logic;
        CLK    : in  std_logic;
        RST    : out std_logic
	);
end entity synchronizer;
 
architecture behavioral of synchronizer is	
						 
    signal Q: std_logic;

begin 
    
    -- Asynchronous active low
    dff1: process(SYSRST, CLK) 
    begin 
        if(SYSRST='0') then 
            Q <= '0';
        elsif(rising_edge(CLK)) then
            Q <= '1'; 
		  end if;
    end process dff1;

    -- Asynchronous active low
    dff2: process(SYSRST, CLK) 
    begin 
        if(SYSRST='0') then 
            RST <= '0';
        elsif(rising_edge(CLK)) then
            RST <= Q;
		  end if;	
    end process dff2;
	
end architecture behavioral;