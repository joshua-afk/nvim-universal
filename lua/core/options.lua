local icons = require('icons')

local o   = vim.o
local opt = vim.opt

o.termguicolors = true
o.encoding='UTF-8'
o.hidden=true
o.cmdheight=1
o.updatetime=100
o.shortmess=o.shortmess .. "c"
o.scrolloff=8
o.number=true
o.relativenumber=true
o.laststatus=2
o.linespace=4
o.showmode=true
o.hlsearch=false
o.wrap=false
o.tags='tags'
o.shiftround=true
o.backspace='indent,eol,start'
o.autoindent=true
o.copyindent=true
o.ignorecase=true
o.smartcase=true
o.showcmd=true
o.viewoptions = o.viewoptions:gsub('options', '')
o.mouse='a'
o.ttyfast=true
o.lazyredraw=false
o.clipboard='unnamedplus'
o.fixendofline=false
o.completeopt='menu,menuone,noselect'
o.signcolumn='yes'
o.winborder='rounded'

-- Backup file
o.swapfile=false
o.backup=false
o.writebackup=false
o.undofile=true
opt.undodir=vim.fn.expand("~/.config/nvim-undo")

-- TAB
o.tabstop=2       -- Width of tab character
o.softtabstop=2   -- Fine tunes the amount of white space to be added
o.shiftwidth=2    -- Number of spaces to use for autoindenting
o.expandtab=true  -- Use spaces instead of tabs

-- Split
o.splitbelow=true
o.splitright=true
o.splitkeep='cursor'

-- Folding. (Working)
o.foldenable = true
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.lsp.foldexpr()' -- OPTIONS: indent, v:lua.vim.treesitter.foldexpr()
o.foldcolumn = '1'
o.foldlevelstart = 99
-- o.foldtext = ''

-- Related files:
-- lua/plugins/nice-to-have/indent-blankline.lua:89
-- lua/plugins/nice-to-have/statuscol.lua:84
opt.fillchars = {
  eob = ' ',
  fold = ' ',
  -- foldclose = icons.arrows.right,
  -- foldopen = icons.arrows.down,
  -- foldsep = ' ',
  msgsep = '─',
}

vim.cmd [[
  " set fillchars=fold:\
  set foldtext=CustomFoldText()

  function! CustomFoldText()
    " get first non-blank line
    let fs = v:foldstart

    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile

    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
    return line . expansionString . foldSizeStr . foldLevelStr
  endfunction
]]
