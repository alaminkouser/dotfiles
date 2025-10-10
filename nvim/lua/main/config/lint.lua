require("lint").linters_by_ft = {
  markdown = { "markdownlint-cli2" },
}

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile", "TextChanged", "TextChangedI" },
  {
    pattern = "*",
    callback = function()
      require("lint").try_lint()
    end,
  }
)
