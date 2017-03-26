private # make the rest private
module PrivateVars
  class << self
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
  end;
end;