local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  -- opts = {}
}

function M.config()
  local fzf = require("fzf-lua")

  fzf.setup {
    files = {
      no_ignore = true, -- respect ".gitignore" by when `false`
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git --ignore-file ]]
        -- ignore files listed in `~/.config/nvim/.fdignore` for all projects
        .. vim.fn.expand("$HOME/.config/nvim/.fdignore"),
    },
  }
end

return M
