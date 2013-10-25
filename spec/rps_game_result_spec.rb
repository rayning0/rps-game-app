require 'spec_helper'

describe RPSGameResult do
  describe "#won?" do
    it "should report whther the game was won by the human player" do
      result = RPSGameResult.new(human_play: :rock, computer_play: :paper, won: true)
      result.won?.should == true

      result = RPSGameResult.new(human_play: :paper, computer_play: :rock, won: false)
      result.won?.should == false

      result = RPSGameResult.new(human_play: :paper, computer_play: :paper, won: false)
      result.won?.should == false
    end
  end

  describe "#tied?" do
    it "should report whther the game was tied" do
      result = RPSGameResult.new(human_play: :rock, computer_play: :rock, won: false, tied: true)
      result.tied?.should == true

      result = RPSGameResult.new(human_play: :paper, computer_play: :rock, won: true, tied: false)
      result.tied?.should == false
    end
  end
end
