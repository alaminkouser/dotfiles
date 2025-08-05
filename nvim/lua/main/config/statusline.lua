require("lualine").setup {
  options = {
    component_separators = "|",
    section_separators = { left = "", right = "" }
  },
  sections = {
    lualine_a = {
      {
        "mode",
	fmt = function(mode)
          local mode_map = {
            ["NORMAL"]    = "N",
            ["OP"]        = "OP",
            ["INSERT"]    = "I",
            ["VISUAL"]    = "VI",
            ["V-LINE"]    = "VL",
            ["V-BLOCK"]   = "VB",
            ["SELECT"]    = "SE",
            ["S-LINE"]    = "SL",
            ["S-BLOCK"]   = "SB",
            ["COMMAND"]   = "CMD",
            ["EX"]        = "E",
            ["REPLACE"]   = "R",
            ["V-REPLACE"] = "VR",
            ["TERMINAL"]  = "T"
          }
          return mode_map[mode] or mode
        end,
	separator = { left = "", right = "" }
      }
    },
    lualine_b = {
      "filename",
      "branch",
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        colored = true
      }
    },
    lualine_c = {
      ""
    },
    lualine_x = {
      {
        "diagnostics",
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	update_in_insert = true
      },
    },
    lualine_y = { "filetype" },
    lualine_z = {
      {
        function()
	  return string.format(
	    "%s | %s",
	    require("lualine.components.progress")(),
	    tostring(require("lualine.components.location")()):gsub("^%s*(.-)%s*$", "%1")
	  )
        end,
        separator = { left = "", right = "" }
      }
    }
  }
}
