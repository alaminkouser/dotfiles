local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.font_size = 18.0
config.use_fancy_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.show_tab_index_in_tab_bar = false
config.default_cwd = "."
config.initial_cols = 120
config.initial_rows = 24
config.default_cursor_style = "BlinkingBar"
config.tab_max_width = 16
config.use_resize_increments = true
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left   = 0,
	right  = 0,
	top    = 0,
	bottom = 0,
}

config.colors = {
	cursor_bg = "#ffffff",
	cursor_border = "#ffffff",
	selection_fg = "#000000",
	selection_bg = "#ffffff",
	tab_bar = {
		background = "rgba(0,0,0,0.85)",
	}
}

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(wezterm.format {
        {
			Text = pane:get_foreground_process_name():match("[\\/]([^\\/]-)$")
				or pane:get_foreground_process_name()
		}
    })
end)

config.keys = {
	{
		key = "F11",
		action = wezterm.action.ToggleFullScreen
	}
}


return config
