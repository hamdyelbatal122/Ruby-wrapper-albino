# Quick Start Guide

Get syntax highlighting in your Ruby project in less than 5 minutes!

## 1. Install Dependencies

### Step 1a: Install Pygments

```bash
# Ubuntu/Debian
sudo apt-get install python3-pygments

# macOS with Homebrew
brew install pygments

# Or with pip
pip install pygments

# Or with easy_install
sudo easy_install pygments
```

### Step 1b: Install Albino Gem

```bash
gem install albino
```

## 2. Basic Usage

### Simple Example

```ruby
require 'albino'

# Highlight Ruby code
code = 'puts "Hello World"'
html = Albino.colorize(code, :ruby)
puts html
# Output: <div class="highlight"><pre>...</pre></div>
```

### In a Rails Application

Add to your Gemfile:

```ruby
gem 'albino'
```

Create a helper:

```ruby
# app/helpers/syntax_helper.rb
module SyntaxHelper
  def highlight_code(code, language)
    Albino.new(code, language).to_s
  end
end
```

Use in your view:

```erb
<div class="code-example">
  <%= highlight_code(@post.code_snippet, :ruby) %>
</div>
```

## 3. Common Patterns

### Highlight File Content

```ruby
require 'albino'

# Read and highlight a file
file = File.open('script.rb')
html = Albino.colorize(file, :ruby)
puts html
```

### Multiple Languages

```ruby
require 'albino'

# Highlight different languages
ruby_code = Albino.colorize('1+2', :ruby)
python_code = Albino.colorize('1-2', :python)
java_code = Albino.colorize('1 + 2', :java)
```

### Different Output Formats

```ruby
require 'albino'

code = 'puts "Hello"'

# HTML (default)
html = Albino.colorize(code, :ruby, :html)

# BBCode for forums
bbcode = Albino.colorize(code, :ruby, :bbcode)

# LaTeX for documents
latex = Albino.colorize(code, :ruby, :latex)

# IRC colors
irc = Albino.colorize(code, :ruby, :irc)
```

### Batch Processing

```ruby
require 'albino/multi'

# Process multiple code blocks efficiently
code_blocks = [
  [:ruby, 'def hello; puts "Hi"; end'],
  [:python, 'def hello(): print("Hi")'],
  [:javascript, 'function hello() { console.log("Hi"); }']
]

results = Albino::Multi.colorize(code_blocks)

results.each_with_index do |html, index|
  puts "Language #{index}:"
  puts html
  puts "---"
end
```

## 4. Supported Languages

Here are some of the most common languages supported:

### Web Development
- `javascript` - JavaScript
- `html` - HTML
- `css` - CSS
- `php` - PHP
- `xml` - XML
- `json` - JSON

### Backend Languages
- `ruby` - Ruby
- `python` - Python
- `java` - Java
- `csharp` - C#
- `go` - Go
- `rust` - Rust
- `cpp` - C++
- `c` - C

### Shell & Scripts
- `bash` - Bash/Shell
- `powershell` - PowerShell
- `perl` - Perl

### Data & Config
- `yaml` - YAML
- `toml` - TOML
- `ini` - INI
- `sql` - SQL

See all available lexers:
```bash
pygmentize -L lexers | grep -E "^\*"
```

## 5. Styling the Output

The HTML output includes CSS classes that you can style. Add CSS:

```css
/* Syntax highlighting styles */
.highlight {
  background-color: #f5f5f5;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 12px;
  overflow-x: auto;
}

.highlight pre {
  margin: 0;
  font-family: 'Monaco', 'Courier New', monospace;
  font-size: 12px;
}

/* Token colors */
.highlight .nb { color: #0086b3; }  /* built-in
.highlight .n { color: #333; }      /* name
.highlight .s { color: #dd1144; }   /* string
.highlight .c { color: #999988; }   /* comment
```

Or use a Pygments CSS theme:

```bash
pygmentize -S default -f html > style.css
```

## 6. Error Handling

```ruby
require 'albino'

begin
  html = Albino.colorize(code, :ruby)
rescue Albino::ShellArgumentError => e
  puts "Invalid syntax highlighting arguments: #{e.message}"
rescue => e
  puts "Error highlighting code: #{e.message}"
end
```

## 7. Performance Tips

### Use Caching

```ruby
# Cache highlighted results
Rails.cache.fetch("highlight_#{code.hash}") do
  Albino.colorize(code, :ruby)
end
```

### Batch Process

```ruby
require 'albino/multi'

# Better performance for multiple codes
results = Albino::Multi.colorize(array_of_code_blocks)
```

### Adjust Timeout

```ruby
# For slow systems or large files
Albino.timeout_threshold = 30
```

## 8. Troubleshooting

### "pygmentize not found"

Make sure Pygments is installed and in your PATH:

```bash
which pygmentize
pygmentize --version
```

If not found, install it and try again.

### "Timeout" errors

Increase the timeout for large code blocks:

```ruby
Albino.timeout_threshold = 30  # 30 seconds
```

### Encoding issues

Specify encoding explicitly:

```ruby
Albino.new(code, :ruby, :html, 'utf-8').colorize
```

## 9. Next Steps

- Read the [full documentation](README.md)
- Check out [examples](test/)
- See the [development guide](DEVELOPMENT.md)
- Report issues or request features

## 10. Getting Help

- 📖 [Read the README](README.md)
- 🐛 [Report a bug](https://github.com/hamdyelbatal122/Ruby-wrapper-albino/issues)
- 💡 [Request a feature](https://github.com/hamdyelbatal122/Ruby-wrapper-albino/issues)
- 🤝 [Contribute code](DEVELOPMENT.md)
