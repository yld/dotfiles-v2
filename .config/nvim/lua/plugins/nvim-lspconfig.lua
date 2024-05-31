-- see https://github.com/ianchesal/dotfiles/blob/main/nvim/lua/plugins/nvim-lspconfig.lua#L26
local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = { timeout_ms = 1500 },
      format_notify = true,
      servers = {
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
      },
    },
  },
}
