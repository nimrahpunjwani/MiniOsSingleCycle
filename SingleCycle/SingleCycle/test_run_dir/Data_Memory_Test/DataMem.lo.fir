circuit DataMem :
  module DataMem :
    input clock : Clock
    input reset : UInt<1>
    input io_address : UInt<32>
    input io_writeData : UInt<32>
    input io_memWrite : UInt<1>
    input io_memRead : UInt<1>
    output io_readData : UInt<32>
    output io_consoleValid : UInt<1>
    output io_consoleByte : UInt<8>

    mem mem : @[DataMem.scala 18:16]
      data-type => UInt<32>
      depth => 65536
      read-latency => 0
      write-latency => 1
      reader => io_readData_MPORT
      writer => MPORT
      read-under-write => undefined
    node _ramIndex_T = sub(io_address, UInt<32>("h80000000")) @[DataMem.scala 21:30]
    node _ramIndex_T_1 = tail(_ramIndex_T, 1) @[DataMem.scala 21:30]
    node ramIndex = bits(_ramIndex_T_1, 17, 2) @[DataMem.scala 21:40]
    node tinyIndex = bits(io_address, 1, 0) @[DataMem.scala 22:29]
    node _wordIndex_T = geq(io_address, UInt<32>("h80000000")) @[DataMem.scala 23:34]
    node wordIndex = mux(_wordIndex_T, ramIndex, tinyIndex) @[DataMem.scala 23:22]
    node isConsole = eq(io_address, UInt<32>("h10000000")) @[DataMem.scala 24:30]
    node _io_consoleByte_T = bits(io_writeData, 7, 0) @[DataMem.scala 39:37]
    node _T = bits(io_writeData, 7, 0) @[DataMem.scala 41:32]
    node _T_1 = bits(reset, 0, 0) @[DataMem.scala 41:13]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[DataMem.scala 41:13]
    node _GEN_0 = mux(isConsole, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 37:21 DataMem.scala 38:23 DataMem.scala 30:19]
    node _GEN_1 = mux(isConsole, _io_consoleByte_T, UInt<1>("h0")) @[DataMem.scala 37:21 DataMem.scala 39:22 DataMem.scala 31:18]
    node _GEN_2 = validif(eq(isConsole, UInt<1>("h0")), wordIndex) @[DataMem.scala 37:21]
    node _GEN_3 = validif(eq(isConsole, UInt<1>("h0")), clock) @[DataMem.scala 37:21]
    node _GEN_4 = mux(isConsole, UInt<1>("h0"), UInt<1>("h1")) @[DataMem.scala 37:21 DataMem.scala 18:16]
    node _GEN_5 = validif(eq(isConsole, UInt<1>("h0")), UInt<1>("h1")) @[DataMem.scala 37:21]
    node _GEN_6 = validif(eq(isConsole, UInt<1>("h0")), io_writeData) @[DataMem.scala 37:21]
    node _GEN_7 = mux(io_memWrite, _GEN_0, UInt<1>("h0")) @[DataMem.scala 36:21 DataMem.scala 30:19]
    node _GEN_8 = mux(io_memWrite, _GEN_1, UInt<1>("h0")) @[DataMem.scala 36:21 DataMem.scala 31:18]
    node _GEN_9 = validif(io_memWrite, _GEN_2) @[DataMem.scala 36:21]
    node _GEN_10 = validif(io_memWrite, _GEN_3) @[DataMem.scala 36:21]
    node _GEN_11 = mux(io_memWrite, _GEN_4, UInt<1>("h0")) @[DataMem.scala 36:21 DataMem.scala 18:16]
    node _GEN_12 = validif(io_memWrite, _GEN_5) @[DataMem.scala 36:21]
    node _GEN_13 = validif(io_memWrite, _GEN_6) @[DataMem.scala 36:21]
    node _T_3 = eq(isConsole, UInt<1>("h0")) @[DataMem.scala 50:22]
    node _T_4 = and(io_memRead, _T_3) @[DataMem.scala 50:19]
    node _GEN_14 = validif(_T_4, wordIndex) @[DataMem.scala 50:34 DataMem.scala 51:28]
    node _GEN_15 = validif(_T_4, clock) @[DataMem.scala 50:34 DataMem.scala 51:28]
    node _GEN_16 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 50:34 DataMem.scala 51:28 DataMem.scala 18:16]
    node _GEN_17 = mux(_T_4, mem.io_readData_MPORT.data, UInt<1>("h0")) @[DataMem.scala 50:34 DataMem.scala 51:17 DataMem.scala 29:15]
    io_readData <= _GEN_17
    io_consoleValid <= _GEN_7
    io_consoleByte <= _GEN_8
    mem.io_readData_MPORT.addr <= _GEN_14
    mem.io_readData_MPORT.en <= _GEN_16
    mem.io_readData_MPORT.clk <= _GEN_15
    mem.MPORT.addr <= _GEN_9
    mem.MPORT.en <= _GEN_11
    mem.MPORT.clk <= _GEN_10
    mem.MPORT.data <= _GEN_13
    mem.MPORT.mask <= _GEN_12
    printf(clock, and(and(and(and(UInt<1>("h1"), io_memWrite), isConsole), _T_2), UInt<1>("h1")), "%c", _T) @[DataMem.scala 41:13]
