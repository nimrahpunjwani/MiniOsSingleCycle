circuit Main :
  module InsMem :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    output io_inst : UInt<32>

    node index = bits(io_pc, 31, 2) @[InsMem.scala 57:20]
    node _io_inst_T = lt(index, UInt<5>("h1a")) @[InsMem.scala 60:24]
    node _io_inst_T_1 = bits(index, 4, 0)
    node rom_0 = UInt<32>("h93") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_0 = validif(eq(UInt<1>("h0"), _io_inst_T_1), rom_0) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_1 = UInt<32>("h100113") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _io_inst_T_1), rom_1, _GEN_0) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_2 = UInt<32>("h400513") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _io_inst_T_1), rom_2, _GEN_1) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_3 = UInt<32>("h2800313") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _io_inst_T_1), rom_3, _GEN_2) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_4 = UInt<32>("h193") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _io_inst_T_1), rom_4, _GEN_3) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_5 = UInt<32>("h418213") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_5 = mux(eq(UInt<3>("h5"), _io_inst_T_1), rom_5, _GEN_4) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_6 = UInt<32>("h1011a023") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_6 = mux(eq(UInt<3>("h6"), _io_inst_T_1), rom_6, _GEN_5) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_7 = UInt<32>("h10222023") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_7 = mux(eq(UInt<3>("h7"), _io_inst_T_1), rom_7, _GEN_6) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_8 = UInt<32>("h800713") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_8 = mux(eq(UInt<4>("h8"), _io_inst_T_1), rom_8, _GEN_7) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_9 = UInt<32>("h800293") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_9 = mux(eq(UInt<4>("h9"), _io_inst_T_1), rom_9, _GEN_8) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_10 = UInt<32>("h800693") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_10 = mux(eq(UInt<4>("ha"), _io_inst_T_1), rom_10, _GEN_9) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_11 = UInt<32>("h400793") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_11 = mux(eq(UInt<4>("hb"), _io_inst_T_1), rom_11, _GEN_10) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_12 = UInt<32>("h400493") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_12 = mux(eq(UInt<4>("hc"), _io_inst_T_1), rom_12, _GEN_11) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_13 = UInt<32>("h208433") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_13 = mux(eq(UInt<4>("hd"), _io_inst_T_1), rom_13, _GEN_12) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_14 = UInt<32>("h2628063") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_14 = mux(eq(UInt<4>("he"), _io_inst_T_1), rom_14, _GEN_13) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_15 = UInt<32>("h800633") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_15 = mux(eq(UInt<4>("hf"), _io_inst_T_1), rom_15, _GEN_14) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_16 = UInt<32>("h10c2a023") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_16 = mux(eq(UInt<5>("h10"), _io_inst_T_1), rom_16, _GEN_15) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_17 = UInt<32>("h1004a583") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_17 = mux(eq(UInt<5>("h11"), _io_inst_T_1), rom_17, _GEN_16) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_18 = UInt<32>("h858433") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_18 = mux(eq(UInt<5>("h12"), _io_inst_T_1), rom_18, _GEN_17) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_19 = UInt<32>("h428293") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_19 = mux(eq(UInt<5>("h13"), _io_inst_T_1), rom_19, _GEN_18) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_20 = UInt<32>("h448493") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_20 = mux(eq(UInt<5>("h14"), _io_inst_T_1), rom_20, _GEN_19) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_21 = UInt<32>("hfe5ff3ef") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_21 = mux(eq(UInt<5>("h15"), _io_inst_T_1), rom_21, _GEN_20) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_22 = UInt<32>("h618863") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_22 = mux(eq(UInt<5>("h16"), _io_inst_T_1), rom_22, _GEN_21) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_23 = UInt<32>("h1001a803") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_23 = mux(eq(UInt<5>("h17"), _io_inst_T_1), rom_23, _GEN_22) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_24 = UInt<32>("h418193") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_24 = mux(eq(UInt<5>("h18"), _io_inst_T_1), rom_24, _GEN_23) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node rom_25 = UInt<32>("hff5ff3ef") @[InsMem.scala 54:28 InsMem.scala 54:28]
    node _GEN_25 = mux(eq(UInt<5>("h19"), _io_inst_T_1), rom_25, _GEN_24) @[InsMem.scala 60:17 InsMem.scala 60:17]
    node _rom_io_inst_T_1 = _GEN_25 @[InsMem.scala 60:17]
    node _io_inst_T_2 = mux(_io_inst_T, _rom_io_inst_T_1, UInt<1>("h0")) @[InsMem.scala 60:17]
    io_inst <= _io_inst_T_2 @[InsMem.scala 60:11]

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

  module ContDec :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_RegWrite : UInt<1>
    output io_ALUSrc : UInt<1>
    output io_ALUOp : UInt<2>
    output io_MemRead : UInt<1>
    output io_MemWrite : UInt<1>
    output io_MemToReg : UInt<1>
    output io_Branch : UInt<1>
    output io_Jump : UInt<1>

    node _T = eq(UInt<6>("h33"), io_opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<5>("h13"), io_opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<2>("h3"), io_opcode) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<6>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 56:19 ContDec.scala 20:15]
    node _GEN_1 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 52:19 ContDec.scala 26:15]
    node _GEN_2 = mux(_T_4, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 ContDec.scala 20:15]
    node _GEN_3 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 47:19 ContDec.scala 21:15]
    node _GEN_4 = mux(_T_3, UInt<1>("h0"), _GEN_1) @[Conditional.scala 39:67 ContDec.scala 49:19]
    node _GEN_5 = mux(_T_3, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 ContDec.scala 20:15]
    node _GEN_6 = mux(_T_2, UInt<1>("h1"), _GEN_5) @[Conditional.scala 39:67 ContDec.scala 40:19]
    node _GEN_7 = mux(_T_2, UInt<1>("h1"), _GEN_3) @[Conditional.scala 39:67 ContDec.scala 41:19]
    node _GEN_8 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 42:19 ContDec.scala 23:15]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 ContDec.scala 44:19]
    node _GEN_10 = mux(_T_2, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67 ContDec.scala 24:15]
    node _GEN_11 = mux(_T_2, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 ContDec.scala 27:15]
    node _GEN_12 = mux(_T_1, UInt<1>("h1"), _GEN_6) @[Conditional.scala 39:67 ContDec.scala 35:19]
    node _GEN_13 = mux(_T_1, UInt<1>("h1"), _GEN_7) @[Conditional.scala 39:67 ContDec.scala 36:19]
    node _GEN_14 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 ContDec.scala 37:19]
    node _GEN_15 = mux(_T_1, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 ContDec.scala 23:15]
    node _GEN_16 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 ContDec.scala 24:15]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 ContDec.scala 27:15]
    node _GEN_18 = mux(_T, UInt<1>("h1"), _GEN_12) @[Conditional.scala 40:58 ContDec.scala 31:19]
    node _GEN_19 = mux(_T, UInt<2>("h2"), _GEN_14) @[Conditional.scala 40:58 ContDec.scala 32:19]
    node _GEN_20 = mux(_T, UInt<1>("h0"), _GEN_13) @[Conditional.scala 40:58 ContDec.scala 21:15]
    node _GEN_21 = mux(_T, UInt<1>("h0"), _GEN_15) @[Conditional.scala 40:58 ContDec.scala 23:15]
    node _GEN_22 = mux(_T, UInt<1>("h0"), _GEN_16) @[Conditional.scala 40:58 ContDec.scala 24:15]
    node _GEN_23 = mux(_T, UInt<1>("h0"), _GEN_14) @[Conditional.scala 40:58 ContDec.scala 26:15]
    node _GEN_24 = mux(_T, UInt<1>("h0"), _GEN_17) @[Conditional.scala 40:58 ContDec.scala 27:15]
    io_RegWrite <= _GEN_18
    io_ALUSrc <= _GEN_20
    io_ALUOp <= _GEN_19
    io_MemRead <= _GEN_21
    io_MemWrite <= _GEN_22
    io_MemToReg <= _GEN_21
    io_Branch <= _GEN_23
    io_Jump <= _GEN_24

  module TypeDec :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_rType : UInt<1>
    output io_iType : UInt<1>
    output io_sType : UInt<1>
    output io_bType : UInt<1>
    output io_auipc : UInt<1>
    output io_jType : UInt<1>
    output io_lui : UInt<1>
    output io_T0 : UInt<1>
    output io_T1 : UInt<1>
    output io_T2 : UInt<1>
    output io_immSel : UInt<3>

    node _T = eq(UInt<6>("h33"), io_opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<5>("h13"), io_opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<2>("h3"), io_opcode) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<7>("h67"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<6>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<6>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<5>("h17"), io_opcode) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 69:16 TypeDec.scala 30:12]
    node _GEN_1 = mux(_T_8, UInt<3>("h4"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 70:17 TypeDec.scala 33:13]
    node _GEN_2 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 65:16 TypeDec.scala 29:12]
    node _GEN_3 = mux(_T_7, UInt<2>("h3"), _GEN_1) @[Conditional.scala 39:67 TypeDec.scala 66:17]
    node _GEN_4 = mux(_T_7, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_5 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 61:14 TypeDec.scala 31:12]
    node _GEN_6 = mux(_T_6, UInt<2>("h3"), _GEN_3) @[Conditional.scala 39:67 TypeDec.scala 62:17]
    node _GEN_7 = mux(_T_6, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_8 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_9 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 57:16 TypeDec.scala 28:12]
    node _GEN_10 = mux(_T_5, UInt<2>("h2"), _GEN_6) @[Conditional.scala 39:67 TypeDec.scala 58:17]
    node _GEN_11 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_13 = mux(_T_5, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_14 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 53:16 TypeDec.scala 27:12]
    node _GEN_15 = mux(_T_4, UInt<1>("h1"), _GEN_10) @[Conditional.scala 39:67 TypeDec.scala 54:17]
    node _GEN_16 = mux(_T_4, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_18 = mux(_T_4, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_19 = mux(_T_4, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_20 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 49:16 TypeDec.scala 26:12]
    node _GEN_21 = mux(_T_3, UInt<1>("h0"), _GEN_15) @[Conditional.scala 39:67 TypeDec.scala 50:17]
    node _GEN_22 = mux(_T_3, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_23 = mux(_T_3, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_24 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_25 = mux(_T_3, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_26 = mux(_T_3, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_27 = mux(_T_2, UInt<1>("h1"), _GEN_20) @[Conditional.scala 39:67 TypeDec.scala 45:16]
    node _GEN_28 = mux(_T_2, UInt<1>("h0"), _GEN_21) @[Conditional.scala 39:67 TypeDec.scala 46:17]
    node _GEN_29 = mux(_T_2, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_30 = mux(_T_2, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_31 = mux(_T_2, UInt<1>("h0"), _GEN_24) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_32 = mux(_T_2, UInt<1>("h0"), _GEN_25) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_33 = mux(_T_2, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_34 = mux(_T_1, UInt<1>("h1"), _GEN_27) @[Conditional.scala 39:67 TypeDec.scala 41:16]
    node _GEN_35 = mux(_T_1, UInt<1>("h0"), _GEN_28) @[Conditional.scala 39:67 TypeDec.scala 42:17]
    node _GEN_36 = mux(_T_1, UInt<1>("h0"), _GEN_29) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_37 = mux(_T_1, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_38 = mux(_T_1, UInt<1>("h0"), _GEN_31) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_39 = mux(_T_1, UInt<1>("h0"), _GEN_32) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_40 = mux(_T_1, UInt<1>("h0"), _GEN_33) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_41 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 TypeDec.scala 37:16 TypeDec.scala 25:12]
    node _GEN_42 = mux(_T, UInt<1>("h0"), _GEN_35) @[Conditional.scala 40:58 TypeDec.scala 38:17]
    node _GEN_43 = mux(_T, UInt<1>("h0"), _GEN_34) @[Conditional.scala 40:58 TypeDec.scala 26:12]
    node _GEN_44 = mux(_T, UInt<1>("h0"), _GEN_36) @[Conditional.scala 40:58 TypeDec.scala 27:12]
    node _GEN_45 = mux(_T, UInt<1>("h0"), _GEN_37) @[Conditional.scala 40:58 TypeDec.scala 28:12]
    node _GEN_46 = mux(_T, UInt<1>("h0"), _GEN_38) @[Conditional.scala 40:58 TypeDec.scala 31:12]
    node _GEN_47 = mux(_T, UInt<1>("h0"), _GEN_39) @[Conditional.scala 40:58 TypeDec.scala 29:12]
    node _GEN_48 = mux(_T, UInt<1>("h0"), _GEN_40) @[Conditional.scala 40:58 TypeDec.scala 30:12]
    node _io_T0_T = bits(io_immSel, 0, 0) @[TypeDec.scala 74:21]
    node _io_T1_T = bits(io_immSel, 1, 1) @[TypeDec.scala 75:21]
    node _io_T2_T = bits(io_immSel, 2, 2) @[TypeDec.scala 76:21]
    io_rType <= _GEN_41
    io_iType <= _GEN_43
    io_sType <= _GEN_44
    io_bType <= _GEN_45
    io_auipc <= _GEN_47
    io_jType <= _GEN_48
    io_lui <= _GEN_46
    io_T0 <= _io_T0_T @[TypeDec.scala 74:9]
    io_T1 <= _io_T1_T @[TypeDec.scala 75:9]
    io_T2 <= _io_T2_T @[TypeDec.scala 76:9]
    io_immSel <= _GEN_42

  module ImmGen :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    input io_sel : UInt<3>
    output io_imm : UInt<32>

    node _immI_T = bits(io_inst, 31, 31) @[ImmGen.scala 15:31]
    node _immI_T_1 = bits(_immI_T, 0, 0) @[Bitwise.scala 72:15]
    node immI_hi = mux(_immI_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node immI_lo = bits(io_inst, 31, 20) @[ImmGen.scala 15:42]
    node immI = cat(immI_hi, immI_lo) @[Cat.scala 30:58]
    node _immS_T = bits(io_inst, 31, 31) @[ImmGen.scala 18:31]
    node _immS_T_1 = bits(_immS_T, 0, 0) @[Bitwise.scala 72:15]
    node immS_hi_hi = mux(_immS_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node immS_hi_lo = bits(io_inst, 31, 25) @[ImmGen.scala 18:42]
    node immS_lo = bits(io_inst, 11, 7) @[ImmGen.scala 18:55]
    node immS_hi = cat(immS_hi_hi, immS_hi_lo) @[Cat.scala 30:58]
    node immS = cat(immS_hi, immS_lo) @[Cat.scala 30:58]
    node _immB_T = bits(io_inst, 31, 31) @[ImmGen.scala 22:18]
    node _immB_T_1 = bits(_immB_T, 0, 0) @[Bitwise.scala 72:15]
    node immB_hi_hi_hi = mux(_immB_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node immB_hi_hi_lo = bits(io_inst, 31, 31) @[ImmGen.scala 23:9]
    node immB_hi_lo = bits(io_inst, 7, 7) @[ImmGen.scala 24:9]
    node immB_lo_hi_hi = bits(io_inst, 30, 25) @[ImmGen.scala 25:9]
    node immB_lo_hi_lo = bits(io_inst, 11, 8) @[ImmGen.scala 26:9]
    node immB_lo_hi = cat(immB_lo_hi_hi, immB_lo_hi_lo) @[Cat.scala 30:58]
    node immB_lo = cat(immB_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node immB_hi_hi = cat(immB_hi_hi_hi, immB_hi_hi_lo) @[Cat.scala 30:58]
    node immB_hi = cat(immB_hi_hi, immB_hi_lo) @[Cat.scala 30:58]
    node immB = cat(immB_hi, immB_lo) @[Cat.scala 30:58]
    node immU_hi = bits(io_inst, 31, 12) @[ImmGen.scala 31:22]
    node immU_lo = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node immU = cat(immU_hi, immU_lo) @[Cat.scala 30:58]
    node _immJ_T = bits(io_inst, 31, 31) @[ImmGen.scala 36:18]
    node _immJ_T_1 = bits(_immJ_T, 0, 0) @[Bitwise.scala 72:15]
    node immJ_hi_hi_hi = mux(_immJ_T_1, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node immJ_hi_hi_lo = bits(io_inst, 31, 31) @[ImmGen.scala 37:9]
    node immJ_hi_lo = bits(io_inst, 19, 12) @[ImmGen.scala 38:9]
    node immJ_lo_hi_hi = bits(io_inst, 20, 20) @[ImmGen.scala 39:9]
    node immJ_lo_hi_lo = bits(io_inst, 30, 21) @[ImmGen.scala 40:9]
    node immJ_lo_hi = cat(immJ_lo_hi_hi, immJ_lo_hi_lo) @[Cat.scala 30:58]
    node immJ_lo = cat(immJ_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node immJ_hi_hi = cat(immJ_hi_hi_hi, immJ_hi_hi_lo) @[Cat.scala 30:58]
    node immJ_hi = cat(immJ_hi_hi, immJ_hi_lo) @[Cat.scala 30:58]
    node immJ = cat(immJ_hi, immJ_lo) @[Cat.scala 30:58]
    node _io_imm_T = eq(UInt<1>("h0"), io_sel) @[Mux.scala 80:60]
    node _io_imm_T_1 = mux(_io_imm_T, immI, UInt<1>("h0")) @[Mux.scala 80:57]
    node _io_imm_T_2 = eq(UInt<1>("h1"), io_sel) @[Mux.scala 80:60]
    node _io_imm_T_3 = mux(_io_imm_T_2, immS, _io_imm_T_1) @[Mux.scala 80:57]
    node _io_imm_T_4 = eq(UInt<2>("h2"), io_sel) @[Mux.scala 80:60]
    node _io_imm_T_5 = mux(_io_imm_T_4, immB, _io_imm_T_3) @[Mux.scala 80:57]
    node _io_imm_T_6 = eq(UInt<2>("h3"), io_sel) @[Mux.scala 80:60]
    node _io_imm_T_7 = mux(_io_imm_T_6, immU, _io_imm_T_5) @[Mux.scala 80:57]
    node _io_imm_T_8 = eq(UInt<3>("h4"), io_sel) @[Mux.scala 80:60]
    node _io_imm_T_9 = mux(_io_imm_T_8, immJ, _io_imm_T_7) @[Mux.scala 80:57]
    io_imm <= _io_imm_T_9 @[ImmGen.scala 44:10]

  module register :
    input clock : Clock
    input reset : UInt<1>
    input io_clr : UInt<1>
    input io_readReg1 : UInt<5>
    input io_readReg2 : UInt<5>
    input io_writeReg : UInt<5>
    input io_writeData : UInt<32>
    input io_regWrite : UInt<1>
    output io_readData1 : UInt<32>
    output io_readData2 : UInt<32>

    reg regs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_0) @[register.scala 18:21]
    reg regs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_1) @[register.scala 18:21]
    reg regs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_2) @[register.scala 18:21]
    reg regs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_3) @[register.scala 18:21]
    reg regs_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_4) @[register.scala 18:21]
    reg regs_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_5) @[register.scala 18:21]
    reg regs_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_6) @[register.scala 18:21]
    reg regs_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_7) @[register.scala 18:21]
    reg regs_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_8) @[register.scala 18:21]
    reg regs_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_9) @[register.scala 18:21]
    reg regs_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_10) @[register.scala 18:21]
    reg regs_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_11) @[register.scala 18:21]
    reg regs_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_12) @[register.scala 18:21]
    reg regs_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_13) @[register.scala 18:21]
    reg regs_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_14) @[register.scala 18:21]
    reg regs_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_15) @[register.scala 18:21]
    reg regs_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_16) @[register.scala 18:21]
    reg regs_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_17) @[register.scala 18:21]
    reg regs_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_18) @[register.scala 18:21]
    reg regs_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_19) @[register.scala 18:21]
    reg regs_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_20) @[register.scala 18:21]
    reg regs_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_21) @[register.scala 18:21]
    reg regs_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_22) @[register.scala 18:21]
    reg regs_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_23) @[register.scala 18:21]
    reg regs_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_24) @[register.scala 18:21]
    reg regs_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_25) @[register.scala 18:21]
    reg regs_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_26) @[register.scala 18:21]
    reg regs_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_27) @[register.scala 18:21]
    reg regs_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_28) @[register.scala 18:21]
    reg regs_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_29) @[register.scala 18:21]
    reg regs_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_30) @[register.scala 18:21]
    reg regs_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_31) @[register.scala 18:21]
    node _T = neq(io_writeReg, UInt<1>("h0")) @[register.scala 30:41]
    node _T_1 = and(io_regWrite, _T) @[register.scala 30:26]
    node _regs_io_writeReg = io_writeData @[register.scala 31:23 register.scala 31:23]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_writeReg), _regs_io_writeReg, UInt<1>("h0")) @[register.scala 31:23 register.scala 31:23 register.scala 24:11]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_writeReg), _regs_io_writeReg, regs_1) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_writeReg), _regs_io_writeReg, regs_2) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_writeReg), _regs_io_writeReg, regs_3) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_writeReg), _regs_io_writeReg, regs_4) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_writeReg), _regs_io_writeReg, regs_5) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_writeReg), _regs_io_writeReg, regs_6) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_writeReg), _regs_io_writeReg, regs_7) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_writeReg), _regs_io_writeReg, regs_8) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_writeReg), _regs_io_writeReg, regs_9) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_writeReg), _regs_io_writeReg, regs_10) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_writeReg), _regs_io_writeReg, regs_11) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_writeReg), _regs_io_writeReg, regs_12) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_writeReg), _regs_io_writeReg, regs_13) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_writeReg), _regs_io_writeReg, regs_14) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_writeReg), _regs_io_writeReg, regs_15) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_writeReg), _regs_io_writeReg, regs_16) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_writeReg), _regs_io_writeReg, regs_17) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_writeReg), _regs_io_writeReg, regs_18) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_writeReg), _regs_io_writeReg, regs_19) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_writeReg), _regs_io_writeReg, regs_20) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_writeReg), _regs_io_writeReg, regs_21) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_writeReg), _regs_io_writeReg, regs_22) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_writeReg), _regs_io_writeReg, regs_23) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_writeReg), _regs_io_writeReg, regs_24) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_writeReg), _regs_io_writeReg, regs_25) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_writeReg), _regs_io_writeReg, regs_26) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_writeReg), _regs_io_writeReg, regs_27) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_writeReg), _regs_io_writeReg, regs_28) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_writeReg), _regs_io_writeReg, regs_29) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_writeReg), _regs_io_writeReg, regs_30) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_writeReg), _regs_io_writeReg, regs_31) @[register.scala 31:23 register.scala 31:23 register.scala 18:21]
    node _GEN_32 = mux(_T_1, _GEN_0, UInt<1>("h0")) @[register.scala 30:50 register.scala 24:11]
    node _GEN_33 = mux(_T_1, _GEN_1, regs_1) @[register.scala 30:50 register.scala 18:21]
    node _GEN_34 = mux(_T_1, _GEN_2, regs_2) @[register.scala 30:50 register.scala 18:21]
    node _GEN_35 = mux(_T_1, _GEN_3, regs_3) @[register.scala 30:50 register.scala 18:21]
    node _GEN_36 = mux(_T_1, _GEN_4, regs_4) @[register.scala 30:50 register.scala 18:21]
    node _GEN_37 = mux(_T_1, _GEN_5, regs_5) @[register.scala 30:50 register.scala 18:21]
    node _GEN_38 = mux(_T_1, _GEN_6, regs_6) @[register.scala 30:50 register.scala 18:21]
    node _GEN_39 = mux(_T_1, _GEN_7, regs_7) @[register.scala 30:50 register.scala 18:21]
    node _GEN_40 = mux(_T_1, _GEN_8, regs_8) @[register.scala 30:50 register.scala 18:21]
    node _GEN_41 = mux(_T_1, _GEN_9, regs_9) @[register.scala 30:50 register.scala 18:21]
    node _GEN_42 = mux(_T_1, _GEN_10, regs_10) @[register.scala 30:50 register.scala 18:21]
    node _GEN_43 = mux(_T_1, _GEN_11, regs_11) @[register.scala 30:50 register.scala 18:21]
    node _GEN_44 = mux(_T_1, _GEN_12, regs_12) @[register.scala 30:50 register.scala 18:21]
    node _GEN_45 = mux(_T_1, _GEN_13, regs_13) @[register.scala 30:50 register.scala 18:21]
    node _GEN_46 = mux(_T_1, _GEN_14, regs_14) @[register.scala 30:50 register.scala 18:21]
    node _GEN_47 = mux(_T_1, _GEN_15, regs_15) @[register.scala 30:50 register.scala 18:21]
    node _GEN_48 = mux(_T_1, _GEN_16, regs_16) @[register.scala 30:50 register.scala 18:21]
    node _GEN_49 = mux(_T_1, _GEN_17, regs_17) @[register.scala 30:50 register.scala 18:21]
    node _GEN_50 = mux(_T_1, _GEN_18, regs_18) @[register.scala 30:50 register.scala 18:21]
    node _GEN_51 = mux(_T_1, _GEN_19, regs_19) @[register.scala 30:50 register.scala 18:21]
    node _GEN_52 = mux(_T_1, _GEN_20, regs_20) @[register.scala 30:50 register.scala 18:21]
    node _GEN_53 = mux(_T_1, _GEN_21, regs_21) @[register.scala 30:50 register.scala 18:21]
    node _GEN_54 = mux(_T_1, _GEN_22, regs_22) @[register.scala 30:50 register.scala 18:21]
    node _GEN_55 = mux(_T_1, _GEN_23, regs_23) @[register.scala 30:50 register.scala 18:21]
    node _GEN_56 = mux(_T_1, _GEN_24, regs_24) @[register.scala 30:50 register.scala 18:21]
    node _GEN_57 = mux(_T_1, _GEN_25, regs_25) @[register.scala 30:50 register.scala 18:21]
    node _GEN_58 = mux(_T_1, _GEN_26, regs_26) @[register.scala 30:50 register.scala 18:21]
    node _GEN_59 = mux(_T_1, _GEN_27, regs_27) @[register.scala 30:50 register.scala 18:21]
    node _GEN_60 = mux(_T_1, _GEN_28, regs_28) @[register.scala 30:50 register.scala 18:21]
    node _GEN_61 = mux(_T_1, _GEN_29, regs_29) @[register.scala 30:50 register.scala 18:21]
    node _GEN_62 = mux(_T_1, _GEN_30, regs_30) @[register.scala 30:50 register.scala 18:21]
    node _GEN_63 = mux(_T_1, _GEN_31, regs_31) @[register.scala 30:50 register.scala 18:21]
    node _GEN_64 = mux(io_clr, UInt<1>("h0"), _GEN_33) @[register.scala 26:16 register.scala 28:15]
    node _GEN_65 = mux(io_clr, UInt<1>("h0"), _GEN_34) @[register.scala 26:16 register.scala 28:15]
    node _GEN_66 = mux(io_clr, UInt<1>("h0"), _GEN_35) @[register.scala 26:16 register.scala 28:15]
    node _GEN_67 = mux(io_clr, UInt<1>("h0"), _GEN_36) @[register.scala 26:16 register.scala 28:15]
    node _GEN_68 = mux(io_clr, UInt<1>("h0"), _GEN_37) @[register.scala 26:16 register.scala 28:15]
    node _GEN_69 = mux(io_clr, UInt<1>("h0"), _GEN_38) @[register.scala 26:16 register.scala 28:15]
    node _GEN_70 = mux(io_clr, UInt<1>("h0"), _GEN_39) @[register.scala 26:16 register.scala 28:15]
    node _GEN_71 = mux(io_clr, UInt<1>("h0"), _GEN_40) @[register.scala 26:16 register.scala 28:15]
    node _GEN_72 = mux(io_clr, UInt<1>("h0"), _GEN_41) @[register.scala 26:16 register.scala 28:15]
    node _GEN_73 = mux(io_clr, UInt<1>("h0"), _GEN_42) @[register.scala 26:16 register.scala 28:15]
    node _GEN_74 = mux(io_clr, UInt<1>("h0"), _GEN_43) @[register.scala 26:16 register.scala 28:15]
    node _GEN_75 = mux(io_clr, UInt<1>("h0"), _GEN_44) @[register.scala 26:16 register.scala 28:15]
    node _GEN_76 = mux(io_clr, UInt<1>("h0"), _GEN_45) @[register.scala 26:16 register.scala 28:15]
    node _GEN_77 = mux(io_clr, UInt<1>("h0"), _GEN_46) @[register.scala 26:16 register.scala 28:15]
    node _GEN_78 = mux(io_clr, UInt<1>("h0"), _GEN_47) @[register.scala 26:16 register.scala 28:15]
    node _GEN_79 = mux(io_clr, UInt<1>("h0"), _GEN_48) @[register.scala 26:16 register.scala 28:15]
    node _GEN_80 = mux(io_clr, UInt<1>("h0"), _GEN_49) @[register.scala 26:16 register.scala 28:15]
    node _GEN_81 = mux(io_clr, UInt<1>("h0"), _GEN_50) @[register.scala 26:16 register.scala 28:15]
    node _GEN_82 = mux(io_clr, UInt<1>("h0"), _GEN_51) @[register.scala 26:16 register.scala 28:15]
    node _GEN_83 = mux(io_clr, UInt<1>("h0"), _GEN_52) @[register.scala 26:16 register.scala 28:15]
    node _GEN_84 = mux(io_clr, UInt<1>("h0"), _GEN_53) @[register.scala 26:16 register.scala 28:15]
    node _GEN_85 = mux(io_clr, UInt<1>("h0"), _GEN_54) @[register.scala 26:16 register.scala 28:15]
    node _GEN_86 = mux(io_clr, UInt<1>("h0"), _GEN_55) @[register.scala 26:16 register.scala 28:15]
    node _GEN_87 = mux(io_clr, UInt<1>("h0"), _GEN_56) @[register.scala 26:16 register.scala 28:15]
    node _GEN_88 = mux(io_clr, UInt<1>("h0"), _GEN_57) @[register.scala 26:16 register.scala 28:15]
    node _GEN_89 = mux(io_clr, UInt<1>("h0"), _GEN_58) @[register.scala 26:16 register.scala 28:15]
    node _GEN_90 = mux(io_clr, UInt<1>("h0"), _GEN_59) @[register.scala 26:16 register.scala 28:15]
    node _GEN_91 = mux(io_clr, UInt<1>("h0"), _GEN_60) @[register.scala 26:16 register.scala 28:15]
    node _GEN_92 = mux(io_clr, UInt<1>("h0"), _GEN_61) @[register.scala 26:16 register.scala 28:15]
    node _GEN_93 = mux(io_clr, UInt<1>("h0"), _GEN_62) @[register.scala 26:16 register.scala 28:15]
    node _GEN_94 = mux(io_clr, UInt<1>("h0"), _GEN_63) @[register.scala 26:16 register.scala 28:15]
    node _GEN_95 = mux(io_clr, UInt<1>("h0"), _GEN_32) @[register.scala 26:16 register.scala 24:11]
    node _GEN_96 = validif(eq(UInt<1>("h0"), io_readReg1), regs_0) @[register.scala 34:16 register.scala 34:16]
    node _GEN_97 = mux(eq(UInt<1>("h1"), io_readReg1), regs_1, _GEN_96) @[register.scala 34:16 register.scala 34:16]
    node _GEN_98 = mux(eq(UInt<2>("h2"), io_readReg1), regs_2, _GEN_97) @[register.scala 34:16 register.scala 34:16]
    node _GEN_99 = mux(eq(UInt<2>("h3"), io_readReg1), regs_3, _GEN_98) @[register.scala 34:16 register.scala 34:16]
    node _GEN_100 = mux(eq(UInt<3>("h4"), io_readReg1), regs_4, _GEN_99) @[register.scala 34:16 register.scala 34:16]
    node _GEN_101 = mux(eq(UInt<3>("h5"), io_readReg1), regs_5, _GEN_100) @[register.scala 34:16 register.scala 34:16]
    node _GEN_102 = mux(eq(UInt<3>("h6"), io_readReg1), regs_6, _GEN_101) @[register.scala 34:16 register.scala 34:16]
    node _GEN_103 = mux(eq(UInt<3>("h7"), io_readReg1), regs_7, _GEN_102) @[register.scala 34:16 register.scala 34:16]
    node _GEN_104 = mux(eq(UInt<4>("h8"), io_readReg1), regs_8, _GEN_103) @[register.scala 34:16 register.scala 34:16]
    node _GEN_105 = mux(eq(UInt<4>("h9"), io_readReg1), regs_9, _GEN_104) @[register.scala 34:16 register.scala 34:16]
    node _GEN_106 = mux(eq(UInt<4>("ha"), io_readReg1), regs_10, _GEN_105) @[register.scala 34:16 register.scala 34:16]
    node _GEN_107 = mux(eq(UInt<4>("hb"), io_readReg1), regs_11, _GEN_106) @[register.scala 34:16 register.scala 34:16]
    node _GEN_108 = mux(eq(UInt<4>("hc"), io_readReg1), regs_12, _GEN_107) @[register.scala 34:16 register.scala 34:16]
    node _GEN_109 = mux(eq(UInt<4>("hd"), io_readReg1), regs_13, _GEN_108) @[register.scala 34:16 register.scala 34:16]
    node _GEN_110 = mux(eq(UInt<4>("he"), io_readReg1), regs_14, _GEN_109) @[register.scala 34:16 register.scala 34:16]
    node _GEN_111 = mux(eq(UInt<4>("hf"), io_readReg1), regs_15, _GEN_110) @[register.scala 34:16 register.scala 34:16]
    node _GEN_112 = mux(eq(UInt<5>("h10"), io_readReg1), regs_16, _GEN_111) @[register.scala 34:16 register.scala 34:16]
    node _GEN_113 = mux(eq(UInt<5>("h11"), io_readReg1), regs_17, _GEN_112) @[register.scala 34:16 register.scala 34:16]
    node _GEN_114 = mux(eq(UInt<5>("h12"), io_readReg1), regs_18, _GEN_113) @[register.scala 34:16 register.scala 34:16]
    node _GEN_115 = mux(eq(UInt<5>("h13"), io_readReg1), regs_19, _GEN_114) @[register.scala 34:16 register.scala 34:16]
    node _GEN_116 = mux(eq(UInt<5>("h14"), io_readReg1), regs_20, _GEN_115) @[register.scala 34:16 register.scala 34:16]
    node _GEN_117 = mux(eq(UInt<5>("h15"), io_readReg1), regs_21, _GEN_116) @[register.scala 34:16 register.scala 34:16]
    node _GEN_118 = mux(eq(UInt<5>("h16"), io_readReg1), regs_22, _GEN_117) @[register.scala 34:16 register.scala 34:16]
    node _GEN_119 = mux(eq(UInt<5>("h17"), io_readReg1), regs_23, _GEN_118) @[register.scala 34:16 register.scala 34:16]
    node _GEN_120 = mux(eq(UInt<5>("h18"), io_readReg1), regs_24, _GEN_119) @[register.scala 34:16 register.scala 34:16]
    node _GEN_121 = mux(eq(UInt<5>("h19"), io_readReg1), regs_25, _GEN_120) @[register.scala 34:16 register.scala 34:16]
    node _GEN_122 = mux(eq(UInt<5>("h1a"), io_readReg1), regs_26, _GEN_121) @[register.scala 34:16 register.scala 34:16]
    node _GEN_123 = mux(eq(UInt<5>("h1b"), io_readReg1), regs_27, _GEN_122) @[register.scala 34:16 register.scala 34:16]
    node _GEN_124 = mux(eq(UInt<5>("h1c"), io_readReg1), regs_28, _GEN_123) @[register.scala 34:16 register.scala 34:16]
    node _GEN_125 = mux(eq(UInt<5>("h1d"), io_readReg1), regs_29, _GEN_124) @[register.scala 34:16 register.scala 34:16]
    node _GEN_126 = mux(eq(UInt<5>("h1e"), io_readReg1), regs_30, _GEN_125) @[register.scala 34:16 register.scala 34:16]
    node _GEN_127 = mux(eq(UInt<5>("h1f"), io_readReg1), regs_31, _GEN_126) @[register.scala 34:16 register.scala 34:16]
    node _GEN_128 = validif(eq(UInt<1>("h0"), io_readReg2), regs_0) @[register.scala 35:16 register.scala 35:16]
    node _GEN_129 = mux(eq(UInt<1>("h1"), io_readReg2), regs_1, _GEN_128) @[register.scala 35:16 register.scala 35:16]
    node _GEN_130 = mux(eq(UInt<2>("h2"), io_readReg2), regs_2, _GEN_129) @[register.scala 35:16 register.scala 35:16]
    node _GEN_131 = mux(eq(UInt<2>("h3"), io_readReg2), regs_3, _GEN_130) @[register.scala 35:16 register.scala 35:16]
    node _GEN_132 = mux(eq(UInt<3>("h4"), io_readReg2), regs_4, _GEN_131) @[register.scala 35:16 register.scala 35:16]
    node _GEN_133 = mux(eq(UInt<3>("h5"), io_readReg2), regs_5, _GEN_132) @[register.scala 35:16 register.scala 35:16]
    node _GEN_134 = mux(eq(UInt<3>("h6"), io_readReg2), regs_6, _GEN_133) @[register.scala 35:16 register.scala 35:16]
    node _GEN_135 = mux(eq(UInt<3>("h7"), io_readReg2), regs_7, _GEN_134) @[register.scala 35:16 register.scala 35:16]
    node _GEN_136 = mux(eq(UInt<4>("h8"), io_readReg2), regs_8, _GEN_135) @[register.scala 35:16 register.scala 35:16]
    node _GEN_137 = mux(eq(UInt<4>("h9"), io_readReg2), regs_9, _GEN_136) @[register.scala 35:16 register.scala 35:16]
    node _GEN_138 = mux(eq(UInt<4>("ha"), io_readReg2), regs_10, _GEN_137) @[register.scala 35:16 register.scala 35:16]
    node _GEN_139 = mux(eq(UInt<4>("hb"), io_readReg2), regs_11, _GEN_138) @[register.scala 35:16 register.scala 35:16]
    node _GEN_140 = mux(eq(UInt<4>("hc"), io_readReg2), regs_12, _GEN_139) @[register.scala 35:16 register.scala 35:16]
    node _GEN_141 = mux(eq(UInt<4>("hd"), io_readReg2), regs_13, _GEN_140) @[register.scala 35:16 register.scala 35:16]
    node _GEN_142 = mux(eq(UInt<4>("he"), io_readReg2), regs_14, _GEN_141) @[register.scala 35:16 register.scala 35:16]
    node _GEN_143 = mux(eq(UInt<4>("hf"), io_readReg2), regs_15, _GEN_142) @[register.scala 35:16 register.scala 35:16]
    node _GEN_144 = mux(eq(UInt<5>("h10"), io_readReg2), regs_16, _GEN_143) @[register.scala 35:16 register.scala 35:16]
    node _GEN_145 = mux(eq(UInt<5>("h11"), io_readReg2), regs_17, _GEN_144) @[register.scala 35:16 register.scala 35:16]
    node _GEN_146 = mux(eq(UInt<5>("h12"), io_readReg2), regs_18, _GEN_145) @[register.scala 35:16 register.scala 35:16]
    node _GEN_147 = mux(eq(UInt<5>("h13"), io_readReg2), regs_19, _GEN_146) @[register.scala 35:16 register.scala 35:16]
    node _GEN_148 = mux(eq(UInt<5>("h14"), io_readReg2), regs_20, _GEN_147) @[register.scala 35:16 register.scala 35:16]
    node _GEN_149 = mux(eq(UInt<5>("h15"), io_readReg2), regs_21, _GEN_148) @[register.scala 35:16 register.scala 35:16]
    node _GEN_150 = mux(eq(UInt<5>("h16"), io_readReg2), regs_22, _GEN_149) @[register.scala 35:16 register.scala 35:16]
    node _GEN_151 = mux(eq(UInt<5>("h17"), io_readReg2), regs_23, _GEN_150) @[register.scala 35:16 register.scala 35:16]
    node _GEN_152 = mux(eq(UInt<5>("h18"), io_readReg2), regs_24, _GEN_151) @[register.scala 35:16 register.scala 35:16]
    node _GEN_153 = mux(eq(UInt<5>("h19"), io_readReg2), regs_25, _GEN_152) @[register.scala 35:16 register.scala 35:16]
    node _GEN_154 = mux(eq(UInt<5>("h1a"), io_readReg2), regs_26, _GEN_153) @[register.scala 35:16 register.scala 35:16]
    node _GEN_155 = mux(eq(UInt<5>("h1b"), io_readReg2), regs_27, _GEN_154) @[register.scala 35:16 register.scala 35:16]
    node _GEN_156 = mux(eq(UInt<5>("h1c"), io_readReg2), regs_28, _GEN_155) @[register.scala 35:16 register.scala 35:16]
    node _GEN_157 = mux(eq(UInt<5>("h1d"), io_readReg2), regs_29, _GEN_156) @[register.scala 35:16 register.scala 35:16]
    node _GEN_158 = mux(eq(UInt<5>("h1e"), io_readReg2), regs_30, _GEN_157) @[register.scala 35:16 register.scala 35:16]
    node _GEN_159 = mux(eq(UInt<5>("h1f"), io_readReg2), regs_31, _GEN_158) @[register.scala 35:16 register.scala 35:16]
    node _regs_WIRE_0 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_1 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_2 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_3 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_4 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_5 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_6 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_7 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_8 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_9 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_10 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_11 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_12 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_13 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_14 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_15 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_16 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_17 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_18 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_19 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_20 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_21 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_22 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_23 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_24 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_25 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_26 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_27 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_28 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_29 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_30 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_WIRE_31 = UInt<32>("h0") @[register.scala 18:29 register.scala 18:29]
    node _regs_io_readReg1 = _GEN_127 @[register.scala 34:16]
    node _regs_io_readReg2 = _GEN_159 @[register.scala 35:16]
    io_readData1 <= _regs_io_readReg1 @[register.scala 34:16]
    io_readData2 <= _regs_io_readReg2 @[register.scala 35:16]
    regs_0 <= mux(reset, _regs_WIRE_0, _GEN_95) @[register.scala 18:21 register.scala 18:21]
    regs_1 <= mux(reset, _regs_WIRE_1, _GEN_64) @[register.scala 18:21 register.scala 18:21]
    regs_2 <= mux(reset, _regs_WIRE_2, _GEN_65) @[register.scala 18:21 register.scala 18:21]
    regs_3 <= mux(reset, _regs_WIRE_3, _GEN_66) @[register.scala 18:21 register.scala 18:21]
    regs_4 <= mux(reset, _regs_WIRE_4, _GEN_67) @[register.scala 18:21 register.scala 18:21]
    regs_5 <= mux(reset, _regs_WIRE_5, _GEN_68) @[register.scala 18:21 register.scala 18:21]
    regs_6 <= mux(reset, _regs_WIRE_6, _GEN_69) @[register.scala 18:21 register.scala 18:21]
    regs_7 <= mux(reset, _regs_WIRE_7, _GEN_70) @[register.scala 18:21 register.scala 18:21]
    regs_8 <= mux(reset, _regs_WIRE_8, _GEN_71) @[register.scala 18:21 register.scala 18:21]
    regs_9 <= mux(reset, _regs_WIRE_9, _GEN_72) @[register.scala 18:21 register.scala 18:21]
    regs_10 <= mux(reset, _regs_WIRE_10, _GEN_73) @[register.scala 18:21 register.scala 18:21]
    regs_11 <= mux(reset, _regs_WIRE_11, _GEN_74) @[register.scala 18:21 register.scala 18:21]
    regs_12 <= mux(reset, _regs_WIRE_12, _GEN_75) @[register.scala 18:21 register.scala 18:21]
    regs_13 <= mux(reset, _regs_WIRE_13, _GEN_76) @[register.scala 18:21 register.scala 18:21]
    regs_14 <= mux(reset, _regs_WIRE_14, _GEN_77) @[register.scala 18:21 register.scala 18:21]
    regs_15 <= mux(reset, _regs_WIRE_15, _GEN_78) @[register.scala 18:21 register.scala 18:21]
    regs_16 <= mux(reset, _regs_WIRE_16, _GEN_79) @[register.scala 18:21 register.scala 18:21]
    regs_17 <= mux(reset, _regs_WIRE_17, _GEN_80) @[register.scala 18:21 register.scala 18:21]
    regs_18 <= mux(reset, _regs_WIRE_18, _GEN_81) @[register.scala 18:21 register.scala 18:21]
    regs_19 <= mux(reset, _regs_WIRE_19, _GEN_82) @[register.scala 18:21 register.scala 18:21]
    regs_20 <= mux(reset, _regs_WIRE_20, _GEN_83) @[register.scala 18:21 register.scala 18:21]
    regs_21 <= mux(reset, _regs_WIRE_21, _GEN_84) @[register.scala 18:21 register.scala 18:21]
    regs_22 <= mux(reset, _regs_WIRE_22, _GEN_85) @[register.scala 18:21 register.scala 18:21]
    regs_23 <= mux(reset, _regs_WIRE_23, _GEN_86) @[register.scala 18:21 register.scala 18:21]
    regs_24 <= mux(reset, _regs_WIRE_24, _GEN_87) @[register.scala 18:21 register.scala 18:21]
    regs_25 <= mux(reset, _regs_WIRE_25, _GEN_88) @[register.scala 18:21 register.scala 18:21]
    regs_26 <= mux(reset, _regs_WIRE_26, _GEN_89) @[register.scala 18:21 register.scala 18:21]
    regs_27 <= mux(reset, _regs_WIRE_27, _GEN_90) @[register.scala 18:21 register.scala 18:21]
    regs_28 <= mux(reset, _regs_WIRE_28, _GEN_91) @[register.scala 18:21 register.scala 18:21]
    regs_29 <= mux(reset, _regs_WIRE_29, _GEN_92) @[register.scala 18:21 register.scala 18:21]
    regs_30 <= mux(reset, _regs_WIRE_30, _GEN_93) @[register.scala 18:21 register.scala 18:21]
    regs_31 <= mux(reset, _regs_WIRE_31, _GEN_94) @[register.scala 18:21 register.scala 18:21]

  module ALUControl :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    input io_opcode : UInt<7>
    input io_funct3 : UInt<3>
    input io_funct7 : UInt<7>
    output io_aluCtrl : UInt<5>

    node _isADD_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 18:26]
    node _isADD_T_1 = eq(io_funct3, UInt<1>("h0")) @[ALUControl.scala 18:56]
    node _isADD_T_2 = and(_isADD_T, _isADD_T_1) @[ALUControl.scala 18:43]
    node _isADD_T_3 = eq(io_funct7, UInt<1>("h0")) @[ALUControl.scala 18:82]
    node isADD = and(_isADD_T_2, _isADD_T_3) @[ALUControl.scala 18:69]
    node _isSUB_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 19:26]
    node _isSUB_T_1 = eq(io_funct3, UInt<1>("h0")) @[ALUControl.scala 19:56]
    node _isSUB_T_2 = and(_isSUB_T, _isSUB_T_1) @[ALUControl.scala 19:43]
    node _isSUB_T_3 = eq(io_funct7, UInt<6>("h20")) @[ALUControl.scala 19:82]
    node isSUB = and(_isSUB_T_2, _isSUB_T_3) @[ALUControl.scala 19:69]
    node _isAND_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 20:26]
    node _isAND_T_1 = eq(io_funct3, UInt<3>("h7")) @[ALUControl.scala 20:56]
    node isAND = and(_isAND_T, _isAND_T_1) @[ALUControl.scala 20:43]
    node _isOR_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 21:26]
    node _isOR_T_1 = eq(io_funct3, UInt<3>("h6")) @[ALUControl.scala 21:56]
    node isOR = and(_isOR_T, _isOR_T_1) @[ALUControl.scala 21:43]
    node _isXOR_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 22:26]
    node _isXOR_T_1 = eq(io_funct3, UInt<3>("h4")) @[ALUControl.scala 22:56]
    node isXOR = and(_isXOR_T, _isXOR_T_1) @[ALUControl.scala 22:43]
    node _isSLL_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 23:26]
    node _isSLL_T_1 = eq(io_funct3, UInt<1>("h1")) @[ALUControl.scala 23:56]
    node isSLL = and(_isSLL_T, _isSLL_T_1) @[ALUControl.scala 23:43]
    node _isSRL_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 24:26]
    node _isSRL_T_1 = eq(io_funct3, UInt<3>("h5")) @[ALUControl.scala 24:56]
    node _isSRL_T_2 = and(_isSRL_T, _isSRL_T_1) @[ALUControl.scala 24:43]
    node _isSRL_T_3 = eq(io_funct7, UInt<1>("h0")) @[ALUControl.scala 24:82]
    node isSRL = and(_isSRL_T_2, _isSRL_T_3) @[ALUControl.scala 24:69]
    node _isSRA_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 25:26]
    node _isSRA_T_1 = eq(io_funct3, UInt<3>("h5")) @[ALUControl.scala 25:56]
    node _isSRA_T_2 = and(_isSRA_T, _isSRA_T_1) @[ALUControl.scala 25:43]
    node _isSRA_T_3 = eq(io_funct7, UInt<6>("h20")) @[ALUControl.scala 25:82]
    node isSRA = and(_isSRA_T_2, _isSRA_T_3) @[ALUControl.scala 25:69]
    node _isSLT_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 26:26]
    node _isSLT_T_1 = eq(io_funct3, UInt<2>("h2")) @[ALUControl.scala 26:56]
    node isSLT = and(_isSLT_T, _isSLT_T_1) @[ALUControl.scala 26:43]
    node _isSLTU_T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 27:26]
    node _isSLTU_T_1 = eq(io_funct3, UInt<2>("h3")) @[ALUControl.scala 27:56]
    node isSLTU = and(_isSLTU_T, _isSLTU_T_1) @[ALUControl.scala 27:43]
    node _isADDI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 30:27]
    node _isADDI_T_1 = eq(io_funct3, UInt<1>("h0")) @[ALUControl.scala 30:57]
    node isADDI = and(_isADDI_T, _isADDI_T_1) @[ALUControl.scala 30:44]
    node _isSLTI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 31:27]
    node _isSLTI_T_1 = eq(io_funct3, UInt<2>("h2")) @[ALUControl.scala 31:57]
    node isSLTI = and(_isSLTI_T, _isSLTI_T_1) @[ALUControl.scala 31:44]
    node _isSLTIU_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 32:27]
    node _isSLTIU_T_1 = eq(io_funct3, UInt<2>("h3")) @[ALUControl.scala 32:57]
    node isSLTIU = and(_isSLTIU_T, _isSLTIU_T_1) @[ALUControl.scala 32:44]
    node _isXORI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 33:27]
    node _isXORI_T_1 = eq(io_funct3, UInt<3>("h4")) @[ALUControl.scala 33:57]
    node isXORI = and(_isXORI_T, _isXORI_T_1) @[ALUControl.scala 33:44]
    node _isORI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 34:27]
    node _isORI_T_1 = eq(io_funct3, UInt<3>("h6")) @[ALUControl.scala 34:57]
    node isORI = and(_isORI_T, _isORI_T_1) @[ALUControl.scala 34:44]
    node _isANDI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 35:27]
    node _isANDI_T_1 = eq(io_funct3, UInt<3>("h7")) @[ALUControl.scala 35:57]
    node isANDI = and(_isANDI_T, _isANDI_T_1) @[ALUControl.scala 35:44]
    node _isSLLI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 36:27]
    node _isSLLI_T_1 = eq(io_funct3, UInt<1>("h1")) @[ALUControl.scala 36:57]
    node isSLLI = and(_isSLLI_T, _isSLLI_T_1) @[ALUControl.scala 36:44]
    node _isSRLI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 38:27]
    node _isSRLI_T_1 = eq(io_funct3, UInt<3>("h5")) @[ALUControl.scala 38:57]
    node _isSRLI_T_2 = and(_isSRLI_T, _isSRLI_T_1) @[ALUControl.scala 38:44]
    node _isSRLI_T_3 = bits(io_inst, 31, 25) @[ALUControl.scala 38:80]
    node _isSRLI_T_4 = eq(_isSRLI_T_3, UInt<1>("h0")) @[ALUControl.scala 38:88]
    node isSRLI = and(_isSRLI_T_2, _isSRLI_T_4) @[ALUControl.scala 38:70]
    node _isSRAI_T = eq(io_opcode, UInt<5>("h13")) @[ALUControl.scala 39:27]
    node _isSRAI_T_1 = eq(io_funct3, UInt<3>("h5")) @[ALUControl.scala 39:57]
    node _isSRAI_T_2 = and(_isSRAI_T, _isSRAI_T_1) @[ALUControl.scala 39:44]
    node _isSRAI_T_3 = bits(io_inst, 31, 25) @[ALUControl.scala 39:80]
    node _isSRAI_T_4 = eq(_isSRAI_T_3, UInt<6>("h20")) @[ALUControl.scala 39:88]
    node isSRAI = and(_isSRAI_T_2, _isSRAI_T_4) @[ALUControl.scala 39:70]
    node _isADDpath_T = eq(io_opcode, UInt<2>("h3")) @[ALUControl.scala 43:15]
    node _isADDpath_T_1 = eq(io_opcode, UInt<6>("h23")) @[ALUControl.scala 44:15]
    node _isADDpath_T_2 = or(_isADDpath_T, _isADDpath_T_1) @[ALUControl.scala 43:32]
    node _isADDpath_T_3 = eq(io_opcode, UInt<7>("h67")) @[ALUControl.scala 45:15]
    node _isADDpath_T_4 = or(_isADDpath_T_2, _isADDpath_T_3) @[ALUControl.scala 44:32]
    node _isADDpath_T_5 = eq(io_opcode, UInt<5>("h17")) @[ALUControl.scala 46:15]
    node isADDpath = or(_isADDpath_T_4, _isADDpath_T_5) @[ALUControl.scala 45:32]
    node isSUBpath = eq(io_opcode, UInt<7>("h63")) @[ALUControl.scala 49:29]
    node _io_aluCtrl_T = or(isADD, isADDI) @[ALUControl.scala 53:13]
    node _io_aluCtrl_T_1 = or(_io_aluCtrl_T, isADDpath) @[ALUControl.scala 53:24]
    node _io_aluCtrl_T_2 = or(isSUB, isSUBpath) @[ALUControl.scala 54:13]
    node _io_aluCtrl_T_3 = or(isAND, isANDI) @[ALUControl.scala 55:13]
    node _io_aluCtrl_T_4 = or(isOR, isORI) @[ALUControl.scala 56:13]
    node _io_aluCtrl_T_5 = or(isXOR, isXORI) @[ALUControl.scala 57:13]
    node _io_aluCtrl_T_6 = or(isSLL, isSLLI) @[ALUControl.scala 58:13]
    node _io_aluCtrl_T_7 = or(isSRL, isSRLI) @[ALUControl.scala 59:13]
    node _io_aluCtrl_T_8 = or(isSRA, isSRAI) @[ALUControl.scala 60:13]
    node _io_aluCtrl_T_9 = or(isSLT, isSLTI) @[ALUControl.scala 61:13]
    node _io_aluCtrl_T_10 = or(isSLTU, isSLTIU) @[ALUControl.scala 62:13]
    node _io_aluCtrl_T_11 = mux(_io_aluCtrl_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_12 = mux(_io_aluCtrl_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_13 = mux(_io_aluCtrl_T_3, UInt<2>("h2"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_14 = mux(_io_aluCtrl_T_4, UInt<2>("h3"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_15 = mux(_io_aluCtrl_T_5, UInt<3>("h4"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_16 = mux(_io_aluCtrl_T_6, UInt<3>("h5"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_17 = mux(_io_aluCtrl_T_7, UInt<3>("h6"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_18 = mux(_io_aluCtrl_T_8, UInt<3>("h7"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_19 = mux(_io_aluCtrl_T_9, UInt<4>("h8"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_20 = mux(_io_aluCtrl_T_10, UInt<4>("h9"), UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_21 = or(_io_aluCtrl_T_11, _io_aluCtrl_T_12) @[Mux.scala 27:72]
    node _io_aluCtrl_T_22 = or(_io_aluCtrl_T_21, _io_aluCtrl_T_13) @[Mux.scala 27:72]
    node _io_aluCtrl_T_23 = or(_io_aluCtrl_T_22, _io_aluCtrl_T_14) @[Mux.scala 27:72]
    node _io_aluCtrl_T_24 = or(_io_aluCtrl_T_23, _io_aluCtrl_T_15) @[Mux.scala 27:72]
    node _io_aluCtrl_T_25 = or(_io_aluCtrl_T_24, _io_aluCtrl_T_16) @[Mux.scala 27:72]
    node _io_aluCtrl_T_26 = or(_io_aluCtrl_T_25, _io_aluCtrl_T_17) @[Mux.scala 27:72]
    node _io_aluCtrl_T_27 = or(_io_aluCtrl_T_26, _io_aluCtrl_T_18) @[Mux.scala 27:72]
    node _io_aluCtrl_T_28 = or(_io_aluCtrl_T_27, _io_aluCtrl_T_19) @[Mux.scala 27:72]
    node _io_aluCtrl_T_29 = or(_io_aluCtrl_T_28, _io_aluCtrl_T_20) @[Mux.scala 27:72]
    node _io_aluCtrl_WIRE = _io_aluCtrl_T_29 @[Mux.scala 27:72 Mux.scala 27:72]
    io_aluCtrl <= _io_aluCtrl_WIRE @[ALUControl.scala 52:14]

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

  module DataMem :
    input clock : Clock
    input reset : UInt<1>
    input io_address : UInt<2>
    input io_writeData : UInt<32>
    input io_memWrite : UInt<1>
    input io_memRead : UInt<1>
    output io_readData : UInt<32>

    mem mem : @[DataMem.scala 14:24]
      data-type => UInt<32>
      depth => 4
      read-latency => 1
      write-latency => 1
      reader => rdata
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(io_memWrite, io_address) @[DataMem.scala 17:21]
    node _GEN_1 = validif(io_memWrite, clock) @[DataMem.scala 17:21]
    node _GEN_2 = mux(io_memWrite, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 17:21 DataMem.scala 14:24]
    node _GEN_3 = validif(io_memWrite, UInt<1>("h1")) @[DataMem.scala 17:21]
    node _GEN_4 = validif(io_memWrite, io_writeData) @[DataMem.scala 17:21]
    node _GEN_5 = validif(io_memRead, io_address) @[DataMem.scala 22:23 DataMem.scala 22:23]
    node _rdata_WIRE = _GEN_5 @[DataMem.scala 22:23]
    node _rdata_T = or(_rdata_WIRE, UInt<2>("h0")) @[DataMem.scala 22:23]
    node _rdata_T_1 = bits(_rdata_T, 1, 0) @[DataMem.scala 22:23]
    node _GEN_6 = mux(io_memRead, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 22:23 DataMem.scala 22:23 DataMem.scala 14:24]
    node _GEN_7 = validif(io_memRead, _rdata_T_1) @[DataMem.scala 22:23 DataMem.scala 22:23]
    node _GEN_8 = validif(io_memRead, clock) @[DataMem.scala 22:23 DataMem.scala 22:23]
    io_readData <= mem.rdata.data @[DataMem.scala 23:15]
    mem.rdata.addr <= _GEN_7
    mem.rdata.en <= _GEN_6
    mem.rdata.clk <= _GEN_8
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3

  module Main :
    input clock : Clock
    input reset : UInt<1>
    output io_pcOut : UInt<32>
    output io_instOut : UInt<32>
    output io_dmemOut : UInt<32>

    inst imem of InsMem @[Main.scala 18:20]
    inst dec of InsDec @[Main.scala 24:20]
    inst ctrl of ContDec @[Main.scala 27:20]
    inst tdec of TypeDec @[Main.scala 30:20]
    inst imm of ImmGen @[Main.scala 33:19]
    inst rf of register @[Main.scala 38:18]
    inst aluCtrl of ALUControl @[Main.scala 46:23]
    inst alu of ALU @[Main.scala 52:19]
    inst br of ALU_Branch @[Main.scala 58:18]
    inst dmem of DataMem @[Main.scala 87:20]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[Main.scala 13:19]
    node _pcPlus4_T = add(pc, UInt<3>("h4")) @[Main.scala 14:20]
    node pcPlus4 = tail(_pcPlus4_T, 1) @[Main.scala 14:20]
    node _alu_io_b_T = mux(ctrl.io_ALUSrc, imm.io_imm, rf.io_readData2) @[Main.scala 54:18]
    node _branchTaken_T = eq(alu.io_out, UInt<1>("h0")) @[Main.scala 65:24]
    node _branchTaken_T_1 = neq(alu.io_out, UInt<1>("h0")) @[Main.scala 66:24]
    node _branchTaken_T_2 = asSInt(rf.io_readData1) @[Main.scala 67:29]
    node _branchTaken_T_3 = asSInt(rf.io_readData2) @[Main.scala 67:55]
    node _branchTaken_T_4 = lt(_branchTaken_T_2, _branchTaken_T_3) @[Main.scala 67:36]
    node _branchTaken_T_5 = asSInt(rf.io_readData1) @[Main.scala 68:29]
    node _branchTaken_T_6 = asSInt(rf.io_readData2) @[Main.scala 68:55]
    node _branchTaken_T_7 = geq(_branchTaken_T_5, _branchTaken_T_6) @[Main.scala 68:36]
    node _branchTaken_T_8 = lt(rf.io_readData1, rf.io_readData2) @[Main.scala 69:29]
    node _branchTaken_T_9 = geq(rf.io_readData1, rf.io_readData2) @[Main.scala 70:29]
    node _branchTaken_T_10 = eq(UInt<1>("h1"), br.io_branchCtrl) @[Mux.scala 80:60]
    node _branchTaken_T_11 = mux(_branchTaken_T_10, _branchTaken_T, UInt<1>("h0")) @[Mux.scala 80:57]
    node _branchTaken_T_12 = eq(UInt<2>("h2"), br.io_branchCtrl) @[Mux.scala 80:60]
    node _branchTaken_T_13 = mux(_branchTaken_T_12, _branchTaken_T_1, _branchTaken_T_11) @[Mux.scala 80:57]
    node _branchTaken_T_14 = eq(UInt<2>("h3"), br.io_branchCtrl) @[Mux.scala 80:60]
    node _branchTaken_T_15 = mux(_branchTaken_T_14, _branchTaken_T_4, _branchTaken_T_13) @[Mux.scala 80:57]
    node _branchTaken_T_16 = eq(UInt<3>("h4"), br.io_branchCtrl) @[Mux.scala 80:60]
    node _branchTaken_T_17 = mux(_branchTaken_T_16, _branchTaken_T_7, _branchTaken_T_15) @[Mux.scala 80:57]
    node _branchTaken_T_18 = eq(UInt<3>("h5"), br.io_branchCtrl) @[Mux.scala 80:60]
    node _branchTaken_T_19 = mux(_branchTaken_T_18, _branchTaken_T_8, _branchTaken_T_17) @[Mux.scala 80:57]
    node _branchTaken_T_20 = eq(UInt<3>("h6"), br.io_branchCtrl) @[Mux.scala 80:60]
    node branchTaken = mux(_branchTaken_T_20, _branchTaken_T_9, _branchTaken_T_19) @[Mux.scala 80:57]
    node _branchTarget_T = add(pc, imm.io_imm) @[Main.scala 73:25]
    node branchTarget = tail(_branchTarget_T, 1) @[Main.scala 73:25]
    node _jalTarget_T = add(pc, imm.io_imm) @[Main.scala 74:25]
    node jalTarget = tail(_jalTarget_T, 1) @[Main.scala 74:25]
    node _jalrTarget_T = add(rf.io_readData1, imm.io_imm) @[Main.scala 75:39]
    node _jalrTarget_T_1 = tail(_jalrTarget_T, 1) @[Main.scala 75:39]
    node _jalrTarget_T_2 = not(UInt<32>("h1")) @[Main.scala 75:56]
    node jalrTarget = and(_jalrTarget_T_1, _jalrTarget_T_2) @[Main.scala 75:53]
    node _nextPC_T = and(ctrl.io_Branch, branchTaken) @[Main.scala 79:21]
    node _nextPC_T_1 = eq(dec.io_opcode, UInt<7>("h67")) @[Main.scala 80:20]
    node _nextPC_T_2 = eq(dec.io_opcode, UInt<7>("h6f")) @[Main.scala 81:20]
    node _nextPC_T_3 = mux(_nextPC_T_2, jalTarget, pcPlus4) @[Mux.scala 98:16]
    node _nextPC_T_4 = mux(_nextPC_T_1, jalrTarget, _nextPC_T_3) @[Mux.scala 98:16]
    node nextPC = mux(_nextPC_T, branchTarget, _nextPC_T_4) @[Mux.scala 98:16]
    node _rf_io_writeData_T = mux(ctrl.io_MemToReg, dmem.io_readData, alu.io_out) @[Main.scala 97:33]
    node _rf_io_writeData_T_1 = mux(ctrl.io_Jump, pcPlus4, _rf_io_writeData_T) @[Mux.scala 98:16]
    io_pcOut <= pc @[Main.scala 15:12]
    io_instOut <= imem.io_inst @[Main.scala 21:14]
    io_dmemOut <= dmem.io_readData @[Main.scala 93:14]
    pc <= mux(reset, UInt<32>("h0"), nextPC) @[Main.scala 13:19 Main.scala 13:19 Main.scala 84:6]
    imem.clock <= clock
    imem.reset <= reset
    imem.io_pc <= pc @[Main.scala 19:14]
    dec.clock <= clock
    dec.reset <= reset
    dec.io_inst <= imem.io_inst @[Main.scala 25:15]
    ctrl.clock <= clock
    ctrl.reset <= reset
    ctrl.io_opcode <= dec.io_opcode @[Main.scala 28:18]
    tdec.clock <= clock
    tdec.reset <= reset
    tdec.io_opcode <= dec.io_opcode @[Main.scala 31:18]
    imm.clock <= clock
    imm.reset <= reset
    imm.io_inst <= imem.io_inst @[Main.scala 34:15]
    imm.io_sel <= tdec.io_immSel @[Main.scala 35:14]
    rf.clock <= clock
    rf.reset <= reset
    rf.io_clr <= UInt<1>("h0") @[Main.scala 39:13]
    rf.io_readReg1 <= dec.io_rs1 @[Main.scala 40:18]
    rf.io_readReg2 <= dec.io_rs2 @[Main.scala 41:18]
    rf.io_writeReg <= dec.io_rd @[Main.scala 42:18]
    rf.io_writeData <= _rf_io_writeData_T_1 @[Main.scala 97:19]
    rf.io_regWrite <= ctrl.io_RegWrite @[Main.scala 43:18]
    aluCtrl.clock <= clock
    aluCtrl.reset <= reset
    aluCtrl.io_inst <= imem.io_inst @[Main.scala 50:21]
    aluCtrl.io_opcode <= dec.io_opcode @[Main.scala 47:21]
    aluCtrl.io_funct3 <= dec.io_funct3 @[Main.scala 48:21]
    aluCtrl.io_funct7 <= dec.io_funct7 @[Main.scala 49:21]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_a <= rf.io_readData1 @[Main.scala 53:12]
    alu.io_b <= _alu_io_b_T @[Main.scala 54:12]
    alu.io_aluCtrl <= aluCtrl.io_aluCtrl @[Main.scala 55:18]
    br.clock <= clock
    br.reset <= reset
    br.io_opcode <= dec.io_opcode @[Main.scala 59:16]
    br.io_funct3 <= dec.io_funct3 @[Main.scala 60:16]
    dmem.clock <= clock
    dmem.reset <= reset
    dmem.io_address <= bits(alu.io_out, 1, 0) @[Main.scala 88:21]
    dmem.io_writeData <= rf.io_readData2 @[Main.scala 89:21]
    dmem.io_memWrite <= ctrl.io_MemWrite @[Main.scala 90:21]
    dmem.io_memRead <= ctrl.io_MemRead @[Main.scala 91:21]
