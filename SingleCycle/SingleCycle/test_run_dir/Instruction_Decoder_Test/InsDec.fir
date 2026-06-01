;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit InsDec : 
  module InsDec : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst : UInt<32>, opcode : UInt<7>, rd : UInt<5>, funct3 : UInt<3>, rs1 : UInt<5>, rs2 : UInt<5>, funct7 : UInt<7>}
    
    node _io_opcode_T = bits(io.inst, 6, 0) @[InsDec.scala 16:23]
    io.opcode <= _io_opcode_T @[InsDec.scala 16:13]
    node _io_rd_T = bits(io.inst, 11, 7) @[InsDec.scala 17:23]
    io.rd <= _io_rd_T @[InsDec.scala 17:13]
    node _io_funct3_T = bits(io.inst, 14, 12) @[InsDec.scala 18:23]
    io.funct3 <= _io_funct3_T @[InsDec.scala 18:13]
    node _io_rs1_T = bits(io.inst, 19, 15) @[InsDec.scala 19:23]
    io.rs1 <= _io_rs1_T @[InsDec.scala 19:13]
    node _io_rs2_T = bits(io.inst, 24, 20) @[InsDec.scala 20:23]
    io.rs2 <= _io_rs2_T @[InsDec.scala 20:13]
    node _io_funct7_T = bits(io.inst, 31, 25) @[InsDec.scala 21:23]
    io.funct7 <= _io_funct7_T @[InsDec.scala 21:13]
    
