-- VIM global variables
api = vim.api
cmd = vim.cmd
fn = vim.fn
g = vim.g
keymap = vim.keymap
loop = vim.loop
o = vim.o
opt = vim.opt

-- Self assigned global variables
g.left_sidebar_width = 55

-- Disable providers
g.loaded_perl_provider = 0

-- Core
require 'core.abbreviations'
require 'core.diagnostic'
require 'core.highlights'
require 'core.lazy-plugins'
require 'core.lsp'
require 'core.mappings'
require 'core.neovide'
require 'core.options'
-- require 'search_with_index'

require 'auto-commands.auto-reload'
require 'auto-commands.buffer'
require 'auto-commands.cursor-line'
-- require 'auto-commands.highlight-yank'
require 'auto-commands.nvim-lint'
