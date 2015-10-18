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

o = "#!/usr/bin/env ruby\n\n#{o}\n\nputs \"Output\""

Dir.mkdir(dirname)

filename = dirname + "/solve.rb"

File.write(filename, o)

FileUtils.chmod "+x", filename

`open #{filename}`