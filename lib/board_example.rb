# Make our Array
@rows = []
@rows << ['basic']
@rows << :separator
@rows << ['table']

# Make our board variable
@initial_board = Terminal::Table.new :rows => @rows

# Puts
system 'clear'
puts @initial_board
