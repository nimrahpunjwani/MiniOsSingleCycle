;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit InsMem : 
  module InsMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, inst : UInt<32>}
    
    wire rom : UInt<32>[19] @[InsMem.scala 54:28]
    rom[0] <= UInt<32>("h084000117") @[InsMem.scala 54:28]
    rom[1] <= UInt<32>("h010113") @[InsMem.scala 54:28]
    rom[2] <= UInt<32>("h08000ef") @[InsMem.scala 54:28]
    rom[3] <= UInt<32>("h06f") @[InsMem.scala 54:28]
    rom[4] <= UInt<32>("h0100513") @[InsMem.scala 54:28]
    rom[5] <= UInt<32>("h03c00593") @[InsMem.scala 54:28]
    rom[6] <= UInt<32>("h0e00613") @[InsMem.scala 54:28]
    rom[7] <= UInt<32>("h0100893") @[InsMem.scala 54:28]
    rom[8] <= UInt<32>("h073") @[InsMem.scala 54:28]
    rom[9] <= UInt<32>("h0513") @[InsMem.scala 54:28]
    rom[10] <= UInt<32>("h0593") @[InsMem.scala 54:28]
    rom[11] <= UInt<32>("h0613") @[InsMem.scala 54:28]
    rom[12] <= UInt<32>("h0200893") @[InsMem.scala 54:28]
    rom[13] <= UInt<32>("h073") @[InsMem.scala 54:28]
    rom[14] <= UInt<32>("h06f") @[InsMem.scala 54:28]
    rom[15] <= UInt<32>("h06c6c6548") @[InsMem.scala 54:28]
    rom[16] <= UInt<32>("h04d202c6f") @[InsMem.scala 54:28]
    rom[17] <= UInt<32>("h04f696e69") @[InsMem.scala 54:28]
    rom[18] <= UInt<32>("h0a53") @[InsMem.scala 54:28]
    node index = bits(io.pc, 31, 2) @[InsMem.scala 57:20]
    node _io_inst_T = lt(index, UInt<5>("h013")) @[InsMem.scala 60:24]
    node _io_inst_T_1 = bits(index, 4, 0)
    node _io_inst_T_2 = mux(_io_inst_T, rom[_io_inst_T_1], UInt<1>("h00")) @[InsMem.scala 60:17]
    io.inst <= _io_inst_T_2 @[InsMem.scala 60:11]
    
