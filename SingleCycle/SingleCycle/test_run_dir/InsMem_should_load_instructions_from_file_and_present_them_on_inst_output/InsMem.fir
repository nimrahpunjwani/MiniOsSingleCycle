;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit InsMem : 
  module InsMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, inst : UInt<32>}
    
    wire rom : UInt<32>[7] @[InsMem.scala 50:28]
    rom[0] <= UInt<32>("h0500093") @[InsMem.scala 50:28]
    rom[1] <= UInt<32>("h0700093") @[InsMem.scala 50:28]
    rom[2] <= UInt<32>("h02081b3") @[InsMem.scala 50:28]
    rom[3] <= UInt<32>("h0302023") @[InsMem.scala 50:28]
    rom[4] <= UInt<32>("h02103") @[InsMem.scala 50:28]
    rom[5] <= UInt<32>("h04180e3") @[InsMem.scala 50:28]
    rom[6] <= UInt<32>("h0400177") @[InsMem.scala 50:28]
    node index = bits(io.pc, 31, 2) @[InsMem.scala 53:20]
    node _io_inst_T = lt(index, UInt<3>("h07")) @[InsMem.scala 56:24]
    node _io_inst_T_1 = bits(index, 2, 0)
    node _io_inst_T_2 = mux(_io_inst_T, rom[_io_inst_T_1], UInt<1>("h00")) @[InsMem.scala 56:17]
    io.inst <= _io_inst_T_2 @[InsMem.scala 56:11]
    
