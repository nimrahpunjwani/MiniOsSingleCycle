;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DataMem : 
  module DataMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip address : UInt<32>, flip writeData : UInt<32>, flip memWrite : UInt<1>, flip memRead : UInt<1>, readData : UInt<32>, consoleValid : UInt<1>, consoleByte : UInt<8>}
    
    cmem mem : UInt<32>[65536] @[DataMem.scala 18:16]
    node _ramIndex_T = sub(io.address, UInt<32>("h080000000")) @[DataMem.scala 21:30]
    node _ramIndex_T_1 = tail(_ramIndex_T, 1) @[DataMem.scala 21:30]
    node ramIndex = bits(_ramIndex_T_1, 17, 2) @[DataMem.scala 21:40]
    node tinyIndex = bits(io.address, 1, 0) @[DataMem.scala 22:29]
    node _wordIndex_T = geq(io.address, UInt<32>("h080000000")) @[DataMem.scala 23:34]
    node wordIndex = mux(_wordIndex_T, ramIndex, tinyIndex) @[DataMem.scala 23:22]
    node isConsole = eq(io.address, UInt<32>("h010000000")) @[DataMem.scala 24:30]
    io.readData <= UInt<1>("h00") @[DataMem.scala 29:15]
    io.consoleValid <= UInt<1>("h00") @[DataMem.scala 30:19]
    io.consoleByte <= UInt<1>("h00") @[DataMem.scala 31:18]
    when io.memWrite : @[DataMem.scala 36:21]
      when isConsole : @[DataMem.scala 37:21]
        io.consoleValid <= UInt<1>("h01") @[DataMem.scala 38:23]
        node _io_consoleByte_T = bits(io.writeData, 7, 0) @[DataMem.scala 39:37]
        io.consoleByte <= _io_consoleByte_T @[DataMem.scala 39:22]
        node _T = bits(io.writeData, 7, 0) @[DataMem.scala 41:32]
        node _T_1 = bits(reset, 0, 0) @[DataMem.scala 41:13]
        node _T_2 = eq(_T_1, UInt<1>("h00")) @[DataMem.scala 41:13]
        when _T_2 : @[DataMem.scala 41:13]
          printf(clock, UInt<1>(1), "%c", _T) @[DataMem.scala 41:13]
          skip @[DataMem.scala 41:13]
        skip @[DataMem.scala 37:21]
      else : @[DataMem.scala 42:17]
        write mport MPORT = mem[wordIndex], clock
        MPORT <= io.writeData
        skip @[DataMem.scala 42:17]
      skip @[DataMem.scala 36:21]
    node _T_3 = eq(isConsole, UInt<1>("h00")) @[DataMem.scala 50:22]
    node _T_4 = and(io.memRead, _T_3) @[DataMem.scala 50:19]
    when _T_4 : @[DataMem.scala 50:34]
      read mport io_readData_MPORT = mem[wordIndex], clock @[DataMem.scala 51:28]
      io.readData <= io_readData_MPORT @[DataMem.scala 51:17]
      skip @[DataMem.scala 50:34]
    
