class Class
  attr_reader

  def initialize(attributes)
    attributes.each { |kvp| instance_variable_set("@#{kvp[0].to_s}", kvp[1].to_s.gsub("'") { "&#39;" }) }
  end

  # def self.all
  # end

  # def save
  # end

  # def ==(comparison)
  # end

  # def self.clear
  # end

  # def self.find(id)
  # end

  # def update()
  # end

  # def delete
  # end
end