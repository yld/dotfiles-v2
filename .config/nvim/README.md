# LazyVim Configuration

This directory contains my LazyVim configuration files.

## Elixir LSP: Expert

This configuration uses [Expert](https://github.com/expert-lsp/expert), the official language server implementation for Elixir.

### Installation

Expert is configured in `lua/plugins/elixir.lua` and requires the Expert binary to be installed in your PATH.

#### Download and Install Expert

For macOS ARM64 (Apple Silicon):

```bash
# Download the latest nightly build
cd /tmp
gh release download nightly --pattern 'expert_darwin_arm64' --repo expert-lsp/expert --clobber

# Make it executable and install to PATH
chmod +x expert_darwin_arm64
mkdir -p ~/.local/bin
mv expert_darwin_arm64 ~/.local/bin/expert

# Verify installation
expert --help
```

For other platforms:

- **macOS Intel**: Use pattern `expert_darwin_amd64`
- **Linux ARM64**: Use pattern `expert_linux_arm64`
- **Linux AMD64**: Use pattern `expert_linux_amd64`
- **Windows**: Use pattern `expert_windows_amd64.exe`

You can also download stable releases from: https://github.com/expert-lsp/expert/releases

#### Verify Installation

After installation, verify Expert is available:

```bash
which expert
# Should output: /Users/yves/.local/bin/expert

expert --help
# Should display Expert's help information
```

#### Configuration

The Expert LSP server is configured in `lua/plugins/elixir.lua`:

```lua
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      expert = {},
    },
  },
}
```

When you open an Elixir file (`.ex`, `.exs`, `.heex`), Expert will automatically start and provide:
- Code completion
- Go to definition
- Find references
- Diagnostics
- Hover documentation
- And more!

### Supported Versions

Expert aims to support:
- Elixir >= 1.15.3
- Erlang >= 25.0

**Note**: You must compile Expert under the lowest version of Elixir and Erlang that you intend to use in your projects.

### Troubleshooting

If Expert is not starting:

1. **Check if Expert is in PATH:**
   ```bash
   which expert
   ```

2. **Check LazyVim LSP logs:**
   Open Neovim and run `:LspLog`

3. **Manually test Expert:**
   ```bash
   expert --stdio
   ```
   (Press Ctrl+C to exit)

4. **Ensure nvim-lspconfig is loaded:**
   ```vim
   :Lazy
   ```
   Check that `nvim-lspconfig` is installed

### Resources

- [Expert GitHub](https://github.com/expert-lsp/expert)
- [Expert Installation Docs](https://github.com/expert-lsp/expert/blob/main/pages/installation.md)
- [LazyVim Docs](https://www.lazyvim.org/)
