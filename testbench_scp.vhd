-- **************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 2 - controller
-- * FILENAME: testbench_scp.vhd
-- * AUTHOR: boyntonrl <Rock Boynton>
-- * PROVIDES:
-- * - testbench to verify Single Cycle Processor operations
-- **************************************************************************************

-- load ieee library 
-- use std_logic, std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

--entity: external view 
-- inputs: none 
-- outputs: none 
entity testbench_scp is 
end entity testbench_scp;

-- architecture: internal circuit 
architecture dataflow of testbench_scp is 
	
	signal CLK       : std_logic;
	signal RST       : std_logic;
	signal DATA_IN   : std_logic_vector(31 downto 0);
	signal DATA_OUT  : std_logic_vector(31 downto 0);
	signal ADDR      : std_logic_vector(31 downto 0);
	signal BRADDR    : std_logic_vector(31 downto 0);
	signal PC4       : std_logic_vector(31 downto 0);
	signal INSTR     : std_logic_vector(31 downto 0);
	signal WD3       : std_logic_vector(31 downto 0);
	signal PCSRC     : std_logic_vector(1 downto 0);
	signal PCWR      : std_logic;
	signal REGDST    : std_logic_vector(1 downto 0);
	signal RNSEL     : std_logic;
	signal RDSEL     : std_logic_vector(1 downto 0);
	signal REGWR     : std_logic;
	signal EXTS      : std_logic_vector(1 downto 0);
	signal ALUSRCB   : std_logic_vector(1 downto 0);
	signal ALUS      : std_logic_vector(3 downto 0);
	signal ALUFLAGWR : std_logic;
	signal MEMWR     : std_logic;
	signal MEMRD     : std_logic;
	signal REGSRC    : std_logic_vector(1 downto 0);
	signal C         : std_logic;
	signal V         : std_logic;
	signal N         : std_logic;
	signal Z         : std_logic;
	
begin 

		-- map the internal circuits to the processor 
		UUT: entity work.scp
			  port map(CLK=>CLK,RST=>RST,DATA_IN=>DATA_IN,DATA_OUT=>DATA_OUT,ADDR=>ADDR,BRADDR=>BRADDR,PC4=>PC4,INSTR=>INSTR,WD3=>WD3,
			  PCSRC=>PCSRC,PCWR=>PCWR,REGDST=>REGDST,RNSEL=>RNSEL,RDSEL=>RDSEL,REGWR=>REGWR,EXTS=>EXTS,ALUSRCB=>ALUSRCB,ALUS=>ALUS,ALUFLAGWR=>ALUFLAGWR,MEMWR=>MEMWR,REGSRC=>REGSRC,Z=>Z); 
			 
		-- generate a 1ms clock period 
		clock: process 
		begin 
			CLK <= '0'; wait for 500us;
			CLK <= '1'; wait for 500us;
		end process clock;
		
		tester : process
		begin 
--			test sychronous reset to make sure all registers zero
			RST <= '1','0' after 1000us;
			wait;  -- test scp
		end process tester;
		
end architecture dataflow;