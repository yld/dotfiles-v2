-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- load lazy and plugins
require("config.lazy")

-- nvim-tree gloobal
-- vim.api.nvim_set_keymap("n", "<F7>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
-- vim.api.nvim_set_keymap("n", "<F8>", "::SymbolsOutline<cr>", { silent = true, noremap = true })
--
-- -- shortcuts
-- vim.api.nvim_set_keymap("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { silent = true, noremap = true })
