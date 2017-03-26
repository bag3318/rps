module PlayRPS
  class << self # nest a self defined class
    def continue(str1, str2) # define self function continue; pass in str1 and str2
      puts str1; # print string1
      print str2; # print string2
      gets; # press the return key to continue
    end; # end `continue` method
  end; # end self class
  continue(ObjectArrays::STRINGS[0], ObjectArrays::STRINGS[1]); # call continue method while passing in these 2 strings
  def initialize # define all dynamic variables ...
    @player_score = @computer_score = @ties = 0; # set them all = to 0
  end; # end initialize
  def self.play(winning_score) # define play method; pass in winning_score
    while @player_score < winning_score && @computer_score < winning_score # loop through the scores
      puts "Player score: #{@player_score}, " + 
           "Computer score: #{@computer_score}, Ties: #{@ties}"; # output scores
      player = PrivateVars.player_choice; # define player variable; chooses user-defined input
      computer = ObjectArrays::COMPUTER_CHOICES.sample; # define copmuter variable; chooses input randomly
      puts "\nPlayer chooses #{player.to_s.downcase}"; # output what the player chooses
      puts "Computer chooses #{computer.to_s.downcase}"; # output computer choice
      case PrivateVars.player_outcome [player, computer] # add a new case 
      when :WIN # win condition
        puts "#{player.to_s.capitalize} beats #{computer.to_s.downcase}, player wins the round"; # tell the user
        @player_score += 1; # add 1 point to the player
      when :LOSE # lose condition
        puts "#{computer.to_s.capitalize} beats #{player.to_s.downcase}, computer wins the round"; # tell the user
        @computer_score += 1; # add 1 point to the computer
      else # else if it's a tie
        puts "Tie, choose again"; # tell the user
        @ties += 1; # add 1 point to the tie score
      end; # end case statement
    end; # end while loop
    puts "\nFinal score: player: #{@player_score}, " +
         "computer: #{@computer_score} (ties: #{@ties})"; # output final scores
    case PrivateVars.final_outcome(@player_score, @computer_score) # create a case for final outcome
    when :WIN # when the player's score is > than the computer's score...
      puts "Player wins!"; # tell the user
    when :LOSE # when the player's score is < than the computer's score...
      puts "Computer wins!"; # tell the user
    else # otherwise (most likely a tie)...
      puts "It's a tie!"; # tell the user
    end; # end case statement
  end; # end play method
end;