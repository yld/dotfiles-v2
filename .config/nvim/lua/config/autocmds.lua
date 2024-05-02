-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- lint on write
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- set terminal title
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      -- titleString = vim.fn.expand('%:t')
      return project_dir[#project_dir]
    end

    vim.opt.titlestring = get_project_dir()
  end,
})

-- cleanup end of line
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = ":%s/[[:cntrl:]]|s+$//e",
})
