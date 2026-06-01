circuit TypeDec :
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
    node _GEN_0 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 78:16 TypeDec.scala 30:12]
    node _GEN_1 = mux(_T_8, UInt<3>("h5"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 79:17 TypeDec.scala 33:13]
    node _GEN_2 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 73:16 TypeDec.scala 29:12]
    node _GEN_3 = mux(_T_7, UInt<3>("h4"), _GEN_1) @[Conditional.scala 39:67 TypeDec.scala 74:17]
    node _GEN_4 = mux(_T_7, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_5 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 68:14 TypeDec.scala 31:12]
    node _GEN_6 = mux(_T_6, UInt<3>("h4"), _GEN_3) @[Conditional.scala 39:67 TypeDec.scala 69:17]
    node _GEN_7 = mux(_T_6, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_8 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_9 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 63:16 TypeDec.scala 28:12]
    node _GEN_10 = mux(_T_5, UInt<2>("h3"), _GEN_6) @[Conditional.scala 39:67 TypeDec.scala 64:17]
    node _GEN_11 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_13 = mux(_T_5, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_14 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 58:16 TypeDec.scala 27:12]
    node _GEN_15 = mux(_T_4, UInt<2>("h2"), _GEN_10) @[Conditional.scala 39:67 TypeDec.scala 59:17]
    node _GEN_16 = mux(_T_4, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_18 = mux(_T_4, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_19 = mux(_T_4, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_20 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeDec.scala 53:16 TypeDec.scala 26:12]
    node _GEN_21 = mux(_T_3, UInt<1>("h1"), _GEN_15) @[Conditional.scala 39:67 TypeDec.scala 54:17]
    node _GEN_22 = mux(_T_3, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_23 = mux(_T_3, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_24 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_25 = mux(_T_3, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_26 = mux(_T_3, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_27 = mux(_T_2, UInt<1>("h1"), _GEN_20) @[Conditional.scala 39:67 TypeDec.scala 48:16]
    node _GEN_28 = mux(_T_2, UInt<1>("h1"), _GEN_21) @[Conditional.scala 39:67 TypeDec.scala 49:17]
    node _GEN_29 = mux(_T_2, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_30 = mux(_T_2, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_31 = mux(_T_2, UInt<1>("h0"), _GEN_24) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_32 = mux(_T_2, UInt<1>("h0"), _GEN_25) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_33 = mux(_T_2, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_34 = mux(_T_1, UInt<1>("h1"), _GEN_27) @[Conditional.scala 39:67 TypeDec.scala 43:16]
    node _GEN_35 = mux(_T_1, UInt<1>("h1"), _GEN_28) @[Conditional.scala 39:67 TypeDec.scala 44:17]
    node _GEN_36 = mux(_T_1, UInt<1>("h0"), _GEN_29) @[Conditional.scala 39:67 TypeDec.scala 27:12]
    node _GEN_37 = mux(_T_1, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 TypeDec.scala 28:12]
    node _GEN_38 = mux(_T_1, UInt<1>("h0"), _GEN_31) @[Conditional.scala 39:67 TypeDec.scala 31:12]
    node _GEN_39 = mux(_T_1, UInt<1>("h0"), _GEN_32) @[Conditional.scala 39:67 TypeDec.scala 29:12]
    node _GEN_40 = mux(_T_1, UInt<1>("h0"), _GEN_33) @[Conditional.scala 39:67 TypeDec.scala 30:12]
    node _GEN_41 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 TypeDec.scala 38:16 TypeDec.scala 25:12]
    node _GEN_42 = mux(_T, UInt<1>("h0"), _GEN_35) @[Conditional.scala 40:58 TypeDec.scala 39:17]
    node _GEN_43 = mux(_T, UInt<1>("h0"), _GEN_34) @[Conditional.scala 40:58 TypeDec.scala 26:12]
    node _GEN_44 = mux(_T, UInt<1>("h0"), _GEN_36) @[Conditional.scala 40:58 TypeDec.scala 27:12]
    node _GEN_45 = mux(_T, UInt<1>("h0"), _GEN_37) @[Conditional.scala 40:58 TypeDec.scala 28:12]
    node _GEN_46 = mux(_T, UInt<1>("h0"), _GEN_38) @[Conditional.scala 40:58 TypeDec.scala 31:12]
    node _GEN_47 = mux(_T, UInt<1>("h0"), _GEN_39) @[Conditional.scala 40:58 TypeDec.scala 29:12]
    node _GEN_48 = mux(_T, UInt<1>("h0"), _GEN_40) @[Conditional.scala 40:58 TypeDec.scala 30:12]
    node _io_T0_T = bits(io_immSel, 0, 0) @[TypeDec.scala 83:21]
    node _io_T1_T = bits(io_immSel, 1, 1) @[TypeDec.scala 84:21]
    node _io_T2_T = bits(io_immSel, 2, 2) @[TypeDec.scala 85:21]
    io_rType <= _GEN_41
    io_iType <= _GEN_43
    io_sType <= _GEN_44
    io_bType <= _GEN_45
    io_auipc <= _GEN_47
    io_jType <= _GEN_48
    io_lui <= _GEN_46
    io_T0 <= _io_T0_T @[TypeDec.scala 83:9]
    io_T1 <= _io_T1_T @[TypeDec.scala 84:9]
    io_T2 <= _io_T2_T @[TypeDec.scala 85:9]
    io_immSel <= _GEN_42
