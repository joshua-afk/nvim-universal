local options = { noremap = true, silent = true }

local map = api.nvim_set_keymap

-- local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- ===========================
-- ===                     ===
-- ===     VIM KEYMAPS     ===
-- ===                     ===
-- ===========================

-- Remap Leader
keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
g.mapleader = " "

-- Terminal Mode keymaps
-- Press Esc key to enter normal mode, only when Claude Code is the foreground process,
-- otherwise pass Esc through to the app (e.g. lazygit). Uses Linux /proc.
keymap.set('t', '<Esc>', function()
  local ok, comm = pcall(function()
    local stat = vim.fn.readfile('/proc/' .. vim.fn.jobpid(vim.bo.channel) .. '/stat')[1]
    -- tpgid (terminal foreground process group) is the 6th field after "(comm)"
    local tpgid = vim.split(vim.trim(stat:match('.*%)(.*)')), ' ')[6]
    return vim.fn.readfile('/proc/' .. tpgid .. '/comm')[1]
  end)
  return (ok and comm == 'claude') and [[<C-\><C-n>]] or '<Esc>'
end, { expr = true, silent = true, desc = 'Esc to normal mode in Claude Code terminal' })

if IS_WINDOWS then
  keymap.set('n', '<leader><leader>', function()
    fn.jobstart({ 'explorer.exe', fn.expand('%:h') }, { detach = true })
  end, { desc = 'Open folder in Explorer' })
elseif IS_WSL then
  keymap.set('n', '<leader><leader>', function()
    local winpath = fn.system('wslpath -w ' .. fn.shellescape(fn.expand('%:h'))):gsub('\n', '')
    fn.jobstart({ 'explorer.exe', winpath }, { detach = true })
  end, { desc = 'Open folder in Explorer (WSL)' })
elseif IS_LINUX then
  keymap.set('n', '<leader><leader>', function()
    if fn.executable('dolphin') == 1 then
      fn.jobstart({ 'dolphin', '--select', fn.expand('%:p') }, { detach = true })
    else
      fn.jobstart({ 'xdg-open', fn.expand('%:h') }, { detach = true })
    end
  end, { desc = 'Open folder in default file manager' })
else
  print 'No file manager set for this OS, check mappings.lua'
end

-- CTRL + Backspace to delete word in nvim
-- NOTE: Disable Ctrl + Backspace mapping in alacritty
map('i', "<C-BS>", "<C-W>", options)

map('n', 'yc', 'yygccp', { noremap = false, desc = "[Y]ank and paste then comment out the first line" })

-- Quickly open vimrc
map('n', '<leader>vrc', ':vsplit $MYVIMRC <cr>', options)

-- Fast save & quit
map('n', '<leader>w', ':w <cr>', options)
map('n', '<leader>q', ':q <cr>', options)

-- -- Easier split navigation (QWERTY)
-- NOTE: This conflicts with vim-tmux navigation `lua/plugins/tmux.lua`
map('n', '<c-j>', '<c-w><c-j>', options)
map('n', '<c-k>', '<c-w><c-k>', options)
map('n', '<c-l>', '<c-w><c-l>', options)
map('n', '<c-h>', '<c-w><c-h>', options)

-- Remap beginning of the line
map('n', '0', '^', options)
map('n', '^', '0', options)

-- Easy buffers
-- map('n', '<leader>n', ':bn <cr>', options)
-- map('n', '<leader>b', ':bp <cr>', options)

-- Copy to system clipboard
if not IS_MAC then
  map('v', '<leader>y', '"+y', options)
  map('n', '<leader>Y', '"+yg_', options)
  map('n', '<leader>y', '"+y', options)
  map('n', '<leader>yy', '"+yy', options)
  map('n', '<leader>yy', '"+yy', options)
end

-- Paste from system clipboard
if IS_MAC then
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
map('n', '<leader>fo', 'za', { noremap = true, silent = true, desc = '[fo]ld toggle' })

-- Swith between 2 latest buffers
-- Skip terminal buffers (e.g. :shell tab from ctrl_s_shell) and unlisted alternates,
-- otherwise the :shell tab gets hijacked and <C-s> spawns a new tabpage each time
keymap.set('n', '<tab>', function()
  local alt = vim.fn.bufnr('#')
  if vim.bo.buftype == 'terminal' or alt == -1 or not vim.bo[alt].buflisted then return end
  vim.cmd('buffer #')
end, { silent = true, desc = 'Switch to alternate buffer' })

-- Quickfix list navigation
map('n', ']q', '<cmd>cnext<cr>', options)
map('n', '[q', '<cmd>cprev<cr>', options)

-- Sort
vim.keymap.set('v', '<leader>s', [[:sort<CR>]], { desc = 'Sort selected lines' })

