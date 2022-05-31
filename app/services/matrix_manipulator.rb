module MatrixManipulator

  MATRIX_SIZE = 5

  def column(col_index, arr = self.current)
    r = ''
    MATRIX_SIZE.times { |t| r += arr[5 * t + col_index] }
    r
  end

  def line(line_index, arr = self.current)
    r = ''
    MATRIX_SIZE.times { |t| r += arr[5 * l + t] }
    r
  end
end
