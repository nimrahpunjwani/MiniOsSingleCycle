circuit ContDec :
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
    node _T_5 = eq(UInt<7>("h67"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<6>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<5>("h17"), io_opcode) @[Conditional.scala 37:30]
    node _T_9 = eq(UInt<7>("h73"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_9, UInt<1>("h0"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 76:19 ContDec.scala 22:15]
    node _GEN_1 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 71:19 ContDec.scala 20:15]
    node _GEN_2 = mux(_T_8, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 ContDec.scala 73:19]
    node _GEN_3 = mux(_T_7, UInt<1>("h1"), _GEN_1) @[Conditional.scala 39:67 ContDec.scala 66:19]
    node _GEN_4 = mux(_T_7, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 ContDec.scala 68:19]
    node _GEN_5 = mux(_T_6, UInt<1>("h1"), _GEN_3) @[Conditional.scala 39:67 ContDec.scala 62:19]
    node _GEN_6 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 63:19 ContDec.scala 27:15]
    node _GEN_7 = mux(_T_6, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67 ContDec.scala 21:15]
    node _GEN_8 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 ContDec.scala 22:15]
    node _GEN_9 = mux(_T_5, UInt<1>("h1"), _GEN_5) @[Conditional.scala 39:67 ContDec.scala 56:19]
    node _GEN_10 = mux(_T_5, UInt<1>("h1"), _GEN_7) @[Conditional.scala 39:67 ContDec.scala 57:19]
    node _GEN_11 = mux(_T_5, UInt<1>("h1"), _GEN_6) @[Conditional.scala 39:67 ContDec.scala 58:19]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 ContDec.scala 59:19]
    node _GEN_13 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 52:19 ContDec.scala 26:15]
    node _GEN_14 = mux(_T_4, UInt<1>("h1"), _GEN_12) @[Conditional.scala 39:67 ContDec.scala 53:19]
    node _GEN_15 = mux(_T_4, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 ContDec.scala 20:15]
    node _GEN_16 = mux(_T_4, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 ContDec.scala 21:15]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 ContDec.scala 27:15]
    node _GEN_18 = mux(_T_3, UInt<1>("h1"), _GEN_16) @[Conditional.scala 39:67 ContDec.scala 47:19]
    node _GEN_19 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 48:19 ContDec.scala 24:15]
    node _GEN_20 = mux(_T_3, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 ContDec.scala 49:19]
    node _GEN_21 = mux(_T_3, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 ContDec.scala 26:15]
    node _GEN_22 = mux(_T_3, UInt<1>("h0"), _GEN_15) @[Conditional.scala 39:67 ContDec.scala 20:15]
    node _GEN_23 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 ContDec.scala 27:15]
    node _GEN_24 = mux(_T_2, UInt<1>("h1"), _GEN_22) @[Conditional.scala 39:67 ContDec.scala 40:19]
    node _GEN_25 = mux(_T_2, UInt<1>("h1"), _GEN_18) @[Conditional.scala 39:67 ContDec.scala 41:19]
    node _GEN_26 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ContDec.scala 42:19 ContDec.scala 23:15]
    node _GEN_27 = mux(_T_2, UInt<1>("h0"), _GEN_20) @[Conditional.scala 39:67 ContDec.scala 44:19]
    node _GEN_28 = mux(_T_2, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 ContDec.scala 24:15]
    node _GEN_29 = mux(_T_2, UInt<1>("h0"), _GEN_21) @[Conditional.scala 39:67 ContDec.scala 26:15]
    node _GEN_30 = mux(_T_2, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 ContDec.scala 27:15]
    node _GEN_31 = mux(_T_1, UInt<1>("h1"), _GEN_24) @[Conditional.scala 39:67 ContDec.scala 35:19]
    node _GEN_32 = mux(_T_1, UInt<1>("h1"), _GEN_25) @[Conditional.scala 39:67 ContDec.scala 36:19]
    node _GEN_33 = mux(_T_1, UInt<1>("h0"), _GEN_27) @[Conditional.scala 39:67 ContDec.scala 37:19]
    node _GEN_34 = mux(_T_1, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 ContDec.scala 23:15]
    node _GEN_35 = mux(_T_1, UInt<1>("h0"), _GEN_28) @[Conditional.scala 39:67 ContDec.scala 24:15]
    node _GEN_36 = mux(_T_1, UInt<1>("h0"), _GEN_29) @[Conditional.scala 39:67 ContDec.scala 26:15]
    node _GEN_37 = mux(_T_1, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 ContDec.scala 27:15]
    node _GEN_38 = mux(_T, UInt<1>("h1"), _GEN_31) @[Conditional.scala 40:58 ContDec.scala 31:19]
    node _GEN_39 = mux(_T, UInt<2>("h2"), _GEN_33) @[Conditional.scala 40:58 ContDec.scala 32:19]
    node _GEN_40 = mux(_T, UInt<1>("h0"), _GEN_32) @[Conditional.scala 40:58 ContDec.scala 21:15]
    node _GEN_41 = mux(_T, UInt<1>("h0"), _GEN_34) @[Conditional.scala 40:58 ContDec.scala 23:15]
    node _GEN_42 = mux(_T, UInt<1>("h0"), _GEN_35) @[Conditional.scala 40:58 ContDec.scala 24:15]
    node _GEN_43 = mux(_T, UInt<1>("h0"), _GEN_36) @[Conditional.scala 40:58 ContDec.scala 26:15]
    node _GEN_44 = mux(_T, UInt<1>("h0"), _GEN_37) @[Conditional.scala 40:58 ContDec.scala 27:15]
    io_RegWrite <= _GEN_38
    io_ALUSrc <= _GEN_40
    io_ALUOp <= _GEN_39
    io_MemRead <= _GEN_41
    io_MemWrite <= _GEN_42
    io_MemToReg <= _GEN_41
    io_Branch <= _GEN_43
    io_Jump <= _GEN_44
