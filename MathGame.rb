class MathGame
  def self.main
    game = MathGame.new
    game.start
  end

  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @current_player = 0
  end

  def current_player
    @players[@current_player]
  end

  def start
    #greet_players
    until game_over? do
      #puts "Are you ready #{current_player.name}?"
      # TODO ask a question and only subtract point if incorrect
      @players.each do |player|
        question = Question.new
        puts "what is #{question.number_1} + #{question.number_2}"
        if gets.chomp == question.answer.to_s
          puts "You are correct"
        else
          puts "Wrong answer"
          subtract_point
        end
        swap_players
        print_scores


      end
      if @players[0].points <= 0 && @players[1].points <=0
        puts "Its a draw"
      elsif @players[0].points <= 0
        puts "Player 1 looses"
      else @players[1].points <= 0
        puts "Player 2 looses"
      end
    end
    puts "Good bye!"
  end

  def game_over?

    @players.any? { |player| player.points <= 0 }
  end

  def subtract_point
    current_player.subtract_point
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def greet_players
    @players.each do |player|
      puts "Hello #{player.name}"
      puts 'Would you like to change your name? (y/N) '
      if gets.chomp == 'y'
        puts 'Enter your new name: '
        player.name = gets.chomp
        puts "Your new name is: #{player.name}"
      end
    end
  end

   def print_scores
    @players.each do |player|
      puts "#{player.name} has #{player.points} points"
    end
  end

end