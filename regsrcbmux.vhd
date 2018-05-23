-- ***************************************************************************************
-- * PROJECT: LW4 - Special Purpose Processor - 2-to-1 Bus Mux
-- * FILENAME: regsrcbmux.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/28/17
-- * DESCRIPTION: 
-- * - This specification implements a 2 by 4-bit bus multiplexar in a dataflow VHDL 
-- ***************************************************************************************

-- load libraries 
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
entity regsrcbmux is
    port(   
        D3,D2,D1,D0   : in  std_logic_vector(3 downto 0);
        S       : in  std_logic_vector(1 downto 0);
        Y       : out  std_logic_vector(3 downto 0)
    );
end entity regsrcbmux;

-- architecture: internal circuit 
architecture dataflow of regsrcbmux is

begin 

    with S select 
    Y <= D0   when  B"00",
         D1   when  B"01",
         D3   when  B"11",
         D2   when  others;

end architecture dataflow;