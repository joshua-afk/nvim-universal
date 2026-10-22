------------------------------
-- NOTE: h nvim_set_hl()
-- 0    = global {ns_id}
-- name = Highlight group name, e.g. "ErrorMsg"
-- val  = Highlight definition map (more values in help page)
------------------------------

local M = {}

function M.apply()
  local set_hl = vim.api.nvim_set_hl
  -- local mocha = require("catppuccin.palettes").get_palette "mocha"
  local macchiato = require("catppuccin.palettes").get_palette "macchiato"

  -- defaults
  set_hl(0, "CursorLineNr", { fg = macchiato.mauve, bold = true })
  set_hl(0, "LineNr", { fg = macchiato.overlay0 })

  -- h neo-tree-highlights
  set_hl(0, "NeoTreeFileNameOpened", { fg = "#d8a657" })
  -- TODO: NeoTreeDirectoryName
  -- nvim_set_hl(0, "NeoTreeFileName", { fg = "#ff0000" })
  -- nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#ff0000" })
  -- nvim_set_hl(0, "NeoTreeGitModified", { fg = "#d8a657" })

  -- neo-tree custom icons
  set_hl(0, "NeoTreeFolderApi", { fg = "#FBC02D" })
  set_hl(0, "NeoTreeFolderApp", { fg = "#EF5350" })
  set_hl(0, "NeoTreeFolderBinary", { fg = "#E57373" })
  set_hl(0, "NeoTreeFolderConfig", { fg = "#06ACC1" })
  set_hl(0, "NeoTreeFolderDatabase", { fg = "#FFCA28" })
  set_hl(0, "NeoTreeFolderDoc", { fg = "#0077BD" })
  set_hl(0, "NeoTreeFolderGit", { fg = "#546E7A" })
  set_hl(0, "NeoTreeFolderImport", { fg = "#AFB42B" })
  set_hl(0, "NeoTreeFolderLib", { fg = "#5C6BC0" })
  set_hl(0, "NeoTreeFolderLog", { fg = "#AFB42B" })
  set_hl(0, "NeoTreeFolderNodeModules", { fg = "#8BC34A" })
  set_hl(0, "NeoTreeFolderPublic", { fg = "#049BE5" })
  set_hl(0, "NeoTreeFolderScript", { fg = "#546E7A" })
  set_hl(0, "NeoTreeFolderSpec", { fg = "#05BFA5" })
  set_hl(0, "NeoTreeFolderStorage", { fg = "#90A4AE" })
  set_hl(0, "NeoTreeFolderTests", { fg = "#05BFA5" })
  set_hl(0, "NeoTreeFolderTmp", { fg = "#0397A7" })
  set_hl(0, "NeoTreeFolderVendor", { fg = "#C0CA33" })

  -- neo-tree custom icons

  -- set_hl(0, "FzfLuaBorder", { fg = "#C0CA33" })
  
  -- set_hl(0, "FzfLuaPathColNr", { fg = macchiato.blue })
  -- set_hl(0, "FzfLuaBufFlagAlt", { fg = macchiato.blue })
  -- set_hl(0, "FzfLuaTabTitle", { fg = macchiato.sky })
  -- set_hl(0, "FzfLuaPathLineNr", { fg = macchiato.green })
  -- set_hl(0, "FzfLuaBufName", { fg = macchiato.mauve })
  -- set_hl(0, "FzfLuaFilePart", { fg = "#89b4fa" })
  set_hl(0, "FzfLuaFilePart", { fg = macchiato.text })
  set_hl(0, "FzfLuaDirPart", { fg = macchiato.overlay0, italic = true })
  set_hl(0, "FzfLuaFzfMatchCustom", { fg = macchiato.mauve, bold = true })

  
  -- Catppuccin (mocha) custom hightlights for ruby here
  -- rosewater = "#f4dbd6",
  -- flamingo  = "#f0c6c6",
  -- pink      = "#f5bde6",
  -- mauve     = "#c6a0f6",
  -- red       = "#ed8796",
  -- maroon    = "#ee99a0",
  -- peach     = "#f5a97f",
  -- yellow    = "#eed49f",
  -- green     = "#a6da95",
  -- teal      = "#8bd5ca",
  -- sky       = "#91d7e3",
  -- sapphire  = "#7dc4e4",
  -- blue      = "#8aadf4",
  -- lavender  = "#b7bdf8",
  -- text      = "#cad3f5",
  -- subtext1  = "#b8c0e0",
  -- subtext0  = "#a5adcb",
  -- overlay2  = "#939ab7",
  -- overlay1  = "#8087a2",
  -- overlay0  = "#6e738d",
  -- surface2  = "#5b6078",
  -- surface1  = "#494d64",
  -- surface0  = "#363a4f",
  -- base      = "#24273a",
  -- mantle    = "#1e2030",
  -- crust     = "#181926",

  -- TREESITTER
  api.nvim_set_hl(0, "@constant.ruby", { fg = macchiato.peach, bold = true })       -- Constant
  api.nvim_set_hl(0, "@type.ruby", { fg = macchiato.yellow, bold = true })          -- Constant call
  api.nvim_set_hl(0, "@function.ruby", { fg = macchiato.rosewater})                 -- Method
  api.nvim_set_hl(0, "@function.call.ruby", { fg = macchiato.blue, italic = true }) -- Method call
  api.nvim_set_hl(0, "@string.special.symbol.ruby", { fg = macchiato.red })         -- for `key` in key-value pair
  api.nvim_set_hl(0, "@constant.builtin.ruby", { fg = macchiato.red })              -- for `nil`
  api.nvim_set_hl(0, "@variable.ruby", { fg = "#ffffff" })                          -- for `variable` declaration and call

  set_hl(0, "@comment.note", { fg = macchiato.text, bg = macchiato.blue })
  -- set_hl(0, "@comment.note", { fg = macchiato.blue, bold = true })

  -- LSP
  -- lua_ls sends a `comment` semantic token (priority 125) over the whole comment,
  -- its `fg` overrides treesitter's `@comment.note` (priority 100). Clear it so treesitter wins.
  set_hl(0, "@lsp.type.comment", {})
  -- api.nvim_set_hl(0, "@lsp.type.method.ruby", { fg = macchiato.lavender })          -- for 


  -- TODO: add material colors here

  -- ===========================
  -- ===========================
  -- ===                     ===
  -- ===       ARCHIVE       ===
  -- ===                     ===
  -- ===========================
  -- catppuccin mocha colors
  local white = "#ffffff"
  local silver = "#afb5bc"
  local tokyo_night_red = "#f7758e"

  local mocha_blue = "#7daea3"
  local mocha_text = "#ebdbb2"
  local mocha_maroon = "#ea6962"
  local mocha_yellow = "#d8a657"
  local mocha_red = "#c14a4a"
  local mocha_mauve = "#d3869b"
  local mocha_green = "#a9b665"
  local mocha_overlay = "#bdae93"


  -- TODO: desc is not working but will leave this commented out for now.
  -- api.nvim_set_hl(0, "@function.ruby", { fg = "#EED8DA", desc = "Method" })
  -- api.nvim_set_hl(0, "@variable.parameter.ruby", { fg = mocha_text, desc = "Method Parameter" })
  -- api.nvim_set_hl(0, "@variable.member.ruby", { fg = mocha_blue, desc = "Initialized instance variable" })
  -- api.nvim_set_hl(0, "@lsp.type.method.ruby", { fg = mocha_blue, desc = "Instance variable refered" })

  -- api.nvim_set_hl(0, "@function.ruby", { fg = "#EED8DA" })
  -- api.nvim_set_hl(0, "@variable.parameter.ruby", { fg = mocha_text })
  -- api.nvim_set_hl(0, "@lsp.type.method.ruby", { fg = mocha_blue })
  -- api.nvim_set_hl(0, "@function.call.ruby", { fg = mocha_green })

  -- CURRENT
  -- api.nvim_set_hl(0, "@variable.member.ruby", { fg = mocha_blue }) -- Initialized instance variable
  -- api.nvim_set_hl(0, "@function.ruby", { fg = mocha_maroon }) -- Method
  -- -- api.nvim_set_hl(0, "@function.call.ruby", { fg = mocha_green }) -- Method call (e.g.: Class.method)
  -- -- api.nvim_set_hl(0, "@lsp.type.method.ruby", { fg = mocha_mauve }) -- Method call w/ ?
  -- api.nvim_set_hl(0, "@function.call.ruby", { fg = mocha_overlay }) -- Method call (e.g.: Class.method, method)
  -- api.nvim_set_hl(0, "@lsp.type.method.ruby", { fg = mocha_overlay }) -- Method call w/ ?
  -- api.nvim_set_hl(0, "@variable.parameter.ruby", { fg = mocha_text }) -- Method Parameter
  -- api.nvim_set_hl(0, "@lsp.type.parameter.ruby", { fg = mocha_text }) -- Method Parameter call
  -- api.nvim_set_hl(0, "@string.special.symbol.ruby", { fg = mocha_blue }) -- Key
  -- --
  -- api.nvim_set_hl(0, "@constant.ruby", { fg = mocha_yellow, bold = true }) -- Constant
  -- api.nvim_set_hl(0, "@type.ruby", { fg = mocha_yellow, bold = true }) -- Constant call
end

return M
