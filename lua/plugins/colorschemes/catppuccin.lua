local highlights = require('core.highlights')

local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  dependencies = {
    {
      'hiphish/rainbow-delimiters.nvim',
      enabled = false
    },
  },
}

local integrations = {
  cmp = false,
  fzf = true,
  neotree = true,
  nvimtree = false,
  indent_blankline = {
    enabled = true,
    scope_color = "mauve", -- catppuccin color (eg. `lavender`) Default: text
    colored_indent_levels = false,
  },
  dropbar = {
    enabled = true,
    color_mode = true, -- enable color for kind's texts, not just kind's icons
  },
  -- rainbow_delimiters = true,
  treesitter = true,
}

function M.config()
  local c = require("catppuccin")
  local mocha = require("catppuccin.palettes").get_palette "mocha"
  local macchiato = require("catppuccin.palettes").get_palette "macchiato"

  c.setup({
    background = {
      light = "latte",
      dark = "macchiato",
    },
    transparent_background = false,
    float = {
      transparent = false,
      solid = false,
    },
    dim_inactive = {
      enabled = false,
      -- percentage = 0.45, -- for mocha; percentage of the shade to apply to the inactive window
      shade = "dark",
      percentage = 0.15, -- for macchiato; percentage of the shade to apply to the inactive window
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
      macchiato = {
        base = "#292C3C", -- identical to vscode catppuccin background
      },
    },
    integrations = integrations,
  })

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      highlights.apply()
    end,
  })

  -- api.nvim_set_hl(0, "@constant.ruby", { fg = mocha.peach, bold = true }) -- Constant
  -- api.nvim_set_hl(0, "@type.ruby", { fg = mocha.yellow, bold = true }) -- Constant call
  -- api.nvim_set_hl(0, "@constant.ruby", { fg = macchiato.peach, bold = true }) -- Constant
  -- api.nvim_set_hl(0, "@type.ruby", { fg = macchiato.yellow, bold = true }) -- Constant call
  -- api.nvim_set_hl(0, "@function.ruby", { fg = "#EED8DA"}) -- Method

  -- vim.cmd.colorscheme "catppuccin-frappe"
  vim.cmd.colorscheme "catppuccin-macchiato"
  -- vim.cmd.colorscheme "catppuccin-mocha" -- darkest
end

return M
