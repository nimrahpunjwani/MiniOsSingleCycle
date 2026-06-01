circuit InsMem :
  module InsMem :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    output io_inst : UInt<32>

    node index = bits(io_pc, 31, 2) @[InsMem.scala 53:20]
    node _io_inst_T = lt(index, UInt<3>("h7")) @[InsMem.scala 56:24]
    node _io_inst_T_1 = bits(index, 2, 0)
    node rom_0 = UInt<32>("h500093") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_0 = validif(eq(UInt<1>("h0"), _io_inst_T_1), rom_0) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node rom_1 = UInt<32>("h700093") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _io_inst_T_1), rom_1, _GEN_0) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node rom_2 = UInt<32>("h2081b3") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _io_inst_T_1), rom_2, _GEN_1) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node rom_3 = UInt<32>("h302023") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _io_inst_T_1), rom_3, _GEN_2) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node rom_4 = UInt<32>("h2103") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _io_inst_T_1), rom_4, _GEN_3) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node rom_5 = UInt<32>("h4180e3") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_5 = mux(eq(UInt<3>("h5"), _io_inst_T_1), rom_5, _GEN_4) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node rom_6 = UInt<32>("h400177") @[InsMem.scala 50:28 InsMem.scala 50:28]
    node _GEN_6 = mux(eq(UInt<3>("h6"), _io_inst_T_1), rom_6, _GEN_5) @[InsMem.scala 56:17 InsMem.scala 56:17]
    node _rom_io_inst_T_1 = _GEN_6 @[InsMem.scala 56:17]
    node _io_inst_T_2 = mux(_io_inst_T, _rom_io_inst_T_1, UInt<1>("h0")) @[InsMem.scala 56:17]
    io_inst <= _io_inst_T_2 @[InsMem.scala 56:11]
