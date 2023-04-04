class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose
    @lives -= 1
  end
end

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
    @game_over = false
  end

  def start_game
    while !@game_over do
      generate_question
      answer = gets.chomp.to_i
      check_answer(answer)
      switch_player
    end
    winner
  end

  def generate_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    puts "#{@current_player.name}: What is #{@num1} plus #{@num2}?"
  end

  def check_answer(answer)
    if answer == @num1 + @num2
      puts "#{@current_player.name}: Yes! You are correctly!"
    else
      puts "#{@current_player.name}: seriously! no!"
      @current_player.lose
    end
    
    puts "Scores: p1: #{@player1.lives}/3 vs p2: #{@player2.lives}/3"
    puts "-----NEW TURN-----"
    
    if @current_player.lives == 0
      @game_over = true
    end
  end

  def switch_player
    if @current_player ==@player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def winner
    if @player1.lives > 0
      winner = @player1
    else
      winner = @player2
    end
    puts "#{winner.name} wins with a score of #{winner.lives}/3."
    puts "----- GAME OVER -----"
  end
end


game = Game.new
game.start_game