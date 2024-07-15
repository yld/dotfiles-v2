return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>ds",
      function()
        require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
      end,
      desc = "Document Symbols Explorer",
    },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_current",
    },
    update_focused_file = {
      enable = true,
    },
  },
}
