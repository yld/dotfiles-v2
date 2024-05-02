return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      -- make a group to be able to delete it later
      group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
      callback = function()
        local f = vim.fn.expand("%:p")
        if vim.fn.isdirectory(f) ~= 0 then
          vim.cmd("Neotree current dir=" .. f)
          -- neo-tree is loaded now, delete the init autocmd
          vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
        end
      end,
    })
    -- keymaps
  end,
  -- init = function()
  --     if vim.fn.argc(-1) == 1 then
  --       local stat = vim.uv.fs_stat(vim.fn.argv(0))
  --       if stat and stat.type == "directory" then
  --         require("neo-tree")
  --       end
  --     end
  --   end,
}
