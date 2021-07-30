class Project
  attr_reader :id

  def initialize(attributes)
    attributes.each { |kvp| instance_variable_set("@#{kvp[0].to_s}", kvp[1].to_s.gsub("'") { "&#39;" }) }
  end

  def title 
    @title
  end

  def id 
    @id
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({ :project => name, :id => id }))
    end
    projects
  end

  def save
    project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = project.first().fetch("id").to_i
  end

  def ==(comparison)
    self.title() == comparison.title()
  end

  # def self.clear
  # end

  # def self.find(id)
  # end

  # def update()
  # end

  # def delete
  # end
end