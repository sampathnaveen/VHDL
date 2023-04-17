-- cntu the control unit
-- controller
library IEEE; use IEEE.std_logic_1164.all;
entity cntu is
  port
  ( rst, clk, st, zi : in std_logic;
    op : out std_logic_vector (6 downto 0);
    --- stt : out std_logic_vector(1 downto 0);
    rdy : out std_logic
  );
end cntu;

architecture behv of cntu is
  -- type states is (SI, SM, SF);
  -- signal stt, nxt_st : states := SI;
  signal stt, nxt_st : std_logic_vector (1 downto 0);
  -- we can use a "hard" encoding of states
  constant SI : std_logic_vector (1 downto 0) := "00";
  constant SM : std_logic_vector (1 downto 0) := "01";
  constant SF : std_logic_vector (1 downto 0) := "10";
  -- Internal op-code signals and related constants
  signal Aop, Qop, Sop : std_logic_vector (1 downto 0);
  signal Dop : std_logic;
  constant ldD : std_logic := '1';
  constant nopD : std_logic := '0';
  constant nop : std_logic_vector (1 downto 0) := "00";
  constant ldAshr,shrQ,count : std_logic_vector (1 downto 0) := "01";
  constant reset, load : std_logic_vector (1 downto 0) := "10";
begin
  -- to synthesize edge-triggered flip-flops
  -- with asynchronous reset when rst = 0
  clkd : process ( clk, rst)
  begin
    if (rst = '0') then
      stt <= SI;
    elsif ( clk'event and clk = '1'
        and clk'LAST_VALUE = '0' ) then
      stt <= nxt_st;
    end if;
  end process clkd;

  stm : process ( stt, st, zi )
  -- the stm process describes the transitions between states
  -- and the output signals
  begin
    -- default assignments
    nxt_st <= stt;
    Dop <= nopD;
    Aop <= nop;
    Qop <= nop;
    Sop <= nop;
    rdy <= '0';

    -- state transitions and output signals
    case stt is
      when SI =>
        rdy <= '0';
        Dop <= ldD;
        Aop <= reset;
        Qop <= load;
        Sop <= reset;
        if ( st = '1' ) then nxt_st <= SM; end if;

      when SM =>
        Aop <= ldAshr;
        Qop <= shrQ;
        Sop <= count;
        if ( zi = '1' ) then nxt_st <= SF; end if;

      when others => --- when SF
        rdy <= '1';
        if ( st = '0' ) then nxt_st <= SI; end if;
    end case;
  end process stm;

  op (6) <= Dop;
  op (5 downto 4) <= Aop;
  op (3 downto 2) <= Qop;
  op (1 downto 0) <= Sop;
end behv;
