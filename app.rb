require "sinatra"
require "sinatra/reloader"
require "pry"
require "pg"
require "./lib/project"
require "./lib/volunteer"
also_reload "lib/**/*.rb"


DB = PG.connect({ dbname: "volunteer_tracker" })

get ('/') do
  @projects = Project.all
  erb(:index)
end

post('/project/new') do
  @project = Project.new(:title => params[:title])
  @project.save
  redirect to ("/")
end