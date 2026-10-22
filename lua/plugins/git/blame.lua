local M = {
  'f-person/git-blame.nvim'
}

function M.config()
  require('gitblame').setup(
    {
      enabled = true
    }
  )
end

return M
