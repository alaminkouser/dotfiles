require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
	scrollbar = false,
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None"
      }
    },
    menu = {
      border = "rounded",
      draw = { gap = 2 },
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None"
    }
  },
  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } }
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
