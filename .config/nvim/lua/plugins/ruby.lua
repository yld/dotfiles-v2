return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ruby" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local root_pattern = require("lspconfig.util").root_pattern

      opts.format = { timeout_ms = 1500 }
      opts.format_notify = true
      opts.servers = opts.servers or {}
      opts.servers.rubocop = vim.tbl_deep_extend("force", opts.servers.rubocop or {}, {
        -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
        name = "rubocop",
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        root_dir = root_pattern("Gemfile", ".git", "."),
      })
      opts.servers.ruby_lsp = vim.tbl_deep_extend("force", opts.servers.ruby_lsp or {}, {
        name = "ruby-lsp",
        -- cmd = { "bundle", "exec", "ruby-lsp" },
        -- init_options = {
        --   formatter = "auto",
        -- },
      })
      opts.servers.solargraph = vim.tbl_deep_extend("force", opts.servers.solargraph or {}, {
        name = "solargraph",
        autostart = false,
      })
    end,
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
