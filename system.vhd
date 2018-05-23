-- ***************************************************************************************
-- * PROJECT: LW8 - Single-Cycle Processor Design Week 1 - Top Level Design  
-- * FILENAME: system.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - top-level schematic of the single-cycle processor
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity system is
port(   
        SLIDERS    : in    std_logic_vector(9 downto 0);
        SYSRST     : in    std_logic;
        CLK        : in    std_logic;
        -- SLIDERDATA : inout std_logic_vector(31 downto 0);
        -- RST        : inout std_logic;
        -- DATAS      : inout std_logic;
        -- DATA       : inout std_logic_vector(31 downto 0);
        -- MEMDATA    : inout std_logic_vector(31 downto 0);
        -- DATA_IN    : inout std_logic_vector(31 downto 0);
        -- DATA_OUT   : inout std_logic_vector(31 downto 0);
        -- ADDR       : inout std_logic_vector(31 downto 0);
        -- BRADDR     : inout std_logic_vector(31 downto 0);
        -- PC4        : inout std_logic_vector(31 downto 0);
        -- INSTR      : inout std_logic_vector(31 downto 0);
        WD3        : inout std_logic_vector(31 downto 0);
        -- PCSRC      : inout std_logic_vector(1 downto 0);
        -- PCWR       : inout std_logic;
        -- REGDST     : inout std_logic_vector(1 downto 0);
        -- RNSEL      : inout std_logic;
        -- RDSEL      : inout std_logic_vector(1 downto 0);
        -- REGWR      : inout std_logic;
        -- EXTS       : inout std_logic_vector(1 downto 0);
        -- ALUSRCB    : inout std_logic_vector(1 downto 0);
        -- ALUS       : inout std_logic_vector(3 downto 0);
        -- ALUFLAGWR  : inout std_logic;
        -- MEMWR      : inout std_logic;
        -- MEMRD      : inout std_logic;
        -- REGSRC     : inout std_logic_vector(1 downto 0);
        -- REG15      : inout std_logic_vector(3 downto 0);
        -- C          : inout std_logic;
        -- V          : inout std_logic;
        -- N          : inout std_logic;
        -- Z          : inout std_logic;
        -- LD2        : inout std_logic;
        -- LD1        : inout std_logic;
        -- LD0        : inout std_logic;  
        LEDS       : out   std_logic_vector(9 downto 0);
        SEG5       : out   std_logic_vector(7 downto 0);
        SEG4       : out   std_logic_vector(7 downto 0);
        SEG3       : out   std_logic_vector(7 downto 0);
        SEG2       : out   std_logic_vector(7 downto 0);
        SEG1       : out   std_logic_vector(7 downto 0);
        SEG0       : out   std_logic_vector(7 downto 0)
	);
end entity system;
 
architecture structural of system is	

    attribute chip_pin: string;
    attribute chip_pin of CLK:     signal is "P11";
    attribute chip_pin of SYSRST:  signal is "B8";
    attribute chip_pin of SLIDERS: signal is "F15,B14,A14,A13,B12,A12,C12,D12,C11,C10";
    attribute chip_pin of LEDS:    signal is "B11,A11,D14,E14,C13,D13,B10,A10,A9,A8";
    attribute chip_pin of SEG0:    signal is "D15,C17,D17,E16,C16,C15,E15,C14";
    attribute chip_pin of SEG1:    signal is "A16,B17,A18,A17,B16,E18,D18,C18";
    attribute chip_pin of SEG2:    signal is "A19,B22,C22,B21,A21,B19,A20,B20";
    attribute chip_pin of SEG3:    signal is "D22,E17,D19,C20,C19,E21,E22,F21";
    attribute chip_pin of SEG4:    signal is "F17,F20,F19,H19,J18,E19,E20,F18";
    attribute chip_pin of SEG5:    signal is "L19,N20,N19,M20,N18,L18,K20,J20";

    signal SLIDERDATA : std_logic_vector(31 downto 0);
    signal RST        : std_logic;
    signal DATAS      : std_logic;
    signal DATA       : std_logic_vector(31 downto 0);
    signal MEMDATA    : std_logic_vector(31 downto 0);
    signal DATA_IN    : std_logic_vector(31 downto 0);
    signal DATA_OUT   : std_logic_vector(31 downto 0);
    signal ADDR       : std_logic_vector(31 downto 0);
    signal BRADDR     : std_logic_vector(31 downto 0);
    signal PC4        : std_logic_vector(31 downto 0);
    signal INSTR      : std_logic_vector(31 downto 0);
