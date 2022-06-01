# frozen_string_literal: true

#
# This modules contains methods to manipulate
# a string as a 2 dimensional square matrix
# and perform transformations on columns and lines like they were simple stacks
#
module MatrixManipulator
  MATRIX_SIZE = 5


  #
  # extract the i-th column
  #
  def column(index, matrix = current)
    (0...MATRIX_SIZE).inject('') { |sum, n| sum + matrix[(MATRIX_SIZE * n) + index] }
  end

  #
  # extract the i-th line
  #
  def line(index, matrix = current)
    (0...MATRIX_SIZE).inject('') { |sum, n| sum + matrix[(5 * index) + n] }
  end

  #
  # transpose a matrix
  #
  def transpose
    r = ''
    lines = current.scan(/.{#{MATRIX_SIZE}}/)
    lines.size.times do |n|
      lines.each do |l|
        r += l[n]
      end
    end
    self.current = r
  end

  #
  # offsets all elements in the line to the left
  #
  def shift_row_left(line_index)
    r = ''
    MATRIX_SIZE.times do |i|
      if i == line_index
        transform = line(line_index).chars
        transform = transform.push(transform.shift).join
        r += transform
      else
        r += line(i)
      end
    end
    self.current = r
  end

  #
  # offsets all elements in the line to the right
  #
  def shift_row_right(line_index)
    r = ''
    MATRIX_SIZE.times do |i|
      if i == line_index
        transform = line(line_index).chars
        transform = transform.unshift(transform.pop).join
        r += transform
      else
        r += line(i)
      end
    end
    self.current = r
  end

  #
  # offsets all elements in the column upward
  # it calls shift_line between 2 transpositions
  #
  def shift_column_up(column_index)
    transpose
    shift_row_left(column_index)
    transpose
  end

  def shift_column_down(column_index)
    transpose
    shift_row_right(column_index)
    transpose
  end
end
