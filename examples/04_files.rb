#!/usr/bin/env ruby

# Example 4: File Highlighting
# This example shows how to highlight code from files

require 'albino'

puts "=== Example 4: File Highlighting ==="
puts

# Create a temporary Ruby file for demonstration
temp_file = File.new(__FILE__)

# Highlight the content
html = Albino.colorize(temp_file, :ruby)

puts "Highlighting #{__FILE__}..."
puts "Output (first 200 chars): #{html[0..200]}..."
puts

puts "-" * 50
puts
