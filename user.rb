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

  def initialize(name, email, goals = {}) # what is the key and what is the value {title: # => goal_object}
    @name = name                          # maybe we can use the name of the goal as the key
    @goals = goals                        # that way we can more easily access it
    @email = email
    # @points = 100
    @points = rand(100)
  end

  # @goals = {
  #   <title>: [goal obj],
  #   <title>: [goal obj],
  #   <title>: [goal obj]
  # }

  #create a method for creating a goal
  def add_goal
    # some logic
    puts "\nwhat is your goal #{name}?"
          print "goal [TITLE]: "
          title = gets.chomp

          print "goal[DESCRIPTION]: "
          description = gets.chomp

          goal = Goal.new(title, description)
          puts "Goal: #{goal}\n\n"

          # this assigns the current goal to our current users goals (hash).
          #     and assigning the current user goals list a new
          #     key value pair of  -> {:index_id => :goal_object}
          #     with the value of the :goal_object being assinged the new goal we created
          # I may change the key to be the :title of the goal
          #     in order to have easy access to executing a goal
          # users is a hash {:email => :user_object} email is how we identify each user
          # user_object has an attribute of goals
          # goals is also a hash collection with a key value pair of {:index_id => :goal_object}
          self.goals[title] = goal
  end

  # SUCCESSFUL
  def execute_goal(goal_title)
    puts "#{goal_title} executed"

    self.points += self.goals[goal_title].points
    completed_goal = goals.delete(goal_title)
  end

  def to_s
    "\tName: #{name}
     \tPoints: #{points}
     \tGoals: #{goals_as_string}\n\n"
  end

  def goals_as_string
    goals_string = ""
    goals.values.each { |goal| goals_string += ("|| [GOAL]: #{goal.title} - [DESCRIPTION]: #{goal.description},\n\t" + "\s" * 7) }
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
