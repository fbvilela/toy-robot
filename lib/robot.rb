class Robot

  LEFT_DIRECTION  = { north: :west, west: :south, south: :east, east: :north }
  RIGHT_DIRECTION = { north: :east, east: :south, south: :west, west: :north }

  attr_reader :direction

  [:north, :south, :east, :west].each do |direction|
    define_method "facing_#{direction}?" do 
      self.direction == direction 
    end
  end

  def left
    self.direction = LEFT_DIRECTION[self.direction] 
  end

  def right
    self.direction = RIGHT_DIRECTION[self.direction] 
  end  

  private 

  attr_writer :direction 

end