#!/usr/bin/env ruby
# Pick a problem, a language, and an action (run the solution or run its tests).
#
# Usage:
#   ./execute.rb                  interactive prompts
#   ./execute.rb 27               prompts for language, then action
#   ./execute.rb 27 ruby          prompts for action (run/test)
#   ./execute.rb 27 ruby run      runs the solution directly, no prompts
#   ./execute.rb 27 ruby test     runs the tests directly, no prompts

require 'open3'

ROOT = __dir__
PROBLEMS_DIR = File.join(ROOT, "problems")
LANGUAGES = %w[go python ruby rust]
ACTIONS = %w[run test]

def problem_dirs
  Dir.glob(File.join(PROBLEMS_DIR, "problem-*")).sort
end

def resolve_problem(input)
  padded = "problem-%04d" % input.to_i
  dir = File.join(PROBLEMS_DIR, padded)
  Dir.exist?(dir) ? dir : nil
end

def languages_for(problem_dir)
  langs = LANGUAGES.select { |lang| Dir.exist?(File.join(problem_dir, lang)) }
  langs << "ruby" if File.exist?(File.join(problem_dir, "solve.rb")) && !langs.include?("ruby")
  langs
end

def lang_dir(problem_dir, lang)
  return problem_dir if lang == "ruby" && !Dir.exist?(File.join(problem_dir, "ruby"))
  File.join(problem_dir, lang)
end

# Returns [dir_to_run_in, command] or nil if there's nothing to run
def run_command(problem_dir, lang)
  dir = lang_dir(problem_dir, lang)
  case lang
  when "ruby"
    return nil unless File.exist?(File.join(dir, "solve.rb"))
    [dir, %w[ruby solve.rb]]
  when "go"
    return nil unless File.exist?(File.join(dir, "go.mod"))
    [dir, %w[go run .]]
  when "rust"
    return nil unless File.exist?(File.join(dir, "Cargo.toml"))
    [dir, %w[cargo run]]
  when "python"
    return nil unless File.exist?(File.join(dir, "solve.py"))
    [dir, %w[python3 solve.py]]
  end
end

# Returns [dir_to_run_in, command] or nil if there's nothing to run
def test_command(problem_dir, lang)
  dir = lang_dir(problem_dir, lang)
  case lang
  when "ruby"
    return nil unless File.exist?(File.join(dir, "tc_solve.rb"))
    [dir, %w[ruby tc_solve.rb]]
  when "go"
    return nil if Dir.glob(File.join(dir, "*_test.go")).empty?
    [dir, %w[go test ./... -v]]
  when "rust"
    return nil unless File.exist?(File.join(dir, "Cargo.toml"))
    [dir, %w[cargo test]]
  when "python"
    return nil unless File.exist?(File.join(dir, "test_solve.py"))
    [dir, %w[python3 test_solve.py -v]]
  end
end

def prompt(label)
  print label
  $stdout.flush
  $stdin.gets&.chomp
end

problem_input = ARGV[0] || prompt("Problem #: ")
problem_dir = resolve_problem(problem_input)
unless problem_dir
  puts "No problem found for '#{problem_input}'"
  exit 1
end

langs = languages_for(problem_dir)
if langs.empty?
  puts "No language solutions found under #{problem_dir}"
  exit 1
end

lang = ARGV[1]
if lang.nil?
  if langs.size == 1
    lang = langs.first
  else
    lang = prompt("Language (#{langs.join('/')}): ")
  end
end

unless langs.include?(lang)
  puts "'#{lang}' not available for #{File.basename(problem_dir)}. Options: #{langs.join(', ')}"
  exit 1
end

available_actions = ACTIONS.select { |a| a == "run" || test_command(problem_dir, lang) }

action = ARGV[2]
if action.nil?
  if available_actions.size == 1
    action = available_actions.first
  else
    action = prompt("Action (#{available_actions.join('/')}): ")
  end
end

unless available_actions.include?(action)
  puts "'#{action}' is not a valid action. Options: #{available_actions.join(', ')}"
  exit 1
end

result = action == "run" ? run_command(problem_dir, lang) : test_command(problem_dir, lang)
unless result
  verb = action == "run" ? "solution" : "tests"
  puts "No #{verb} found for #{File.basename(problem_dir)} (#{lang})"
  exit 1
end

dir, cmd = result
puts "Running: #{cmd.join(' ')} (in #{dir.sub(ROOT + '/', '')})"
success = system(*cmd, chdir: dir)
exit(success ? 0 : 1)
