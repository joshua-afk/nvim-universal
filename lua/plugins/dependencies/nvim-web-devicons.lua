-- NOTE: If modifying the folder icon, head over to:
-- `lua/plugins/navigation/neo-tree.lua:filesystem.components.icons`

-- REFER to these link for icons color and ideas:
-- https://gist.github.com/rupeshtiwari/6860fbc1b3e2f6711c780070d6f59748
-- https://www.nerdfonts.com/cheat-sheet

local M = {
  "nvim-tree/nvim-web-devicons",
}

function M.config()
  local devicons = require("nvim-web-devicons")

  devicons.setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      },
    },
    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore"
      },
    },
    override_by_extension = {
      ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log"
      },
      ["rb"] = {
        icon = "󰴭",
        color = "#921b1f",
        name = "Rb"
      },
      ["erb"] = {
        -- icon = ruby_icon,
        icon = "󰴭",
        color = "#f1502f",
        name = "Erb"
      },
    },
  }
end

return M
