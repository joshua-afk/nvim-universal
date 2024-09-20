return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy=false,
    priority = 1000,
    dependencies = {
      'hiphish/rainbow-delimiters.nvim',
    },
    config = function()
      local catppuccin = require("catppuccin")
      local rainbow_delimiters = require('rainbow-delimiters')

      local colors = require("catppuccin.palettes").get_palette()

      vim.cmd.colorscheme("catppuccin-mocha") -- latte, frappe, macchiato, mocha

      catppuccin.setup({
        transparent_background = false,
        term_colors = true,
        dim_inactive = {
          enabled = true,
          shade = "dark", -- dark, light
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
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
            scope_color = "mauve", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },
          telescope = {
            enabled = true
          },
          illuminate = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic", "bold" },
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
        -- highlight_overrides = {
        --   all = function()
        --     return {
        --       CurSearch = { bg = colors.sky },
        --       IncSearch = { bg = colors.sky },
        --       CursorLineNr = { fg = colors.blue, style = { "bold" } },
        --       DashboardFooter = { fg = colors.overlay0 },
        --       TreesitterContextBottom = { style = {} },
        --       WinSeparator = { fg = colors.overlay0, style = { "bold" } },
        --       ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
        --       ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
        --       Headline = { style = { "bold" } },
        --       Headline1 = { fg = colors.blue, style = { "bold" } },
        --       Headline2 = { fg = colors.pink, style = { "bold" } },
        --       Headline3 = { fg = colors.lavender, style = { "bold" } },
        --       Headline4 = { fg = colors.green, style = { "bold" } },
        --       Headline5 = { fg = colors.peach, style = { "bold" } },
        --       Headline6 = { fg = colors.flamingo, style = { "bold" } },
        --       rainbow1 = { fg = colors.blue, style = { "bold" } },
        --       rainbow2 = { fg = colors.pink, style = { "bold" } },
        --       rainbow3 = { fg = colors.lavender, style = { "bold" } },
        --       rainbow4 = { fg = colors.green, style = { "bold" } },
        --       rainbow5 = { fg = colors.peach, style = { "bold" } },
        --       rainbow6 = { fg = colors.flamingo, style = { "bold" } },
        --     }
        --   end,
        -- },
        color_overrides = {
          all = {
            text = "#ffffff",
            base = "#ff0000",
          },
          -- frappe = {
          --   base="#2e2e2e"
          -- }
        },
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

      -- Custom highlights
      api.nvim_set_hl(0, "CursorLineNr", { fg = colors.mauve, bold = true })

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  }
}
