local M = {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
}

function M.config()
  local fzf = require("fzf-lua")

  fzf.setup {
    files = {
      no_ignore = true, -- respect ".gitignore" when `false`
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git --ignore-file ]]
        -- ignore files listed in `~/.config/nvim/.fdignore` for all projects
        .. vim.fn.expand("$HOME/.config/nvim/.fdignore"),
    },
    actions = {
      -- Below are the default actions, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      files = {
        -- true,        -- uncomment to inherit all the below in your custom config
        -- Pickers inheriting these actions:
        --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
        --   tags, btags, args, buffers, tabs, lines, blines
        -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
        -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
        -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
        ["enter"]       = FzfLua.actions.file_edit_or_qf,
        ["ctrl-s"]      = FzfLua.actions.file_split,
        ["ctrl-l"]      = FzfLua.actions.file_vsplit, -- NOTE: default is `ctrl-v`
        ["alt-i"]       = FzfLua.actions.toggle_ignore,
        ["alt-h"]       = FzfLua.actions.toggle_hidden,
      },
    }
  }
end

return M
