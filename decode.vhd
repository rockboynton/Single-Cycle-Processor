-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - Decode Circuitry 
-- * FILENAME: decode.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - top-level schematic of the decode circuitry in a single-cycle processor
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity decode is
port(   PC4     : in  std_logic_vector(31 downto 0);
        PC8     : in  std_logic_vector(31 downto 0);
        INSTR   : in  std_logic_vector(31 downto 0); 
        WD3     : in  std_logic_vector(31 downto 0); 
        REGDST  : in  std_logic_vector(1 downto 0);
        RNSEL   : in  std_logic;
        RDSEL   : in  std_logic_vector(1 downto 0);
        REGWR   : in  std_logic;
        EXTS    : in  std_logic_vector(1 downto 0);
        RST     : in  std_logic;
        CLK     : in  std_logic;
        BRAADDR : out std_logic_vector(31 downto 0);
        RD1     : out std_logic_vector(31 downto 0);
        RD2     : out std_logic_vector(31 downto 0);
        REG15   : out std_logic_vector(3 downto 0);
        IMM32   : out std_logic_vector(31 downto 0)
	  );
end entity decode;
 
architecture structural of decode is	

	signal SRCA : std_logic_vector(3 downto 0);					 
    signal SRCB   : std_logic_vector(3 downto 0);
    signal SRCC : std_logic_vector(3 downto 0);
    signal IMM  : std_logic_vector(31 downto 0);
	
 begin 

    regsrcamux: entity work.regsrcamux
                    port map(D1=>INSTR(19 downto 16),D0=>INSTR(3 downto 0),S=>RNSEL,Y=>SRCA); 
                    -- rn: D1 is for regular, D0 is for multiply
 	  
	regsrcbmux: entity work.regsrcbmux
					port map(D3=>B"1110",D2=>INSTR(11 downto 8),D1=>INSTR(15 downto 12),D0=>INSTR(3 downto 0),S=>REGDST,Y=>SRCB); 
                    -- rm: D2 is for multiply, D1 is for store, D0 is for other instructions
    
    regsrccmux: entity work.regsrccmux 
                    port map(D2=>X"E",D1=>INSTR(15 downto 12),D0=>INSTR(19 downto 16),S=>RDSEL,Y=>SRCC);
                    -- rd: D1 is for regular, D0 is for multiply

    adder: 	    entity work.adder
                    port map(A=>PC8,B=>IMM,S=>BRAADDR);  

    regfile: 	entity work.regfile
                    port map(A1=>SRCA,A2=>SRCB,A3=>SRCC,WD3=>WD3,WE3=>REGWR,RST=>RST,CLK=>CLK,RD1=>RD1,RD2=>RD2); 

    extimm: 	entity work.extimm
                    port map(imm=>INSTR(23 downto 0),exts=>EXTS,imm32=>IMM); 

    IMM32 <= IMM;

    REG15 <= INSTR(15 downto 12);
	
end architecture structural;