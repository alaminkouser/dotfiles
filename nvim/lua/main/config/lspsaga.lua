require("lspsaga").setup({
  symbol_in_winbar = {
    enable = false,
    show_file = false,
    folder_level = 0,
  },
  finder = {
    keys = {
      toggle_or_open = "<CR>",
    },
    max_height = "0.75",
    left_width = "0.25",
    right_width = "0.5",
  },
  ui = {
    code_action = "",
  },
})
