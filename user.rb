# Game:
# Users: goals
# Users get points for completing goals

=begin
  make the goals array a hash, like:
  @goals = {
    <goal id>: [goal obj],
    <goal id>: [goal obj],
    <goal id>: [goal obj]
  }
=end

require "./goal"

class User
  attr_reader :goals, :email, :name, :points

  def initialize(name, email, goals = {}) # what is the key and what is the value {id# => goal_object}
    @name = name                          # maybe we can use the name of the goal as the key
    @goals = goals                        # that way we can more easily access it
    @email = email
    @points = 100
    # @points = rand(100)
  end

  # @goals = {
  #   <title>: [goal obj],
  #   <title>: [goal obj],
  #   <title>: [goal obj]
  # }

  #create a method for creating a goal
  def new_goal(goal)
    # some logic
  end

  # SUCCESSFUL
  def execute_goal(goal_title)
    puts "#{goal_title} executed"

    self.points += goals[goal_title].points
    completed_goal = goals.delete(goal_title)
  end

  def to_s
    "Name: #{name}\n
     Points: #{points}\n
     Goals: #{goals_as_string}\n\n"
  end

  def goals_as_string
    goals_string = ""
    puts "goals: #{goals}"
    goals.values.each { |goal| goals_string += "|| [GOAL]: #{goal.title} - [DESCRIPTION]: #{goal.description},\n\s\s\s\s\s\s\s" }
    goals_string
  end

  # NEED TO CREATE A METHOD TO PRINT A SPECIFIC GOAL
  def goal_as_string(specified_goal)
    # some logic
  end

  private

  def points=(points)
    @points = points
  end

  # def name=(name)
  #   @name = name
  # end
end
