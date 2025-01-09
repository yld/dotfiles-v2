-- see https://github.com/ianchesal/dotfiles/blob/main/nvim/lua/plugins/nvim-lspconfig.lua#L26
local lspconfig = require("lspconfig")
local root_dir = lspconfig.util.root_pattern("Gemfile", ".git", ".")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true,
      format = { timeout_ms = 1500 },
      format_notify = true,
      servers = {
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "asdf", "exec", "rubocop", "--ignore-unrecognized-cops", "--lsp" },
          root_dir = root_dir,
        },
        ruby_lsp = {
          cmd = {
            "asdf",
            "exec",
            "ruby-lsp",
          },
          root_dir = root_dir,
        },
        solargraph = {
          cmd = {
            "asdf",
            "exec",
            "solargraph",
            "stdio",
          },
          root_dir = root_dir,
          settings = {
            solargraph = {
              autoformat = false,
              completion = true,
              definitions = true,
              diagnostics = true,
              folding = true,
              formatting = true,
              highlights = true,
              references = true,
              rename = true,
              symbols = true,
              -- Enable this when running with docker compose
              --transport = 'external',
              --externalServer = {
              --    host = 'localhost',
              --    port = '7658',
              --}
            },
          },
        },
      },
    },
  },
}
