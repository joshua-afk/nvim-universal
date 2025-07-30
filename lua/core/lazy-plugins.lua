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
  { import = "plugins.colorschemes.init" },
  { import = "plugins.core" },
  { import = "plugins.database" },
  { import = "plugins.debugging" },
  { import = "plugins.git" },
  { import = "plugins.lsp" },
  { import = "plugins.navigation" },
  { import = "plugins.nice-to-have" },
  -- { import = "plugins.completion" },
  -- { import = "plugins.diagnostics" },
  -- { import = "plugins.linters" },
  -- { import = "plugins.obsidian" },

  -- Core
  'chrisbra/vim-diff-enhanced',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'jiangmiao/auto-pairs',

  -- Formatting
  'tommcdo/vim-lion', -- align text by some character

  -- Navigation
  -- 'MattesGroeger/vim-bookmarks',
  'psliwka/vim-smoothie',

  -- Linting
  -- 'sheerun/vim-polyglot',
  -- 'mfussenegger/nvim-lint',
  'digitaltoad/vim-pug',
  'jwalton512/vim-blade',
  'pangloss/vim-javascript',
  'statico/vim-javascript-sql',
  -- 'vim-ruby/vim-ruby',
  -- 'tpope/vim-rails',
  'godlygeek/tabular',
  'MaxMEllon/vim-jsx-pretty',
  'joereynolds/sql-lint',
  'vim-python/python-syntax',
  'tbastos/vim-lua',
  'ap/vim-css-color',

  -- Git
  'tpope/vim-fugitive',

  -- Debugging
  'vim-test/vim-test',

  -- Etc
  -- Vim sugar for the UNIX shell commands that need it the most.
  -- 'tpope/vim-eunuch',

  -- Archive
  -- 'junegunn/vim-easy-align',
}

local opts = {
  change_detection = {
    enabled = false,
    notify = false,
  },
}

require("lazy").setup(plugins, opts)
