NTRY_TO_SYM = { 'p' => :paper, 'r'=>:rock, 's'=>:scissors }; # define entries
VALID_ENTRIES = NTRY_TO_SYM.keys; # define valid entries
COMPUTER_CHOICES = NTRY_TO_SYM.values; # define computer choices
# WINNERS and LOSERS from the player's perspective, the first value of each
# pair being the player's choice, the second, the computer's choice.
WINNERS = [[:scissors, :paper], [:paper, :rock], [:rock, :scissors]]; # define winners 
LOSERS =  WINNERS.map { |i,j| [j,i] }; # define loosers

class RockPaperScissors # create class: Rock Paper Scissors
  def initialize # define all dynamic variables ...
    @player_score = @computer_score = @ties = 0; # set them = to 0
  end;
  def play(winning_score) # define play method; pass in winning_score
    while @player_score < winning_score && @computer_score < winning_score; # loop through the scores
      puts "Player score: #{@player_score}, " + 
           "Computer score: #{@computer_score}, Ties: #{@ties}"; # output scores
      player = player_choice; # define player variable; chooses user-defined input
      computer = COMPUTER_CHOICES.sample; # define copmuter variable; chooses input randomly
      puts "\nPlayer chooses #{player.to_s}"; # output what the player chooses
      puts "Computer chooses #{computer.to_s}"; # output computer choice

      case player_outcome [player, computer] # add a new case 
      when :WIN # win condition
        puts "#{player.to_s} beats #{computer.to_s}, player wins the round";
        @player_score += 1; # add 1 point to the player
      when :LOSE # lose condition
        puts "#{computer.to_s} beats #{player.to_s}, computer wins the round";
        @computer_score += 1; # add 1 point to the computer
      else # else if it's a tie
        puts "Tie, choose again";
        @ties += 1; # add 1 point to the tie score
      end;
    end;
    puts "\nFinal score: player: #{@player_score}, " +
         "computer: #{@computer_score} (ties: #{@ties})"; # output final scores
    # puts (@player_score == 2) ? "Player wins!" : "Yea! Computer wins!"
    case final_outcome # create a case for final outcome
    when :WIN # when the player's score is > than the computer's score...
      puts "Player wins!"; # tell the user
    when :LOSE # when the player's score is < than the computer's score...
      puts "Computer wins!"; # tell the user
    when :TIE # otherwise (most likely a tie)...
      puts "It's a tie!"; # tell the user
    end;
    return final_outcome; # return the final outcome
  end;
  private; # make private

  def player_choice # define the player's choice
    loop do
      print "Choose rock (r), paper (p) or scissors (s): ";
      choice = gets.chomp.downcase; # define choice variable
      return NTRY_TO_SYM[choice] if NTRY_TO_SYM.key?(choice); # if not one of the valid entries
      puts "That entry is invalid. Please re-enter"; # output this
    end;
  end;

  def player_outcome(plays) # define player outcome
    return :WIN  if WINNERS.include?(plays); # return win condition
    return :LOSE if LOSERS.include?(plays); # return lose condition
    :TIE; # tie
  end;
  def final_outcome # define final outcome method
    return :WIN if @player_score > @computer_score; # return a win if player's score is > than computer's score
    return :LOSE if @player_score < @computer_score; # return a loss if player's score is < than computer's score
    return :TIE if @player_score = @computer_score; # return a tie if player's score is = computer's score
  end;
end;

RockPaperScissors.new.play(3); # play rock paper scissors

=begin

=end
