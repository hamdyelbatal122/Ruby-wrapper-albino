#!/usr/bin/env ruby

# Example 5: Batch Processing
# This example shows how to efficiently highlight multiple code blocks

require 'albino/multi'

puts "=== Example 5: Batch Processing ==="
puts

# Multiple code fragments
code_blocks = [
  [:ruby, 'def hello; puts "Hi"; end'],
  [:python, 'def hello(): print("Hi")'],
  [:javascript, 'function hello() { console.log("Hi"); }']
]

# Process all at once
results = Albino::Multi.colorize(code_blocks)

puts "Highlighted #{results.size} code blocks:"
puts

results.each_with_index do |html, index|
  puts "Block #{index + 1} (first 150 chars):"
  puts html[0..150]
  puts
end

puts "-" * 50
puts
