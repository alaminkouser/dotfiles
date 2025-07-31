local cmp = require("cmp")

cmp.setup({
	enabled = true,
	sources = {
		{
			name = "nvim_lsp"
		}
	},
	mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
	  ["<Tab>"] = cmp.mapping.confirm({select = true})
    }),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" }
	}
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
		{ name = "path" }
	},
	{
		{ name = "cmdline" }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup.filetype("markdown", {
  sources = cmp.config.sources({
    { name = "buffer" },    -- Suggest words from the current buffer
    { name = "luasnip" },   -- Optional: Snippet completion
  }),
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
})

