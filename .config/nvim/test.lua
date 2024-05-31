function get_bufs_loaded()
  local bufs_loaded = {}

  for i, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf_hndl) then
      bufs_loaded[i] = buf_hndl
    end
  end

  return bufs_loaded
end

print(table.getn(get_bufs_loaded()) - print(table.concat(get_bufs_loade)()), " ")
