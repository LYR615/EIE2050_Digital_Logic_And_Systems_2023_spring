----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/04/14 03:49:23
-- Design Name: 
-- Module Name: test_bench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_SIPO_ASYNC is
end tb_SIPO_ASYNC;

architecture tb of tb_SIPO_ASYNC is

    component SIPO_ASYNC
        port (D   : in std_logic;
              CLK : in std_logic;
              RST : in std_logic;
              Q   : out std_logic_vector (7 downto 0));
    end component;

    signal D   : std_logic;
    signal CLK : std_logic;
    signal RST : std_logic;
    signal Q   : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : SIPO_ASYNC
    port map (D   => D,
              CLK => CLK,
              RST => RST,
              Q   => Q);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        D <= '0';

        -- Reset generation
        -- EDIT: Check that RST is really your reset signal
        RST <= '1';
        wait for 7 ns;
        RST <= '0';
        wait for 5 ns;
        
        -- Test Case 1:           
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;
        
        D <= '1'; wait for 2 ns;
        RST <= '1';wait for 10 ns;
        D <= '0'; wait for 7 ns;
        RST <= '0';wait for 5 ns;
        
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;
        
        D <= '1'; wait for 2 ns;
        RST <= '1';wait for 10 ns;
        D <= '0'; wait for 7 ns;
        RST <= '0';wait for 5 ns;
        
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;
        D <= '1'; wait for 12 ns;
        D <= '0'; wait for 12 ns;

        RST <= '1';
        wait for 10 ns;
        RST <= '0';
        wait for 10 ns;       

        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end;

