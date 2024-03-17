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
  'nvim-lua/plenary.nvim',
  {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup()
    end,
  },
  'chrisbra/vim-diff-enhanced',
  'junegunn/vim-easy-align',
  'notjedi/nvim-rooter.lua',
  --'nvim-treesitter/nvim-treesitter',
  'RRethy/vim-illuminate',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'jiangmiao/auto-pairs',

  -- Navigation
  { 'mg979/vim-visual-multi', branch = 'master' },
  'MattesGroeger/vim-bookmarks',
  'psliwka/vim-smoothie',
  'unblevable/quick-scope',
  'nvim-tree/nvim-tree.lua',

  -- Telescope
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  -- Copilot
  'github/copilot.vim',

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
  'kdheepak/lazygit.nvim',

  -- Theme
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'onsails/lspkind.nvim',

  -- SNIPPET
  'L3MON4D3/LuaSnip',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip',

  -- Etc
  'tpope/vim-eunuch',
  -- 'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'stevearc/dressing.nvim',
    opts = {}
  }
})
