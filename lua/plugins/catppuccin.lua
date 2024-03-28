return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local colors = require("catppuccin.palettes").get_palette()

      vim.cmd.colorscheme("catppuccin-mocha")

      require("catppuccin").setup({
        transparent_background = false,
        term_colors = true,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = false,
          nvimtree = true,
          treesitter = true,
          mason = true,
          indent_blankline = {
            enabled = true,
            scope_color = "sapphire", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },
          telescope = {
            enabled = true
          },
          illuminate = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
        },
        custom_highlights = {
          LineNr = { fg = colors.peach },
          LineNrAbove = { fg = colors.green },
          LineNrBelow = { fg = colors.teal }
        }
        -- Transparent background tweaks
        -- custom_highlights = {
        -- 	Comment = { fg = colors.overlay1 },
        -- 	LineNr = { fg = colors.overlay1 },
        -- 	CursorLine = { bg = colors.none },
        -- 	CursorLineNr = { fg = colors.lavender },
        -- 	DiagnosticVirtualTextError = { bg = colors.none },
        -- 	DiagnosticVirtualTextWarn = { bg = colors.none },
        -- 	DiagnosticVirtualTextInfo = { bg = colors.none },
        -- 	DiagnosticVirtualTextHint = { bg = colors.none },
        -- }
      })
    end
  }
}
