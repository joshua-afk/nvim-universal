require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "eslint",
  },
}

-- local on_attach = function(client, bufnr)
--   -- MAPPINGS
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
-- end

fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = '', texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })

local util = require 'lspconfig.util'
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})
lspconfig.rubocop.setup({
  cmd = { "bundle", "exec", "rubocop", "--lsp" },
  filetypes = { "ruby" },
  root_dir = util.root_pattern('Gemfile', '.git'),
})

-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
