local lspconfig = require("lspconfig")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ruby" } },
  },
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
    "suketa/nvim-dap-ruby",
    config = function()
      require("dap-ruby").setup()
    end,
  },
  {
    "olimorris/neotest-rspec",
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
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
