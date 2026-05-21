#!/usr/bin/env ruby

# Example 3: Multiple Languages
# This example highlights code in different programming languages

require 'albino'

puts "=== Example 3: Multiple Languages ==="
puts

languages = {
  ruby: 'puts "Hello Ruby"',
  python: 'print("Hello Python")',
  javascript: 'console.log("Hello JavaScript")',
  java: 'System.out.println("Hello Java");',
  go: 'fmt.Println("Hello Go")'
}

languages.each do |lang, code|
  puts "#{lang.to_s.upcase}:"
  puts code
  
  html = Albino.colorize(code, lang)
  puts "Highlighted (first 100 chars): #{html[0..100]}..."
  puts
end

puts "-" * 50
puts
