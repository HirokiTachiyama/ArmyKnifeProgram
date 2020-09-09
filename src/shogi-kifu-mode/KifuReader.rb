
File.open("kifu.csa") do |f|
  f.gets # Version
  $sente = f.gets #
  $gote  = f.gets
  $event = f.gets
  $site  = f.gets
  $start_time = f.gets
  $opening = f.gets

  $kifu = ""
  f.each_line do |l|
    $kifu = $kifu + l
  end
end

puts $sente
puts $gote
puts $event
puts $site
puts $start_time
puts $opening

$kifu.each_line do |l|
  print l
end

