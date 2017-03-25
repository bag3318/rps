def computer_input
  computer = rand(3)
  if computer == 0
    computer = "p"
  elsif computer == 1
    computer = "r"
  else
    computer = "s"
  end
end

def player_input
  if player == "r"
    player = "r"
  elsif player == "p"
    player = "p"
  else player == "s"
    player = "s"
  end
end

while true

  puts "Player Score: #{$player_count}, \tComputer Score: #{$computer_count}"

  puts "Choose rock (r), paper (p), or scissors (s) "

  player_input = gets.chomp

  if player_input == "r" && computer_input == "s"
    puts "Player chose rock. \nComputer chose scissors."
    puts "Rock beats scissors, player wins the round."
    $player_count += 1

  elsif player_input == "s" && computer_input == "p"
    puts "Player chose scissors. \nComputer chose paper."
    puts "Scissors beat paper, player wins the round."
    $player_count += 1

  elsif player_input == "p" && computer_input == "r"
    puts "Player chose paper. \nComputer chose rock"
    puts "Paper beats rock, player wins the round."
    $player_count += 1

  elsif computer_input == "r" && player_input == "s"
    puts "Player chose scissors. \nComputer chose rock."
    puts "Rock beats scissos, Computer wins the round"
    $computer_count += 1

  elsif computer_input == "s" && player_input == "p"
    puts "Player chose paper. \nComputer chose scissors."
    puts "Scissors beats paper, Computer wins the round"
    $computer_count += 1

  elsif computer_input == "p" && player_input == "r"
    puts "Player chose rock. \nComputer chose paper."
    puts "Paper beats rock, Computer wins the round"
    $computer_count += 1

  elsif player_input == computer_input
    puts "Tie, go again!"

  else
    puts "Invalid Entry"
  end

  if $player_count == 2
    puts "Player wins!"
    break
  elsif $computer_count == 2
    puts "Computer wins!"
    break
  end
end;