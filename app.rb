require_relative 'config/environment'
require "sinatra/reloader"
require 'pry'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    
    # Your app code goes here
    @rps = RPSGame.new(params[:play].to_sym)
    #binding.pry
    erb :rps_game
  end
end
