require("lspconfig").marksman.setup{}

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
          focus = false,
          max_height = 20
        })
      end)
    end, 100)
  end,
})

local last_result_was_empty = nil
local function check_marksman_lsp_issues()
  local client = nil
  -- find marksman client among all active LSP clients
  for _, c in pairs(vim.lsp.get_clients()) do
    if c.name == "marksman" then
      client = c
      break
    end
  end

  if not client then
    return
  end

  local results = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local diags = vim.diagnostic.get(bufnr, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
    if diags and #diags > 0 then
      local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t:r")
      for _, diag in ipairs(diags) do
        table.insert(results, {
          file = fname,
          lnum = diag.lnum + 1,
          message = fname .. " (Line: " .. tostring(diag.lnum + 1) .. ")" .. "\n" .. diag.message,
          severity = diag.severity,
        })
      end
    end
  end

  if #results == 0 then
    -- only notify if previous check had some issues or it's the first run (last_result_was_empty == nil)
    if last_result_was_empty == false or last_result_was_empty == nil then
      vim.notify("No Issues Found.", "info", { title = "Status" })
    end
    last_result_was_empty = true
  else
    for _, item in ipairs(results) do
      local msg = item.message
      vim.notify(msg, vim.log.levels.ERROR)
    end
    last_result_was_empty = false
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.defer_fn(check_marksman_lsp_issues, 500)
  end,
})

vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
  pattern = "*",
  callback = function()
    vim.defer_fn(check_marksman_lsp_issues, 500)
  end,
})