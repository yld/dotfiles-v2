return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jfpedroza/neotest-elixir",
    "olimorris/neotest-rspec",
  },
  opts = {
    adapters = {
      ["neotest-elixir"] = {},
    },
  },
  requires = {
    "nvim-lua/plenary.nvim",
  }
}
