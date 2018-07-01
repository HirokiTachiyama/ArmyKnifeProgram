require_relative 'util'
require_relative 'AKP_color_echo'
include Util
include AKP_color_echo

class DiceStrategy

	def initialize
	  @map = Array.new(5).map{Array.new(6).map{
		Area.new "free", 0
	  }}

#		@map = Array.new(4, (Array.new 5, # size: 4*5
#					(Area.new "c0",0)))
		# show_map
	  	generate_game_map
	end

  def generate_game_map
	update_area @map[0][0], "player", 3
	update_area @map[0][1], "player", 3
	update_area @map[1][0], "player", 3

	update_area @map[0][4], "cpu1", 3
	update_area @map[0][5], "cpu1", 3
	update_area @map[1][5], "cpu1", 3

	update_area @map[3][0], "cpu2", 3
	update_area @map[4][0], "cpu2", 3
	update_area @map[4][1], "cpu2", 3


	update_area @map[3][5], "cpu3", 3
	update_area @map[4][4], "cpu3", 3
	update_area @map[4][5], "cpu3", 3
  end

	def update_area area, country, dice
	  	area.country = country
	  	area.dice = dice
	end

	def start
		r = Random.new
		# puts r.rand(1..6)
	  	main_loop
	end


	def main_loop
		input = nil
		gc = GameController.new
		while there_are_some_countries? # till decide WIN country
			current_player = gc.next
			print "\nTurn of ",
				  current_player,
				  "(press any key)"
			STDIN.getc
			loop do
				show_map
				colored_print_by_country_color current_player, "Command(x,y->x,y)? : "
				input = gets.chomp
			  	case input
				when 'q'
					break
				else
					do_command input
					next
				end
			end
		end
	end

	def do_command(input)
		coordinates = input.split("->")
	  	from, to = Hash.new
	  	print from, to

	end

	def there_are_some_countries?
		true
	end

	def show_map
		clear
		colored_puts "  0 1 2 3 4 5", "index119"
		@map.each_with_index do |line, i|
			index_s = i.to_s + " "
			colored_print index_s, "index119"
			line.each do |area|
				colored_print_by_country_color area.country, area.dice.to_s+" "
			end
		puts
		end
	end

	class GameController
		def initialize
		  @turn_order           = %w(player cpu1 cpu2 cpu3)
		  @current_player_index = 0
		  @current_player       = @turn_order[0]
		end

	  def next
		@current_player_index = @current_player_index + 1
		if(@current_player_index == @turn_order.size) then
		  @current_player_index = 0
		end
		@current_player = @turn_order[@current_player_index]
		return @current_player
	  end
	end


  class Area
	attr_accessor :country, :dice
	def initialize(country, dice)
	  @country=country
	  @dice=dice
	end
  end
end

game = DiceStrategy.new
game.start

