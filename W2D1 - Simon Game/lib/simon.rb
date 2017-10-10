class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game
      rescue
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      system ("clear")
      puts color
      sleep 0.75
      system ("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat sequence by entering first letter of color in each line."
    @seq.each do |color|
      user_input = gets.chomp
      if color[0] != user_input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.dup.shuffle.first
  end

  def round_success_message
    puts "Awesome."
  end

  def game_over_message
    raise "Game over! You made it #{sequence_length - 1} rounds. Try again?"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
e
