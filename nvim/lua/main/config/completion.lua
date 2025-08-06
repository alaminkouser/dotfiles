require("blink.cmp").setup({
  completion = {
    list = {
      selection = {
        preselect = false,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:Normal,FloatBorder:None,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
    },
    menu = {
      border = "rounded",
      draw = { gap = 2 },
      winhighlight = "Normal:Normal,FloatBorder:None,CursorLine:BlinkCmpMenuSelection,Search:None",
    },
  },
  keymap = {
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
  },
  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
