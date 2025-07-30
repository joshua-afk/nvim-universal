vim.lsp.config("*", {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.enable({
  "emmet_ls",
  "lua_ls",
  "ruby_lsp",
  "stylelint_lsp",
  -- "eslint",
})

local options = { noremap = true, silent = true }
local map = api.nvim_set_keymap

-- Custom LSP mappings
keymap.set("n", "K", function()
  vim.lsp.buf.hover { border = "single", max_height = 25, max_width = 120 }
end, options)
map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format()<cr>', options)
map('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
map('n', '<leader>gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', options)
map('n', '<c-leftmouse>', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
map('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', options)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', options)

keymap.set('n', '<c-t>', function()
  local filetype = vim.bo.filetype

  cmd('vsplit')
  if filetype == 'markdown' then
    cmd('ObsidianFollowLink')
  else
    -- Use api.nvim_feedkeys to simulate pressing <c-]>
    api.nvim_feedkeys(api.nvim_replace_termcodes("<c-]>", true, true, true), 'n', true)
  end
end, options)

-- LSP TSX
map('n', '<leader>tsi', '<cmd>TSToolsAddMissingImports<cr>', options)
map('n', '<leader>tss', '<cmd>TSToolsSortImports<cr>', options)
map('n', '<leader>tsr', '<cmd>TSToolsRemoveUnusedImports<cr>', options)
map('n', '<leader>tsl', '<cmd>TSToolsFileReferences<cr>', options)

-- LSP Diagnostic mappings
keymap.set('n', '<leader>j', function()
  vim.diagnostic.goto_next()
end, options)

keymap.set('n', '<leader>k', function()
  vim.diagnostic.open_float()
end, options)

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(event)
--     local map = function(keys, func, desc, mode)
--       mode = mode or 'n'
--       vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
--     end
--
--     -- Jump to the definition of the word under your cursor.
--     --  This is where a variable was first declared, or where a function is defined, etc.
--     --  To jump back, press <C-t>.
--     map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--
--     -- -- Rename the variable under your cursor.
--     -- --  Most Language Servers support renaming across files, etc.
--     -- map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
--     --
--     -- -- Execute a code action, usually your cursor needs to be on top of an error
--     -- -- or a suggestion from your LSP for this to activate.
--     -- map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
--     --
--     -- -- Find references for the word under your cursor.
--     -- map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--     --
--     -- -- Jump to the implementation of the word under your cursor.
--     -- --  Useful when your language has ways of declaring types without an actual implementation.
--     -- map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--     --
--     -- -- WARN: This is not Goto Definition, this is Goto Declaration.
--     -- --  For example, in C this would take you to the header.
--     -- map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--     --
--     -- -- Fuzzy find all the symbols in your current document.
--     -- --  Symbols are things like variables, functions, types, etc.
--     -- map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
--     --
--     -- -- Fuzzy find all the symbols in your current workspace.
--     -- --  Similar to document symbols, except searches over your entire project.
--     -- map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
--     --
--     -- -- Jump to the type of the word under your cursor.
--     -- --  Useful when you're not sure what type a variable is and you want to see
--     -- --  the definition of its *type*, not where it was *defined*.
--     -- map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
--   end
-- })
