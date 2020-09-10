
$goban = nil
$kifu  = nil

def show_goban
  puts "SENTE:" + $sente
  puts $goban
  puts "GOTE:"  + $gote
end

def prepare_goban
  $goban = Hash.new { |h, k| h[k] = {} }
  $goban[""]

end

def show_kifu
  puts $kifu
end

File.open("kifu.csa") do |f|
  f.gets # Version
  $sente = f.gets.delete("N+")
  $gote  = f.gets.delete("N-")
  $event = f.gets.delete("$EVENT:")
  $site  = f.gets.delete("$SITE:")
  $start_time = f.gets.delete("$START_TIME:")
  $opening = f.gets.delete("$OPENING:")

  while( !f.gets.include?("+\n") )  # throw away P1~P9
  end
  
  $kifu = ""
  f.each_line do |l|
    $kifu = $kifu + l
  end
end

puts "-----"

$kifu.each_line do |l|
  print l
end

loop do
  cmd = gets.chomp
  show_goban if cmd.eql? "g"
  show_kifu  if cmd.eql? "k"
end



