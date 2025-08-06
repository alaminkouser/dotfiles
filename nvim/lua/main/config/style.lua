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
  },
})

vim.cmd.colorscheme("catppuccin")

local palette = require("catppuccin.palettes").get_palette()

vim.cmd("highlight Pmenu guibg=" .. palette.mantle)