--    signal WD3        : std_logic_vector(31 downto 0);
    signal PCSRC      : std_logic_vector(1 downto 0);
    signal PCWR       : std_logic;
    signal REGDST     : std_logic_vector(1 downto 0);
    signal RNSEL      : std_logic;
    signal RDSEL      : std_logic_vector(1 downto 0);
    signal REGWR      : std_logic;
    signal EXTS       : std_logic_vector(1 downto 0);
    signal ALUSRCB    : std_logic_vector(1 downto 0);
    signal ALUS       : std_logic_vector(3 downto 0);
    signal ALUFLAGWR  : std_logic;
    signal MEMWR      : std_logic;
    signal MEMRD      : std_logic;
    signal REGSRC     : std_logic_vector(1 downto 0);
    signal REG15      : std_logic_vector(3 downto 0);
    signal C          : std_logic;
    signal V          : std_logic;
    signal N          : std_logic;
    signal Z          : std_logic;
    signal LD2        : std_logic;
    signal LD1        : std_logic;
    signal LD0        : std_logic;   

 begin   

    slider:         entity work.reg10
                        port map(
                            D=>SLIDERS,LD=>'1',RST=>RST,CLK=>CLK,Q=>SLIDERDATA
                        );

    synchronizer:   entity work.synchronizer
                        port map(
                            SYSRST=>SYSRST,CLK=>CLK,RST=>RST
                        );

    datamux:        entity work.datamux
                        port map(
                            D1=>MEMDATA,D0=>SLIDERDATA,S=>DATAS,Y=>DATA
                        );
                    
    scp:            entity work.scp
                        port map(
                            DATA_IN=>DATA,RST=>RST,CLK=>CLK,ADDR=>ADDR,DATA_OUT=>DATA_OUT,BRADDR=>BRADDR,PC4=>PC4,INSTR=>INSTR,WD3=>WD3,PCSRC=>PCSRC,PCWR=>PCWR,REGDST=>REGDST,RNSEL=>RNSEL,RDSEL=>RDSEL,REGWR=>REGWR,EXTS=>EXTS,ALUSRCB=>ALUSRCB,ALUS=>ALUS,ALUFLAGWR=>ALUFLAGWR,MEMWR=>MEMWR,MEMRD=>MEMRD,REGSRC=>REGSRC,REG15=>REG15,C=>C,V=>V,N=>N,Z=>Z
                        );  

    addressdecoder: entity work.addressdecoder
                        port map(
                            ADDR=>ADDR,MEMRD=>MEMRD,MEMWR=>MEMWR,LD2=>LD2,LD1=>LD1,LD0=>LD0,DATAS=>DATAS
                        );

    dmem:           entity work.dmem
                        port map(
                            A=>ADDR,WD=>DATA_OUT,MEMWR=>LD2,RST=>RST,CLK=>CLK,RD=>MEMDATA
                        );
    
    LED:            entity work.LED
                        port map(
                            D=>DATA_OUT,LD=>LD1,RST=>RST,CLK=>CLK,LEDS=>LEDS
                        );

    SEG7:           entity work.SEG7
                        port map(
                            D=>DATA_OUT,LD=>LD0,RST=>RST,CLK=>CLK,SEG5=>SEG5,SEG4=>SEG4,SEG3=>SEG3,SEG2=>SEG2,SEG1=>SEG1,SEG0=>SEG0
                        );
	
end architecture structural;