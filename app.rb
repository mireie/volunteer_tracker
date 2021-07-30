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
  @volunteers = Volunteer.all
  erb(:index)
end

get ('/project/:id') do
  @project = Project.find(params[:id].to_i)
  @volunteers = @project.volunteers
  erb(:project)
end

get ('/volunteer/:id') do
  @volunteer = Volunteer.find(params[:id].to_i)
  erb(:volunteer)
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

post ('/volunteer/project/:id') do
  @volunteer = Volunteer.new(:name => params[:name], :project_id => params[:id])
  @volunteer.save
  redirect to ("/")
end

patch ('/project/:id/edit') do
  @project = Project.find(params[:id].to_i)
  @project.update(params)
  redirect to ("/")
end

patch ('/volunteer/:id/edit') do
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteer.update(params)
  redirect to ("volunteer/#{params[:id]}")
end

delete ('/project/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to ("/")
end
