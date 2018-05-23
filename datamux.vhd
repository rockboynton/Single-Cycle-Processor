-- ***************************************************************************************
-- * PROJECT: LW4 - Special Purpose Processor - 2-to-1 Bus Mux
-- * FILENAME: bmux2to1.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/28/17
-- * DESCRIPTION: 
-- * - This specification implements a 2 by 32-bit bus multiplexar in a dataflow VHDL 
-- ***************************************************************************************

-- load libraries a
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

-- entity declaration: external-view
-- inputs: 
--    D1-0: inputs to be selected 
--    S: Selection bits
-- outputs: 
-- 	Y: outputs the value
entity datamux is
    port(   
        D1,D0   : in  std_logic_vector(31 downto 0);
        S       : in std_logic;
        Y       : out  std_logic_vector(31 downto 0)
    );
end entity datamux;

-- architecture: internal circuit 
architecture dataflow of datamux is

begin 

    with S select 
    Y <= D0   when  '0',
         D1   when  others;
			
end architecture dataflow;