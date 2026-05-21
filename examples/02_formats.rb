#!/usr/bin/env ruby

# Example 2: Different Output Formats
# This example demonstrates different output formats

require 'albino'

puts "=== Example 2: Different Output Formats ==="
puts

code = '1 + 2'

# HTML format (default)
html = Albino.colorize(code, :ruby, :html)
puts "HTML format:"
puts html.inspect
puts

# BBCode format (for forums)
bbcode = Albino.colorize(code, :ruby, :bbcode)
puts "BBCode format:"
puts bbcode.inspect
puts

# LaTeX format (for documents)
latex = Albino.colorize(code, :ruby, :latex)
puts "LaTeX format:"
puts latex.inspect
puts

# IRC format (with ANSI colors)
irc = Albino.colorize(code, :ruby, :irc)
puts "IRC format:"
puts irc.inspect
puts

puts "-" * 50
puts
