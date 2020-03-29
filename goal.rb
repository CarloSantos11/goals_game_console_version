=begin
Goals will have a
  - title :string
  - description :string
  - type: repeat/one-time :string
  - category: partner-goal/solo-goal/team-goal :string
  - value :integer

=end
class Goal
  attr_reader :title, :description, :type,
              :category, :points, :status

  def initialize(title, description, category = "solo", type = "repeat", points = 50, status = "incomplete")
    @title = title
    @description = description
    @type = type
    @category = category
    @points = points
    @status = status
  end

  def to_s
    "#{title} - #{description}"
  end

end


#convention is to have less than or equal to 4

# method to edit the goal?
# mark as completed?

# what happens to a goal after a user completes it?
# ideally i would like for the goal to be archived in a users completed list

# for our toy app... we can just pop it out of our array of goals and add the point to our user
# if a goal is a repeat goal it can be completed 5 times befor it is popped off but
# add the value each time

# what is the purpose of a goal
# create a reward system for a user to do good deeds/good habits
# their point value is dependent on whether it is

# future TASKS:

# ON THE USER SIDE
# //////////////////////////////////////
# assign goals to users
# implement popping off completed goals
# receiving the value when completed
# incrementing user points
