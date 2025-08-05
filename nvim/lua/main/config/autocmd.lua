local notify = require("notify")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if buf_name == "" and (#buf_lines == 1 and buf_lines[1] == "") then
      vim.schedule(function()
        vim.cmd("Yazi")
      end)
    end
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.defer_fn(function()
      if vim.v.vim_did_enter == 0 then return end

      local buf = vim.api.nvim_get_current_buf()
      if not vim.api.nvim_buf_is_loaded(buf) then return end

      local name = vim.api.nvim_buf_get_name(buf)
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

      if name == "" and #lines == 1 and lines[1] == "" then
        vim.cmd("q")
      end
    end, 100)
  end
})

vim.api.nvim_create_autocmd("BufNewFile", {
  callback = function()
    local filename = vim.fn.expand("%:t")
    notify("Filename: " .. filename, vim.log.levels.INFO, { title = "New File" })
  end
})
