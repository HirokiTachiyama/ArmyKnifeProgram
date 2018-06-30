require_relative 'util'

class Memo

	def main_loop(config)
		file_names = Hash.new
		if not defined? config or config["memo_dir"].nil? then
			memo_dir = ENV['HOME'] # environment variable
		else
			memo_dir = config["memo_dir"].chomp
			memo_dir.gsub! "~", ENV['HOME'] # replace ~ to absolute path
		end

		read_file_names(memo_dir, file_names)
		input=0
		while Util.integer_string? input
			Util.show_hash file_names
			print "file number? : "
			input = gets.chomp
			if Util.integer_string? input then
				file_name = memo_dir + file_names[input.to_i]
				open file_name do |file|
					file.each { |line| puts line }
				end
			end
		end
	end

	def read_file_names(working_dir, file_names)
		Dir::entries(working_dir).each_with_index do |fn, i|
			next if fn == "." or fn == ".."
			file_names[i] = fn
		end
	end

end


