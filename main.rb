
require "./game"

# Introduction
# Query for amount of users
# Each User in turn will enter 5 goals
# User assigns each goals title and description
#######################################
# TESTING THE GET_USERS AND MENU METHODS
#
# all_users = Game.get_users
# puts Game.menu
#####################################
# TESTING THE EXECUTE METHOD
#
# pseudocode
# create a hash of users?

=begin
we will have created all our users for the game.
we prompt for the next step 
we will say execute goal
we ask for which user
we get the specified user
was ask which goal we would like to delete for a particular user.

lets pass in 
=end

# Create a goal
=begin
goal_1 = Goal.new("Become Infinite", "Meditate for 5 mins daily")
goal_2 = Goal.new("Get Money", "Find the other stream of Revenue. Side Hussle")
goal_3 = Goal.new("Make sure you find your flow state daily", "Do something that challenges you as well as taps into your creativity")
goal_4 = Goal.new("Finish Goals Game", "Get Assistance From Wayne")
goal_5 = Goal.new("Finish Rails App", "Find a way to deploy")

goals = { goal_1.title => goal_1, goal_2.title => goal_2, goal_3.title => goal_3 }
# Assign it to a User
carlo = User.new("Carlo", "antcs07@gmail.com", goals)
puts carlo

# Know execute goal one
# Become Infinite
# carlo.execute_goal("Become Infinite")
# puts carlo

# Game.prompt_execution_sequence
=end
# Game.get_users_testing_suite
# Game.prompt_execution_sequence

Game.select(1, Game.get_users_testing_suite)

# Game.get_users_testing_suite
# Game.menu
