class RPSGameResult < Sequel::Model
  attr_reader :human_play, :computer_play, :won, :tied, :created_at
  
  set_dataset(DB[:rps_game_results])

  def won?
    self.won
  end

  def tied?
    self.tied
  end
end
