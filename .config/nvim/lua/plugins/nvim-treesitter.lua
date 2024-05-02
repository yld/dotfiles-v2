return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
    "RRethy/nvim-treesitter-endwise"
  },
  opts = {
    endwise = {
      enable = true,
    },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "elixir",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
}
