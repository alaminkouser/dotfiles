vim.keymap.set("n", "<Esc>", function()
  vim.cmd("update")
  vim.cmd("Yazi")
end, {
  desc = "Open Yazi",
})

vim.keymap.set("n", "q", function()
  vim.cmd("update")
  local bufs = vim.api.nvim_list_bufs()
  local unsaved_buf = nil

  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
      unsaved_buf = buf
      break
    end
  end

  if unsaved_buf then
    vim.api.nvim_set_current_buf(unsaved_buf)
  else
    vim.cmd("quit")
  end
end, {
  noremap = true,
  desc = "Save all and quit if no unsaved buffer, else jump to unsaved",
})

vim.keymap.set("n", "r", function()
  vim.api.nvim_feedkeys("q", "n", false)
  vim.defer_fn(function()
    local reg = vim.fn.reg_recording()
    if reg ~= "" then
      vim.notify("recording @" .. reg, vim.log.levels.INFO, {
        render = "simple",
        title = "Recording",
      })
    end
  end, 100)
end)
