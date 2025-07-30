local M = {
  "RutaTang/quicknote.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  require("quicknote").setup({
    mode = "resident",
    git_branch_recognizable = false,
  })
end

return M
