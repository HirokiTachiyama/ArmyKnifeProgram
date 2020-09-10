# coding: cp932

$goban = nil
$kifu  = nil

def show_goban
  puts "SENTE:" + $sente
  puts $goban
  puts "GOTE:"  + $gote
end

def prepare_goban
  $goban = Hash.new { |h, k| h[k] = {} }
  $goban["一"] = {1=>["-", "KY"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  9=>["+", "KY"]}

  $goban["二"] = {1=>["-", "KE"],
                  2=>["-", "KA"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  8=>["+", "HI"],
                  9=>["+", "KE"]}

  $goban["三"] = {1=>["-", "KY"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  9=>["+", "KY"]}


  $goban["四"] = {1=>["-", "KY"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  9=>["+", "KY"]}

  $goban["五"] = {1=>["-", "KY"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  9=>["+", "KY"]}

  $goban["六"] = {1=>["-", "KY"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  9=>["+", "KY"]}

  $goban["七"] = {1=>["-", "KY"],
                  3=>["-", "FU"],
                  7=>["+", "FU"],
                  9=>["+", "KY"]}
  $goban["八"] = {}
  
  
  $goban["九"][9] = [ "+", "KY" ]
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
    print "j"
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

prepare_goban

loop do
  cmd = gets.chomp
  show_goban if cmd.eql? "g"
  show_kifu  if cmd.eql? "k"
end

puts $goban["九"][9]



