# From http://trevoke.net/blog/2008/12/20/lexicographic-permutations-in-ruby/
# (I should try to understand this better)
def permutations array
  if array.size < 2
    yield array
  else
    array.each do |element|
      permutations(array.select() {|n| n != element}) \
      {|val| yield([element].concat val)}
    end
  end
end
