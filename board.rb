class Board
  attr_accessor :all_coordinates, :board

  def initialize
    @board = create_board
  end

  def create_board
    board = []
    8.times { board.push([]) }
    board.each { |row| 8.times { row.push('[ ]') } }
  end

  def to_s
    string = ""
    string.concat("   1  2  3  4  5  6  7  8\n")
    @board.each_with_index do |row, index|
      string.concat("#{index + 1} ")
      row.each do |square|
        string.concat(square)
      end
      string.concat("\n")
    end
    string
  end
end
