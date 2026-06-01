circuit InsDec :
  module InsDec :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    output io_opcode : UInt<7>
    output io_rd : UInt<5>
    output io_funct3 : UInt<3>
    output io_rs1 : UInt<5>
    output io_rs2 : UInt<5>
    output io_funct7 : UInt<7>

    node _io_opcode_T = bits(io_inst, 6, 0) @[InsDec.scala 16:23]
    node _io_rd_T = bits(io_inst, 11, 7) @[InsDec.scala 17:23]
    node _io_funct3_T = bits(io_inst, 14, 12) @[InsDec.scala 18:23]
    node _io_rs1_T = bits(io_inst, 19, 15) @[InsDec.scala 19:23]
    node _io_rs2_T = bits(io_inst, 24, 20) @[InsDec.scala 20:23]
    node _io_funct7_T = bits(io_inst, 31, 25) @[InsDec.scala 21:23]
    io_opcode <= _io_opcode_T @[InsDec.scala 16:13]
    io_rd <= _io_rd_T @[InsDec.scala 17:13]
    io_funct3 <= _io_funct3_T @[InsDec.scala 18:13]
    io_rs1 <= _io_rs1_T @[InsDec.scala 19:13]
    io_rs2 <= _io_rs2_T @[InsDec.scala 20:13]
    io_funct7 <= _io_funct7_T @[InsDec.scala 21:13]
