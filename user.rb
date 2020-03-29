# Game:
# Users: goals
# Users get points for completing goals
require "./goal"

class User
  attr_reader :goals, :name, :points

  def initialize(name, *goals)
    @name = name
    @goals = goals
    @points = 100
  end

  def <<(goal)
    @goals << goal
  end

  #create a method for creating a goal

  def to_s
    goal_format = "#{goals.map { |x| x.to_s }.join(", ")}"
    "Name: #{name}\n" +
    "Points #{points}\n" +
    "goals: #{goal_format}\n\n"
  end

  def execute_goal(goal)
    puts "#{goal} executed"
    self.points += goal.points
  end

  private # comment to make name change work

  # we should not be able to  use this outside our class
  def points=(points)
    @points = points
  end

  # we should not be able to  use this outside our class
  def name=(name)
    @name = name
  end
end
