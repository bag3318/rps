NTRY_TO_SYM = { 'p'=>:PAPER, 'r'=>:ROCK, 's'=>:SCISSORS }
VALID_ENTRIES = NTRY_TO_SYM.keys
COMPUTER_CHOICES = NTRY_TO_SYM.values
# WINNERS and LOSERS from the player's perspective, the first value of each
# pair being the player's choice, the second, the computer's choice.
WINNERS = [[:SCISSORS, :PAPER], [:PAPER, :ROCK], [:ROCK, :SCISSORS]]
LOSERS =  WINNERS.map { |i,j| [j,i] }

class RockPaperScissors
  def initialize
    @player_score = @computer_score = @ties = 0
  end
  def play(winning_score)
    while @player_score < winning_score && @computer_score < winning_score
      puts "Player score: #{@player_score}, " + 
           "Computer score: #{@computer_score}, Ties: #{@ties}"
      player = player_choice 
      computer = COMPUTER_CHOICES.sample
      puts "\nPlayer chooses #{player.to_s}"
      puts "Computer chooses #{computer.to_s}"

      case player_outcome [player, computer]
      when :WIN
        puts "#{player.to_s} beats #{computer.to_s}, player wins the round"
        @player_score += 1
      when :LOSE
        puts "#{computer.to_s} beats #{player.to_s}, computer wins the round"
        @computer_score += 1
      else
        puts "Tie, choose again"
        @ties += 1
      end
    end
    puts "\nFinal score: player: #{@player_score}, " +
         "computer: #{@computer_score} (ties: #{@ties})"
    puts (@player_score == 2) ? "Player wins!" : "Yea! Computer wins!"
  end
  private

  def player_choice
    loop do
      print "Choose rock (r), paper (p) or scissors (s): "
      choice = gets.chomp.downcase
      return NTRY_TO_SYM[choice] if NTRY_TO_SYM.key?(choice)
      puts "That entry is invalid. Please re-enter"
    end
  end

  def player_outcome(plays)
    return :WIN  if WINNERS.include?(plays)
    return :LOSE if LOSERS.include?(plays)
    :TIE
  end
end

RockPaperScissors.new.play(3)
