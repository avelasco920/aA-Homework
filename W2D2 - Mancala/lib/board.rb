class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      i == 6 || i == 13 ? next : 4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0 || start_pos == 6 || start_pos || 13
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[idx] << stones.pop if current_player_name == @name1
        next if current_player_name != @name1
      elsif idx == 13
        @cups[idx] << stones.pop if current_player_name == @name2
        next if current_player_name != @name2
      else
        cups[idx] << stones.pop
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5]
    side2 = @cups[7..12]
    side1 = side1.all? { |cup| cup.empty? }
    side2 = side2.all? { |cup| cup.empty? }
    return false unless side1 || side2
    true
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
