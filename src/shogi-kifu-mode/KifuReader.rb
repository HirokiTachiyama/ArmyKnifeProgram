# coding: utf-8

require 'io/console'


$goban = {}
$kifu  = {}
$yoko = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
$te = 0

$teban = ""
$before_tate, $before_yoko = 0, ""
$after_tate, $after_yoko   = 0, ""
$koma = ""

def prepare_goban
  $goban[1] = { "一"=>"-KY", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+KY" }
  $goban[2] = { "一"=>"-KE", "二"=>"-KA", "三"=>"-FU","四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>"+HI", "九"=>"+KE" }
  $goban[3] = { "一"=>"-GI", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+GI" }
  $goban[4] = { "一"=>"-KI", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+KI" }
  $goban[5] = { "一"=>"-OU", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+KY" }
  $goban[6] = { "一"=>"-KI", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+KI" }
  $goban[7] = { "一"=>"-GI", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+GI" }
  $goban[8] = { "一"=>"-KE", "二"=>"-HI", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>"+KA", "九"=>"+KE" }
  $goban[9] = { "一"=>"-KY", "二"=>" * ", "三"=>"-FU", "四"=>" * ",
                "五"=>" * ", "六"=>" * ", "七"=>"+FU", "八"=>" * ", "九"=>"+KY" }
end

def show_goban
  9.downto(1) { |c| print " #{c}  " }
  puts ""
  $yoko.each do |v|
    next if v.eql?("零")
    9.downto(1) do |c|
      print $goban[c][v] + " "
    end
    puts " " + v
  end
end

def show_kifu
  puts $kifu
end

def clear_console
  puts "\e[H\e[2J"
end  

def info
  clear_console()

  print $event+"\n戦形:"+$opening+"\n"
  print "後手: " + $gote + "\n"
  
  show_goban()
  
  print "\n" + "先手: " + $sente + "\n"
  print "#{$te}手目 " + $after_tate.to_s + $after_yoko + $koma + "\n"
end

File.open("kifu.csa") do |f|
  f.gets # throw aray Version
  $sente = f.gets.delete("N+")
  $gote  = f.gets.delete("N-")
  $event = f.gets#.delete("$EVENT:")
  $site  = f.gets.delete("$SITE:")
  $start_time = f.gets.delete("$START_TIME:")
  $opening = f.gets.delete("$OPENING:")

  while( !f.gets.include?("+\n") )  # throw away P1~P9
  end

  tmp = ""
  f.each_line { |l| tmp = tmp + l }
  i=1
  tmp.each_line do |sashite|
    $kifu[i] = sashite.chomp
    i = i + 1
  end
end


def update
  $te = $te + 1
  sashite = $kifu[$te]
  # sashite.delete!("+").delete!("-") # throw "+", "-"

  $teban = sashite[0]

  $before_tate, $before_yoko = sashite[1].to_i, $yoko[sashite[2].to_i]
  $after_tate, $after_yoko   = sashite[3].to_i, $yoko[sashite[4].to_i]
  $koma   = sashite[5] + sashite[6]

  $goban[$before_tate][$before_yoko] = " * "
  $goban[$after_tate][$after_yoko] = $teban + $koma
end

prepare_goban()
show_kifu()
info()
loop do
  print "command? ((n)ext/(q)uit) : "
  cmd = STDIN.getch
  if cmd.eql? "k" then
    show_kifu()
  elsif cmd.eql? "n"
    update()
    info()
  elsif cmd.eql? "q"
    break
  end
end


