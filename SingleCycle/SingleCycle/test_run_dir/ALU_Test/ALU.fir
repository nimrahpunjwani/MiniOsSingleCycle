;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<32>, flip b : UInt<32>, flip aluCtrl : UInt<5>, out : UInt<32>}
    
    io.out <= UInt<1>("h00") @[ALU.scala 13:10]
    node _T = eq(UInt<1>("h01"), io.aluCtrl) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _io_out_T = add(io.a, io.b) @[ALU.scala 16:36]
      node _io_out_T_1 = tail(_io_out_T, 1) @[ALU.scala 16:36]
      io.out <= _io_out_T_1 @[ALU.scala 16:28]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h02"), io.aluCtrl) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        node _io_out_T_2 = sub(io.a, io.b) @[ALU.scala 17:36]
        node _io_out_T_3 = tail(_io_out_T_2, 1) @[ALU.scala 17:36]
        io.out <= _io_out_T_3 @[ALU.scala 17:28]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h03"), io.aluCtrl) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          node _io_out_T_4 = and(io.a, io.b) @[ALU.scala 18:36]
          io.out <= _io_out_T_4 @[ALU.scala 18:28]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_3 = eq(UInt<3>("h04"), io.aluCtrl) @[Conditional.scala 37:30]
          when _T_3 : @[Conditional.scala 39:67]
            node _io_out_T_5 = or(io.a, io.b) @[ALU.scala 19:36]
            io.out <= _io_out_T_5 @[ALU.scala 19:28]
            skip @[Conditional.scala 39:67]
    
