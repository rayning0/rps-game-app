class RPSGame
  attr_reader :player
  attr_accessor :computer_play
  COMMANDS = [:paper, :scissors, :rock]

  def initialize(item)
    raise PlayTypeError if !COMMANDS.include?(item)
    @player = item
    @computer_play = COMMANDS.shuffle[0]  # computer randomly picks 1 of 3
  end

  def won?
    p = COMMANDS.index(self.player)  # 0 = paper, 1 = scissors, 2 = rock
    c = COMMANDS.index(self.computer_play)

    # paper > rock
    return true if p == 0 && c == 2  # paper beats rock
    return false if p == 2 && c == 0 

    # rock > scissors > paper (2 > 1 > 0)
    p > c ? true : false
  end

  def lost?
    return false if self.tied?
    self.won? ? false : true
  end

  def tied?
    self.player == self.computer_play
  end

  def self.valid_play?(item)
    true if COMMANDS.include?(item)
  end
end

class PlayTypeError < Exception
end