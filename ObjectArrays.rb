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