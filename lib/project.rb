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
      projects.push(Project.new({ :title => title, :id => id }))
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

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch("title")
      id = project.fetch("id")
      Project.new({:title => title, :id => id})
    end
  end

  def update(params)
    @title = params.fetch(:title)
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    # DB.exec("DELETE FROM voulenteers WHERE project_id = #{@id};")
  end
end