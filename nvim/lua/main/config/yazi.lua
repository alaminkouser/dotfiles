require("yazi").setup({
  open_for_directories = true,
  floating_window_scaling_factor = 1,
  yazi_floating_window_border = "none",
  hooks = {
    yazi_closed_successfully = function(chosen_file)
      if chosen_file == nil then
        if vim.v.vim_did_enter == 0 then return end

        local buf = vim.api.nvim_get_current_buf()
        if not vim.api.nvim_buf_is_loaded(buf) then return end

        local name = vim.api.nvim_buf_get_name(buf)
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

        if name == "" and #lines == 1 and lines[1] == "" then
          vim.cmd("q")
        end
      end
    end
  }
})

vim.g.loaded_netrwPlugin = 1
