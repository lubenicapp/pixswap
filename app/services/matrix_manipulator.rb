module MatrixManipulator

  MATRIX_SIZE = 5

  def column(col_index, arr = self.current)
    r = ''
    MATRIX_SIZE.times { |t| r += arr[5 * t + col_index] }
    r
  end

  def line(line_index, arr = self.current)
    r = ''
    MATRIX_SIZE.times { |t| r += arr[5 * line_index + t] }
    r
  end

  def shift_line_left(line_index)
    r = ''
    MATRIX_SIZE.times do |i|
      if i == line_index
        transform = line(line_index).split('')
        transform = transform.push(transform.shift).join('')
        r += transform
      else
        r += line(i)
      end
    end
    self.current = r
  end

  def shift_line_right(line_index)
    r = ''
    MATRIX_SIZE.times do |i|
      if i == line_index
        transform = line(line_index).split('')
        transform = transform.unshift(transform.pop).join('')
        r += transform
      else
        r += line(i)
      end
    end
    self.current = r
  end

end
