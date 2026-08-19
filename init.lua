-- VIM global variables
api = vim.api
cmd = vim.cmd
fn = vim.fn
g = vim.g
keymap = vim.keymap
loop = vim.loop
o = vim.o
opt = vim.opt

g.nvim_version = '0.12.0'

-- OS Selector
local uname = vim.loop.os_uname()
_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

-- Self assigned global variables
g.left_sidebar_width = 55

-- Providers (https://neovim.io/doc/user/provider.html)
local node_version = 'v20.19.0' -- stylelint-lsp works with this version
local fnm = vim.env.HOME .. '/.local/share/fnm'
local node_bin = fnm .. '/node-versions/' .. node_version .. '/installation/bin'

vim.env.PATH = node_bin .. ':' .. vim.env.PATH
vim.g.node_host_prog = node_bin .. '/node'

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
-- require 'auto-commands.nvim-lint'
