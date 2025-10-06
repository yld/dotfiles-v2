-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- history
if vim.fn.has("persistent_undo") then
  vim.g.undodir = '~/.undodir'
  vim.g.undofile = true
end

-- backups
vim.go.backupdir = '~/.vim/backup/'
vim.go.backup = false

-- swap
vim.go.directory = '~/.vim/swp'

-- bells
vim.go.errorbells = true
vim.go.belloff = 'all'

--  Text, tab and indent related
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.go.smarttab = true
vim.bo.autoindent = true
vim.wo.wrap = true

-- background
vim.go.background = 'dark'

--
vim.go.clipboard = 'unnamed'

-- load lazy and plugins
require("config.lazy")

-- nvim-tree gloobal
vim.api.nvim_set_keymap("n", "<F7>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<F8>", "::SymbolsOutline<cr>", {silent = true, noremap = true})

-- shortcuts
vim.api.nvim_set_keymap("c", "%%", "<C-R>=expand('%:h').'/'<cr>", {silent = true, noremap = true})
