require 'rspec'
require_relative 'optimus_grime'

RSpec.describe Robot do
  describe '#clean' do
    it 'returns the correct instructions' do
      grid = Grid.new(5, 5)
      robot = Robot.new(grid)
      points = [Point.new(1, 3), Point.new(4, 4)]
      instructions = robot.clean(points)
      expect(instructions).to eq('ENNNCEEENC')
    end
  end
end

RSpec.describe '#with reversed points' do
  it 'returns the correct instructions' do
    grid = Grid.new(5, 5)
    robot = Robot.new(grid)
    points = [Point.new(4, 4), Point.new(1, 3)]
    instructions = robot.clean(points)
    expect(instructions).to eq('EEEENNNNCWWWSC')
  end
end

RSpec.describe '#with single point' do
  it 'returns the correct instructions' do
    grid = Grid.new(5, 5)
    robot = Robot.new(grid)
    points = [Point.new(1, 3)]
    instructions = robot.clean(points)
    expect(instructions).to eq('ENNNC')
  end
end

RSpec.describe '#with mutiple points' do
  it 'returns the correct instructions' do
    grid = Grid.new(5, 5)
    robot = Robot.new(grid)
    points = [Point.new(1, 3), Point.new(4, 4), Point.new(2, 4)]
    instructions = robot.clean(points)
    expect(instructions).to eq('ENNNCEEENCWWC')
  end
end

RSpec.describe '#parse_grid_size' do
  it 'returns a Grid object with the correct size' do
    size = '5x5'
    grid = parse_grid_size(size)
    expect(grid.width).to eq(5)
    expect(grid.height).to eq(5)
  end
end

RSpec.describe '#parse_points' do
  it 'returns an array of Point objects' do
    points = ['(1, 3)', '(4, 4)']
    parsed_points = parse_points(points)
    expect(parsed_points.length).to eq(2)
    expect(parsed_points[0].x).to eq(1)
    expect(parsed_points[0].y).to eq(3)
    expect(parsed_points[1].x).to eq(4)
    expect(parsed_points[1].y).to eq(4)
  end
end

RSpec.describe '#valid_point?' do
  it 'returns true for a valid point within the grid' do
    grid = Grid.new(5, 5)
    point = Point.new(3, 3)
    expect(valid_point?(point, grid)).to be true
  end

  it 'returns false for a point outside the grid' do
    grid = Grid.new(5, 5)
    point = Point.new(6, 6)
    expect(valid_point?(point, grid)).to be false
  end
end

RSpec.describe '#validate_points' do
  it 'does not raise an error for valid points' do
    grid = Grid.new(5, 5)
    points = [Point.new(1, 3), Point.new(4, 4)]
    expect { validate_points(points, grid) }.not_to raise_error
  end

  it 'raises an error for points outside the grid' do
    grid = Grid.new(5, 5)
    points = [Point.new(1, 3), Point.new(6, 6)]
    expect { validate_points(points, grid) }.to raise_error(SystemExit)
  end
end
