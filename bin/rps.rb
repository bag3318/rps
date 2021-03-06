#!/usr/bin/env ruby

=begin 
|=================================|
| How to Run                      |
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

  class RPS

    module Constants 
      NTRY_TO_SYM = { 
        'p' => :PAPER, 
        'r' => :ROCK, 
        's' => :SCISSORS 
      }; 
      VALID_ENTRIES = NTRY_TO_SYM.keys; 
      COMPUTER_CHOICES = NTRY_TO_SYM.values;
      WINNERS = [
        [:SCISSORS, :PAPER], 
        [:PAPER, :ROCK], 
        [:ROCK, :SCISSORS]
      ]; # format: player choice, computer choice
      LOSERS = WINNERS.map { |i,j| [j,i] }; # this will take the original WINNERS array and flip the symbols, thus returning a loss for the user/player
      INIT_STRINGS = [
        "You are about to enter a rock-paper-scissors best of 3 match.", 
        "Press the return/enter key to continue...", 
        ""
      ];
    end;

    class RockPaperScissors 
      class << self
        def continue(str1, str2, str3)
          puts  str1; 
          print str2;
          gets; 
          puts  str3;
        end; 
      end; 
      continue(Constants::INIT_STRINGS[0], Constants::INIT_STRINGS[1], Constants::INIT_STRINGS[2]);
      def initialize
        @player_score = @computer_score = @ties = 0; 
      end; 
      def play(winning_score) 
        while @player_score < winning_score && @computer_score < winning_score 
          puts "Player score: #{@player_score}, " + 
               "Computer score: #{@computer_score}, Ties: #{@ties}"; 
          player = PrivateVars.player_choice; 
          computer = Constants::COMPUTER_CHOICES.sample; 
          puts "\nPlayer chooses #{player.to_s.downcase}"; 
          puts "Computer chooses #{computer.to_s.downcase}";
          case PrivateVars.player_outcome [player, computer] 
          when :WIN
            puts "#{player.to_s.capitalize} beats #{computer.to_s.downcase}, player wins the round"; 
            @player_score += 1;
          when :LOSE
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
              return Constants::NTRY_TO_SYM[choice] if Constants::NTRY_TO_SYM.key?(choice); 
              puts "That entry is invalid. Please re-enter"; 
            end; 
          end; 
          def player_outcome(plays)
            return :WIN  if Constants::WINNERS.include?(plays);
            return :LOSE if Constants::LOSERS.include?(plays);
            return :TIE  if (!:WIN || !:LOSE);
          end; 
          def final_outcome(pl, co) 
            return :WIN  if pl > co; 
            return :LOSE if pl < co;
            return :TIE  if pl = co; 
          end; 
        end;
      end;
    end;
  end;
end; 

Master::RPS::RockPaperScissors.new.play(3); # best of 3