-- ===========================
-- ===                     ===
-- === DIAGNOSTICS KEYMAPS ===
-- ===                     ===
-- ===========================
-- Diagnostic, Fixer, Formatter, Linter, LSP

keymap.set('n', '<leader>K', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

keymap.set('n', '<leader>k', function()
  vim.diagnostic.open_float()
end, options)

map('n', '<leader>li', '<cmd>lua require("lint").try_lint()<cr>', options)

-- ===========================
-- ===                     ===
-- ===   PLUGINS KEYMAPS   ===
-- ===                     ===
-- ===========================

map('n', '<leader>a', '<cmd>AerialToggle!<cr>', options)

-- Bufferline
map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', options)
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', options)
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', options)
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', options)
map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', options)
map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', options)
map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', options)
map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', options)
map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', options)
map('n', '<leader>$', '<cmd>BufferLineGoToBuffer $<cr>', options)
map('n', '<leader>x', '<cmd>bd<cr>', { desc = '[b]uffer [k]ill' })
map('n', '<leader>X', '<cmd>BufferLineCloseOthers<cr>', { desc = 'buffer close others' })

-- Chainsaw
map('n', '<leader>cl', '<cmd>lua require("chainsaw").variableLog()<cr>', options)
map('n', '<leader>cc', '<cmd>lua require("chainsaw").clearLog()<cr>', options)
map('n', '<leader>ce', '<cmd>lua require("chainsaw").emojiLog()<cr>', options)
map('n', '<leader>cr', '<cmd>lua require("chainsaw").removeLogs()<cr>', options)

-- Comment
-- map('v', "<c-'>", "ysiw'", options)

-- Conform
map('n', '<leader>ft', '<cmd>lua require("conform").format()<cr>', options)

-- Dadbod UI
-- map('n', '<leader>d', '<cmd>NvimTreeClose<cr><cmd>DBUIToggle<cr>', options)
keymap.set('n', '<leader>d', function()
  vim.cmd('Neotree close')
  vim.cmd('DBUIToggle')
end, options)

-- Dial
vim.keymap.set("n", "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("x", "<C-a>", function()
    require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("x", "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("x", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("x", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gvisual")
end)
-- map('n', '<c-a>', '<cmd>lua require("conform").format()<cr>', options)
-- nnoremap  <C-a> <Plug>(dial-increment)
-- nnoremap  <C-x> <Plug>(dial-decrement)

-- FZF
-- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#commands
map('n', '<leader>fb', '<cmd>FzfLua buffers<cr>',        { desc = '[f]zf [b]uffers' })
map('n', '<leader>ff', '<cmd>FzfLua files<cr>',          { desc = '[f]zf [f]ind files' })
map('v', '<leader>ff', '<cmd>FzfLua grep_visual<cr>',    { desc = '[f]zf [f]ind grep visual' })
map('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>',      { desc = '[f]zf [g]rep' })
map('n', '<leader>fl', '<cmd>FzfLua lsp_references<cr>', { desc = '[f]zf [l]sp references' })
-- map('n', '<leader>fo', '<cmd>FzfLua oldfiles<cr>',       { desc = '[f]zf [o]ld files' })
map('n', '<leader>fr', '<cmd>FzfLua resume<cr>',         { desc = '[f]zf [r]esume' })
map('n', '<leader>fw', '<cmd>FzfLua grep_cword<cr>',     { desc = '[f]zf grep [w]ord under cursor' })
map('n', '<leader>gl', '<cmd>FzfLua git_bcommits<cr>',   { desc = 'Buffer [g]it [l]og' })

-- Git Blame
map('n', '<leader>gb', ':GitBlameToggle <cr>', options)
map('n', '<leader>go', ':GitBlameOpenCommitURL <cr>', options)

-- Git Blame
map('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', options)

-- Git Signs
map('n', '<leader>h', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'gitsign preview [h]unk' })
map('n', '[g', '<cmd>Gitsigns nav_hunk prev<cr>', { desc = 'Gitsign jump to prev git hunk' })
map('n', ']g', '<cmd>Gitsigns nav_hunk next<cr>', { desc = 'Gitsign jump to next git hunk' })

-- Indent Blankline
-- Toggle UI related enhancements
keymap.set('n', '<leader>u', function()
  vim.cmd('IBLToggle')
  vim.cmd('GitBlameToggle')
  vim.cmd('Gitsigns toggle_signs')
  vim.cmd('IlluminateToggle')
  vim.cmd('lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())')
end, options)

-- Lazygit
map('n', '<leader>lg', ':LazyGit <cr>', options)
map('n', '<leader>lc', ':LazyGitFilterCurrentFile <cr>', options)
-- map('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', options)

-- MultiCursor:START --
local mc = require("multicursor-nvim")

