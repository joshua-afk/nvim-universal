local api = vim.api

-- catppuccin mocha colors
local white = "#ffffff"
local silver = "#AFB5BC"
local tokyo_night_red = "#F7758E"

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
