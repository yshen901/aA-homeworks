class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    self.place_stones
  end

  def place_stones
    @cups.each_with_index do |_, i|
      next if i == 6 || i == 13
      4.times { @cups[i] << :stone }
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0,5) || start_pos.between?(7,12)
      raise ArgumentError.new "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise ArgumentError.new "Starting cup is empty"
    end
  end

  def opponent_store?(player, position)
    return true if player == @name1 && position == 13
    return true if player == @name2 && position == 6
    false
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = @cups[start_pos].length
    @cups[start_pos] = []

    current_pos = start_pos
    until stones_in_hand == 0
      current_pos = (current_pos + 1) % 14
      next if self.opponent_store?(current_player_name, current_pos)
      @cups[current_pos] << :stone
      stones_in_hand -= 1
    end
    self.render
    self.next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
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
    side1_empty = (0..5).all? { |idx| @cups[idx].empty? }
    side2_empty = (7..12).all? { |idx| @cups[idx].empty? }
    side1_empty || side2_empty
  end

  def winner
    #return "No Winner!!!" unless self.one_side_empty?
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? (return @name1) : (return @name2)
  end
end
