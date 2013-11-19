# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE
  #check for sane parameters
  #figured out the first 2, found the answers to the other ones on the stackoverflow hint URL.
  #sometimes doing it the long way aroun(i.e verbose) is easiest.
  raise TriangleError, "side cannot be  0" if [a,b,c].min <= 0
  raise TriangleError,"side cannot be  negative" if [a,b,c].min <= 0
  raise TriangleError, "Two sides can never be less than the sum of one side" if ((a + b) < c) | ((a + c) < b) | ((b + c) < a)
  raise TriangleError, "Two sides can never be equal one side" if ((a + b) ==  c) | ((a + c) ==  b) | ((b + c) ==  a)
  args = [a,b,c]
	args.uniq!
	
  if(args.size == 1)
  	return :equilateral
  elsif (args.size == 2)
  	return :isosceles
  elsif (args.size == 3)
  	return :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
