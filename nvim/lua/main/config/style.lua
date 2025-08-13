require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    blink_cmp = {
      style = "rounded",
    },
    treesitter = true,
    noice = true,
    notify = true,
    gitsigns = true,
    telescope = {
      enabled = true,
      border = false,
    },
  },
})

vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
