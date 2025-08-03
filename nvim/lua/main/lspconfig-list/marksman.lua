require("lspconfig").marksman.setup{}

-- Autocmd: Show diagnostics when they change in markdown files
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.defer_fn(show_diagnostics_noice, 100)
    end
  end,
})

local last_pos = nil
local timer = nil

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorHold" }, {
  pattern = "*.md",
  callback = function()
    if vim.api.nvim_get_mode().mode ~= "n" then return end

    local pos = vim.api.nvim_win_get_cursor(0)
    if last_pos and pos[1] == last_pos[1] and pos[2] == last_pos[2] then
      return -- don't retrigger on same position
    end
    last_pos = pos

    -- Debounce hover
    if timer then
      timer:stop()
      timer:close()
    end
    timer = vim.loop.new_timer()
    timer:start(150, 0, vim.schedule_wrap(function()
      -- Ensure LSP client is attached
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if not vim.tbl_isempty(clients) then
        vim.lsp.buf.hover(nil, { focus = false })  -- <- key part
      end
    end))
  end,
})