-- Add or skip adding a new cursor by matching word/selection
keymap.set({'n', 'v'}, '<leader>n', function()
  mc.matchAddCursor(1)
end, options)
-- MultiCursor:END --

-- Neo-Tree
keymap.set('n', '<leader>e', function()
  vim.cmd('DBUIClose')
  vim.cmd('Neotree float toggle')
end, options)
map('n', '<leader>i', '<cmd>Neotree float reveal<cr>', options)

-- QuickNote (mapping inspiration got from vim-bookmark, just changed the `m` to `s`)
map('n', '<leader>st', '<cmd>lua require("quicknote").ToggleNoteSigns()<cr>', options)
map('n', '<leader>ss', '<cmd>lua require("quicknote").NewNoteAtCurrentLine()<cr>', options)
map('n', '<leader>sd', '<cmd>lua require("quicknote").DeleteNoteAtCurrentLine()<cr>', options)
map('n', '<leader>sf', '<cmd>Telescope quicknote scope=CurrentBuffer<cr>', options)
map('n', '<leader>sa', '<cmd>lua require("quicknote").ListNotesForCurrentBuffer()<cr>', options)
map('n', '<leader>sn', '<cmd>lua require("quicknote").JumpToNextNote()<cr>', options)
-- map('n', '<leader>sp', '<cmd>lua require("quicknote").JumpToPreviousNote()<cr>', options)

-- Telescope (File Pickers)
-- map('n', '<leader>ff', ':lua require("telescope.builtin").find_files() <cr>', options)
-- map('n', '<leader>ff', ':lua require("telescope.builtin").find_files({layout_config={height=0.90,width=0.75}}) <cr>', options)
-- map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep() <cr>', options)
-- map('n', '<leader>fb', ':lua require("telescope.builtin").buffers({layout_config={width=0.5}}) <cr>', options)
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags() <cr>', options)
-- map('n', '<leader>fl', ':lua require("telescope.builtin").highlights() <cr>', options)
-- map('n', '<leader>fo', ':lua require("telescope.builtin").oldfiles() <cr>', options)

-- Telescope (Dir)
map('n', '<leader>fdf', ':FileInDirectory <cr>', options)
map('n', '<leader>fdg', ':GrepInDirectory <cr>', options)

-- Telescope (Git)
map('n', '<leader>fc', ':lua require("telescope.builtin").git_commits() <cr>', options)
-- map('n', '<leader>fgb', ':lua require("telescope.builtin").git_branches() <cr>', options)
map('n', '<leader>fs', ':lua require("telescope.builtin").git_status() <cr>', options)

-- Telescope (Misc)
-- map('n', '<leader>fr', ':Telescope resume <cr>', options)
-- map('n', '<leader>snip', ':Telescope luasnip <cr>', { noremap = true })

-- ToggleTerm
-- map('n', '<leader>ft', ':ToggleTerm<cr>', options)

-- Undotree
-- map('n', '<leader>u', ':lua require("undotree").toggle() <cr>', options)

-- vim-test (list of commands: https://github.com/vim-test/vim-test?tab=readme-ov-file#setup)
map('n', '<leader>tt', '<cmd>TestNearest<cr>', options)
map('n', '<leader>tT', '<cmd>TestFile<cr>', options)

-- ===========================
-- ===                     ===
-- ===   CUSTOM KEYMAPS    ===
-- ===                     ===
-- ===========================

-- Ruby on Rails: quick switch to rspec
-- `%:s/^app/spec/` Replaces the app/ directory with spec/.
-- `:r_spec.rb` Removes the file extension (.rb) and adds _spec.rb to the filename.
-- map('n', '<leader>test', ':e %:s/^app/spec/:r_spec.rb <cr>', options)
map('n', '<leader>test', ':e %:s/app/spec/:r_spec.rb <cr>', options)

-- Quick switch to current file scss & js
-- `:r` removes the file extension
-- `.scss` or `.js` add files extension to the modified filename
-- map('n', '<leader>st', ':e %:r.scss <cr>', options)
-- map('n', '<leader>js', ':e %:r.js <cr>', options)

-- Quick switch to current file scss & js
-- `:e` is edit command of vim
-- `%` current file full path
-- `:r` removes the file extension
-- `.scss` or `.js` add files extension to the modified filename
map('n', '<leader>st', ':e %:r.scss <cr>', options)
map('n', '<leader>js', ':e %:r.js <cr>', options)

-- Zen
-- map('n', '<leader>z', '<cmd>ZenMode<cr>', options)

-- TODO: DRAFT
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

-- Go to file (gf shortcut to 2 mouse clicks)
vim.keymap.set('n', '<2-LeftMouse>', 'gf', { noremap = true, silent = true })
