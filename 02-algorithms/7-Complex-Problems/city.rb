class City
  attr_accessor :name
  attr_accessor :x_value
  attr_accessor :y_value
  attr_accessor :visited

  def initialize(name, x_value, y_value)
    @name = name
    @x_value = x_value
    @y_value = y_value
    @visited = false
  end

end
