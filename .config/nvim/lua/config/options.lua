-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local home = vim.env.HOME

vim.env.PATH = home .. "/.local/share/mise/shims:" .. vim.env.PATH

local mise_python3 = home .. "/.local/share/mise/installs/python/3/bin/python3"
if vim.fn.executable(mise_python3) == 1 then
  vim.g.python3_host_prog = mise_python3
end

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

-- history
if vim.fn.has("persistent_undo") then
  vim.o.undodir = home .. "/.undodir"
  vim.o.undofile = true
end

-- backups
vim.o.backupdir = home .. "/.vim/backup/"
vim.o.backup = false

-- swap
vim.o.directory = home .. "/.vim/swp"

-- bells
vim.go.errorbells = true

--  Text, tab and indent related
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.wrap = true

-- background
vim.o.background = "dark"

-- https://github.com/LazyVim/LazyVim/discussions/1770
vim.g.root_spec = { "cwd" }

-- ruby
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

-- AI
vim.g.ai_cmp = false

-- case
vim.opt.ignorecase = false

-- LSP logging: default level INFO floods the log with copilot/ruby-lsp stderr noise
vim.lsp.log.set_level("WARN")
