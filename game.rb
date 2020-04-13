=begin
  users = {
    "[email address]": [the user obj]
  }
  # this users variable will be a hash with a key value pair of
  # { email => user_object }
  
  the user's goals variable:
  goals = {
    1: [goal obj],
    2: [goal obj],
    3: [goal obj],
    4: [goal obj],
    5: [goal obj]
  }

  possible change to
  goals = {
    title: [goal obj],
    title: [goal obj],
    title: [goal obj],
    title: [goal obj],
    title: [goal obj]
  }

  if a user wants to update their data:
    curr_user = users[<email address>]
    goal = curr_user.goals[<goal id>]
=end
require "./user"
require "./goal"
require "pry-byebug"

class Game
  class << self # Opening the current class (eigen class)
    attr_reader :users

    # @users = {} # Users will be a hash with email as the key and a user object as the value. {:email => :user_obj }
    # SUCCESS: STILL NEEDS TESTING ALONG SIDE OTHER FUNCTIONS
    def get_users
      @users = {}

      puts "How many users are playing the game?"
      user_count = gets.chomp.to_i

      (0...user_count).each do |player| # This creates a range from 0 to our amount of employees
        puts "hello what is your name?\n"
        name = gets.chomp

        puts "what is your email"
        email = gets.chomp

        users[email] = User.new(name, email) # this is where we create our key value pair  {:email => :user_obj }

        (1..1).each do |i| # This establishes how many goals to enter
          puts "\nwhat is your goal #{name}?"
          print "goal[#{i}] TITLE: "
          title = gets.chomp

          print "goal[#{i}] DESCRIPTION: "
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
          users[email].goals[title] = goal
          # This should return back to us a hash
          # with email as key and user as value
          # User has a attribute of goal
        end
      end # Perhaps we can encapsulate these loops

      # Print all goals
      # Eventually for each user (currently shooting for one good print)
      # users is currently a hash with a key value pair of {:user_email => :user_object}
      puts users.values
      users
      # this will need to return our list of users at the end of the operation
    end

    # SUCCESS: NEED TO TEST THE LOOPING FUNCTIONALITY
    # after I execute one goal can I do anything else
    def menu
      # puts "#" * 160
      # puts "%68s" % "#{"#" * 10}" + " What's the next move " + "#{"#" * 10}\n\n"
      # puts "%70s" % "#{"#" * 10}" + " 1)Execute a Goal " + "#{"#" * 10}"
      # puts "%70s" % "#{"#" * 10}" + " 2)Check Goals \s\s\s" + "#{"#" * 10}"
      # puts "%70s" % "#{"#" * 10}" + " 3)Check Score \s\s\s" + "#{"#" * 10}"
      # puts "%70s" % "#{"#" * 10}" + " 4)Decide Winner \s" + "#{"#" * 10}"
      # puts "#" * 160 + "\n\n"
      puts [
        "#" * 160,
        "%73s" % "#{"#" * 10} What's the next move #{"#" * 10}\n\n",
        "%70s" % "#{"#" * 10} 1)Execute a Goal \s#{"#" * 10}",
        "%70s" % "#{"#" * 10} 2)Check Goals \s\s\s #{"#" * 10}",
        "%70s" % "#{"#" * 10} 3)Check Score \s\s\s #{"#" * 10}",
        "%70s" % "#{"#" * 10} 4)Add Goal \s\s\s\s\s\s #{"#" * 10}",
        "%70s" % "#{"#" * 10} 5)Decide Winner \s #{"#" * 10}",
        "#{"#" * 160} \n\n",
      ].join("\n")

      selection = gets.chomp
    end

    def game_engine
      # ask for users
      # generate menu
        # make selection
        # execute action
      # repeat til q
      get_users
      selection = ""
      while selection != "q" && selection != "Q"
        selection = menu
        select(selection)
      end
      
    end
  end             # all instance methods within are defined as class methods

  # I want to set up a list of users here
  def self.get_users_testing_suite
    goals = [
      ["Become Infinite", "Meditate for 5 mins daily"],
      ["Get Money", "Find the other stream of Revenue. Side Hussle"],
      ["Make sure you find your flow state daily", "Do something that challenges you as well as taps into your creativity"],
      ["Finish Goals Game", "Get Assistance From Wasif"],
      ["Finish Rails App", "Find a way to deploy"],
    ]
    goals = goals.map { |goal| [goal[0], Goal.new(goal[0], goal[1])] }.to_h

    # when code reviewing, critique and improve:
    # * simplicity - can i quickly understand this? (ideally code should be concise while maintaining readability)
    # * variable names. are they meaningful?
    # * DRYness - spot repeated code and consolidate
    # * make code extendable

    # goal_1 = Goal.new("Become Infinite", "Meditate for 5 mins daily")
    # goal_2 = Goal.new("Get Money", "Find the other stream of Revenue. Side Hussle")
    # goal_3 = Goal.new("Make sure you find your flow state daily", "Do something that challenges you as well as taps into your creativity")
    # goal_4 = Goal.new("Finish Goals Game", "Get Assistance From Wasif")
    # goal_5 = Goal.new("Finish Rails App", "Find a way to deploy")
    # goals = { goal_1.title => goal_1, goal_2.title => goal_2, goal_3.title => goal_3, goal_4.title => goal_4, goal_5.title => goal_5 }
    # Assign it to a User
    carlo = User.new("Carlo", "antcs07@gmail.com", goals)
    users = { carlo.email => carlo }
  end

  # Work on case 2 and 3
  def self.select(case_selected)
    case case_selected.to_i
    when 1
      prompt_goal_execution_sequence
    when 2
      prompt_goal_check_sequence
    when 3
      prompt_score_board_sequence
    when 4
      prompt_add_goal_sequence
    when 5
      decide_winner
    else
      puts "Leaving the game?"
    end
  end

  # SUCCESS: I would like to show all the users goals after entering
  #          which email/user to execute a goal for
  def self.prompt_goal_execution_sequence
    # 1. gets from the terminal the user email
    # 2. get the User obj from the hash
    # 3. gets from the terminal the goal title
    # 4. gets the Goal obj from the goals hash
    # 5. execute goal
    puts "What email will we be executing the sequence?"
    email = gets.chomp

    # LIST GOALS OF EMAIL USER HERE

    puts "What is the goal you would like to execute?"
    goal_title = gets.chomp

    users[email].execute_goal(goal_title)
    puts users[email]
    # users[email]
    # puts what is the email of the current user
  end

  def self.prompt_goal_check_sequence
    puts users.values
    gets.chomp
  end

  def self.prompt_score_board_sequence
    puts users.values
    gets.chomp
  end

  def self.prompt_add_goal_sequence
    puts "What email will we be executing the sequence?"
    email = gets.chomp

    users[email].add_goal
    puts users[email]
  end

  # How do we decide the end of the game
  # We should filter through all users and see who has
  # the highest point value

  # STILL NEEDS ATTENTION
  def self.decide_winner # we will pass in our hash of users
    winner_score = ["", 0]      # users hash {:user_email => :user_object}
    # puts "Users: #{users.values}"
    users.each do |user_id, user|
      # if statement to update winner_score
      if user.points > winner_score[1]
        winner_score[0] = user.name               { "var": "value"}
        winner_score[1] = user.points
      end
      puts user
    end

    users.each do |user_id, user|
      puts "Name: #{user.name}, Email: #{user.email}, Points: #{user.points}"
    end
    puts "\nThe winner is #{winner_score[0]}"
  end
end

# puts Game.decide_winner(all_users)

# accept user input with email
# store the email in the user object
# store the user hash's key to be an

# USERS: {email =>}
# {"antcs07@gmail.com"=>
#   User:
#     @name="Carlo",
#     @goals={
#            1=>Goal:0x00007fa83304a168 @title="goal one", @description="goal desc", @type="repeat", @category="solo", @points=50, @status="incomplete">,
#            2=><Goal:0x00007fa833049e20 @title="goal 2", @description="goal desc", @type="repeat", @category="solo", @points=50, @status="incomplete">},
#     @email="antcs07@gmail.com",
#      @points=48>}

# USER: [:email, :user]
# ["antcs07@gmail.com",
#   <User: @name="Carlo",
#          @goals=
#           { 1=><Goal: @title="Write an app a day", @description="anything as simple as a console app", @type="repeat", @category="solo", @points=50, @status="incomplete">,
#             2=><Goal: @title="turn up you curiosity", @description="look into everything. Hunger for more.", @type="repeat", @category="solo", @points=50, @status="incomplete">},
#             @email="antcs07@gmail.com",
#             @points=47>]
