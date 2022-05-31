#
# This modules contains methods to manipulate
# a string as a 2 dimensional square matrix
#
#
module MatrixManipulator

  MATRIX_SIZE = 5

  #
  # extract the i-th column
  #
  def column(i, arr = self.current)
    (0...MATRIX_SIZE).inject('') { |sum, n| sum + arr[MATRIX_SIZE * n + i] }
  end

  #
  # extract the i-th line
  #
  def line(i, arr = self.current)
    (0...MATRIX_SIZE).inject('') { |sum, n| sum + arr[5 * i + n] }
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
