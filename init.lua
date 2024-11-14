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
g.left_sidebar_width = 45

-- Disable providers
g.loaded_perl_provider = 0

-- Core
require 'abbreviations'
require 'settings'
require 'mappings'
require 'auto-commands'
require 'lazy-plugins'
require 'neovide'
