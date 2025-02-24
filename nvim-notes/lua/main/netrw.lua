vim.g.netrw_browsex_viewer = ""

local function get_markdown_headers()
    local files = vim.fn.systemlist("find . -type f -name '*.md'") -- Find all Markdown files recursively
    local results = {}
    local file_map = {}

    for _, file in ipairs(files) do
        for line in io.lines(file) do
            if line:match("^# ") then
                local entry = file .. " → " .. line
                table.insert(results, entry)
                file_map[#results] = file -- Store mapping of line number to file
                break
            end
        end
    end

    if #results == 0 then
        print("No headers found in Markdown files.")
        return
    end

    -- Open a new scratch buffer for the results
    vim.api.nvim_command("new") -- Open a new buffer (not a split)
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, results) -- Populate buffer with headers
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "buftype", "nofile") -- Prevent saving the buffer
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe") -- Close buffer when switching

    -- Define a function to open the selected file
    local function open_selected_file()
        local line = vim.api.nvim_win_get_cursor(0)[1] -- Get the current cursor line
        local file = file_map[line]
        if file then
            vim.cmd("bd!") -- Close the current buffer
            vim.cmd("e " .. vim.fn.fnameescape(file)) -- Open the selected file in full view
        end
    end

    -- Set a keybinding for <Enter> to open the file
    vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "", {
        noremap = true,
        silent = true,
        callback = open_selected_file,
    })
end

-- Create a Neovim command for easy execution
vim.api.nvim_create_user_command("Ex", get_markdown_headers, {})










vim.g.netrw_list_hide = [[^\./$,^.marksman.toml$]]
vim.g.netrw_hide = 1

-- vim.g.netrw_liststyle = 3  -- Set the tree view style for netrw

vim.g.netrw_banner = 0

vim.g.netrw_preview = 1

