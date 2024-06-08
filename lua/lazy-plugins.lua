local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

opt.rtp:prepend(lazypath)

local plugins = {
  { import = "plugins" },
  { import = "plugins.completion" },
  { import = "plugins.lsp" },
  { import = "plugins.obsidian" },

  'nvim-pack/nvim-spectre',

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

  -- Linting
  -- 'mfussenegger/nvim-lint',
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

  -- SNIPPET
  -- 'L3MON4D3/LuaSnip',
  -- 'hrsh7th/nvim-cmp',
  -- 'hrsh7th/cmp-buffer',
  -- 'hrsh7th/cmp-path',
  -- 'hrsh7th/cmp-cmdline',
  -- 'rafamadriz/friendly-snippets',
  -- 'saadparwaiz1/cmp_luasnip',

  -- Etc
  'tpope/vim-eunuch',
}

local opts = {
  install = {
    colorscheme = { "catppuccin" }
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
}

require("lazy").setup(plugins, opts)
