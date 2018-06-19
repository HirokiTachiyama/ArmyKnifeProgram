require "twitter"
# include Constants


class MyTwitter

	def initialize(config_hash)
		ssl_file_path = config_hash['akp_root'] + config_hash['ssl_file_name']
		ENV["SSL_CERT_FILE"] = ssl_file_path
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key			= config_hash['consumer_key']
			config.consumer_secret		= config_hash['consumer_secret']
			config.access_token			= config_hash['access_token']
			config.access_token_secret	= config_hash['access_token_secret']
		end
	end

	def main_loop
		show_my_profile
		
		loop do
			print "########## Action? : "
			input = gets.chomp

			case input 
			when "send"
				print "########## Str? : "
				str = gets.chomp
				@client.update(str)
			when "timeline"
				@client.home_timeline({count: 5}).each do |tweet|
					puts tweet.full_text
					puts "Favorite: #{tweet.favorite_count}"
					puts "Retweet : #{tweet.retweet_count}"
				end
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
		puts "send", "timeline", "help", "h", "quit"
	end	


	def show_my_profile
		puts @client.user.screen_name
		puts @client.user.name
		puts @client.user.description
		puts @client.user.tweets_count
	end

	def send_tweet(str)
		@client.update(str)
	end


		

end


