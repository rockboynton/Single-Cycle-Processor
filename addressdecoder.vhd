-- ***************************************************************************************
-- * PROJECT: LW8 - Single-Cycle Processor Design FPGA
-- * FILENAME: addressdecoder.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - System address decoder 
-- ***************************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned;

entity addressdecoder is 
	port(
            ADDR  : in  std_logic_vector(31 downto 0);
            MEMRD : in  std_logic;
            MEMWR : in  std_logic;
            LD2   : out std_logic;
            LD1   : out std_logic;
            LD0   : out std_logic;
            DATAS : out std_logic
		);
end entity addressdecoder;

architecture dataflow of addressdecoder is 
		
begin

    LD2     <= '1' when ADDR < X"00000020" and MEMRD = '0' and MEMWR = '1' else
               '0';

    LD1     <= '1' when ADDR = X"000000F8" and MEMRD = '0' and MEMWR = '1' else
               '0';

    LD0     <= '1' when ADDR = X"000000FC" and MEMRD = '0' and MEMWR = '1' else
               '0';

    DATAS   <= '1' when ADDR < X"00000020" and MEMRD = '1' and MEMWR = '0' else
			   '0' when ADDR = X"000000F4" and MEMRD = '1' and MEMWR = '0' else
               '0';
			  		
end architecture dataflow;