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

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorHold" }, {
  pattern = "*.md",
  callback = function()
    if vim.api.nvim_get_mode().mode ~= "n" then return end

    local pos = vim.api.nvim_win_get_cursor(0)
    if last_pos and pos[1] == last_pos[1] and pos[2] == last_pos[2] then
      return
    end
    last_pos = pos

    vim.defer_fn(function()
      if not vim.api.nvim_buf_is_valid(0) then return end

      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if vim.tbl_isempty(clients) then return end

      local encoding = clients[1].offset_encoding or "utf-16"

      local params = vim.lsp.util.make_position_params(nil, encoding)
      vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result, ctx, config)
        if err or not result or not result.contents then return end

        local contents = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        contents = vim.split(table.concat(contents, "\n"), "\n", { trimempty = true })
        if vim.tbl_isempty(contents) then return end

        vim.lsp.util.open_floating_preview(contents, "markdown", {
          border = {
            { "╭", "CmpBorder" },
            { "─", "CmpBorder" },
            { "╮", "CmpBorder" },
            { "│", "CmpBorder" },
            { "╯", "CmpBorder" },
            { "─", "CmpBorder" },
            { "╰", "CmpBorder" },
            { "│", "CmpBorder" },
          },
          focus = false
        })
      end)
    end, 100)
  end,
})
