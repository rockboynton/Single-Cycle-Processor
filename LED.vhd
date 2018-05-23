-- ***************************************************************************************
-- * PROJECT: LW8 - Single-Cycle Processor Design FPGA
-- * FILENAME: reg32.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/28/18
-- * DESCRIPTION: 
-- * - This specification implements a 32-bit register to display on DE10 Lite LEDS 
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- active high load, active low reset 
entity LED is 
port(   D   : in   std_logic_vector(31 downto 0);
	    LD  : in   std_logic;
	    RST : in   std_logic;
	    CLK : in   std_logic;
	    LEDS: out  std_logic_vector(9 downto 0)
	);
end entity LED;

-- architecture: internal circuit 
architecture structural of LED is

	signal Q: std_logic_vector(31 downto 0);

begin 

	

	reg: entity work.reg32
			port map(
				D=>D,LD=>LD,RST=>RST,CLK=>CLK,Q=>Q
			);

	LEDS <= Q(9 downto 0);
	
end architecture structural;