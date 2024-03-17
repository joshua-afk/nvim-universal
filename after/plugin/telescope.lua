local telescope = require('telescope')

-- Options
local ignore_these = {
  '.git',
  '.yarn',
  '.neuron',
  'node_modules',
  'fonts',
  'icons',
  'images',
  'dist',
  'build',
  'yarn.lock',
  'package-lock.json',
  'vendor',
  'tags'
}

telescope.setup {
  defaults = {
    -- prompt_prefix = '🔍 ',
    color_devicons = true,
    layout_strategy = 'flex',
    file_ignore_patterns = ignore_these,
    -- preview = false
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    buffers = {
      theme = "dropdown"
    },
  },
}

telescope.load_extension('lazygit')
