-- Global variables
api = vim.api
fn = vim.fn
g = vim.g
keymap = vim.keymap
loop = vim.loop
o = vim.o
opt = vim.opt

-- Disable providers
g.loaded_perl_provider = 0

-- Core
require 'abbreviations'
require 'settings'
require 'mappings'
require 'auto-commands'
require 'lazy-plugins'
