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
  },
})

vim.cmd.colorscheme("catppuccin")
