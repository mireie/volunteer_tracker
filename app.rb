require "sinatra"
require "sinatra/reloader"
require "pry"
require "pg"
require "./lib/"
also_reload "lib/**/*.rb"


DB = PG.connect({ dbname: "" })