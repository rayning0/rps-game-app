require 'bundler/setup'

Bundler.require

DB = Sequel.connect('sqlite://db/rpsresults.db')

require_relative '../models/rps_game'
require_relative '../models/rps_game_result'

require './app'
require 'sequel'