class TicTacToe
  def initialize(board)
    @board = board
    @height = board.length
    @width = board[0].length
  end

  def check_rows
    row = 0
    while row < @height
      col = 0
      val = @board[row][col]
      while col <= @width
        # if col == width, we've match all values in the column
        return val if val != " " && col == @width
        break if col == @width || @board[row][col] != val
        col += 1
      end
      row += 1
    end
    return nil
  end

  def check_cols
    col = 0
    while col < @width
      row = 0
      val = @board[row][col]
      while row <= @height
        # if row == height, we've match all values in the column
        return val if val != " " && row == @height
        break if row == @height || @board[row][col] != val
        row += 1
      end
      col += 1
    end
    return nil
  end

  def check_forward_diagonal
    row = @height - 1
    col = 0
    val = @board[row][col]
    while row >= 0
      break if @board[row][col] != val
      # we've matched the diagonal
      return val if val != " " && col == @width - 1
      col += 1
      row -= 1
    end
    return nil
  end

  def check_back_diagonal
    row = 0
    col = 0
    val = @board[0][0]
    while row <= @height
      # we've matched the diagonal
      return val if val != " " && row == @height
      break if row == @height || @board[row][col] != val
      col += 1
      row += 1
    end
    return nil
  end

  def check_for_draw
    @board.each do |row|
      row.each do |val|
        return 'unfinished' if val == " "
      end
    end
    return 'draw'
  end

  def winner
    rowWin = check_rows()
    if rowWin
      return rowWin
    else
      colWin = check_cols()
      if colWin
        return colWin
      else
        forward_diag = check_forward_diagonal()
        if forward_diag
          return forward_diag
        else
          back_diag = check_back_diagonal()
          return back_diag ? back_diag : check_for_draw()
        end
      end
    end
  end

end
