def get_users
  puts "How many users are playing the game?"
  user_count = gets.chomp.to_i

=begin
  users = {
    "[email address]": [the user obj]
  }

  if a user wants to update their data:
    users[<email address>]
=end

    
  end
  users = Array.new(user_count)
  (0...user_count).each do |player|
    puts "hello what is your name?\n"

    name = gets.chomp
    users[player] = User.new(name)

    (1..3).each do |goal| # This establishes how many
      puts "\nwhat is your goal #{name}?"
      print "goal[#{goal}] TITLE: "
      title = gets.chomp

      print "goal[#{goal}] DESCRIPTION: "
      description = gets.chomp

      goal = Goal.new(title, description)
      users[player] << goal
      puts
    end
  end

  users
end
