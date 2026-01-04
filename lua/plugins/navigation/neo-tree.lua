-- A plugin to manage the file system and other tree like structures. 

local icons = require('icons')

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

local custom_mappings = {
  ['P'] = {
    "toggle_preview",
    config = {
      use_float = true,
      use_image_nvim = true,
      -- title = 'Neo-tree Preview',
    },
  },
  Y = "copy_selector",
  ['h'] = "toggle_hidden",
  ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
  ['gh'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
}

local custom_commands = {
  copy_selector = function(state)
    local node = state.tree:get_node()
    local filepath = node:get_id()
    local filename = node.name
    local modify = vim.fn.fnamemodify

    local vals = {
      -- ["BASENAME"] = modify(filename, ":r"),
      -- ["EXTENSION"] = modify(filename, ":e"),
      -- ["FILENAME"] = filename,
      ["PATH (CWD)"] = modify(filepath, ":."),
      ["PATH (HOME)"] = modify(filepath, ":~"),
      -- ["PATH"] = filepath,
      -- ["URI"] = vim.uri_from_fname(filepath),
    }

    local options = vim.tbl_filter(
      function(val)
        return vals[val] ~= ""
      end,
      vim.tbl_keys(vals)
    )
    if vim.tbl_isempty(options) then
      vim.notify("No values to copy", vim.log.levels.WARN)
      return
    end
    table.sort(options)
    vim.ui.select(options, {
      prompt = "Choose to copy to clipboard:",
      format_item = function(item)
        return ("%s: %s"):format(item, vals[item])
      end,
    }, function(choice)
        local result = vals[choice]
        if result then
          vim.notify(("Copied: `%s`"):format(result))
          vim.fn.setreg("+", result)
        end
      end)
  end,
}

local diagnostics_config = {
  symbols = {
    hint = icons.diagnostics.HINT,
    info = icons.diagnostics.INFO,
    warn = icons.diagnostics.WARN,
    error = icons.diagnostics.ERROR,
  },
  highlights = {
    hint = "DiagnosticSignHint",
    info = "DiagnosticSignInfo",
    warn = "DiagnosticSignWarn",
    error = "DiagnosticSignError",
  },
}

local source_selector_config = {
  winbar = true, -- toggle to show selector on winbar
  statusline = false, -- toggle to show selector on statusline
  show_scrolled_off_parent_node = false,                    -- boolean
  sources = {
    {
      source = "filesystem",                                -- string
      display_name = "       󰉓 Files    "                            -- string | nil
    },
    -- {
    --   source = "buffers",                                   -- string
    --   display_name = " 󰈚 Buffers "                          -- string | nil
    -- },
    {
      source = "git_status",                                -- string
      display_name = "     󰊢 Git "                              -- string | nil
    },
  },
  content_layout = "start",                                 -- string
  tabs_layout = "equal",                                    -- string
  truncation_character = "…",                               -- string
  tabs_min_width = nil,                                     -- int | nil
  tabs_max_width = nil,                                     -- int | nil
  padding = 0,                                              -- int | { left: int, right: int }
  separator = { left = "▏", right= "▕" },                   -- string | { left: string, right: string, override: string | nil }
  separator_active = nil,                                   -- string | { left: string, right: string, override: string | nil } | nil
  show_separator_on_edge = false,                           -- boolean
  highlight_tab = "NeoTreeTabInactive",                     -- string
  highlight_tab_active = "NeoTreeTabActive",                -- string
  highlight_background = "NeoTreeTabInactive",              -- string
  highlight_separator = "NeoTreeTabSeparatorInactive",      -- string
  highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
}

function M.config()
  local nt = require("neo-tree")
  local highlights = require("neo-tree.ui.highlights")

  nt.setup({
    commands = custom_commands,
    default_component_configs = {
      name = {
        highlight_opened_files = "all",
      },
      indent = {
        with_markers = true,
        indent_marker = icons.lines.vertical,
        last_indent_marker = icons.lines.vertical_end,
        indent_size = 2,
      },
      diagnostics = diagnostics_config,
    },
    filesystem = {
      components = {
        icon = function(config, node, state)
          local icon = config.default or " "
          local padding = config.padding or " "
          local highlight = config.highlight or highlights.FILE_ICON

          if node.type == "directory" then
            highlight = highlights.DIRECTORY_ICON

            if node:is_expanded() then
              icon = config.folder_open
            else
              icon = config.folder_closed
            end

            -- Custom Icons!
            -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#custom-icons
            -- highlight is inside: lua/core/highlights.lua
            if node.name == "app" then
              icon = "󱋤"
              highlight = 'NeoTreeFolderApp'
            elseif node.name == "node_modules" then
              icon = ""
              highlight = 'NeoTreeFolderNodeModules'
            elseif node.name == "spec" then
              icon = "󰴋"
              highlight = 'NeoTreeFolderTests'
            end
          elseif node.type == "file" then
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            if success then
              local devicon, hl = web_devicons.get_icon(node.name, node.ext)
              icon = devicon or icon
              highlight = hl or highlight
            end
          end

          return {
            text = icon .. padding,
            highlight = highlight,
          }
        end,
      },
    },
    source_selector = source_selector_config,
    window = {
      mappings = custom_mappings
    },
  })
end

return M
