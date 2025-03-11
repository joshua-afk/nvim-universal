local options = { noremap = true, silent = true }
local map = api.nvim_set_keymap

-- local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- Remap Leader
keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
g.mapleader = " "

-- CTRL + Backspace to delete word in nvim
-- NOTE: Disable Ctrl + Backspace mapping in alacritty
map('i', "<C-BS>", "<C-W>", options)

-- Quickly open vimrc
map('n', '<leader>vrc', ':vsplit $MYVIMRC <cr>', options)

-- Fast save & quit
map('n', '<leader>w', ':w <cr>', options)
map('n', '<leader>q', ':q <cr>', options)

-- Easier split navigation (QWERTY)
map('n', '<c-j>', '<c-w><c-j>', options)
map('n', '<c-k>', '<c-w><c-k>', options)
map('n', '<c-l>', '<c-w><c-l>', options)
map('n', '<c-h>', '<c-w><c-h>', options)

-- Remap beginning of the line
map('n', '0', '^', options)
map('n', '^', '0', options)

-- Easy buffers
map('n', '<leader>n', ':bn <cr>', options)
map('n', '<leader>b', ':bp <cr>', options)

-- Copy to system clipboard
if not fn.has('macunix') then
  map('v', '<leader>y', '"+y', options)
  map('n', '<leader>Y', '"+yg_', options)
  map('n', '<leader>y', '"+y', options)
  map('n', '<leader>yy', '"+yy', options)
  map('n', '<leader>yy', '"+yy', options)
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

  -- map('n', 'p', '<cmd>r !pbpaste <cr>', options)
  -- map('v', 'p', 'd<cmd>r !pbpaste <cr>', options)
else
  map('n', '<leader>p', '"+p', options)
  map('n', '<leader>P', '"+P', options)
  map('v', '<leader>p', '"+p', options)
  map('v', '<leader>P', '"+P', options)
end

-- Hit <enter> to insert new line in normal mode
map('n', '<enter>', 'o<esc>', options)
map('n', 's<enter>', 'o<esc>', options)

-- Close HTML tag
map('i', '<c-c>', '</<c-x><c-o><c-x>', options)

-- Faster open splits
map('n', '<leader>vs', ':vsplit <cr>', options)
map('n', '<leader>sp', ':split <cr>', options)

-- Vertical resize for sidenav
map('n', '<leader>30', ':vertical resize 30 <cr>', options)

-- Open explorer.exe in current directory

-- Fast fold block of code
map('n', 'zz', 'zf%', options)

-- Swith between 2 latest buffers
map('n', '<tab>', '<c-6>', options)

-- Comment
-- map('v', "<c-'>", "ysiw'", options)

-- LSP
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)
-- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, options)

-- Telescope (File Pickers)
-- map('n', '<leader>ff', ':lua require("telescope.builtin").find_files() <cr>', options)
map('n', '<leader>ff', ':lua require("telescope.builtin").find_files({layout_config={height=0.90,width=0.75}}) <cr>', options)
map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep() <cr>', options)
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers({layout_config={width=0.5}}) <cr>', options)
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags() <cr>', options)
map('n', '<leader>fo', ':lua require("telescope.builtin").oldfiles() <cr>', options)

-- Telescope (Git)
map('n', '<leader>fc', ':lua require("telescope.builtin").git_commits() <cr>', options)
-- map('n', '<leader>fgb', ':lua require("telescope.builtin").git_branches() <cr>', options)
map('n', '<leader>fs', ':lua require("telescope.builtin").git_status() <cr>', options)

-- -- Telescope (Git)
-- map('n', '<leader>snip', ':Telescope luasnip <cr>', { noremap = true })

-- Telescope (Misc)
map('n', '<leader>fr', ':Telescope resume <cr>', options)

-- Dir-Telescope
map('n', '<leader>fdf', ':FileInDirectory <cr>', options)

map('n', '<leader>fdg', ':GrepInDirectory <cr>', options)

-- nvim-tree
-- map('n', '<leader>e', '<cmd>DBUIClose<cr><cmd>NvimTreeToggle<cr>', options)
-- map('n', '<leader>r', ':NvimTreeRefresh <cr>', options)
-- map('n', '<leader>i', ':NvimTreeFindFile <cr>', options)

-- neo-tree
map('n', '<leader>e', '<cmd>Neotree toggle<cr>', options)
map('n', '<leader>i', '<cmd>Neotree reveal<cr>', options)

-- Lazygit
map('n', '<leader>lg', ':LazyGit <cr>', options)
-- map('n', '<leader>lgc', ':LazyGitFilterCurrentFile <cr>', options)

-- Quick switch to current file scss & js
-- `:r` removes the file extension
-- `.scss` or `.js` add files extension to the modified filename
map('n', '<leader>st', ':e %:r.scss <cr>', options)
map('n', '<leader>js', ':e %:r.js <cr>', options)

-- Quick switch to current file scss & js
-- `:e` is edit command of vim
-- `%` current file full path
-- `:r` removes the file extension
-- `.scss` or `.js` add files extension to the modified filename
map('n', '<leader>st', ':e %:r.scss <cr>', options)
map('n', '<leader>js', ':e %:r.js <cr>', options)

-- Ruby on Rails: quick switch to rspec
-- `%:s/^app/spec/` Replaces the app/ directory with spec/.
-- `:r_spec.rb` Removes the file extension (.rb) and adds _spec.rb to the filename.
map('n', '<leader>test', ':e %:s/^app/spec/:r_spec.rb <cr>', options)

-- Dadbod UI
-- map('n', '<leader>d', '<cmd>NvimTreeClose<cr><cmd>DBUIToggle<cr>', options)
map('n', '<leader>d', '<cmd>Neotree close<cr><cmd>DBUIToggle<cr>', options)

-- Git BLame
map('n', '<leader>gb', ':GitBlameToggle <cr>', options)
map('n', '<leader>go', ':GitBlameOpenCommitURL <cr>', options)

-- Zen
map('n', '<leader>z', '<cmd>ZenMode<cr>', options)


-- Undotree
map('n', '<leader>u', ':lua require("undotree").toggle() <cr>', options)
-- ToggleTerm
-- map('n', '<leader>t', ':ToggleTerm<cr>', options)

-- Debugging
map('n', '<leader>cl', '<cmd>lua require("chainsaw").variableLog()<cr>', options)
map('n', '<leader>cc', '<cmd>lua require("chainsaw").clearLog()<cr>', options)
map('n', '<leader>ce', '<cmd>lua require("chainsaw").emojiLog()<cr>', options)
map('n', '<leader>cr', '<cmd>lua require("chainsaw").removeLogs()<cr>', options)

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
map('n', '<c-]', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
-- map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
map('n', '<leader>ft', '<cmd>lua vim.lsp.buf.format()<cr>', options)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', options)
map('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', options)
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
map('n', '<leader>tsi', '<cmd>TSToolsAddMissingImports<cr>', options)
map('n', '<leader>tss', '<cmd>TSToolsSortImports<cr>', options)
map('n', '<leader>tsr', '<cmd>TSToolsRemoveUnusedImports<cr>', options)
map('n', '<leader>tsl', '<cmd>TSToolsFileReferences<cr>', options)

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
