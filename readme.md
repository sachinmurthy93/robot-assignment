# Robot Cleaning Instructions

This program provides a Ruby solution for generating cleaning instructions for a robot to clean specific points on a grid.

## Installation

Clone the repository:

```
git clone <repository_url>
```

Install the required dependencies:

```
bundle install
```

## Usage

The program accepts input as command-line arguments and returns a list of instructions for the robot to reach and clean the specified points on the grid.

```
ruby optimus_grime.rb <grid_size> <point1> <point2> ...
```

- <grid_size>: The size of the grid in the format widthxheight. For example, 5x5 represents a grid of 5 meters width and 5 meters height.
- <point1>, <point2>, ...: The list of points to be cleaned. Each point should be in the format (x, y), where x and y are the coordinates of the point.

## Example

Given the following input:

```
ruby optimus_grime.rb 5x5 "(1, 3)" "(4, 4)"
```

## Unit Testing

To run the unit tests, use the following command:

```
rspec optimus_grime_spec.rb
```

## Note

- The robot always starts at the origin point (0, 0), which is the most south-westerly point of the grid.
- Make sure to provide valid points that are within the boundaries of the grid. If any invalid points are provided, an error message will be displayed.
