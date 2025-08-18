local palette = require("catppuccin.palettes").get_palette()

require("lualine").setup({
  options = {
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      {
        function()
          local reg = vim.fn.reg_recording()
          if reg == "" then
            return ""
          end
          return " " .. reg
        end,
        color = { fg = palette.red, bg = palette.surface0 },
        separator = { left = "" },
      },
      {
        "mode",
        fmt = function(mode)
          local mode_map = {
            ["NORMAL"] = "NOR",
            ["OP"] = "OP",
            ["INSERT"] = "INS",
            ["VISUAL"] = "VIS",
            ["V-LINE"] = "VL",
            ["V-BLOCK"] = "VB",
            ["SELECT"] = "SEL",
            ["S-LINE"] = "SL",
            ["S-BLOCK"] = "SB",
            ["COMMAND"] = "CMD",
            ["EX"] = "E",
            ["REPLACE"] = "REP",
            ["V-REPLACE"] = "VR",
            ["TERMINAL"] = "TER",
          }
          return mode_map[mode] or mode
        end,
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      "filename",
      "branch",
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        colored = true,
      },
    },
    lualine_c = {
      {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then
            return "[NO LSP STATUS]"
          end

          local client_names = {}
          for _, client in pairs(clients) do
            table.insert(client_names, client.name)
          end

          return table.concat(client_names, ", ")
        end,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
        update_in_insert = true,
      },
    },
    lualine_y = { "filetype" },
    lualine_z = {
      {
        function()
          return string.format(
            "%s | %s",
            require("lualine.components.progress")(),
            tostring(require("lualine.components.location")()):gsub(
              "^%s*(.-)%s*$",
              "%1"
            )
          )
        end,
        separator = { left = "", right = "" },
      },
    },
  },
})
