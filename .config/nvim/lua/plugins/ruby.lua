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
          name = "rubocop",
          cmd = { "bundle", "exec", "rubocop" },
          -- cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
        ruby_lsp = {
          name = "ruby-lsp",
          -- cmd = { "bundle", "exec", "ruby-lsp" },
          -- init_options = {
          --   formatter = "auto",
          -- },
        },
        solargraph = {
          name = "solargraph",
          autostart = false,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = function()
            -- https://github.com/neovim/neovim/issues/23913
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end,
        },
      },
    },
  },
}
