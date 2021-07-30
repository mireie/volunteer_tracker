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

get ('/project/:id') do
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

get ('/project/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

post ('/project/new') do
  @project = Project.new(:title => params[:title])
  @project.save
  redirect to ("/")
end

patch ('/project/:id/edit') do
  @project = Project.find(params[:id].to_i)
  @project.update(params)
  redirect to ("/")
end