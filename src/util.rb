
class Util

  def self.integer_string?(s)
    Integer(s)
    true
  rescue ArgumentError
    false
  end

  def self.show_hash(h)
    h.keys.each do |k|
      print "key:", k, " value:", h[k], "\n"
    end
  end


end

