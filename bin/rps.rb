#!/usr/bin/env ruby

=begin 
|=================================|
| To run                          |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
| Mac                             |
|---------------------------------|
| $ ruby ~/Desktop/rps/bin/rps.rb |
|*********************************|
| Windows                         |     
|---------------------------------|         
| > CD Desktop/rps/bin            |
| > rps.rb                        |
|_________________________________|
=end

class Master 

  module ObjectArrays 
    NTRY_TO_SYM = { 'p' => :PAPER, 'r' => :ROCK, 's' => :SCISSORS }; 
    VALID_ENTRIES = NTRY_TO_SYM.keys; 
    COMPUTER_CHOICES = NTRY_TO_SYM.values;
    WINNERS = [[:SCISSORS, :PAPER], [:PAPER, :ROCK], [:ROCK, :SCISSORS]]; # format: player choice, computer choice
    LOSERS = WINNERS.map { |i,j| [j,i] }; # this will take the original WINNERS array and flip the symbols, thus returning a loss for the user/player
    STRINGS = ["You are about to enter a rock-paper-scissors best of 3 match.", "Press the return key to continue..."];
  end;

  class RockPaperScissors 
    class << self
      def continue(str1, str2)
        puts str1; 
        print str2;
        gets; 
      end; 
    end; 
    continue(ObjectArrays::STRINGS[0], ObjectArrays::STRINGS[1]);
    def initialize
      @player_score = @computer_score = @ties = 0; 
    end; 
    def play(winning_score) 
      while @player_score < winning_score && @computer_score < winning_score 
        puts "Player score: #{@player_score}, " + 
             "Computer score: #{@computer_score}, Ties: #{@ties}"; 
        player = PrivateVars.player_choice; 
        computer = ObjectArrays::COMPUTER_CHOICES.sample; 
        puts "\nPlayer chooses #{player.to_s.downcase}"; 
        puts "Computer chooses #{computer.to_s.downcase}";
        case PrivateVars.player_outcome [player, computer] 
        when :WIN
          puts "#{player.to_s.capitalize} beats #{computer.to_s.downcase}, player wins the round"; 
          @player_score += 1;
        when :LOSE1
          puts "#{computer.to_s.capitalize} beats #{player.to_s.downcase}, computer wins the round";
          @computer_score += 1; 
        else 
          puts "Tie, choose again"; 
          @ties += 1;
        end;
      end;
      puts "\nFinal score: player: #{@player_score}, " +
           "computer: #{@computer_score} (ties: #{@ties})"; 
      case PrivateVars.final_outcome(@player_score, @computer_score)
      when :WIN 
        puts "Player wins!"; 
      when :LOSE
        puts "Computer wins!";
      else 
        puts "It's a tie!"; 
      end; 
      puts "";
      gets;
    end; 
    private 
    module PrivateVars
      class << self
        def player_choice
          loop do
            print "Choose rock (r), paper (p) or scissors (s): ";
            choice = gets.chomp.downcase;
            return ObjectArrays::NTRY_TO_SYM[choice] if ObjectArrays::NTRY_TO_SYM.key?(choice); 
            puts "That entry is invalid. Please re-enter"; 
          end; 
        end; 

        def player_outcome(plays)
          return :WIN  if ObjectArrays::WINNERS.include?(plays);
          return :LOSE if ObjectArrays::LOSERS.include?(plays); 
          :TIE; 
        end; 
        def final_outcome(pl, co) 
          return :WIN if pl > co; 
          return :LOSE if pl < co;
          return :TIE if pl = co; 
        end; 
      end;
    end;
  end;
end; 

Master::RockPaperScissors.new.play(3);

