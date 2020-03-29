require "./user"
require "./goal"
require "./setup"

# Introduction
# Query for amount of users
# Each User in turn will enter 5 goals
# User assigns each goals title and description
#######################################
all_users = get_users
puts all_users
#####################################
# we have returned our list of users

# puts "#" * 5 + " What's the next move " + "#" * 5
puts "#" * 60
puts "%20s" % "#{"#" * 10}" + " What's the next move " + "#{"#" * 10}\n\n"
puts "%22s" % "#{"#" * 10}" + " 1)Execute a Goal " + "#{"#" * 10}"
puts "%23s" % "#{"#" * 10}" + " 2)Check Goals " + "#{"#" * 10}"
puts "%23s" % "#{"#" * 9}" + " 3)Check Score " + "#{"#" * 8}"
puts "#" * 60 + "\n\n"

# we know want to know what our users want to do

#### WHAT'S THE NEXT MOVE ####
# execut a goal
# view the score

# carlo.name = "name Change" # this should not work
# carlo.goals = "goal change" # this is not the way we want to assign goals
# carlo.to_s

# new_goal = Goal.new("Call The Church", "Make sure we can get married")
# new_goal_2 = Goal.new("Program Daily", "Spend 30 minutes a day programming")

# carlo << new_goal
# carlo << new_goal_2
# puts carlo.to_s
# carlo.execute_goal(new_goal)
# puts carlo.to_s
# puts carlo.goals
