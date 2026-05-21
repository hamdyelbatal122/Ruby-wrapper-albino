#!/usr/bin/env ruby

# Example 6: Custom Configuration
# This example shows how to configure Albino

require 'albino'

puts "=== Example 6: Custom Configuration ==="
puts

code = 'puts "Configuration Example"'

# Default configuration
puts "Default timeout: #{Albino.timeout_threshold} seconds"
puts "Default encoding: #{Albino.default_encoding}"
puts "Pygmentize path: #{Albino.bin}"
puts

# Change timeout for slow systems
Albino.timeout_threshold = 30
puts "Updated timeout to: #{Albino.timeout_threshold} seconds"

# Change default encoding
original_encoding = Albino.default_encoding
Albino.default_encoding = 'utf-8'
puts "Default encoding: #{Albino.default_encoding}"

# Highlight with custom settings
html = Albino.new(code, :ruby, :html, 'utf-8').colorize
puts "Highlighted successfully with custom encoding"
puts

# Restore original encoding
Albino.default_encoding = original_encoding

puts "-" * 50
puts
