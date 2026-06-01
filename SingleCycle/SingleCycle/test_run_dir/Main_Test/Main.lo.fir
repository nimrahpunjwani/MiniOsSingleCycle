circuit Main :
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
    node _T_3 = eq(UInt<6>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<5>("h17"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<6>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 68:16 TypeDec.scala 30:12]
    node _GEN_1 = mux(_T_7, UInt<3>("h5"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 69:17 TypeDec.scala 36:13]
    node _GEN_2 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 64:14 TypeDec.scala 31:12]
    node _GEN_3 = mux(_T_6, UInt<3>("h4"), _GEN_1) @[Conditional.scala 39:67 TypeDec.scala 65:17]
    node _GEN_4 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_5 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 60:16 TypeDec.scala 29:12]
    node _GEN_6 = mux(_T_5, UInt<3>("h4"), _GEN_3) @[Conditional.scala 39:67 TypeDec.scala 61:17]
    node _GEN_7 = mux(_T_5, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_8 = mux(_T_5, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_9 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 56:16 TypeDec.scala 28:12]
    node _GEN_10 = mux(_T_4, UInt<2>("h3"), _GEN_6) @[Conditional.scala 39:67 TypeDec.scala 57:17]
    node _GEN_11 = mux(_T_4, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_12 = mux(_T_4, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_13 = mux(_T_4, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_14 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 52:16 TypeDec.scala 27:12]
    node _GEN_15 = mux(_T_3, UInt<2>("h2"), _GEN_10) @[Conditional.scala 39:67 TypeDec.scala 53:17]
    node _GEN_16 = mux(_T_3, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_17 = mux(_T_3, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_18 = mux(_T_3, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_19 = mux(_T_3, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_20 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 48:16 TypeDec.scala 26:12]
    node _GEN_21 = mux(_T_2, UInt<1>("h1"), _GEN_15) @[Conditional.scala 39:67 TypeDec.scala 49:17]
    node _GEN_22 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_23 = mux(_T_2, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_24 = mux(_T_2, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_25 = mux(_T_2, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_26 = mux(_T_2, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_27 = mux(_T_1, UInt<1>("h1"), _GEN_20) @[Conditional.scala 39:67 TypeDec.scala 44:16]
    node _GEN_28 = mux(_T_1, UInt<1>("h1"), _GEN_21) @[Conditional.scala 39:67 TypeDec.scala 45:17]
    node _GEN_29 = mux(_T_1, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_30 = mux(_T_1, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_31 = mux(_T_1, UInt<1>("h0"), _GEN_24) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_32 = mux(_T_1, UInt<1>("h0"), _GEN_25) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_33 = mux(_T_1, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_34 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 TypeDec.scala 40:16 TypeDec.scala 25:12]
    node _GEN_35 = mux(_T, UInt<1>("h0"), _GEN_28) @[Conditional.scala 40:58 TypeDec.scala 41:17]
    node _GEN_36 = mux(_T, UInt<1>("h0"), _GEN_27) @[Conditional.scala 40:58 TypeDec.scala 26:12]
    node _GEN_37 = mux(_T, UInt<1>("h0"), _GEN_29) @[Conditional.scala 40:58 TypeDec.scala 27:12]
    node _GEN_38 = mux(_T, UInt<1>("h0"), _GEN_30) @[Conditional.scala 40:58 TypeDec.scala 28:12]
    node _GEN_39 = mux(_T, UInt<1>("h0"), _GEN_31) @[Conditional.scala 40:58 TypeDec.scala 29:12]
    node _GEN_40 = mux(_T, UInt<1>("h0"), _GEN_32) @[Conditional.scala 40:58 TypeDec.scala 31:12]
    node _GEN_41 = mux(_T, UInt<1>("h0"), _GEN_33) @[Conditional.scala 40:58 TypeDec.scala 30:12]
    node _io_T0_T = bits(io_immSel, 0, 0) @[TypeDec.scala 74:21]
    node _io_T1_T = bits(io_immSel, 1, 1) @[TypeDec.scala 75:21]
    node _io_T2_T = bits(io_immSel, 2, 2) @[TypeDec.scala 76:21]
    io_rType <= _GEN_34
    io_iType <= _GEN_36
    io_sType <= _GEN_37
    io_bType <= _GEN_38
    io_auipc <= _GEN_39
    io_jType <= _GEN_41
    io_lui <= _GEN_40
    io_T0 <= _io_T0_T @[TypeDec.scala 74:9]
    io_T1 <= _io_T1_T @[TypeDec.scala 75:9]
    io_T2 <= _io_T2_T @[TypeDec.scala 76:9]
    io_immSel <= _GEN_35

  module ImmGen :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    input io_sel : UInt<3>
    output io_imm : UInt<32>

    node _immI_T = bits(io_inst, 31, 31) @[ImmGen.scala 12:34]
    node _immI_T_1 = bits(_immI_T, 0, 0) @[Bitwise.scala 72:15]
    node immI_hi = mux(_immI_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node immI_lo = bits(io_inst, 31, 20) @[ImmGen.scala 12:48]
    node immI = cat(immI_hi, immI_lo) @[Cat.scala 30:58]
    node _immS_T = bits(io_inst, 31, 31) @[ImmGen.scala 13:34]
    node _immS_T_1 = bits(_immS_T, 0, 0) @[Bitwise.scala 72:15]
    node immS_hi_hi = mux(_immS_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node immS_hi_lo = bits(io_inst, 31, 25) @[ImmGen.scala 13:48]
    node immS_lo = bits(io_inst, 11, 7) @[ImmGen.scala 13:64]
    node immS_hi = cat(immS_hi_hi, immS_hi_lo) @[Cat.scala 30:58]
    node immS = cat(immS_hi, immS_lo) @[Cat.scala 30:58]
    node _immB_T = bits(io_inst, 31, 31) @[ImmGen.scala 14:34]
    node _immB_T_1 = bits(_immB_T, 0, 0) @[Bitwise.scala 72:15]
    node immB_hi_hi_hi = mux(_immB_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node immB_hi_hi_lo = bits(io_inst, 31, 31) @[ImmGen.scala 14:48]
    node immB_hi_lo = bits(io_inst, 7, 7) @[ImmGen.scala 14:61]
    node immB_lo_hi_hi = bits(io_inst, 30, 25) @[ImmGen.scala 14:73]
    node immB_lo_hi_lo = bits(io_inst, 11, 8) @[ImmGen.scala 14:89]
    node immB_lo_hi = cat(immB_lo_hi_hi, immB_lo_hi_lo) @[Cat.scala 30:58]
    node immB_lo = cat(immB_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node immB_hi_hi = cat(immB_hi_hi_hi, immB_hi_hi_lo) @[Cat.scala 30:58]
    node immB_hi = cat(immB_hi_hi, immB_hi_lo) @[Cat.scala 30:58]
    node immB = cat(immB_hi, immB_lo) @[Cat.scala 30:58]
    node _immU_T = bits(io_inst, 31, 12) @[ImmGen.scala 17:22]
    node immU = shl(_immU_T, 12) @[ImmGen.scala 17:30]
    node _immJ_T = bits(io_inst, 31, 31) @[ImmGen.scala 19:34]
    node _immJ_T_1 = bits(_immJ_T, 0, 0) @[Bitwise.scala 72:15]
    node immJ_hi_hi_hi = mux(_immJ_T_1, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node immJ_hi_hi_lo = bits(io_inst, 31, 31) @[ImmGen.scala 19:48]
    node immJ_hi_lo = bits(io_inst, 19, 12) @[ImmGen.scala 19:61]
    node immJ_lo_hi_hi = bits(io_inst, 20, 20) @[ImmGen.scala 19:77]
    node immJ_lo_hi_lo = bits(io_inst, 30, 21) @[ImmGen.scala 19:90]
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
    io_imm <= _io_imm_T_9 @[ImmGen.scala 21:10]

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
    node _T = neq(io_writeReg, UInt<1>("h0")) @[register.scala 26:41]
    node _T_1 = and(io_regWrite, _T) @[register.scala 26:26]
    node _regs_io_writeReg = io_writeData @[register.scala 27:23 register.scala 27:23]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_writeReg), _regs_io_writeReg, UInt<1>("h0")) @[register.scala 27:23 register.scala 27:23 register.scala 20:11]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_writeReg), _regs_io_writeReg, regs_1) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_writeReg), _regs_io_writeReg, regs_2) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_writeReg), _regs_io_writeReg, regs_3) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_writeReg), _regs_io_writeReg, regs_4) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_writeReg), _regs_io_writeReg, regs_5) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_writeReg), _regs_io_writeReg, regs_6) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_writeReg), _regs_io_writeReg, regs_7) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_writeReg), _regs_io_writeReg, regs_8) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_writeReg), _regs_io_writeReg, regs_9) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_writeReg), _regs_io_writeReg, regs_10) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_writeReg), _regs_io_writeReg, regs_11) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_writeReg), _regs_io_writeReg, regs_12) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_writeReg), _regs_io_writeReg, regs_13) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_writeReg), _regs_io_writeReg, regs_14) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_writeReg), _regs_io_writeReg, regs_15) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_writeReg), _regs_io_writeReg, regs_16) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_writeReg), _regs_io_writeReg, regs_17) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_writeReg), _regs_io_writeReg, regs_18) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_writeReg), _regs_io_writeReg, regs_19) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_writeReg), _regs_io_writeReg, regs_20) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_writeReg), _regs_io_writeReg, regs_21) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_writeReg), _regs_io_writeReg, regs_22) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_writeReg), _regs_io_writeReg, regs_23) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_writeReg), _regs_io_writeReg, regs_24) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_writeReg), _regs_io_writeReg, regs_25) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_writeReg), _regs_io_writeReg, regs_26) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_writeReg), _regs_io_writeReg, regs_27) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_writeReg), _regs_io_writeReg, regs_28) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_writeReg), _regs_io_writeReg, regs_29) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_writeReg), _regs_io_writeReg, regs_30) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_writeReg), _regs_io_writeReg, regs_31) @[register.scala 27:23 register.scala 27:23 register.scala 18:21]
    node _GEN_32 = mux(_T_1, _GEN_0, UInt<1>("h0")) @[register.scala 26:50 register.scala 20:11]
    node _GEN_33 = mux(_T_1, _GEN_1, regs_1) @[register.scala 26:50 register.scala 18:21]
    node _GEN_34 = mux(_T_1, _GEN_2, regs_2) @[register.scala 26:50 register.scala 18:21]
    node _GEN_35 = mux(_T_1, _GEN_3, regs_3) @[register.scala 26:50 register.scala 18:21]
    node _GEN_36 = mux(_T_1, _GEN_4, regs_4) @[register.scala 26:50 register.scala 18:21]
    node _GEN_37 = mux(_T_1, _GEN_5, regs_5) @[register.scala 26:50 register.scala 18:21]
    node _GEN_38 = mux(_T_1, _GEN_6, regs_6) @[register.scala 26:50 register.scala 18:21]
    node _GEN_39 = mux(_T_1, _GEN_7, regs_7) @[register.scala 26:50 register.scala 18:21]
    node _GEN_40 = mux(_T_1, _GEN_8, regs_8) @[register.scala 26:50 register.scala 18:21]
    node _GEN_41 = mux(_T_1, _GEN_9, regs_9) @[register.scala 26:50 register.scala 18:21]
    node _GEN_42 = mux(_T_1, _GEN_10, regs_10) @[register.scala 26:50 register.scala 18:21]
    node _GEN_43 = mux(_T_1, _GEN_11, regs_11) @[register.scala 26:50 register.scala 18:21]
    node _GEN_44 = mux(_T_1, _GEN_12, regs_12) @[register.scala 26:50 register.scala 18:21]
    node _GEN_45 = mux(_T_1, _GEN_13, regs_13) @[register.scala 26:50 register.scala 18:21]
    node _GEN_46 = mux(_T_1, _GEN_14, regs_14) @[register.scala 26:50 register.scala 18:21]
    node _GEN_47 = mux(_T_1, _GEN_15, regs_15) @[register.scala 26:50 register.scala 18:21]
    node _GEN_48 = mux(_T_1, _GEN_16, regs_16) @[register.scala 26:50 register.scala 18:21]
    node _GEN_49 = mux(_T_1, _GEN_17, regs_17) @[register.scala 26:50 register.scala 18:21]
    node _GEN_50 = mux(_T_1, _GEN_18, regs_18) @[register.scala 26:50 register.scala 18:21]
    node _GEN_51 = mux(_T_1, _GEN_19, regs_19) @[register.scala 26:50 register.scala 18:21]
    node _GEN_52 = mux(_T_1, _GEN_20, regs_20) @[register.scala 26:50 register.scala 18:21]
    node _GEN_53 = mux(_T_1, _GEN_21, regs_21) @[register.scala 26:50 register.scala 18:21]
    node _GEN_54 = mux(_T_1, _GEN_22, regs_22) @[register.scala 26:50 register.scala 18:21]
    node _GEN_55 = mux(_T_1, _GEN_23, regs_23) @[register.scala 26:50 register.scala 18:21]
    node _GEN_56 = mux(_T_1, _GEN_24, regs_24) @[register.scala 26:50 register.scala 18:21]
    node _GEN_57 = mux(_T_1, _GEN_25, regs_25) @[register.scala 26:50 register.scala 18:21]
    node _GEN_58 = mux(_T_1, _GEN_26, regs_26) @[register.scala 26:50 register.scala 18:21]
    node _GEN_59 = mux(_T_1, _GEN_27, regs_27) @[register.scala 26:50 register.scala 18:21]
    node _GEN_60 = mux(_T_1, _GEN_28, regs_28) @[register.scala 26:50 register.scala 18:21]
    node _GEN_61 = mux(_T_1, _GEN_29, regs_29) @[register.scala 26:50 register.scala 18:21]
    node _GEN_62 = mux(_T_1, _GEN_30, regs_30) @[register.scala 26:50 register.scala 18:21]
    node _GEN_63 = mux(_T_1, _GEN_31, regs_31) @[register.scala 26:50 register.scala 18:21]
    node _GEN_64 = mux(io_clr, UInt<1>("h0"), _GEN_33) @[register.scala 22:16 register.scala 24:15]
    node _GEN_65 = mux(io_clr, UInt<1>("h0"), _GEN_34) @[register.scala 22:16 register.scala 24:15]
    node _GEN_66 = mux(io_clr, UInt<1>("h0"), _GEN_35) @[register.scala 22:16 register.scala 24:15]
    node _GEN_67 = mux(io_clr, UInt<1>("h0"), _GEN_36) @[register.scala 22:16 register.scala 24:15]
    node _GEN_68 = mux(io_clr, UInt<1>("h0"), _GEN_37) @[register.scala 22:16 register.scala 24:15]
    node _GEN_69 = mux(io_clr, UInt<1>("h0"), _GEN_38) @[register.scala 22:16 register.scala 24:15]
    node _GEN_70 = mux(io_clr, UInt<1>("h0"), _GEN_39) @[register.scala 22:16 register.scala 24:15]
    node _GEN_71 = mux(io_clr, UInt<1>("h0"), _GEN_40) @[register.scala 22:16 register.scala 24:15]
    node _GEN_72 = mux(io_clr, UInt<1>("h0"), _GEN_41) @[register.scala 22:16 register.scala 24:15]
    node _GEN_73 = mux(io_clr, UInt<1>("h0"), _GEN_42) @[register.scala 22:16 register.scala 24:15]
    node _GEN_74 = mux(io_clr, UInt<1>("h0"), _GEN_43) @[register.scala 22:16 register.scala 24:15]
    node _GEN_75 = mux(io_clr, UInt<1>("h0"), _GEN_44) @[register.scala 22:16 register.scala 24:15]
    node _GEN_76 = mux(io_clr, UInt<1>("h0"), _GEN_45) @[register.scala 22:16 register.scala 24:15]
    node _GEN_77 = mux(io_clr, UInt<1>("h0"), _GEN_46) @[register.scala 22:16 register.scala 24:15]
    node _GEN_78 = mux(io_clr, UInt<1>("h0"), _GEN_47) @[register.scala 22:16 register.scala 24:15]
    node _GEN_79 = mux(io_clr, UInt<1>("h0"), _GEN_48) @[register.scala 22:16 register.scala 24:15]
    node _GEN_80 = mux(io_clr, UInt<1>("h0"), _GEN_49) @[register.scala 22:16 register.scala 24:15]
    node _GEN_81 = mux(io_clr, UInt<1>("h0"), _GEN_50) @[register.scala 22:16 register.scala 24:15]
    node _GEN_82 = mux(io_clr, UInt<1>("h0"), _GEN_51) @[register.scala 22:16 register.scala 24:15]
    node _GEN_83 = mux(io_clr, UInt<1>("h0"), _GEN_52) @[register.scala 22:16 register.scala 24:15]
    node _GEN_84 = mux(io_clr, UInt<1>("h0"), _GEN_53) @[register.scala 22:16 register.scala 24:15]
    node _GEN_85 = mux(io_clr, UInt<1>("h0"), _GEN_54) @[register.scala 22:16 register.scala 24:15]
    node _GEN_86 = mux(io_clr, UInt<1>("h0"), _GEN_55) @[register.scala 22:16 register.scala 24:15]
    node _GEN_87 = mux(io_clr, UInt<1>("h0"), _GEN_56) @[register.scala 22:16 register.scala 24:15]
    node _GEN_88 = mux(io_clr, UInt<1>("h0"), _GEN_57) @[register.scala 22:16 register.scala 24:15]
    node _GEN_89 = mux(io_clr, UInt<1>("h0"), _GEN_58) @[register.scala 22:16 register.scala 24:15]
    node _GEN_90 = mux(io_clr, UInt<1>("h0"), _GEN_59) @[register.scala 22:16 register.scala 24:15]
    node _GEN_91 = mux(io_clr, UInt<1>("h0"), _GEN_60) @[register.scala 22:16 register.scala 24:15]
    node _GEN_92 = mux(io_clr, UInt<1>("h0"), _GEN_61) @[register.scala 22:16 register.scala 24:15]
    node _GEN_93 = mux(io_clr, UInt<1>("h0"), _GEN_62) @[register.scala 22:16 register.scala 24:15]
    node _GEN_94 = mux(io_clr, UInt<1>("h0"), _GEN_63) @[register.scala 22:16 register.scala 24:15]
    node _GEN_95 = mux(io_clr, UInt<1>("h0"), _GEN_32) @[register.scala 22:16 register.scala 20:11]
    node _GEN_96 = validif(eq(UInt<1>("h0"), io_readReg1), regs_0) @[register.scala 30:16 register.scala 30:16]
    node _GEN_97 = mux(eq(UInt<1>("h1"), io_readReg1), regs_1, _GEN_96) @[register.scala 30:16 register.scala 30:16]
    node _GEN_98 = mux(eq(UInt<2>("h2"), io_readReg1), regs_2, _GEN_97) @[register.scala 30:16 register.scala 30:16]
    node _GEN_99 = mux(eq(UInt<2>("h3"), io_readReg1), regs_3, _GEN_98) @[register.scala 30:16 register.scala 30:16]
    node _GEN_100 = mux(eq(UInt<3>("h4"), io_readReg1), regs_4, _GEN_99) @[register.scala 30:16 register.scala 30:16]
    node _GEN_101 = mux(eq(UInt<3>("h5"), io_readReg1), regs_5, _GEN_100) @[register.scala 30:16 register.scala 30:16]
    node _GEN_102 = mux(eq(UInt<3>("h6"), io_readReg1), regs_6, _GEN_101) @[register.scala 30:16 register.scala 30:16]
    node _GEN_103 = mux(eq(UInt<3>("h7"), io_readReg1), regs_7, _GEN_102) @[register.scala 30:16 register.scala 30:16]
    node _GEN_104 = mux(eq(UInt<4>("h8"), io_readReg1), regs_8, _GEN_103) @[register.scala 30:16 register.scala 30:16]
    node _GEN_105 = mux(eq(UInt<4>("h9"), io_readReg1), regs_9, _GEN_104) @[register.scala 30:16 register.scala 30:16]
    node _GEN_106 = mux(eq(UInt<4>("ha"), io_readReg1), regs_10, _GEN_105) @[register.scala 30:16 register.scala 30:16]
    node _GEN_107 = mux(eq(UInt<4>("hb"), io_readReg1), regs_11, _GEN_106) @[register.scala 30:16 register.scala 30:16]
    node _GEN_108 = mux(eq(UInt<4>("hc"), io_readReg1), regs_12, _GEN_107) @[register.scala 30:16 register.scala 30:16]
    node _GEN_109 = mux(eq(UInt<4>("hd"), io_readReg1), regs_13, _GEN_108) @[register.scala 30:16 register.scala 30:16]
    node _GEN_110 = mux(eq(UInt<4>("he"), io_readReg1), regs_14, _GEN_109) @[register.scala 30:16 register.scala 30:16]
    node _GEN_111 = mux(eq(UInt<4>("hf"), io_readReg1), regs_15, _GEN_110) @[register.scala 30:16 register.scala 30:16]
    node _GEN_112 = mux(eq(UInt<5>("h10"), io_readReg1), regs_16, _GEN_111) @[register.scala 30:16 register.scala 30:16]
    node _GEN_113 = mux(eq(UInt<5>("h11"), io_readReg1), regs_17, _GEN_112) @[register.scala 30:16 register.scala 30:16]
    node _GEN_114 = mux(eq(UInt<5>("h12"), io_readReg1), regs_18, _GEN_113) @[register.scala 30:16 register.scala 30:16]
    node _GEN_115 = mux(eq(UInt<5>("h13"), io_readReg1), regs_19, _GEN_114) @[register.scala 30:16 register.scala 30:16]
    node _GEN_116 = mux(eq(UInt<5>("h14"), io_readReg1), regs_20, _GEN_115) @[register.scala 30:16 register.scala 30:16]
    node _GEN_117 = mux(eq(UInt<5>("h15"), io_readReg1), regs_21, _GEN_116) @[register.scala 30:16 register.scala 30:16]
    node _GEN_118 = mux(eq(UInt<5>("h16"), io_readReg1), regs_22, _GEN_117) @[register.scala 30:16 register.scala 30:16]
    node _GEN_119 = mux(eq(UInt<5>("h17"), io_readReg1), regs_23, _GEN_118) @[register.scala 30:16 register.scala 30:16]
    node _GEN_120 = mux(eq(UInt<5>("h18"), io_readReg1), regs_24, _GEN_119) @[register.scala 30:16 register.scala 30:16]
    node _GEN_121 = mux(eq(UInt<5>("h19"), io_readReg1), regs_25, _GEN_120) @[register.scala 30:16 register.scala 30:16]
    node _GEN_122 = mux(eq(UInt<5>("h1a"), io_readReg1), regs_26, _GEN_121) @[register.scala 30:16 register.scala 30:16]
    node _GEN_123 = mux(eq(UInt<5>("h1b"), io_readReg1), regs_27, _GEN_122) @[register.scala 30:16 register.scala 30:16]
    node _GEN_124 = mux(eq(UInt<5>("h1c"), io_readReg1), regs_28, _GEN_123) @[register.scala 30:16 register.scala 30:16]
    node _GEN_125 = mux(eq(UInt<5>("h1d"), io_readReg1), regs_29, _GEN_124) @[register.scala 30:16 register.scala 30:16]
    node _GEN_126 = mux(eq(UInt<5>("h1e"), io_readReg1), regs_30, _GEN_125) @[register.scala 30:16 register.scala 30:16]
    node _GEN_127 = mux(eq(UInt<5>("h1f"), io_readReg1), regs_31, _GEN_126) @[register.scala 30:16 register.scala 30:16]
    node _GEN_128 = validif(eq(UInt<1>("h0"), io_readReg2), regs_0) @[register.scala 31:16 register.scala 31:16]
    node _GEN_129 = mux(eq(UInt<1>("h1"), io_readReg2), regs_1, _GEN_128) @[register.scala 31:16 register.scala 31:16]
    node _GEN_130 = mux(eq(UInt<2>("h2"), io_readReg2), regs_2, _GEN_129) @[register.scala 31:16 register.scala 31:16]
    node _GEN_131 = mux(eq(UInt<2>("h3"), io_readReg2), regs_3, _GEN_130) @[register.scala 31:16 register.scala 31:16]
    node _GEN_132 = mux(eq(UInt<3>("h4"), io_readReg2), regs_4, _GEN_131) @[register.scala 31:16 register.scala 31:16]
    node _GEN_133 = mux(eq(UInt<3>("h5"), io_readReg2), regs_5, _GEN_132) @[register.scala 31:16 register.scala 31:16]
    node _GEN_134 = mux(eq(UInt<3>("h6"), io_readReg2), regs_6, _GEN_133) @[register.scala 31:16 register.scala 31:16]
    node _GEN_135 = mux(eq(UInt<3>("h7"), io_readReg2), regs_7, _GEN_134) @[register.scala 31:16 register.scala 31:16]
    node _GEN_136 = mux(eq(UInt<4>("h8"), io_readReg2), regs_8, _GEN_135) @[register.scala 31:16 register.scala 31:16]
    node _GEN_137 = mux(eq(UInt<4>("h9"), io_readReg2), regs_9, _GEN_136) @[register.scala 31:16 register.scala 31:16]
    node _GEN_138 = mux(eq(UInt<4>("ha"), io_readReg2), regs_10, _GEN_137) @[register.scala 31:16 register.scala 31:16]
    node _GEN_139 = mux(eq(UInt<4>("hb"), io_readReg2), regs_11, _GEN_138) @[register.scala 31:16 register.scala 31:16]
    node _GEN_140 = mux(eq(UInt<4>("hc"), io_readReg2), regs_12, _GEN_139) @[register.scala 31:16 register.scala 31:16]
    node _GEN_141 = mux(eq(UInt<4>("hd"), io_readReg2), regs_13, _GEN_140) @[register.scala 31:16 register.scala 31:16]
    node _GEN_142 = mux(eq(UInt<4>("he"), io_readReg2), regs_14, _GEN_141) @[register.scala 31:16 register.scala 31:16]
    node _GEN_143 = mux(eq(UInt<4>("hf"), io_readReg2), regs_15, _GEN_142) @[register.scala 31:16 register.scala 31:16]
    node _GEN_144 = mux(eq(UInt<5>("h10"), io_readReg2), regs_16, _GEN_143) @[register.scala 31:16 register.scala 31:16]
    node _GEN_145 = mux(eq(UInt<5>("h11"), io_readReg2), regs_17, _GEN_144) @[register.scala 31:16 register.scala 31:16]
    node _GEN_146 = mux(eq(UInt<5>("h12"), io_readReg2), regs_18, _GEN_145) @[register.scala 31:16 register.scala 31:16]
    node _GEN_147 = mux(eq(UInt<5>("h13"), io_readReg2), regs_19, _GEN_146) @[register.scala 31:16 register.scala 31:16]
    node _GEN_148 = mux(eq(UInt<5>("h14"), io_readReg2), regs_20, _GEN_147) @[register.scala 31:16 register.scala 31:16]
    node _GEN_149 = mux(eq(UInt<5>("h15"), io_readReg2), regs_21, _GEN_148) @[register.scala 31:16 register.scala 31:16]
    node _GEN_150 = mux(eq(UInt<5>("h16"), io_readReg2), regs_22, _GEN_149) @[register.scala 31:16 register.scala 31:16]
    node _GEN_151 = mux(eq(UInt<5>("h17"), io_readReg2), regs_23, _GEN_150) @[register.scala 31:16 register.scala 31:16]
    node _GEN_152 = mux(eq(UInt<5>("h18"), io_readReg2), regs_24, _GEN_151) @[register.scala 31:16 register.scala 31:16]
    node _GEN_153 = mux(eq(UInt<5>("h19"), io_readReg2), regs_25, _GEN_152) @[register.scala 31:16 register.scala 31:16]
    node _GEN_154 = mux(eq(UInt<5>("h1a"), io_readReg2), regs_26, _GEN_153) @[register.scala 31:16 register.scala 31:16]
    node _GEN_155 = mux(eq(UInt<5>("h1b"), io_readReg2), regs_27, _GEN_154) @[register.scala 31:16 register.scala 31:16]
    node _GEN_156 = mux(eq(UInt<5>("h1c"), io_readReg2), regs_28, _GEN_155) @[register.scala 31:16 register.scala 31:16]
    node _GEN_157 = mux(eq(UInt<5>("h1d"), io_readReg2), regs_29, _GEN_156) @[register.scala 31:16 register.scala 31:16]
    node _GEN_158 = mux(eq(UInt<5>("h1e"), io_readReg2), regs_30, _GEN_157) @[register.scala 31:16 register.scala 31:16]
    node _GEN_159 = mux(eq(UInt<5>("h1f"), io_readReg2), regs_31, _GEN_158) @[register.scala 31:16 register.scala 31:16]
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
    node _regs_io_readReg1 = _GEN_127 @[register.scala 30:16]
    node _regs_io_readReg2 = _GEN_159 @[register.scala 31:16]
    io_readData1 <= _regs_io_readReg1 @[register.scala 30:16]
    io_readData2 <= _regs_io_readReg2 @[register.scala 31:16]
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
    input io_opcode : UInt<7>
    input io_funct3 : UInt<3>
    input io_funct7 : UInt<7>
    output io_aluCtrl : UInt<4>

    node _T = eq(io_opcode, UInt<6>("h33")) @[ALUControl.scala 30:18]
    node _T_1 = eq(io_funct3, UInt<1>("h0")) @[ALUControl.scala 32:20]
    node _T_2 = eq(io_funct7, UInt<1>("h0")) @[ALUControl.scala 32:46]
    node _T_3 = and(_T_1, _T_2) @[ALUControl.scala 32:33]
    node _GEN_0 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[ALUControl.scala 32:64 ALUControl.scala 33:11 ALUControl.scala 23:8]
    node _T_4 = eq(io_funct3, UInt<1>("h0")) @[ALUControl.scala 37:20]
    node _T_5 = eq(io_funct7, UInt<6>("h20")) @[ALUControl.scala 37:46]
    node _T_6 = and(_T_4, _T_5) @[ALUControl.scala 37:33]
    node _GEN_1 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[ALUControl.scala 37:64 ALUControl.scala 38:11 ALUControl.scala 24:8]
    node _T_7 = eq(io_funct3, UInt<3>("h7")) @[ALUControl.scala 42:20]
    node _T_8 = eq(io_funct7, UInt<1>("h0")) @[ALUControl.scala 42:46]
    node _T_9 = and(_T_7, _T_8) @[ALUControl.scala 42:33]
    node _GEN_2 = mux(_T_9, UInt<1>("h1"), UInt<1>("h0")) @[ALUControl.scala 42:64 ALUControl.scala 43:12 ALUControl.scala 25:8]
    node _T_10 = eq(io_funct3, UInt<3>("h6")) @[ALUControl.scala 47:20]
    node _T_11 = eq(io_funct7, UInt<1>("h0")) @[ALUControl.scala 47:46]
    node _T_12 = and(_T_10, _T_11) @[ALUControl.scala 47:33]
    node _GEN_3 = mux(_T_12, UInt<1>("h1"), UInt<1>("h0")) @[ALUControl.scala 47:64 ALUControl.scala 48:11 ALUControl.scala 26:8]
    node _GEN_4 = mux(_T, _GEN_0, UInt<1>("h0")) @[ALUControl.scala 30:36 ALUControl.scala 23:8]
    node _GEN_5 = mux(_T, _GEN_1, UInt<1>("h0")) @[ALUControl.scala 30:36 ALUControl.scala 24:8]
    node _GEN_6 = mux(_T, _GEN_2, UInt<1>("h0")) @[ALUControl.scala 30:36 ALUControl.scala 25:8]
    node _GEN_7 = mux(_T, _GEN_3, UInt<1>("h0")) @[ALUControl.scala 30:36 ALUControl.scala 26:8]
    node add = _GEN_4 @[ALUControl.scala 17:18]
    node add4 = cat(UInt<3>("h0"), add) @[Cat.scala 30:58]
    node sub = _GEN_5 @[ALUControl.scala 18:18]
    node sub4 = cat(UInt<3>("h0"), sub) @[Cat.scala 30:58]
    node and_ = _GEN_6 @[ALUControl.scala 19:18]
    node and4 = cat(UInt<3>("h0"), and_) @[Cat.scala 30:58]
    node or_ = _GEN_7 @[ALUControl.scala 20:18]
    node or4 = cat(UInt<3>("h0"), or_) @[Cat.scala 30:58]
    node _io_aluCtrl_T = mux(add, add4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_1 = mux(sub, sub4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_2 = mux(and_, and4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_3 = mux(or_, or4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_aluCtrl_T_4 = or(_io_aluCtrl_T, _io_aluCtrl_T_1) @[Mux.scala 27:72]
    node _io_aluCtrl_T_5 = or(_io_aluCtrl_T_4, _io_aluCtrl_T_2) @[Mux.scala 27:72]
    node _io_aluCtrl_T_6 = or(_io_aluCtrl_T_5, _io_aluCtrl_T_3) @[Mux.scala 27:72]
    node _io_aluCtrl_WIRE = _io_aluCtrl_T_6 @[Mux.scala 27:72 Mux.scala 27:72]
    io_aluCtrl <= _io_aluCtrl_WIRE @[ALUControl.scala 59:14]

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<32>
    input io_b : UInt<32>
    input io_aluCtrl : UInt<4>
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

    node _T = eq(io_opcode, UInt<7>("h63")) @[ALU_Branch.scala 32:18]
    node _T_1 = eq(UInt<1>("h0"), io_funct3) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<1>("h1"), io_funct3) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h4"), io_funct3) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h5"), io_funct3) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<3>("h6"), io_funct3) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<3>("h7"), io_funct3) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ALU_Branch.scala 39:27 ALU_Branch.scala 29:8]
    node _GEN_1 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ALU_Branch.scala 38:27 ALU_Branch.scala 28:8]
    node _GEN_2 = mux(_T_5, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 ALU_Branch.scala 29:8]
    node _GEN_3 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ALU_Branch.scala 37:27 ALU_Branch.scala 27:8]
    node _GEN_4 = mux(_T_4, UInt<1>("h0"), _GEN_1) @[Conditional.scala 39:67 ALU_Branch.scala 28:8]
    node _GEN_5 = mux(_T_4, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 ALU_Branch.scala 29:8]
    node _GEN_6 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ALU_Branch.scala 36:27 ALU_Branch.scala 26:8]
    node _GEN_7 = mux(_T_3, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67 ALU_Branch.scala 27:8]
    node _GEN_8 = mux(_T_3, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 ALU_Branch.scala 28:8]
    node _GEN_9 = mux(_T_3, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 ALU_Branch.scala 29:8]
    node _GEN_10 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ALU_Branch.scala 35:27 ALU_Branch.scala 25:8]
    node _GEN_11 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67 ALU_Branch.scala 26:8]
    node _GEN_12 = mux(_T_2, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 ALU_Branch.scala 27:8]
    node _GEN_13 = mux(_T_2, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 ALU_Branch.scala 28:8]
    node _GEN_14 = mux(_T_2, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 ALU_Branch.scala 29:8]
    node _GEN_15 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 ALU_Branch.scala 34:27 ALU_Branch.scala 24:8]
    node _GEN_16 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[Conditional.scala 40:58 ALU_Branch.scala 25:8]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_11) @[Conditional.scala 40:58 ALU_Branch.scala 26:8]
    node _GEN_18 = mux(_T_1, UInt<1>("h0"), _GEN_12) @[Conditional.scala 40:58 ALU_Branch.scala 27:8]
    node _GEN_19 = mux(_T_1, UInt<1>("h0"), _GEN_13) @[Conditional.scala 40:58 ALU_Branch.scala 28:8]
    node _GEN_20 = mux(_T_1, UInt<1>("h0"), _GEN_14) @[Conditional.scala 40:58 ALU_Branch.scala 29:8]
    node _GEN_21 = mux(_T, _GEN_15, UInt<1>("h0")) @[ALU_Branch.scala 32:36 ALU_Branch.scala 24:8]
    node _GEN_22 = mux(_T, _GEN_16, UInt<1>("h0")) @[ALU_Branch.scala 32:36 ALU_Branch.scala 25:8]
    node _GEN_23 = mux(_T, _GEN_17, UInt<1>("h0")) @[ALU_Branch.scala 32:36 ALU_Branch.scala 26:8]
    node _GEN_24 = mux(_T, _GEN_18, UInt<1>("h0")) @[ALU_Branch.scala 32:36 ALU_Branch.scala 27:8]
    node _GEN_25 = mux(_T, _GEN_19, UInt<1>("h0")) @[ALU_Branch.scala 32:36 ALU_Branch.scala 28:8]
    node _GEN_26 = mux(_T, _GEN_20, UInt<1>("h0")) @[ALU_Branch.scala 32:36 ALU_Branch.scala 29:8]
    node beq = _GEN_21 @[ALU_Branch.scala 16:18]
    node beq4 = cat(UInt<3>("h0"), beq) @[Cat.scala 30:58]
    node bne = _GEN_22 @[ALU_Branch.scala 17:18]
    node bne4 = cat(UInt<3>("h0"), bne) @[Cat.scala 30:58]
    node blt = _GEN_23 @[ALU_Branch.scala 18:18]
    node blt4 = cat(UInt<3>("h0"), blt) @[Cat.scala 30:58]
    node bge = _GEN_24 @[ALU_Branch.scala 19:18]
    node bge4 = cat(UInt<3>("h0"), bge) @[Cat.scala 30:58]
    node bltu = _GEN_25 @[ALU_Branch.scala 20:18]
    node bltu4 = cat(UInt<3>("h0"), bltu) @[Cat.scala 30:58]
    node bgeu = _GEN_26 @[ALU_Branch.scala 21:18]
    node bgeu4 = cat(UInt<3>("h0"), bgeu) @[Cat.scala 30:58]
    node _io_branchCtrl_T = mux(beq, beq4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_branchCtrl_T_1 = mux(bne, bne4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_branchCtrl_T_2 = mux(blt, blt4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_branchCtrl_T_3 = mux(bge, bge4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_branchCtrl_T_4 = mux(bltu, bltu4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_branchCtrl_T_5 = mux(bgeu, bgeu4, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_branchCtrl_T_6 = or(_io_branchCtrl_T, _io_branchCtrl_T_1) @[Mux.scala 27:72]
    node _io_branchCtrl_T_7 = or(_io_branchCtrl_T_6, _io_branchCtrl_T_2) @[Mux.scala 27:72]
    node _io_branchCtrl_T_8 = or(_io_branchCtrl_T_7, _io_branchCtrl_T_3) @[Mux.scala 27:72]
    node _io_branchCtrl_T_9 = or(_io_branchCtrl_T_8, _io_branchCtrl_T_4) @[Mux.scala 27:72]
    node _io_branchCtrl_T_10 = or(_io_branchCtrl_T_9, _io_branchCtrl_T_5) @[Mux.scala 27:72]
    node _io_branchCtrl_WIRE = _io_branchCtrl_T_10 @[Mux.scala 27:72 Mux.scala 27:72]
    io_branchCtrl <= _io_branchCtrl_WIRE @[ALU_Branch.scala 52:17]

  module DataMem :
    input clock : Clock
    input reset : UInt<1>
    input io_address : UInt<2>
    input io_writeData : UInt<32>
    input io_memWrite : UInt<1>
    output io_readData : UInt<32>

    mem mem : @[DataMem.scala 14:16]
      data-type => UInt<32>
      depth => 4
      read-latency => 0
      write-latency => 1
      reader => readValue
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(io_memWrite, io_address) @[DataMem.scala 17:21]
    node _GEN_1 = validif(io_memWrite, clock) @[DataMem.scala 17:21]
    node _GEN_2 = mux(io_memWrite, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 17:21 DataMem.scala 14:16]
    node _GEN_3 = validif(io_memWrite, UInt<1>("h1")) @[DataMem.scala 17:21]
    node _GEN_4 = validif(io_memWrite, io_writeData) @[DataMem.scala 17:21]
    node _io_readData_T = mux(io_memWrite, UInt<1>("h0"), mem.readValue.data) @[DataMem.scala 25:21]
    io_readData <= _io_readData_T @[DataMem.scala 25:15]
    mem.readValue.addr <= io_address @[DataMem.scala 22:27]
    mem.readValue.en <= UInt<1>("h1") @[DataMem.scala 22:27]
    mem.readValue.clk <= clock @[DataMem.scala 22:27]
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3

  module Main :
    input clock : Clock
    input reset : UInt<1>
    input io_imemInst : UInt<32>
    output io_dmemOut : UInt<32>
    output io_pcOut : UInt<32>

    inst dec of InsDec @[Main.scala 22:19]
    inst ctrl of ContDec @[Main.scala 28:20]
    inst tdec of TypeDec @[Main.scala 34:20]
    inst imm of ImmGen @[Main.scala 37:19]
    inst rf of register @[Main.scala 44:18]
    inst aluCtrl of ALUControl @[Main.scala 54:23]
    inst alu of ALU @[Main.scala 59:19]
    inst br of ALU_Branch @[Main.scala 67:18]
    inst dmem of DataMem @[Main.scala 93:20]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[Main.scala 15:19]
    node _pcPlus4_T = add(pc, UInt<3>("h4")) @[Main.scala 17:20]
    node pcPlus4 = tail(_pcPlus4_T, 1) @[Main.scala 17:20]
    node _alu_io_b_T = mux(ctrl.io_ALUSrc, imm.io_imm, rf.io_readData2) @[Main.scala 61:18]
    node _branchTaken_T = eq(alu.io_out, UInt<1>("h0")) @[Main.scala 72:24]
    node _branchTaken_T_1 = neq(alu.io_out, UInt<1>("h0")) @[Main.scala 73:24]
    node _branchTaken_T_2 = asSInt(rf.io_readData1) @[Main.scala 74:29]
    node _branchTaken_T_3 = asSInt(rf.io_readData2) @[Main.scala 74:55]
    node _branchTaken_T_4 = lt(_branchTaken_T_2, _branchTaken_T_3) @[Main.scala 74:36]
    node _branchTaken_T_5 = asSInt(rf.io_readData1) @[Main.scala 75:29]
    node _branchTaken_T_6 = asSInt(rf.io_readData2) @[Main.scala 75:55]
    node _branchTaken_T_7 = geq(_branchTaken_T_5, _branchTaken_T_6) @[Main.scala 75:36]
    node _branchTaken_T_8 = lt(rf.io_readData1, rf.io_readData2) @[Main.scala 76:29]
    node _branchTaken_T_9 = geq(rf.io_readData1, rf.io_readData2) @[Main.scala 77:29]
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
    node _branchTarget_T = add(pc, imm.io_imm) @[Main.scala 80:25]
    node branchTarget = tail(_branchTarget_T, 1) @[Main.scala 80:25]
    node _jumpTarget_T = add(pc, imm.io_imm) @[Main.scala 81:25]
    node jumpTarget = tail(_jumpTarget_T, 1) @[Main.scala 81:25]
    node _nextPC_T = and(ctrl.io_Branch, branchTaken) @[Main.scala 84:21]
    node _nextPC_T_1 = mux(ctrl.io_Jump, jumpTarget, pcPlus4) @[Mux.scala 98:16]
    node nextPC = mux(_nextPC_T, branchTarget, _nextPC_T_1) @[Mux.scala 98:16]
    node _dmem_io_address_T = bits(alu.io_out, 1, 0) @[Main.scala 94:32]
    node _io_dmemOut_T = mux(ctrl.io_MemRead, dmem.io_readData, UInt<1>("h0")) @[Main.scala 98:20]
    node _rf_io_writeData_T = mux(ctrl.io_MemToReg, dmem.io_readData, alu.io_out) @[Main.scala 103:25]
    io_dmemOut <= _io_dmemOut_T @[Main.scala 98:14]
    io_pcOut <= pc @[Main.scala 16:12]
    pc <= mux(reset, UInt<32>("h0"), nextPC) @[Main.scala 15:19 Main.scala 15:19 Main.scala 88:6]
    dec.clock <= clock
    dec.reset <= reset
    dec.io_inst <= io_imemInst @[Main.scala 23:15]
    ctrl.clock <= clock
    ctrl.reset <= reset
    ctrl.io_opcode <= dec.io_opcode @[Main.scala 29:18]
    tdec.clock <= clock
    tdec.reset <= reset
    tdec.io_opcode <= dec.io_opcode @[Main.scala 35:18]
    imm.clock <= clock
    imm.reset <= reset
    imm.io_inst <= io_imemInst @[Main.scala 38:15]
    imm.io_sel <= tdec.io_immSel @[Main.scala 39:15]
    rf.clock <= clock
    rf.reset <= reset
    rf.io_clr <= UInt<1>("h0") @[Main.scala 45:13]
    rf.io_readReg1 <= dec.io_rs1 @[Main.scala 46:18]
    rf.io_readReg2 <= dec.io_rs2 @[Main.scala 47:18]
    rf.io_writeReg <= dec.io_rd @[Main.scala 48:18]
    rf.io_writeData <= _rf_io_writeData_T @[Main.scala 103:19]
    rf.io_regWrite <= ctrl.io_RegWrite @[Main.scala 49:18]
    aluCtrl.clock <= clock
    aluCtrl.reset <= reset
    aluCtrl.io_opcode <= dec.io_opcode @[Main.scala 55:21]
    aluCtrl.io_funct3 <= dec.io_funct3 @[Main.scala 56:21]
    aluCtrl.io_funct7 <= dec.io_funct7 @[Main.scala 57:21]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_a <= rf.io_readData1 @[Main.scala 60:12]
    alu.io_b <= _alu_io_b_T @[Main.scala 61:12]
    alu.io_aluCtrl <= aluCtrl.io_aluCtrl @[Main.scala 62:18]
    br.clock <= clock
    br.reset <= reset
    br.io_opcode <= dec.io_opcode @[Main.scala 68:16]
    br.io_funct3 <= dec.io_funct3 @[Main.scala 69:16]
    dmem.clock <= clock
    dmem.reset <= reset
    dmem.io_address <= _dmem_io_address_T @[Main.scala 94:19]
    dmem.io_writeData <= rf.io_readData2 @[Main.scala 95:21]
    dmem.io_memWrite <= ctrl.io_MemWrite @[Main.scala 96:20]
