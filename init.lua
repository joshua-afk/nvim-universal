-- Global variables
g = vim.g
o = vim.o
fn = vim.fn
opt = vim.opt
api = vim.api
keymap = vim.keymap

-- Disable providers
g.loaded_perl_provider = 0

-- Core
require 'abbreviations'
require 'settings'
require 'mappings'
require 'auto-commands'
require 'lazy-plugins'
