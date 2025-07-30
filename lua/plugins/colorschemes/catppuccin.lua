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
}

function M.config()
  local c = require("catppuccin")
  local mocha = require("catppuccin.palettes").get_palette "mocha"

  c.setup({
    background = {
      light = "latte",
      dark = "mocha",
    },
    dim_inactive = {
      enabled = true,
    },
    integrations = integrations,
  })

  api.nvim_set_hl(0, "@constant.ruby", { fg = mocha.peach, bold = true }) -- Constant
  api.nvim_set_hl(0, "@type.ruby", { fg = mocha.yellow, bold = true }) -- Constant call
  api.nvim_set_hl(0, "@function.ruby", { fg = "#EED8DA"}) -- Method

  vim.cmd.colorscheme "catppuccin-frappe"
end

return M
