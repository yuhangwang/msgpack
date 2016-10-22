set outBinData [binary format s2Sa6B8 {100 -2} 100 foobar 01000001]
puts "Format done: $outBinData"
set OUT [open "binary.dat" w]
fconfigure $OUT -translation binary 
puts -nonewline $OUT $outBinData
close $OUT 

set IN [open "binary.dat" r]
fconfigure $IN -translation binary 

set inBinData [read $IN]
close $IN 
binary scan $inBinData s2Sa6B8 val1 val2 val3 val4
puts "Scan done!"
puts "val1 = $val1"
puts "val2 = $val2"
puts "val3 = $val3"
puts "val4 = $val4"