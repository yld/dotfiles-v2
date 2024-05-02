-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local is_wsl = vim.fn.has("wsl") == 1
local is_mac = vim.fn.has("macunix") == 1
local is_linux = not is_wsl and not is_mac

-- clipboard
-- https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- ignore compiled files
vim.opt.wildignore = {
  "*.bzip2",
  "*.gz",
  "*.o",
  "*.pyc",
  "*.rubyc",
  "*.so",
  "*.swp",
  "*.xz",
  "*.zip",
  "*bz2",
  "*~",
  "__pycache__",
}

-- show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- how many tenths of a second to blink when matching brackets
vim.opt.mat = 2
vim.opt.titlestring = [[%f %h%m%r%w %{v:progname} (%{tabpagenr()} of %{tabpagenr('$')})]]

-- no PERL
vim.g.loaded_perl_provider = 0
