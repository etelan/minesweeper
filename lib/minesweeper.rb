require 'terminal-table/import'

=begin
Bomb Totals
Beginner = 10
intermediate = 40
Expert = 99
=end


class Game

  def initialize
    display_board = Board.new
    display_board.set_board(display_board.get_size)

    mine_board = Mine_Board.new
    mine_board.set_board(mine_board.get_size('b'))
  end

end

class Board

  def get_size(answer = nil)

    # Get User Input for Board Size - NEED TO EXTRACT - NEED TO SIZE INSTANCE VARIABLE
    if answer.nil?
      puts "What size do you want?"
      puts "beginner, intermediate, and expert. (b, i, e)"
    end

    (answer.nil?) ? size = gets.chomp : size = answer

    # Puts it out
    return size
  end

  # Keeps our Set_Board DRY
  def board_maker(num1, num2)

    # [num1] x [num2]

    # Return Array Initialize
    array = []

    # Emoji Initialize
    bnk = "\u{2B1C}"
    flg = "\u{1F6A9}"

    # For each number of lines...
    num1.times do |i|

      # Make our line
      line = []
      num2.times do line.push([bnk]) end

      # Push the line
      array.push(line)

      # Add our seperators
      if i != num1-1
        array << :separator
      end
    end

    # RETURN Array
    array

  end

  def set_board(size)
    # Makes our blank 2D array
    array = []

    #Makes based on size
    if size == "b"
      array = board_maker(9, 9)
    elsif size == "i"
      array = board_maker(13, 15)
    elsif size == "e"
      array = board_maker(16, 30)
    end

    # Make our board variable
    board = Terminal::Table.new :rows => array

    # Puts The Board
    puts board

  end
end

class Mine_Board < Board
end

Game.new
