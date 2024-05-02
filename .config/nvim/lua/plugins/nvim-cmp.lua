return {
  {
    "hrsh7th/cmp-buffer",
    opts = {
      sources = {
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      },
    },
  },
}
