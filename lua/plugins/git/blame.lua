local M = {
  "f-person/git-blame.nvim"
}

function M.config()
  require("gitblame").setup({
    enabled = false
  })
end

return M
