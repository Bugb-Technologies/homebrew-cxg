# Homebrew Tap for CERT-X-GEN

This is the official [Homebrew](https://brew.sh/) tap for [CERT-X-GEN](https://github.com/Bugb-Technologies/cert-x-gen), a polyglot execution engine for vulnerability detection.

## Installation

```bash
# Add the tap
brew tap bugb-technologies/cxg

# Install CERT-X-GEN
brew install cxg

# Verify installation
cxg --version
```

## Upgrade

```bash
brew update
brew upgrade cxg
```

## Uninstall

```bash
brew uninstall cxg
brew untap bugb-technologies/cxg
```

## What is CERT-X-GEN?

CERT-X-GEN is a polyglot security scanner that lets you write vulnerability detection templates in 12 programming languages (Python, Go, Rust, C, Shell, YAML, and more).

**Key Features:**
- Write detection logic in real programming languages
- Sandboxed execution with resource limits
- Multiple output formats (JSON, HTML, SARIF)
- CI/CD friendly

Learn more: [github.com/Bugb-Technologies/cert-x-gen](https://github.com/Bugb-Technologies/cert-x-gen)

## Templates

After installation, download the official templates:

```bash
cxg template update
```

Browse templates: [github.com/Bugb-Technologies/cert-x-gen-templates](https://github.com/Bugb-Technologies/cert-x-gen-templates)

## License

Apache License 2.0
