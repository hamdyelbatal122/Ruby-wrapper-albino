#!/usr/bin/env ruby

# Example 1: Basic Syntax Highlighting
# This example shows the simplest way to highlight code

require 'albino'

puts "=== Example 1: Basic Syntax Highlighting ==="
puts

# Simple Ruby code
ruby_code = 'puts "Hello, World!"'

# Colorize it
html = Albino.colorize(ruby_code, :ruby)

puts "Input:"
puts ruby_code
puts
puts "Output (HTML):"
puts html
puts
puts "-" * 50
puts
