circuit ALU_Branch :
  module ALU_Branch :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    input io_funct3 : UInt<3>
    output io_branchCtrl : UInt<4>

    node isBranch = eq(io_opcode, UInt<7>("h63")) @[ALU_Branch.scala 23:28]
    node _io_branchCtrl_T = eq(UInt<1>("h0"), io_funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_1 = mux(_io_branchCtrl_T, UInt<1>("h1"), UInt<1>("h0")) @[Mux.scala 80:57]
    node _io_branchCtrl_T_2 = eq(UInt<1>("h1"), io_funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_3 = mux(_io_branchCtrl_T_2, UInt<2>("h2"), _io_branchCtrl_T_1) @[Mux.scala 80:57]
    node _io_branchCtrl_T_4 = eq(UInt<3>("h4"), io_funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_5 = mux(_io_branchCtrl_T_4, UInt<2>("h3"), _io_branchCtrl_T_3) @[Mux.scala 80:57]
    node _io_branchCtrl_T_6 = eq(UInt<3>("h5"), io_funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_7 = mux(_io_branchCtrl_T_6, UInt<3>("h4"), _io_branchCtrl_T_5) @[Mux.scala 80:57]
    node _io_branchCtrl_T_8 = eq(UInt<3>("h6"), io_funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_9 = mux(_io_branchCtrl_T_8, UInt<3>("h5"), _io_branchCtrl_T_7) @[Mux.scala 80:57]
    node _io_branchCtrl_T_10 = eq(UInt<3>("h7"), io_funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_11 = mux(_io_branchCtrl_T_10, UInt<3>("h6"), _io_branchCtrl_T_9) @[Mux.scala 80:57]
    node _io_branchCtrl_T_12 = mux(isBranch, _io_branchCtrl_T_11, UInt<1>("h0")) @[ALU_Branch.scala 25:23]
    io_branchCtrl <= _io_branchCtrl_T_12 @[ALU_Branch.scala 25:17]
