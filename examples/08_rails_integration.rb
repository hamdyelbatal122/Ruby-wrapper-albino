#!/usr/bin/env ruby

# Example 8: Rails Integration
# This example shows how to use Albino in a Rails application

# This is a conceptual example - run this in a Rails project

# config/initializers/albino_config.rb
# Albino.timeout_threshold = 30
# Albino.default_encoding = 'utf-8'

# app/helpers/code_helper.rb
module CodeHelper
  def highlight_code(code, language = :text)
    require 'albino'
    Albino.new(code, language).to_s
  end

  def highlight_code_with_class(code, language = :text)
    require 'albino'
    html = Albino.colorize(code, language)
    # Add custom classes
    html.gsub('<div class="highlight">', '<div class="code-block highlight">')
  end
end

# app/views/posts/show.html.erb
# <div class="post-content">
#   <%= highlight_code(@post.code_snippet, @post.language) %>
# </div>

puts "=== Example 8: Rails Integration ==="
puts "This is a conceptual example for Rails projects."
puts
puts "To use in Rails:"
puts "1. Add 'gem \"albino\"' to your Gemfile"
puts "2. Create a helper method in app/helpers/code_helper.rb"
puts "3. Use <%= highlight_code(code) %> in your views"
puts
puts "See the comments in this file for details."
puts
puts "-" * 50
puts
