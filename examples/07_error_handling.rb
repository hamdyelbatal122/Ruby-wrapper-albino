#!/usr/bin/env ruby

# Example 7: Error Handling
# This example shows how to handle errors gracefully

require 'albino'

puts "=== Example 7: Error Handling ==="
puts

def safe_highlight(code, language)
  begin
    Albino.colorize(code, language)
  rescue Albino::ShellArgumentError => e
    puts "ERROR: Invalid shell argument - #{e.message}"
    code  # Return original code
  rescue => e
    puts "ERROR: Failed to highlight - #{e.message}"
    code  # Return original code
  end
end

# Valid code
code1 = 'puts "Valid code"'
result1 = safe_highlight(code1, :ruby)
puts "Successfully highlighted valid code"
puts

# The shell validator will catch dangerous patterns
begin
  invalid_code = 'puts "test"'
  Albino.new(invalid_code, :ruby, :l => "'abc;'").colorize
rescue Albino::ShellArgumentError => e
  puts "Caught shell injection attempt: #{e.message}"
end
puts

puts "-" * 50
puts
