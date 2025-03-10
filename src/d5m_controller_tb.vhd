-------------------------------------------------------------------------------
-- Title      : Testbench for design "d5m_controller"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : d5m_controller_tb.vhd
-- Author     :   <rodrigo@snowden>
-- Company    : 
-- Created    : 2017-03-17
-- Last update: 2017-03-22
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2017 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2017-03-17  1.0      rodrigo	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity d5m_controller_tb is

end entity d5m_controller_tb;

-------------------------------------------------------------------------------

architecture tb of d5m_controller_tb is

  -- component ports
  signal clk, rst_n    : std_logic := '0';
  signal start         : std_logic;
  signal frame_valid   : std_logic;
  signal line_valid    : std_logic;
  signal data_in       : std_logic_vector(7 downto 0);
  signal data_valid    : std_logic;
  signal data_out      : std_logic_vector(7 downto 0);
  signal startofpacket : std_logic;
  signal endofpacket   : std_logic;

  -- clock

begin  -- architecture tb

  -- component instantiation
  DUT: entity work.d5m_controller_v
    -- generic map (
    --   COLS => 16,
    --   LINES => 8
    --   )
    port map (
      clk           => clk,
      rst_n         => rst_n,
      start         => '1',
      frame_valid   => frame_valid,
      line_valid    => line_valid,
      data_in       => data_in,
      data_valid    => data_valid,
      data_out      => data_out,
      startofpacket => startofpacket,
      endofpacket   => endofpacket);

  lupa_fake_1: entity work.lupa_fake
    generic map (
      ROWS => 8,
      COLS => 16,
      FOT  => 4,
      ROT  => 10)
    port map (
      clk           => clk,
      rst_n         => rst_n,
      en            => '1',
      frame_valid   => frame_valid,
      line_valid    => line_valid,
      data_valid    => open,
      data_out      => data_in,
      startofpacket => open,
      endofpacket   => open);

  rst_n <= '1' after 40 ns;
  -- clock generation
  WaveGen_Proc3: process
  begin
    clk <= '1';
    wait for 10 ns; -- Clk'event and Clk = '1';
    clk <= '0';
    wait for 10 ns;
  end process WaveGen_Proc3;


end architecture tb;

-------------------------------------------------------------------------------

configuration d5m_controller_tb_tb_cfg of d5m_controller_tb is
  for tb
  end for;
end d5m_controller_tb_tb_cfg;

-------------------------------------------------------------------------------
