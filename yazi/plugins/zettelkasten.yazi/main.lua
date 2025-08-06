return {
  preview = {
    ["*.md"] = function(ctx)
      local file_path = ctx.file
      local file = io.open(file_path, "r")

      if not file then
        return ctx:fail("Could not open file")
      end

      local title = "(no title)"
      for line in file:lines() do
        if line:match("%S") then
          title = line
          break
        end
      end
      file:close()

      ctx:spot("📄 " .. title)

      -- Use 'bat' if available, fallback to 'cat'
      local previewer = vim.fn.executable("bat") == 1 and "bat" or "cat"
      local cmd = previewer == "bat" and { "bat", "--paging=never", "--style=plain", "--color=always", file_path }
        or { "cat", file_path }

      return ctx:subproc(cmd)
    end,
  },
}
