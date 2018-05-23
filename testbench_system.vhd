-- **************************************************************************************
-- * PROJECT: LW8 - Single-Cycle Processor Design FPGA
-- * FILENAME: testbench_scp.vhd
-- * AUTHOR: boyntonrl <Rock Boynton>
-- * PROVIDES:
-- * - testbench to verify Single Cycle Processor FPGA operations
-- **************************************************************************************

-- load ieee library 
-- use std_logic, std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

--entity: external view 
-- inputs: none 
-- outputs: none 
entity testbench_system is 
end entity testbench_system;

-- architecture: internal circuit 
architecture dataflow of testbench_system is 
	
    signal SLIDERS    : std_logic_vector(9 downto 0);
    -- signal SLIDERDATA : std_logic_vector(31 downto 0);
    signal SYSRST     : std_logic;
    -- signal RST        : std_logic;
    signal CLK        : std_logic;
    -- signal DATAS      : std_logic;
    -- signal DATA       : std_logic_vector(31 downto 0);
    -- signal MEMDATA    : std_logic_vector(31 downto 0);
    -- signal DATA_IN    : std_logic_vector(31 downto 0);
    -- signal DATA_OUT   : std_logic_vector(31 downto 0);
    -- signal ADDR       : std_logic_vector(31 downto 0);
    -- signal BRADDR     : std_logic_vector(31 downto 0);
    -- signal PC4        : std_logic_vector(31 downto 0);
    -- signal INSTR      : std_logic_vector(31 downto 0);
    signal WD3        : std_logic_vector(31 downto 0);
    -- signal PCSRC      : std_logic_vector(1 downto 0);
    -- signal PCWR       : std_logic;
    -- signal REGDST     : std_logic_vector(1 downto 0);
    -- signal RNSEL      : std_logic;
    -- signal RDSEL      : std_logic_vector(1 downto 0);
    -- signal REGWR      : std_logic;
    -- signal EXTS       : std_logic_vector(1 downto 0);
    -- signal ALUSRCB    : std_logic_vector(1 downto 0);
    -- signal ALUS       : std_logic_vector(3 downto 0);
    -- signal ALUFLAGWR  : std_logic;
    -- signal MEMWR      : std_logic;
    -- signal MEMRD      : std_logic;
    -- signal REGSRC     : std_logic_vector(1 downto 0);
    -- signal REG15      : std_logic_vector(3 downto 0);
    -- signal C          : std_logic;
    -- signal V          : std_logic;
    -- signal N          : std_logic;
    -- signal Z          : std_logic;
    -- signal LD2        : std_logic;
    -- signal LD1        : std_logic;
    -- signal LD0        : std_logic;
    signal LEDS       : std_logic_vector(9 downto 0);
    signal SEG5       : std_logic_vector(7 downto 0);
    signal SEG4       : std_logic_vector(7 downto 0);
    signal SEG3       : std_logic_vector(7 downto 0);
    signal SEG2       : std_logic_vector(7 downto 0);
    signal SEG1       : std_logic_vector(7 downto 0);
    signal SEG0       : std_logic_vector(7 downto 0);
	
begin 


		-- map the internal circuits to the processor 
		UUT: entity work.system
              port map(SLIDERS=>SLIDERS,SYSRST=>SYSRST,CLK=>CLK,
            --   RST=>RST,DATA_IN=>DATA_IN,DATA_OUT=>DATA_OUT,ADDR=>ADDR,BRADDR=>BRADDR,PC4=>PC4,INSTR=>INSTR,
            WD3=>WD3,
            --   PCSRC=>PCSRC,PCWR=>PCWR,REGDST=>REGDST,RNSEL=>RNSEL,RDSEL=>RDSEL,REGWR=>REGWR,EXTS=>EXTS,ALUSRCB=>ALUSRCB,ALUS=>ALUS,ALUFLAGWR=>ALUFLAGWR,MEMWR=>MEMWR,MEMRD=>MEMRD,REGSRC=>REGSRC,REG15=>REG15,C=>C,V=>V,N=>N,Z=>Z,LD2=>LD2,LD1=>LD1,LD0=>LD0,
              LEDS=>LEDS,SEG5=>SEG5,SEG4=>SEG4,SEG3=>SEG3,SEG2=>SEG2,SEG1=>SEG1,SEG0=>SEG0); 
			 
		-- generate a 1ms clock period 
		clock: process 
		begin 
			CLK <= '0'; wait for 10ns;
			CLK <= '1'; wait for 10ns;
		end process clock;
		
		tester : process
		begin 
--			test sychronous reset to make sure all registers zero
            SYSRST <= '0','1' after 20ns;
            SLIDERS <= B"0000001010";
			wait;  -- test scp
		end process tester;
		
end architecture dataflow;