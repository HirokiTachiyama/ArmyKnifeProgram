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
		show_map
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
		show_map

		r = Random.new
		puts r.rand(1..6)
	end

	def show_map
		clear
		colored_puts "  0 1 2 3 4 5", "index119"
		@map.each_with_index do |line, i|
			index_s = i.to_s + " "
			colored_print index_s, "index119"
			line.each do |area|
				colored_print_by_country area
			end
		  puts
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

