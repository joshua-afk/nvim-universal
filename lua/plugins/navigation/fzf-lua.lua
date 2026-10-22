local M = {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
}

function M.config()
  local fzf = require("fzf-lua")

  fzf.setup {
    fzf_colors = {
      ["hl"] = { "fg", "FzfLuaFzfMatchCustom" },
      ["hl+"] = { "fg", "FzfLuaFzfMatchCustom" },
    },
    files = {
      formatter = "path.filename_first",
      no_ignore = true, -- respect ".gitignore" when `false`
      -- fd_opts = [[--color=never --type f --hidden --follow --exclude .git --ignore-file ]]
        -- -- ignore files listed in `~/.config/nvim/.fdignore` for all projects
        -- .. vim.fn.expand("$HOME/.config/nvim/.fdignore"),
      cmd = [[fd --color=never --type f --hidden --follow --exclude .git --ignore-file ]]
        .. vim.fn.expand("$HOME/.config/nvim/.fdignore")
        .. [[ | awk '{ ]]
        .. [[ r=3; ]]
        .. [[ if ($0 ~ /^app\//) r=1; ]]
        .. [[ else if ($0 ~ /^lib\//) r=2; ]]
        .. [[ else if ($0 ~ /^spec\//) r=8; ]]
        .. [[ if ($0 ~ /\.(sql|lock|min\.js)$/) r=9; ]]
        .. [[ n=split($0,p,"/"); print r "\t" length(p[n]) "\t" length($0) "\t" $0 }' ]]
        .. [[ | sort -k1,1n -k2,2n -k3,3n -s | cut -f4-]],
      fzf_opts = {
        ["--tiebreak"] = "index",
      },
    },
    winopts = {
      treesitter = {
        enabled = true,
        fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
      },
      preview = {
        horizontal = "right:40%",     -- right|left:size
      },
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
        ["enter"]  = FzfLua.actions.file_edit_or_qf,
        ["ctrl-s"] = FzfLua.actions.file_split,
        ["ctrl-l"] = FzfLua.actions.file_vsplit, -- NOTE: default is `ctrl-v`
        ["alt-i"]  = FzfLua.actions.toggle_ignore,
        ["alt-h"]  = FzfLua.actions.toggle_hidden,
      },
    },
  }
end

return M
