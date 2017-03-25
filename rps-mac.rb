#!/usr/bin/env ruby

class Master # create master class

  NTRY_TO_SYM = { 'p' => :PAPER, 'r' => :ROCK, 's' => :SCISSORS }; # define entries to symbol
  VALID_ENTRIES = NTRY_TO_SYM.keys; # define valid entries
  COMPUTER_CHOICES = NTRY_TO_SYM.values; # define computer choices
  # WINNERS and LOSERS from the player's perspective, the first value of each
  # pair being the player's choice, the second, the computer's choice.
  WINNERS = [[:SCISSORS, :PAPER], [:PAPER, :ROCK], [:ROCK, :SCISSORS]]; # define winners 
  LOSERS = WINNERS.map { |i,j| [j,i] }; # define losers

  # `LOSERS = WINNERS.map { |i,j| [j,i] };`
  # What this means:
  # The .map is used to create an array based off of the original (which is the `WINNERS` array in this case), though with modified values.
  # So `i` means the player's choice, and `j` means the computers choice. 
  # Thus when we do `[j,i]`, we flip the symbols and switch the outcome

  class RockPaperScissors # create class: Rock Paper Scissors
    def self.continue(str1, str2) # define self function continue; pass in str1 and str2
      puts str1; # print str1
      puts str2; # print str2
      gets; # press any key to continue
    end; # end `continue` method
    continue("You are about to enter a rock-paper-scissors best of 3 match.", "Press any key to continue..."); # call continue method while passing in these 2 strings
    def initialize # define all dynamic variables ...
      @player_score = @computer_score = @ties = 0; # set them = to 0
    end; # end initialize
    def play(winning_score) # define play method; pass in winning_score
      while @player_score < winning_score && @computer_score < winning_score # loop through the scores
        puts "Player score: #{@player_score}, " + 
             "Computer score: #{@computer_score}, Ties: #{@ties}"; # output scores
        player = player_choice; # define player variable; chooses user-defined input
        computer = COMPUTER_CHOICES.sample; # define copmuter variable; chooses input randomly
        puts "\nPlayer chooses #{player.to_s.downcase}"; # output what the player chooses
        puts "Computer chooses #{computer.to_s.downcase}"; # output computer choice

        case player_outcome [player, computer] # add a new case 
        when :WIN # win condition
          puts "#{player.to_s.downcase} beats #{computer.to_s.downcase}, player wins the round";
          @player_score += 1; # add 1 point to the player
        when :LOSE # lose condition
          puts "#{computer.to_s.downcase} beats #{player.to_s.downcase}, computer wins the round";
          @computer_score += 1; # add 1 point to the computer
        else # else if it's a tie
          puts "Tie, choose again";
          @ties += 1; # add 1 point to the tie score
        end; # end case statement
      end; # end while loop
      puts "\nFinal score: player: #{@player_score}, " +
           "computer: #{@computer_score} (ties: #{@ties})"; # output final scores
      # puts (@player_score == 2) ? "Player wins!" : "Yea! Computer wins!"
      case final_outcome # create a case for final outcome
      when :WIN # when the player's score is > than the computer's score...
        puts "Player wins!"; # tell the user
      when :LOSE # when the player's score is < than the computer's score...
        puts "Computer wins!"; # tell the user
      else # otherwise (most likely a tie)...
        puts "It's a tie!"; # tell the user
      end; # end case statement
      return final_outcome; # return the final outcome
    end; # end play method
    private # make private

    def player_choice # define the player's choice
      loop do
        print "Choose rock (r), paper (p) or scissors (s): ";
        choice = gets.chomp.downcase; # define choice variable
        return NTRY_TO_SYM[choice] if NTRY_TO_SYM.key?(choice); # if not one of the valid entries
        puts "That entry is invalid. Please re-enter"; # output this
      end; # end loop do
    end; # end play_choice

    def player_outcome(plays) # define player outcome
      return :WIN  if WINNERS.include?(plays); # return win condition
      return :LOSE if LOSERS.include?(plays); # return lose condition
      :TIE; # tie
    end; # end player outcome method
    def final_outcome # define final outcome method
      return :WIN if @player_score > @computer_score; # return a win if player's score is > than computer's score
      return :LOSE if @player_score < @computer_score; # return a loss if player's score is < than computer's score
      return :TIE if @player_score = @computer_score; # return a tie if player's score is = computer's score
    end; # end final_outcome
  end; # end rock paper scissors class
end; # end master class

Master::RockPaperScissors.new.play(3); # play rock paper scissors, best out of 3

=begin
|=======================================|
| ORIGINAL CODE:                        |
|---------------------------------------|
| http://stackoverflow.com/a/26395899   |
|_______________________________________|
=end

