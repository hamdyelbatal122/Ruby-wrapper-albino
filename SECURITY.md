# Security Policy

## Reporting Security Issues

If you discover a security vulnerability in Albino, please email security concerns to the maintainers rather than using the issue tracker.

## Security Considerations

### Shell Injection Prevention

Albino implements strict validation of shell arguments to prevent injection attacks:

```ruby
# Validates that flags only contain a-z (case-insensitive)
# Validates that values only contain safe characters

# These will raise ShellArgumentError:
Albino.colorize(code, :ruby, :f => "html; rm -rf /")
Albino.colorize(code, :ruby, :l => "'; DROP TABLE--")
```

### Input Validation

- All shell arguments are strictly validated
- File paths are handled safely
- Process timeouts prevent resource exhaustion

## Best Practices

1. **Always validate user input** before passing to Albino
2. **Run Pygments securely** - ensure pygmentize is from trusted source
3. **Use process timeouts** to prevent denial of service
4. **Keep dependencies updated** - regularly update Pygments
5. **Sanitize output** when embedding in web applications

## Supported Versions

- Ruby 1.8.7+ (legacy maintenance mode)
- Pygments 2.0+

## Security Updates

We recommend:
- Keeping Ruby updated
- Keeping Pygments updated to latest version
- Running security scans regularly

## Dependencies Security

### Direct Dependencies

- `posix-spawn` - Used for secure process spawning

### Development Dependencies

- `mocha` - Testing library
- `bundler` - Dependency management

All dependencies are regularly reviewed for security issues.
