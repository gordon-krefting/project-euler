#!/usr/bin/env ruby

require 'tempfile'

print "Problem #:"
num = gets.chomp

if num.to_i.to_s != num || num.length > 3
	puts "Numbers under 1000 only"
	exit
end

dirname = str = "problem-" + num.rjust(3, "0")

if File.directory?(dirname)
	puts "Problem #{num} is already set up"
	exit
end

tmp = Tempfile.new('euler')

system('vi', tmp.path)

o = ""
File.readlines(tmp.path).each do |line|
	o += "# #{line}"
end

if o.length == 0
	puts "Please enter a description"
	exit
end

# build the solve file
dashes = "# ---------------------------------------------------------------------------------------------------------------------"

o = "#!/usr/bin/env ruby\n#{dashes}\n#{o}#\n#{dashes}\nif __FILE__ == $0\n\nend"

Dir.mkdir(dirname)

filename = dirname + "/solve.rb"

File.write(filename, o)

FileUtils.chmod "+x", filename

# build the test file
o = @text = <<END
#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase

end
END
testfilename = dirname + "/tc_solve.rb"

File.write(testfilename, o)

FileUtils.chmod "+x", testfilename



`open #{filename}`