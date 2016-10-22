lappend auto_path ../..
package require msgpack

set obj [msgpack::packer new]
$obj pack int 123456789
$obj pack dict int string {1 one 2 two}
set packed_data [$obj data]
$obj destroy

set OUT [open "data.msgp" w]
fconfigure $OUT -translation binary
puts -nonewline $OUT $packed_data
close $OUT

set IN [open "data.msgp" r]
fconfigure $IN -translation binary 
set content [read $IN]
set data [msgpack unpack $content]
puts $data