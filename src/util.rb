module Util

  def integer_string?(s)
    Integer(s)
    true
  rescue ArgumentError
    false
  end

  def show_hash(h)
    h.keys.each do |k|
      print "key:", k, " value:", h[k], "\n"
    end
  end


  def clear
	puts "\e[H\e[2J"
  end
end

