-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - Excecute Circuitry 
-- * FILENAME: excecute.vhd
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
entity excecute is
port(   RD1         : in  std_logic_vector(31 downto 0);
        RD2         : in  std_logic_vector(31 downto 0); 
        IMM32       : in  std_logic_vector(31 downto 0); 
        ALUSRCB     : in  std_logic_vector(1 downto 0);
        ALUS        : in  std_logic_vector(3 downto 0);
        ALUFLAGWR   : in  std_logic;
        RST         : in  std_logic;
        CLK         : in  std_logic;
		PC4			  : in  std_logic_vector(31 downto 0);
        F           : inout std_logic_vector(31 downto 0);
        C           : out std_logic;
        V           : out std_logic;
        N           : out std_logic;
        Z           : out std_logic
	  );
end entity excecute;
 
architecture structural of excecute is	
						 
    signal B        : std_logic_vector(31 downto 0);
    signal ALU_C    : std_logic;
    signal ALU_V    : std_logic;
    signal ALU_N    : std_logic;
    signal ALU_Z    : std_logic;

 begin 
 	  
	bmux2to1: entity work.alusrcbmux
					port map(D2=>PC4,D1=>RD2,D0=>IMM32,S=>ALUSRCB,Y=>B); 

    alu: 	    entity work.alu
                    port map(A=>RD1,B=>B,ALUS=>ALUS,F=>F,C=>ALU_C,V=>ALU_V,N=>ALU_N,Z=>ALU_Z);  

    cpsr: 	entity work.reg4
                    port map(D(3)=>ALU_C,D(2)=>ALU_V,D(1)=>ALU_N,D(0)=>ALU_Z,LD=>ALUFLAGWR,RST=>RST,CLK=>CLK,Q(3)=>C,Q(2)=>V,Q(1)=>N,Q(0)=>Z); 
	
end architecture structural; 