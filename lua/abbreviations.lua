-- Link and Reload nvim config (lua)
vim.cmd('abb reload luafile %<Esc>')

-- Pane controls
vim.cmd('abb vr vertical resize')
vim.cmd('abb vdiff vertical diffsplit')

-- Telescope commands shortcuts
vim.cmd('abb tgrep lua require("telescope.builtin").live_grep { noremap = true, prompt_title="Grep with Filtered Files", additional_args=function() return {"-g*.js"} end}')
