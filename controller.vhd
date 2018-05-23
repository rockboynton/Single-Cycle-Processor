-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 2 - controller
-- * FILENAME: controller.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 4/17/18
-- * DESCRIPTION: 
-- * - This specification implements an ARMv4 controller in a dataflow VHDL 
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller is 
port(   COND      : in  std_logic_vector(3 downto 0);
        OP        : in  std_logic_vector(1 downto 0);
        FUNCT     : in  std_logic_vector(5 downto 0);
        BIT4      : in  std_logic;
        REG15     : in std_logic_vector(3 downto 0);
        C         : in  std_logic;
        V         : in  std_logic;
        N         : in  std_logic;
        Z         : in  std_logic;
        PCSRC     : out std_logic_vector(1 downto 0);
        PCWR      : out std_logic;
        REGDST    : out std_logic_vector(1 downto 0);
        RNSEL     : out std_logic;
        RDSEL     : out std_logic_vector(1 downto 0);
        REGWR     : out std_logic;
        EXTS      : out std_logic_vector(1 downto 0);
        ALUSRCB   : out std_logic_vector(1 downto 0);
        ALUS      : out std_logic_vector(3 downto 0);
        ALUFLAGWR : out std_logic;
        MEMWR     : out std_logic;
        REGSRC    : out std_logic_vector(1 downto 0);
        MEMRD     : out std_logic
	);
end entity controller;

-- architecture: internal circuit 
architecture dataflow of controller is

    signal I   : std_logic;
    signal L   : std_logic;
    signal BL  : std_logic;
    signal CMD : std_logic_vector(3 downto 0);
    signal S   : std_logic;

begin 

    I   <= FUNCT(5);
    L   <= FUNCT(0);
    BL  <= FUNCT(4);
    CMD <= FUNCT(4 DOWNTO 1);
    S   <= FUNCT(0);
                 
    PCSRC     <= -- branch conditions (PC <- PC + 8 + (imm32 << 2))
                 B"00" when OP = B"10" and COND = X"E" else  -- B 
                 B"00" when OP = B"10" and COND = X"0" and Z = '1' else -- BEQ
                 B"00" when OP = B"10" and COND = X"1" and Z = '0' else -- BNE
                 -- BRanch Link PC gets LR
                 B"10" when REG15 = B"1111" and CMD = X"D" else          -- BL 
                 -- next instruction (Pc <- PC + 4)
                 B"01";

    PCWR      <= '1'; -- always writes
    
    REGDST    <= B"10" when OP = B"00" and I = '0' and BIT4 = '1' else -- R[rm] multiply
                 B"01" when OP = B"01" and I = '0' else -- R[rd] when STR 
                 B"11" when OP = B"10" and COND = X"E" and BL = '1' else -- BL (PC + 4)
                 B"00";                                 -- R[rm] every other instruction

    RNSEL     <= '0' when OP = B"00" and I = '0' and BIT4 = '1' else -- R[rn] multiply
                 '1';                                                 -- R[rn] other instructions

    RDSEL     <= B"00" when OP = B"00" and I = '0' and BIT4 = '1' else -- R[rn] multiply
				 B"10" when OP = B"10" and COND = X"E" and BL = '1' else -- BL
                 B"01";

    REGWR     <= '0' when COND = X"E" and OP  = B"01" and L = '0' else -- STR 
                 '0' when OP  = B"10" and BL = '0' else                 -- branch conditions 
                 '1';

    EXTS      <= B"01" when OP = B"01" else -- LDR/STR
                 B"10" when OP = B"10" else -- branch conditions
                 B"00"; -- data processing 

    ALUSRCB   <= B"01" when I = '0' and OP = B"00" else -- register mode data processing
				 B"10" when OP = B"10" and COND = X"E" and BL = '1' else -- PC + 4 
                 B"00";                               -- all other instructions

    ALUS      <= B"0000" when CMD = X"4" or  OP = B"01" else             -- ADD    when ADD/LDR/STR
                 B"0001" when CMD = X"2" or  CMD = X"A" else             -- SUB    when SUB/CMP
                 B"0010" when CMD = X"0" else             -- AND    when AND
                 B"0011" when CMD = X"C" else             -- OR     when OR 
                 B"0100" when CMD = X"1" else             -- EOR    when EOR
                 B"0110" when CMD = X"D" else             -- Pass B when MOV
                 B"0110" when OP = B"10" and COND = X"E" and BL = '1' else -- Pass B when BL
                 B"1000" when OP = B"00" and I = '0' and BIT4 = '1' else -- MUL    when MUL/MULS
                 B"0111";                                                -- pass 1 for all others
                
    ALUFLAGWR <= '1' when CMD = X"A" else -- update CPSR when CMP
                 '1' when COND = X"E" and OP = B"00" and S = '1' else -- S extended data proc 
                 '0';

    MEMWR     <= '1' when OP = B"01" and L = '0' else -- write to memory when STR
                 '0';

    REGSRC    <= B"00" when OP = B"01" and L = '1' else -- load from memory when LDR
                 B"10" when OP = B"10" and COND = X"E" and BL = '1' else -- BL
                 B"01";

    MEMRD     <= '1' when OP = B"01" and L = '1' else -- LDR
                 '0'; 

end architecture dataflow;