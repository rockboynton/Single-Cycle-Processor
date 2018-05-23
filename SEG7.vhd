-- ***************************************************************************************
-- * PROJECT: LW8 - Single-Cycle Processor Design FPGA
-- * FILENAME: SEG7.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - SEG7 output device
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity SEG7 is
port(   
        D    : in  std_logic_vector(31 downto 0);
        LD   : in  std_logic;
        RST  : in  std_logic;
        CLK  : in  std_logic;
        SEG5 : out std_logic_vector(7 downto 0);
        SEG4 : out std_logic_vector(7 downto 0);
        SEG3 : out std_logic_vector(7 downto 0);
        SEG2 : out std_logic_vector(7 downto 0);
        SEG1 : out std_logic_vector(7 downto 0);
        SEG0 : out std_logic_vector(7 downto 0)
	  );
end entity SEG7;
 
architecture structural of SEG7 is	
						 
    signal Q: std_logic_vector(31 downto 0);

 begin 

    datareg:    entity work.reg32
                        port map(D=>D,LD=>LD,RST=>RST,CLK=>CLK,Q=>Q);

    seg7decode: entity work.seg7decode
                        port map(A=>Q,SEG5=>SEG5,SEG4=>SEG4,SEG3=>SEG3,SEG2=>SEG2,SEG1=>SEG1,SEG0=>SEG0);
	
end architecture structural;