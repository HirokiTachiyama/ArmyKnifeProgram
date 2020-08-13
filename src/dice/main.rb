# coding: cp932

class Dice
  def initialize
    @r = Random.new
  end

  def roll
    @r.rand(1..6)
  end

  # @return [int, int] 二回のダイスロール結果をタプルで返す
  def roll_twice
    [roll, roll]
  end
end

# @attr [Integer] @height 高さ
# @attr [Integer] @width 幅
# @attr [Array] @body マップ本体
# ゲームのマップ情報
class GameMap
  # @param [Integer] _w 幅
  # @param [Integer] _h 高さ
  def initialize(_w, _h)
    @height = _h
    @width  = _w
    @body   = Array.new(@height) {
      Array.new(@width, 0)
    }
  end

  def map_update(_x, _y, _value)
    @body[_y][_x] = _value
  end

  def debug_print
    puts "DEBUG_PRINT"
    puts "@height:#{@height}, @width:#{@width}"

    puts "@body"
    @height.times do |w|
      @width.times do |h|
        print @body[w][h], " "
      end
      puts ""
    end
  end
end

map = GameMap.new(2, 3)

dice = Dice.new
p dice.roll
p dice.roll_twice
map.map_update(1, 0, 100)
map.debug_print

