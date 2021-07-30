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

get ('/projects') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end

get ('/volunteers') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:volunteers_dashboard)
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
  redirect to ("/project/#{params[:id]}")
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

patch ('/volunteer/add-hours') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @volunteer.add_hours(params)
  redirect to ("project/#{params[:project_id].to_i}")
end

delete ('/project/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to ("/")
end

delete ('/volunteer/:id') do
  @project = Volunteer.find(params[:id].to_i)
  @project.delete
  redirect to ("/")
end
