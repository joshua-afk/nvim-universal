local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },

  -- Core
  'chrisbra/vim-diff-enhanced',
  'junegunn/vim-easy-align',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'jiangmiao/auto-pairs',

  -- Navigation
  { 'mg979/vim-visual-multi', branch = 'master' },
  'MattesGroeger/vim-bookmarks',
  'psliwka/vim-smoothie',
  'unblevable/quick-scope',

  -- -- Copilot
  -- 'github/copilot.vim',

  -- Linting
  'mfussenegger/nvim-lint',
  'digitaltoad/vim-pug',
  'jwalton512/vim-blade',
  'pangloss/vim-javascript',
  'statico/vim-javascript-sql',
  'vim-ruby/vim-ruby',
  'godlygeek/tabular',
  'MaxMEllon/vim-jsx-pretty',
  'joereynolds/sql-lint',
  'vim-python/python-syntax',
  'tbastos/vim-lua',
  'ap/vim-css-color',
  { "folke/neodev.nvim", opts = {} },

  -- Git
  'tpope/vim-fugitive',
  --'f-person/git-blame.nvim',
  -- 'kdheepak/lazygit.nvim',

  -- Theme
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- LSP
  -- 'williamboman/mason.nvim',
  -- 'williamboman/mason-lspconfig.nvim',
  -- 'neovim/nvim-lspconfig',
  -- 'onsails/lspkind.nvim',

  -- SNIPPET
  'L3MON4D3/LuaSnip',
  'hrsh7th/nvim-cmp',
  -- 'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip',

  -- Etc
  'tpope/vim-eunuch',
  {
    'stevearc/dressing.nvim',
    opts = {}
  }
})
