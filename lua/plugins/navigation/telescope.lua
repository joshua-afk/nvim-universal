local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    "kdheepak/lazygit.nvim",
  },
  priority = 1000,
  tag = '0.1.8'
}

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

local mappings = {
  i = {
    ["<c-d>"] = "delete_buffer",
    ["<c-BS>"] = function()
      api.nvim_input "<C-W>"
    end,
  },
  n = {
    ["<c-d>"] = "delete_buffer",
    ["dd"] = "delete_buffer",
    ["<c-p>"] = require('telescope.actions.layout').toggle_preview
  }
}

function M.config()
  local telescope = require('telescope')

  telescope.setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--trim",
        "--multiline"
      },
      color_devicons = true,
      file_ignore_patterns = ignore_these,
      -- CTRL + Backspace to delete word when using telescope
      mappings = mappings
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
    pickers = {
      find_files = {
        previewer = false,
        hidden = true,
        theme = "dropdown", -- results is messed up in large codebase
      },
      buffers = {
        theme = "dropdown"
      }
    },
  })

  -- Custom highlights
  -- local colors = require("catppuccin.palettes").get_palette()
  -- api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.mauve })
  -- api.nvim_set_hl(0, "TelescopeTitle", { fg = colors.lavender })

  -- Extensions
  telescope.load_extension('fzf')
  telescope.load_extension('quicknote')
  telescope.load_extension('lazygit')
end

return M
