local M = {}

function M.hl_str(hl, str)
  return "%#" .. hl .. "#" .. str .. "%*"
end

-- -- LSP folds when a server with folding support is attached,
-- -- otherwise fall back to treesitter so folds work everywhere.
-- function M.foldexpr()
--   local bufnr = vim.api.nvim_get_current_buf()
--   for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
--     if client:supports_method('textDocument/foldingRange', bufnr) then
--       return vim.lsp.foldexpr()
--     end
--   end
--   if vim.treesitter.get_parser(bufnr, nil, { error = false }) then
--     return vim.treesitter.foldexpr()
--   end
--   return '0'
-- end

return M
