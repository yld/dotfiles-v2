-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- working directory shortcuts
-- vim.api.nvim_set_keymap("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { expr = true, noremap = true })
vim.cmd("cnoremap % <C-R>=expand('%:P').'/'<cr>")
vim.cmd("cnoremap %% <C-R>=expand('%:h').'/'<cr>")

vim.cmd("map <leader>ew : %%")
vim.cmd("map <leader>es :sp %%")
vim.cmd("map <leader>ev :vsp %%")
vim.cmd("map <leader>et :tabe %%")
