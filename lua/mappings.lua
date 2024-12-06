local options = { noremap = true, silent = true }
-- local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- Remap Leader
keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
g.mapleader = " "

-- CTRL + Backspace to delete word in nvim
-- NOTE: Disable Ctrl + Backspace mapping in alacritty
api.nvim_set_keymap('i', "<C-BS>", "<C-W>", options)

-- Quickly open vimrc
api.nvim_set_keymap('n', '<leader>vrc', ':vsplit $MYVIMRC <cr>', options)

-- Fast save & quit
api.nvim_set_keymap('n', '<leader>w', ':w <cr>', options)
api.nvim_set_keymap('n', '<leader>q', ':q <cr>', options)

-- Easier split navigation (QWERTY)
api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', options)
api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', options)
api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', options)
api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', options)

-- Remap beginning of the line
api.nvim_set_keymap('n', '0', '^', options)
api.nvim_set_keymap('n', '^', '0', options)

-- Easy buffers
api.nvim_set_keymap('n', '<leader>n', ':bn <cr>', options)
api.nvim_set_keymap('n', '<leader>b', ':bp <cr>', options)

-- Copy to system clipboard
if not fn.has('macunix') then
  api.nvim_set_keymap('v', '<leader>y', '"+y', options)
  api.nvim_set_keymap('n', '<leader>Y', '"+yg_', options)
  api.nvim_set_keymap('n', '<leader>y', '"+y', options)
  api.nvim_set_keymap('n', '<leader>yy', '"+yy', options)
  api.nvim_set_keymap('n', '<leader>yy', '"+yy', options)
end

-- Paste from system clipboard
if fn.has('macunix') then
  keymap.set('n', '<leader>p', function()
    cmd('r !pbpaste')
  end, options)

  keymap.set('v', '<leader>p', function()
    -- Send `d` keystroke
    api.nvim_feedkeys("d", "n", true)

    -- 0ms command execution delay
    vim.defer_fn(function()
      cmd('r !pbpaste')
    end, 0)
  end, options)

  -- keymap.set('v', 'p', {"d", "<cmd>", "r !pbpaste", "<cr>"}, options)

  -- api.nvim_set_keymap('n', 'p', '<cmd>r !pbpaste <cr>', options)
  -- api.nvim_set_keymap('v', 'p', 'd<cmd>r !pbpaste <cr>', options)
else
  api.nvim_set_keymap('n', '<leader>p', '"+p', options)
  api.nvim_set_keymap('n', '<leader>P', '"+P', options)
  api.nvim_set_keymap('v', '<leader>p', '"+p', options)
  api.nvim_set_keymap('v', '<leader>P', '"+P', options)
end

-- Hit <enter> to insert new line in normal mode
api.nvim_set_keymap('n', '<enter>', 'o<esc>', options)
api.nvim_set_keymap('n', 's<enter>', 'o<esc>', options)

-- Close HTML tag
api.nvim_set_keymap('i', '<c-c>', '</<c-x><c-o><c-x>', options)

-- Faster open splits
api.nvim_set_keymap('n', '<leader>vs', ':vsplit <cr>', options)
api.nvim_set_keymap('n', '<leader>sp', ':split <cr>', options)

-- Vertical resize for sidenav
api.nvim_set_keymap('n', '<leader>30', ':vertical resize 30 <cr>', options)

-- Open explorer.exe in current directory

-- Fast fold block of code
api.nvim_set_keymap('n', 'zz', 'zf%', options)

-- Swith between 2 latest buffers
api.nvim_set_keymap('n', '<tab>', '<c-6>', options)

-- Comment
-- api.nvim_set_keymap('v', "<c-'>", "ysiw'", options)

-- LSP
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)
-- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, options)

-- Telescope (File Pickers)
api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files() <cr>', options)
api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep() <cr>', options)
api.nvim_set_keymap('n', '<leader>fb', ':lua require("telescope.builtin").buffers({layout_config={width=0.5}}) <cr>', options)
api.nvim_set_keymap('n', '<leader>fh', ':lua require("telescope.builtin").help_tags() <cr>', options)

-- Telescope (Git)
api.nvim_set_keymap('n', '<leader>fc', ':lua require("telescope.builtin").git_commits() <cr>', options)
-- api.nvim_set_keymap('n', '<leader>fgb', ':lua require("telescope.builtin").git_branches() <cr>', options)
api.nvim_set_keymap('n', '<leader>fs', ':lua require("telescope.builtin").git_status() <cr>', options)

-- -- Telescope (Git)
-- api.nvim_set_keymap('n', '<leader>snip', ':Telescope luasnip <cr>', { noremap = true })

-- Telescope (Misc)
api.nvim_set_keymap('n', '<leader>fr', ':Telescope resume <cr>', options)

-- Dir-Telescope
api.nvim_set_keymap('n', '<leader>fdf', ':FileInDirectory <cr>', options)

api.nvim_set_keymap('n', '<leader>fdg', ':GrepInDirectory <cr>', options)

