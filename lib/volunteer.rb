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
    if !@hours
      @hours = 0
    end
    @hours
  end
  
  def project_id 
    @project_id.to_i
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({ :name => name, :id => id }))
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
      Volunteer.new({:name => name, :id => id})
    end
  end

  def update(params)
    @name = params.fetch(:name)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
    # DB.exec("DELETE FROM voulenteers WHERE volunteer_id = #{@id};")
  end
end