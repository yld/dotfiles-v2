if vim.fn.executable("kitten") == 1 then
  return {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/",
  }
else
  return {}
end
