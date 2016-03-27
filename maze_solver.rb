class MazeSolver

  def initialize(maze_file_name)
    maze_lines = File.readlines(maze_file_name)
    @maze = maze_lines.map{|line| line.chomp.split('')}
    @start = find_char('S')
    @finish = find_char('E')
    @seen_pos = {}
  end

  attr_reader :seen_pos

  def find_char(char)
    @maze.each_index do |i|
      @maze[i].each_index do |j|
        return [i,j] if self[i,j] == char
      end
    end
  end

  def [](x,y)
    @maze[x][y]
  end

  def get_valid_moves(x,y)
    result = []
    move = [1,-1]
    move.each do |i|
      x_move = [x+i, y]
      y_move = [x, y + i]
      result << x_move unless self[*x_move] == '*' || @seen_pos.include?(x_move)
      result << y_move unless self[*y_move] == '*' || @seen_pos.include?(y_move)
    end
    result
  end

  def shortest_path
    path = [@finish]
    next_node = @seen_pos[@finish]
    until next_node.nil?
      path << next_node
      next_node = @seen_pos[next_node]
    end
    path
  end

  def run
    pos = @start
    @seen_pos[pos] = nil
    path_finder(get_valid_moves(*pos),pos)
    # until moves.include?(@finish)
    #   moves = get_valid_moves(*pos)
    #   moves.each do |move|
    #     @seen_pos[move] = pos
    #   end
    #Replace with recursive function terminating with finish
    p shortest_path
  end

  def path_finder(moves,start_pos)
    if moves.include?(@finish)
      @seen_pos[@finish] = start_pos
      return nil
    end
    moves.each do |move|
      @seen_pos[move] = start_pos
      path_finder(get_valid_moves(*move),move)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  a = MazeSolver.new('maze1.txt')
  a.run
end
