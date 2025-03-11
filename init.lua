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
-- g.left_sidebar_width = 55
g.left_sidebar_width = 45

-- Disable providers
g.loaded_perl_provider = 0

-- Core
require 'core.abbreviations'
require 'core.auto-commands'
require 'core.highlights'
require 'core.lazy-plugins'
require 'core.mappings'
require 'core.neovide'
require 'core.settings'
