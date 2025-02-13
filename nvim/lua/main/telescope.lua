require("telescope").setup{
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
                ["i"] = {},
                ["n"] = {},
            }
        }
    }
}

require("telescope").load_extension "file_browser"

vim.api.nvim_create_user_command("FF", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
end, {})

vim.api.nvim_create_user_command("FG", function()
  require("telescope.builtin").live_grep({
    cwd = vim.fn.expand("%:p:h"),
    case_mode = "smart"
  })
end, {})


-- Telescope live_grep find_command=rg,--smart-case

