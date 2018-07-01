require 'curses'
require 'AKP_color_echo'

require_relative 'memo'
require_relative 'twitter'
require_relative 'util'

include Curses

class AKP
	def read_config(config, file_name)
		f = open file_name
		f.each do |l|
			k, v = l.split '='
			config[k] = v.chomp
		end
		f.close
	end

	def main(config_file_path)
		if config_file_path.include? "~" then
			config_file_path.gsub! "~", ENV['HOME']
		end

		### Main process
		config = Hash.new
		read_config(config, config_file_path)

		main_loop config

		puts "akp fin"
	end

	def main_loop(config)
		input = nil
		while input != "quit"
			print "Function? : "
			input = gets.chomp

			case input
			when "twitter"
				client = MyTwitter.new config
				client.main_loop
			when "memo"
				Memo.new.main_loop config
			when "help", "h"
				show_help
			when "quit"
				break
			else
				print "Invalid command : ", input, "\n"
			end
		end
	end
 
	def show_help
		puts "twitter", "memo", "help"
	end

end

