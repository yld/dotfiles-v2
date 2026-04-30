return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.elixirls = vim.tbl_deep_extend("force", opts.servers.elixirls or {}, {
        enabled = false,
      })
      opts.servers.expert = opts.servers.expert or {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex" })
      vim.treesitter.language.register("markdown", "livebook")
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "jfpedroza/neotest-elixir",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file(".credo.exs")
          end,
        }),
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.elixir = { "credo" }

      opts.linters = opts.linters or {}
      opts.linters.credo = vim.tbl_deep_extend("force", opts.linters.credo or {}, {
        condition = function(ctx)
          return vim.fs.find({ ".credo.exs" }, { path = ctx.filename, upward = true })[1]
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { "livebook" })
    end,
  },
  {
    "brendalf/mix.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/cmp-cmdline",
    },
  },
}