-- nvim-tree
api.nvim_set_keymap('n', '<leader>e', '<cmd>DBUIClose<cr><cmd>NvimTreeToggle<cr>', options)
api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh <cr>', options)
api.nvim_set_keymap('n', '<leader>i', ':NvimTreeFindFile <cr>', options)

-- Lazygit
api.nvim_set_keymap('n', '<leader>lg', ':LazyGit <cr>', options)
-- api.nvim_set_keymap('n', '<leader>lgc', ':LazyGitFilterCurrentFile <cr>', options)

-- Quick switch to current file scss & js
-- `:r` removes the file extension
-- `.scss` or `.js` add files extension to the modified filename
api.nvim_set_keymap('n', '<leader>st', ':e %:r.scss <cr>', options)
api.nvim_set_keymap('n', '<leader>js', ':e %:r.js <cr>', options)

-- Quick switch to current file scss & js
-- `:e` is edit command of vim
-- `%` current file full path
-- `:r` removes the file extension
-- `.scss` or `.js` add files extension to the modified filename
api.nvim_set_keymap('n', '<leader>st', ':e %:r.scss <cr>', options)
api.nvim_set_keymap('n', '<leader>js', ':e %:r.js <cr>', options)

-- Ruby on Rails: quick switch to rspec
-- `%:s/^app/spec/` Replaces the app/ directory with spec/.
-- `:r_spec.rb` Removes the file extension (.rb) and adds _spec.rb to the filename.
api.nvim_set_keymap('n', '<leader>test', ':e %:s/^app/spec/:r_spec.rb <cr>', options)

-- Dadbod UI
api.nvim_set_keymap('n', '<leader>d', '<cmd>NvimTreeClose<cr><cmd>DBUIToggle<cr>', options)

-- Git BLame
api.nvim_set_keymap('n', '<leader>gb', ':GitBlameToggle <cr>', options)
api.nvim_set_keymap('n', '<leader>go', ':GitBlameOpenCommitURL <cr>', options)

-- Zen
api.nvim_set_keymap('n', '<leader>z', '<cmd>ZenMode<cr>', options)


-- Undotree
api.nvim_set_keymap('n', '<leader>u', ':lua require("undotree").toggle() <cr>', options)
-- ToggleTerm
-- api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<cr>', options)

-- Debugging
api.nvim_set_keymap('n', '<leader>cl', '<cmd>lua require("chainsaw").variableLog()<cr>', options)
api.nvim_set_keymap('n', '<leader>cc', '<cmd>lua require("chainsaw").clearLog()<cr>', options)
api.nvim_set_keymap('n', '<leader>ce', '<cmd>lua require("chainsaw").emojiLog()<cr>', options)
api.nvim_set_keymap('n', '<leader>cr', '<cmd>lua require("chainsaw").removeLogs()<cr>', options)

-- LSP Diagnostic
keymap.set('n', '<leader>j', function()
  vim.diagnostic.goto_next()
end, options)

-- keymap.set('n', '<leader>k', function()
--   vim.diagnostic.goto_prev()
-- end, options)

keymap.set('n', '<leader>k', function()
  vim.diagnostic.open_float()
end, options)

-- LSP things
api.nvim_set_keymap('n', '<c-]', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
api.nvim_set_keymap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.format()<cr>', options)
api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', options)
api.nvim_set_keymap('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', options)
keymap.set('n', '<c-t>', function()
  local filetype = vim.bo.filetype

  cmd('vsplit')
  if filetype == 'markdown' then
    cmd('ObsidianFollowLink')
  else
    -- Use api.nvim_feedkeys to simulate pressing <c-]>
    api.nvim_feedkeys(api.nvim_replace_termcodes("<c-]>", true, true, true), 'n', true)
  end
end, options)

-- LSP TSX
api.nvim_set_keymap('n', '<leader>tsi', '<cmd>TSToolsAddMissingImports<cr>', options)
api.nvim_set_keymap('n', '<leader>tss', '<cmd>TSToolsSortImports<cr>', options)
api.nvim_set_keymap('n', '<leader>tsr', '<cmd>TSToolsRemoveUnusedImports<cr>', options)
api.nvim_set_keymap('n', '<leader>tsl', '<cmd>TSToolsFileReferences<cr>', options)

-- keymap.set('n', '<c-a>', vim.lsp.buf.code_action, bufopts) -- this is working (but c-a mapping is for increment number)
-- g.mapping_code_action = { mode = 'n', mapping = '<c-a>', command = vim.lsp.buf.code_action }
-- g.mapping_buf_hover = keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

-- vim.cmd [[
-- " Like gJ, but always remove spaces
-- fun! s:join_spaceless()
--     execute 'normal! gJ'
--
--     " Remove character under the cursor if it's whitespace.
--     if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
--         execute 'normal! dw'
--     endif
-- endfun
--
-- " Map it to a key
-- nnoremap J :call <sid>join_spaceless()<cr>
-- ]]
