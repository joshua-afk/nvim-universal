local M = {
  "chrisgrieser/nvim-chainsaw"
}

function M.config()
  require("chainsaw").setup {
    marker = "🪚",
    logHighlightGroup = false,
    logStatements = {
      variableLog = {
        javascript = "console.log('%s %s:', %s);",
      },
    }
  }
end

return M
