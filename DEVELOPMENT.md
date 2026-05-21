# Development Guide

## Setup Development Environment

### Prerequisites

```bash
# Install Ruby
ruby --version  # Should be 1.8.7+

# Install Pygments
pip install pygments

# Install dependencies
gem install bundler
bundle install
```

### Running Tests

```bash
# Run all tests
rake test

# Or with bundler
bundle exec rake test

# Run specific test
ruby -I lib:test test/albino_test.rb
```

## Project Structure

```
.
├── lib/
│   ├── albino.rb           # Main Albino class
│   └── albino/
│       └── multi.rb        # Multi-fragment processor
├── test/
│   ├── albino_test.rb      # Core tests
│   └── multi_albino_test.rb # Multi tests
├── vendor/
│   └── multipygmentize     # Python script for batch processing
├── Rakefile                # Build tasks
├── albino.gemspec          # Gem specification
└── Gemfile                 # Dependencies
```

## Code Style

- Use Ruby 1.8.7+ compatible syntax
- Follow existing code conventions
- Add documentation to new methods
- Include tests for new features

## Debugging

### Enable debug output

```ruby
require 'albino'

# Set custom pygmentize path for debugging
Albino.bin = 'pygmentize'

# Increase timeout for slow systems
Albino.timeout_threshold = 30
```

### Common Issues

1. **pygmentize not found**: Ensure Pygments is installed and in PATH
2. **Timeout errors**: Increase `Albino.timeout_threshold`
3. **Encoding issues**: Specify encoding explicitly in constructor

## Building the Gem

```bash
# Build locally
gem build albino.gemspec

# Install locally
gem install ./albino-*.gem

# Push to RubyGems (maintainers only)
gem push albino-*.gem
```

## Performance Tips

- Use `Albino::Multi` for highlighting multiple fragments
- Cache highlighted results when possible
- Increase timeout for complex code

## Future Improvements

- Add support for newer Pygments versions
- Improve error handling and messages
- Add more output format examples
- Optimize performance for large code blocks
