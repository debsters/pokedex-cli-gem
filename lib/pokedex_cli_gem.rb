# require "pokedex_cli_gem/version"
#
# module PokedexCliGem
#   class Error < StandardError; end
#   # Your code goes here...
# end

require 'pry'
require 'open-uri'
require 'nokogiri'
require 'colorize'

require_relative './pokedex_cli_gem/cli'
require_relative './pokedex_cli_gem/pokemon'
require_relative './pokedex_cli_gem/scraper'
