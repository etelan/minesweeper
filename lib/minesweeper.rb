require 'terminal-table/import'

=begin
Bomb Totals
Beginner = 10
intermediate = 40
Expert = 99
=end


class Minesweeper

  def get_size
    # Make a blank table for us
    puts "What size do you want?"
    puts "beginner, intermediate, and expert. (b, i, e)"
    answer = gets.chomp

    # Switch statement for our size
    if answer == "b"
      size = "beginner"
    elsif answer == "i"
      size = "intermediate"
    elsif answer == "e"
      size = "expert"
    end

    # Puts it out
    return size
  end

  # Keeps our Set_Board DRY
  def make_board(num1, num2)

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
    @Player_Array = []


    #Makes based on size
    if size == "beginner"
      @Player_Array = make_board(9, 9)
    elsif size == "intermediate"
      @Player_Array = make_board(13, 15)
    elsif size == "expert"
      @Player_Array = make_board(16, 30)
    end


    # Make our board variable
    @player_board = Terminal::Table.new :rows => @Player_Array

    # Puts
    #system 'clear'
    puts @player_board
  end
end

yours = Minesweeper.new
yours.set_board(yours.get_size)
