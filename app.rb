require_relative 'config/environment'
require 'pry'

class GameApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/rps_game'
  end

  get '/rps_game' do
    erb :rps_game     # form for human to play
  end

  post '/rps_game' do
    gresult = RPSGame.new(params[:human_play].to_sym).result
    #binding.pry
    gresult.save
    redirect "/rps_game_results/#{gresult.id}"
  end

  get '/rps_game_results/:id' do
    @gresult = RPSGameResult[params[:id].to_i]
    erb :show       # shows results for this 1 game
  end

  get '/rps_game_results' do
#A list of the last 20 game results ordered by most to least recent.
    @all = RPSGameResult.all
    erb :results
  end
end
