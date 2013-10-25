class RPSGameResult < Sequel::Model

  def won?
    self.won
  end

  def tied?
    self.tied
  end
end
