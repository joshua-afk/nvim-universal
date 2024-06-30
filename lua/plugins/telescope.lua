return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kdheepak/lazygit.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      local telescope = require('telescope')

      local ignore_these = {
        '.git/.*',
        '.neuron',
        '.yarn',
        'build',
        'dist',
        'eslintReport.json',
        'fonts',
        'icons',
        'images',
        'node_modules',
        'package-lock.json',
        'tags',
        'vendor',
        'yarn.lock'
      }

      telescope.setup({
        defaults = {
          color_devicons = true,
          file_ignore_patterns = ignore_these,
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
        pickers = {
          find_files = {
            previewer = false
            -- theme = "dropdown" -- results is messed up in large codebase
          },
          buffers = {
            theme = "dropdown"
          }
        },
      })

      telescope.load_extension('lazygit')
      telescope.load_extension('fzf')
    end
  }

}
