class Volunteer
  attr_reader :id, :project_id, :hours

  def initialize(attributes)
    attributes.each { |kvp| instance_variable_set("@#{kvp[0].to_s}", kvp[1].to_s.gsub("'") { "&#39;" }) }
  end

  def name 
    @name
  end

  def id 
    @id
  end

  def hours
    @hours
  end
  
  def project_id 
    @project_id.to_i
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers ORDER BY name ASC;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      hours = volunteer.fetch("hours").to_i
      volunteers.push(Volunteer.new({ :name => name, :id => id, :hours => hours}))
    end
    volunteers
  end

  def save
    volunteer = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = volunteer.first().fetch("id").to_i
  end

  def ==(comparison)
    self.name() == comparison.name()
  end

  # def self.clear
  # end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      name = volunteer.fetch("name")
      id = volunteer.fetch("id")
      hours = volunteer.fetch("hours").to_i
      Volunteer.new({ :name => name, :id => id, :hours => hours})
    end
  end

  def update(params)
    @name = params.fetch(:name)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end

  def add_hours(params)
    hours = DB.exec("SELECT hours FROM volunteers WHERE id = #{params.fetch(:volunteer_id)};").first.fetch("hours").to_i
    hours += params.fetch(:hours).to_i
    DB.exec("UPDATE volunteers SET hours = #{hours} WHERE id = #{params.fetch("volunteer_id")};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end

  def total_hours
    DB.exec("SELECT hours FROM volunteers;").sum
  end
end