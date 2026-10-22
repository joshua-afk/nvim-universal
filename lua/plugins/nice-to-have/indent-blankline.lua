-- Adds indentation guides.
-- Very useful for large projects.

local icons = require('icons')

local highlight = {
  "RainbowViolet",
  "RainbowBlue",
  "RainbowYellow",
  "RainbowRed",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowCyan",
}

local scope_node_type = {
  -- All Language
  ["*"] = {
    "for",
    "if",
    "else",
    "try",
    -- "argument",
    -- "expression",
    -- "import",
    -- "type",
    -- "arguments",
    -- "block",
    -- "bracket",
    -- "declaration",
    -- "field",
    -- "func_literal",
    -- "function",
    -- "import_spec_list",
    -- "list",
    -- "return_statement",
    -- "short_var_declaration",
    -- "statement",
    -- "switch_body",
    -- "block_mapping_pair",
  },
  ruby = {
    "call",
  },
  lua = {
    "field",
    "expression_list",
  },
}

-- Slightly thinner char than the default one, check :help ibl.config.indent.char
local indent_char = "▏"
local scope_char = icons.lines.vertical_left

local M = {
  'lukas-reineke/indent-blankline.nvim',
  enabled = true,
}

function M.config(_, opts)
  local hooks = require "ibl.hooks"

  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }

  require('ibl').setup({
    -- show_first_indent_level = false,
    indent = {
      char = indent_char,
    },
    -- Highlight current codeblock
    scope = {
      enabled = false,
      show_start = true,
      char = scope_char,
      highlight = highlight,
      include = {
        node_type = scope_node_type,
      },
    },
  })

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

  -- Hide the first level indent, the fold column already marks it.
  -- Matches the scope char too, otherwise a top level scope stays colored there.
  -- hooks.register(hooks.type.VIRTUAL_TEXT, function(_, _, _, virt_text)
  --   local char = virt_text[1] and virt_text[1][1]
  --
  --   if char == indent_char or char == scope_char then
  --     virt_text[1] = { " ", { "@ibl.whitespace.char.1" } }
  --   end
  --
  --   return virt_text
  -- end)
end

return M
