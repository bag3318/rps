#!/usr/bin/env ruby

=begin
|=====================================|
| Code to English Comments Available  |
|-------------------------------------|
| Key:                                |
|-------------------------------------|
| # = comment in ruby                 |
|_____________________________________|
=end

class Master # create master class
  
  module ObjectArrays # create new module
    NTRY_TO_SYM = { 'p' => :PAPER, 'r' => :ROCK, 's' => :SCISSORS }; # define entries to symbol
    VALID_ENTRIES = NTRY_TO_SYM.keys; # define valid entries
    COMPUTER_CHOICES = NTRY_TO_SYM.values; # define computer choices
    # WINNERS and LOSERS from the player's perspective, the first value of each
    # pair being the player's choice, the second, the computer's choice.
    WINNERS = [[:SCISSORS, :PAPER], [:PAPER, :ROCK], [:ROCK, :SCISSORS]]; # define winners 
    LOSERS = WINNERS.map { |i,j| [j,i] }; # define losers
    STRINGS = ["You are about to enter a rock-paper-scissors best of 3 match.", "Press the return key to continue..."]; # create a strings array for later use
  end; # end module

  class RockPaperScissors # create class: Rock Paper Scissors
    class << self # nest a self defined class
      def continue(str1, str2) # define self function continue; pass in str1 and str2
        puts str1; # print string1
        puts str2; # print string2
        gets; # press any key to continue
      end; # end `continue` method
    end; # end self class
    continue(ObjectArrays::STRINGS[0], ObjectArrays::STRINGS[1]); # call continue method while passing in these 2 strings
    def initialize # define all dynamic variables ...
      @player_score = @computer_score = @ties = 0; # set them all = to 0
    end; # end initialize
    def play(winning_score) # define play method; pass in winning_score
      while @player_score < winning_score && @computer_score < winning_score # loop through the scores
        puts "Player score: #{@player_score}, " + 
             "Computer score: #{@computer_score}, Ties: #{@ties}"; # output scores
        player = player_choice; # define player variable; chooses user-defined input
        computer = ObjectArrays::COMPUTER_CHOICES.sample; # define copmuter variable; chooses input randomly
        puts "\nPlayer chooses #{player.to_s.downcase}"; # output what the player chooses
        puts "Computer chooses #{computer.to_s.downcase}"; # output computer choice
        case player_outcome [player, computer] # add a new case 
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
      case final_outcome(@player_score, @computer_score) # create a case for final outcome
      when :WIN # when the player's score is > than the computer's score...
        puts "Player wins!"; # tell the user
      when :LOSE # when the player's score is < than the computer's score...
        puts "Computer wins!"; # tell the user
      else # otherwise (most likely a tie)...
        puts "It's a tie!"; # tell the user
      end; # end case statement
    end; # end play method
    
    private # make the rest private

    def player_choice # define the player's choice
      loop do
        print "Choose rock (r), paper (p) or scissors (s): ";
        choice = gets.chomp.downcase; # define choice variable
        return ObjectArrays::NTRY_TO_SYM[choice] if ObjectArrays::NTRY_TO_SYM.key?(choice); # if not one of the valid entries
        puts "That entry is invalid. Please re-enter"; # output this
      end; # end loop do
    end; # end play_choice

    def player_outcome(plays) # define player outcome
      return :WIN  if ObjectArrays::WINNERS.include?(plays); # return win condition
      return :LOSE if ObjectArrays::LOSERS.include?(plays); # return lose condition
      :TIE; # tie
    end; # end player outcome method
    def final_outcome(pl, co) # define final outcome method
      return :WIN if pl > co; # return a win if player's score is > than computer's score
      return :LOSE if pl < co; # return a loss if player's score is < than computer's score
      return :TIE if pl = co; # return a tie if player's score is = computer's score
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




