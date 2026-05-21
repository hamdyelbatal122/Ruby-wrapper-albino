# Albino: Advanced Syntax Highlighting for Ruby

**A production-ready Ruby gem for powerful syntax highlighting across 500+ programming languages using Pygments.**

> An actively maintained and professionally enhanced syntax highlighting library with comprehensive documentation, security best practices, and extensive examples for modern Ruby projects.

## 📋 Overview

Albino is a lightweight Ruby wrapper around the Pygments syntax highlighter. It allows you to:

- ✨ Highlight code snippets in 500+ programming languages
- 🎨 Generate HTML, LaTeX, BBCode, IRC, and other formats
- 📁 Process both strings and file objects
- 🚀 Handle multiple code fragments efficiently
- 🌍 Support UTF-8 encoding out of the box
- ⚙️ Customize encoding and output formats

## 🔧 Requirements

- **Ruby** 1.8.7+
- **Python** 2.6+
- **Pygments** (Python syntax highlighter)

## 📦 Installation

### Step 1: Install Pygments

```bash
# Using pip (recommended)
pip install pygments

# Or using easy_install
sudo easy_install pygments

# Or using apt (Debian/Ubuntu)
sudo apt-get install python-pygments

# Or using homebrew (macOS)
brew install pygments
```

### Step 2: Install the Ruby Gem

```bash
gem install albino
```

Or add to your Gemfile:

```ruby
gem 'albino'
```

## 🚀 Usage

### Basic Syntax Highlighting

```ruby
require 'albino'

# Simple colorization
puts Albino.colorize('puts "Hello World"', :ruby)

# Returns HTML with syntax highlighting:
# <div class="highlight"><pre><span></span><span class="nb">puts</span>...
```

### Advanced Usage

```ruby
require 'albino'

# Create syntaxer object
@syntaxer = Albino.new('puts "Hello World"', :ruby)
puts @syntaxer.colorize

# Specify output format (default is :html)
@syntaxer = Albino.new('puts "Hello World"', :ruby, :bbcode)
puts @syntaxer.colorize

# Custom encoding
@syntaxer = Albino.new('puts "Hello World"', :ruby, :html, 'ascii')
puts @syntaxer.colorize

# Highlight a file
@syntaxer = Albino.new(File.new('script.rb'), :ruby)
puts @syntaxer.colorize
```

### Batch Processing (Multiple Code Fragments)

```ruby
require 'albino/multi'

# Highlight multiple code blocks in one operation
ruby, python = Albino::Multi.colorize([
  [:ruby, '1+2'],
  [:python, '1-2']
])

puts ruby
puts python

# Or with array syntax
syntaxer = Albino::Multi.new([
  [:ruby, "class MyClass\nend"],
  [:python, "class MyClass:\n  pass"]
])
results = syntaxer.colorize
```

### Using in Rails

```ruby
# app/helpers/syntax_helper.rb
module SyntaxHelper
  def highlight(code, language = :text)
    Albino.new(code, language)
  end
end

# app/views/posts/show.html.erb
<div class="code-block">
  <%= highlight(@post.code, :ruby) %>
</div>
```

## 📚 Supported Languages

Albino supports all lexers available in Pygments, including but not limited to:

- **Web:** JavaScript, HTML, CSS, PHP, XML, JSON
- **Backend:** Ruby, Python, Java, C#, Go, Rust, C++
- **Scripts:** Bash, Perl, PowerShell, Shell
- **Templates:** ERB, Jinja2, Liquid, Haml
- **Data:** YAML, TOML, INI, Properties
- **Markup:** Markdown, reStructuredText, AsciiDoc

To see all available lexers:

```bash
pygmentize -L lexers
```

## 🎨 Supported Output Formats

- `html` (default) - HTML with CSS classes
- `html+erb` - HTML embedded in ERB
- `bbcode` - BBCode format
- `latex` - LaTeX format
- `irc` - IRC-style ANSI colors
- `img` - Image format (requires additional setup)

To see all available formatters:

```bash
pygmentize -L formatters
```

## ⚙️ Configuration

```ruby
# Set custom pygmentize path
Albino.bin = '/custom/path/to/pygmentize'

# Set process timeout (default: 10 seconds)
Albino.timeout_threshold = 30

# Set default encoding (default: 'utf-8')
Albino.default_encoding = 'iso-8859-1'
```

## 🧪 Testing

Run the test suite:

```bash
rake test
```

Or with bundler:

```bash
bundle exec rake test
```

## 📝 API Reference

### Albino Class

#### `Albino.colorize(target, lexer = :text, format = :html, encoding = 'utf-8')`

Class method for quick syntax highlighting.

```ruby
html = Albino.colorize('code here', :ruby)
```

#### `Albino.new(target, lexer = :text, format = :html, encoding = 'utf-8')`

Create a new Albino instance.

- **target** - String, File, or any object with a `read` method
- **lexer** - Symbol for the programming language (`:ruby`, `:python`, `:java`, etc.)
- **format** - Symbol for output format (default: `:html`)
- **encoding** - String for character encoding (default: `'utf-8'`)

#### `#colorize(options = {})`

Highlights the code and returns formatted output.

```ruby
syntaxer = Albino.new(code, :ruby)
result = syntaxer.colorize
```

#### `#to_s`

Alias for `colorize`. Useful in Rails templates.

### Albino::Multi Class

For batch processing multiple code fragments with better performance.

```ruby
Albino::Multi.colorize(array_of_pairs)
```

## 🐛 Error Handling

```ruby
begin
  Albino.colorize(code, :ruby)
rescue Albino::ShellArgumentError => e
  puts "Invalid argument: #{e.message}"
end
```

## 🌐 Environment Variables

Albino respects these environment variables:

- `PYGMENTIZE_BIN` - Custom path to pygmentize executable
- `PYGMENTIZE_TIMEOUT` - Process timeout in seconds

## ⚠️ Limitations

- Requires Pygments to be installed on the system
- Cannot auto-detect programming language (must be specified)
- Performance depends on Pygments installation
- Some exotic output formats may require additional dependencies

## 📄 License

MIT License - See LICENSE file for details

Maintained and enhanced by **Hamdy Elbatal**

Originally inspired by **Chris Wanstrath's** work

## 🤝 Contributing

Contributions are welcome! Please follow our [Contribution Guidelines](DEVELOPMENT.md) and review the [Code of Conduct](CODE_OF_CONDUCT.md).

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

For more details, see [DEVELOPMENT.md](DEVELOPMENT.md)

## 📚 Resources

- [Pygments Documentation](https://pygments.org/)
- [Pygments Language Support](https://pygments.org/languages/)
- [Quick Start Guide](QUICKSTART.md)
- [Development Guide](DEVELOPMENT.md)
- [Security Policy](SECURITY.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)

