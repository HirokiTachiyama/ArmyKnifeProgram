require "curses"

include Curses


class AKP

  def read_config(config, file_name)
    f = open file_name
    f.each do |l|
      k, v = l.split '='
      config[k] = v
    end
    f.close
  end

  def read_file_names(working_dir, file_names)
    Dir::entries(working_dir).each_with_index do |f, i|
      file_names[i] = f
    end
  end

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


  def main(config_file_path)
    if config_file_path.include? "~" then
      config_file_path.gsub! "~", ENV['HOME']
    end
    config = Hash.new
    file_names  = Hash.new

    ### Main process
    read_config(config, config_file_path)

    # get path
    memo_dir=nil;
    if not defined? config or config["memo_dir"].nil? then
      memo_dir = ENV['HOME'] # environment variable
    else
      memo_dir = config["memo_dir"].chomp
      memo_dir.gsub! "~", ENV['HOME'] # replace ~ to absolute path
    end

    read_file_names(memo_dir, file_names)

    input=0
    while integer_string? input 
      show_hash file_names

      print "file number? : "
      input = gets.chomp

      if integer_string? input then
        input = input.to_i
        open file_names[input] do |file|
          file.each do |line|
             puts line
          end
        end
      end
    end
  end

end

