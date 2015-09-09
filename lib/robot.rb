class Robot

  LEFT  = { north: :west, west: :south, south: :east, east: :north }
  RIGHT = { north: :east, east: :south, south: :west, west: :north }
  MOVE_OPERATIONS = { north: [0,1], west: [-1,0], south: [0,-1], east: [1,0] }
 
  attr_reader :direction
  attr_reader :x, :y

  def initialize
    self.x = 0 
    self.y = 0
    self.direction = :north
  end

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
    operations = MOVE_OPERATIONS[self.direction]
    self.x += operations.first
    self.y += operations.last
  end

  def place(x, y, direction)
    self.x, self.y, self.direction = x, y, direction 
  end

  private 

  attr_writer :direction 
  attr_writer :x, :y

end