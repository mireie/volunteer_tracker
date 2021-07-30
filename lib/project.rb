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

  # def self.all
  # end

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