class RPSGame
  attr_reader :player
  attr_accessor :computer_play
  COMMANDS = [:paper, :scissors, :rock]
  THROWS = { rock: :scissors, paper: :rock, scissors: :paper }

  def initialize(item)
    item = item.to_sym if item
    raise PlayTypeError if !COMMANDS.include?(item)
    @player = item
    @computer_play = COMMANDS.shuffle[0]  # computer randomly picks 1 of 3
  end

  def won?
    THROWS[self.player] == self.computer_play
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

  def result
    RPSGameResult.new({
      human_play: self.player, 
      computer_play: self.computer_play, 
      won: won?,
      tied: tied?,
      created_at: Time.now
    })
  end

  class PlayTypeError < Exception
  end
end

