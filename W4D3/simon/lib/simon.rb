class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(1)
    system("clear")
    require_sequence
    unless game_over
      round_success_message 
      @sequence_length += 1
    end
    system("clear")
  end

  def show_sequence
    add_random_color
    puts @seq.join(", ")
  end

  def require_sequence
    puts "Time to test your memory! Please enter the sequence one color at a time"
    puts "-----------------------------------------------------------------------"
    @seq.each do |color|
      print "Enter a color: "
      input = gets.chomp
      if input != color
        @game_over = true
        return
      end
      print "\nCorrect! "
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round Passed!"
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
