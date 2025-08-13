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
local palette = require("catppuccin.palettes").get_palette()

vim.opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = palette.crust })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
