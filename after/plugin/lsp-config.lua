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
    ensure_installed = { "lua_ls", "eslint", "rubocop" },
}

-- local on_attach = function(client, bufnr)
--   -- MAPPINGS
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
-- end
-- error = "",
      -- warning = "",
      -- hint = "",
      -- information = "",
      -- other = "",

fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = '', texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })

-- for type, icon in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

--
-- fn.sign_define(
--     'DiagnosticSignError',
--     { text = '', texthl = 'LspDiagnosticsDefaultError' }
-- )
--
-- fn.sign_define(
--     'DiagnosticSignWarn',
--
-- )


local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})

-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
