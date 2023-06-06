class Grid
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Robot
  attr_reader :grid, :cleaning_instructions

  def initialize(grid)
    @grid = grid
    @cleaning_instructions = []
  end

  def clean(points)
    current_position = Point.new(0, 0)

    points.each do |destination|
      instructions = move_to(destination, current_position)
      @cleaning_instructions << instructions
      current_position = destination
      @cleaning_instructions << 'C'
    end

    @cleaning_instructions.join('')
  end

  private

  def move_to(destination, current_position)
    x_diff = destination.x - current_position.x
    y_diff = destination.y - current_position.y

    x_direction = x_diff.positive? ? 'E' : 'W'
    y_direction = y_diff.positive? ? 'N' : 'S'

    x_instructions = x_direction * x_diff.abs
    y_instructions = y_direction * y_diff.abs

    x_instructions + y_instructions
  end
end

def parse_grid_size(size)
  width, height = size.split('x').map(&:to_i)
  Grid.new(width, height)
end

def parse_points(point_coords)
  point_coords.map do |coord|
    x, y = coord.gsub(/[()]/, '').split(',').map(&:to_i)
    Point.new(x, y)
  end
end

def valid_point?(point, grid)
  point.x >= 0 && point.x < grid.width && point.y >= 0 && point.y < grid.height
end

def validate_points(points, grid)
  points.each do |point|
    unless valid_point?(point, grid)
      puts "Error: Point (#{point.x}, #{point.y}) is outside the grid boundaries."
      exit(1)
    end
  end
end

# Extract command line arguments
grid_size, *point_coords = ARGV

grid = parse_grid_size(grid_size)
cleaning_points = parse_points(point_coords)
validate_points(cleaning_points, grid)

robot = Robot.new(grid)
instructions = robot.clean(cleaning_points)

puts instructions
