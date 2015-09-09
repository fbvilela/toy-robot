class Robot

  LEFT  = { north: :west, west: :south, south: :east, east: :north }
  RIGHT = { north: :east, east: :south, south: :west, west: :north }

  attr_reader :direction
  attr_reader :x, :y


  [:north, :south, :east, :west].each do |direction|
    define_method "facing_#{direction}?" do 
      self.direction == direction 
    end
  end

  def left
    self.direction = LEFT[self.direction] 
  end

  def right
    self.direction = RIGHT[self.direction] 
  end  

  def move

  end

  def place(x, y, direction)
    self.x, self.y, self.direction = x, y, direction 
  end

  private 

  attr_writer :direction 
  attr_writer :x, :y

end