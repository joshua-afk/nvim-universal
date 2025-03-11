-- A plugin to manage the file system and other tree like structures. 

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  }
}

function M.config()
  local nt = require("neo-tree")

  nt.setup({
    window = {
      mappings = {
        ["P"] = {
          "toggle_preview",
          config = {
            use_float = true,
            use_image_nvim = true,
            -- title = 'Neo-tree Preview',
          },
        },
      }
    },
    -- highlight_overrides = {
    --   all = function()
    --     return {
    --       NeoTreeFileNameOpened = { fg = "#ff0000" },
    --     }
    --   end
    -- }
  })

  api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#ff0000" })
  -- api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#ff0000" })
  -- api.nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#ff0000" })
end

return M
