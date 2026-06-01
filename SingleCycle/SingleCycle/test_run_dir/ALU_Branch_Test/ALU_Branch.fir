;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ALU_Branch : 
  module ALU_Branch : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip opcode : UInt<7>, flip funct3 : UInt<3>, branchCtrl : UInt<4>}
    
    io.branchCtrl <= UInt<1>("h00") @[ALU_Branch.scala 13:17]
    node isBranch = eq(io.opcode, UInt<7>("h063")) @[ALU_Branch.scala 23:28]
    node _io_branchCtrl_T = eq(UInt<1>("h00"), io.funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_1 = mux(_io_branchCtrl_T, UInt<1>("h01"), UInt<1>("h00")) @[Mux.scala 80:57]
    node _io_branchCtrl_T_2 = eq(UInt<1>("h01"), io.funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_3 = mux(_io_branchCtrl_T_2, UInt<2>("h02"), _io_branchCtrl_T_1) @[Mux.scala 80:57]
    node _io_branchCtrl_T_4 = eq(UInt<3>("h04"), io.funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_5 = mux(_io_branchCtrl_T_4, UInt<2>("h03"), _io_branchCtrl_T_3) @[Mux.scala 80:57]
    node _io_branchCtrl_T_6 = eq(UInt<3>("h05"), io.funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_7 = mux(_io_branchCtrl_T_6, UInt<3>("h04"), _io_branchCtrl_T_5) @[Mux.scala 80:57]
    node _io_branchCtrl_T_8 = eq(UInt<3>("h06"), io.funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_9 = mux(_io_branchCtrl_T_8, UInt<3>("h05"), _io_branchCtrl_T_7) @[Mux.scala 80:57]
    node _io_branchCtrl_T_10 = eq(UInt<3>("h07"), io.funct3) @[Mux.scala 80:60]
    node _io_branchCtrl_T_11 = mux(_io_branchCtrl_T_10, UInt<3>("h06"), _io_branchCtrl_T_9) @[Mux.scala 80:57]
    node _io_branchCtrl_T_12 = mux(isBranch, _io_branchCtrl_T_11, UInt<1>("h00")) @[ALU_Branch.scala 25:23]
    io.branchCtrl <= _io_branchCtrl_T_12 @[ALU_Branch.scala 25:17]
    
