circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<32>
    input io_b : UInt<32>
    input io_aluCtrl : UInt<5>
    output io_out : UInt<32>

    node _T = eq(UInt<1>("h1"), io_aluCtrl) @[Conditional.scala 37:30]
    node _io_out_T = add(io_a, io_b) @[ALU.scala 16:36]
    node _io_out_T_1 = tail(_io_out_T, 1) @[ALU.scala 16:36]
    node _T_1 = eq(UInt<2>("h2"), io_aluCtrl) @[Conditional.scala 37:30]
    node _io_out_T_2 = sub(io_a, io_b) @[ALU.scala 17:36]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[ALU.scala 17:36]
    node _T_2 = eq(UInt<2>("h3"), io_aluCtrl) @[Conditional.scala 37:30]
    node _io_out_T_4 = and(io_a, io_b) @[ALU.scala 18:36]
    node _T_3 = eq(UInt<3>("h4"), io_aluCtrl) @[Conditional.scala 37:30]
    node _io_out_T_5 = or(io_a, io_b) @[ALU.scala 19:36]
    node _GEN_0 = mux(_T_3, _io_out_T_5, UInt<1>("h0")) @[Conditional.scala 39:67 ALU.scala 19:28 ALU.scala 13:10]
    node _GEN_1 = mux(_T_2, _io_out_T_4, _GEN_0) @[Conditional.scala 39:67 ALU.scala 18:28]
    node _GEN_2 = mux(_T_1, _io_out_T_3, _GEN_1) @[Conditional.scala 39:67 ALU.scala 17:28]
    node _GEN_3 = mux(_T, _io_out_T_1, _GEN_2) @[Conditional.scala 40:58 ALU.scala 16:28]
    io_out <= _GEN_3
