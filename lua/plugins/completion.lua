local M = {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    -- { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  },
  version = '1.*',
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'default'
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      -- ghost_text = {
      --   enabled = true
      -- },
      documentation = {
        auto_show = false
      }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- providers = {
      --   snippet = {
      --     opts = {
      --       search_paths = {
      --         '~/.config/nvim/snippets'
      --       }
      --     },
      --   },
      -- },
    },
    -- snippets = { preset = 'luasnip' },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
}

return M

-- local M = {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     -- Snippets
--     "L3MON4D3/LuaSnip",
--     "rafamadriz/friendly-snippets",
--
--     -- cmp sources
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-cmdline",
--     "saadparwaiz1/cmp_luasnip",
--
--     -- Display parameters of function under the cursor
--     "hrsh7th/cmp-nvim-lsp-signature-help"
--   }
-- }
--
-- function M.config()
--   local cmp = require("cmp")
--   local luasnip = require("luasnip")
--   local lspkind = require("lspkind")
--
--   --## LuaSnip
--   local snipmate_snippets_path = vim.fn.stdpath("config") .. "/snippets/snipmate"
--   -- local catppuccin_color = require("catppuccin.palettes").get_palette()
--
--   -- Extend Snippets
--   luasnip.filetype_extend("javascript", {
--     "javascript-axios",
--     "javascript-express",
--     "javascript-moment",
--     "javascript-mssql",
--     "javascript-node",
--     "javascript-webix"
--   })
--
--   require("luasnip.loaders.from_snipmate").lazy_load({ paths = { snipmate_snippets_path } })
--   require("luasnip.loaders.from_vscode").lazy_load()
--
--   -- luasnip mappings
--   -- TODO: move this to `lua/mappings.lua`
--   keymap.set({ "i" }, "<C-K>", function () luasnip.expand() end, { silent = true })
--   keymap.set({ "i", "s" }, "<C-L>", function () luasnip.jump(1) end, { silent = true })
--   keymap.set({ "i", "s" }, "<C-J>", function () luasnip.jump(-1) end, { silent = true })
--   keymap.set({ "i", "s" }, "<C-E>", function ()
--     if luasnip.choice_active() then
--       luasnip.change_choice(1)
--     end
--   end, { silent = true })
--
--   --## CMP
--   local has_words_before = function ()
--     if api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
--   end
--
--   cmp.setup {
--     window = {
--       completion = {
--         winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
--         col_offset = -3,
--         side_padding = 0,
--       },
--     },
--     formatting = {
--       fields = { "kind", "abbr", "menu" },
--       format = function (entry, vim_item)
--         local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
--         local strings = vim.split(kind.kind, "%s", { trimempty = true })
--         kind.kind = " " .. (strings[1] or "") .. " "
--         kind.menu = "    (" .. (strings[2] or "") .. ")"
--
--         return kind
--       end,
--     },
--     snippet = {
--       expand = function (args)
--         luasnip.lsp_expand(args.body)
--       end,
--     },
--     mapping = cmp.mapping.preset.insert {
--       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--       ["<C-f>"] = cmp.mapping.scroll_docs(4),
--       ["<C-Space>"] = cmp.mapping.complete(),
--       ["<C-e>"] = cmp.mapping.abort(),
--       ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--       ["<Tab>"] = vim.schedule_wrap(function (fallback)
--         if cmp.visible() and has_words_before() then
--           cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--         else
--           fallback()
--         end
--       end),
--     },
--     opts = function (_, opts)
--       opts.sources = opts.sources or {}
--       table.insert(opts.sources, {
--         name = "lazydev",
--         group_index = 0, -- set group index to 0 to skip loading LuaLS completions
--       })
--     end,
--     sources = cmp.config.sources {
--       -- TODO: what the fuck is group_index
--       { name = "luasnip", group_index = 2 },
--       { name = "nvim_lsp" },
--       { name = "buffer",  max_item_count = 5 },
--       { name = "copilot", group_index = 2 },
--     }
--   }
--
--   -- Popup Menu layout customization
--   api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
--   api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
--
--   api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
--   api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
--   api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
--   api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })
--
--   api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
--   api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
--   api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })
--
--   api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
--   api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
--   api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })
--
--   api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
--   api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
--   api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })
--
--   api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
--   api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
--   api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
--   api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
--   api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })
--
--   api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
--   api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })
--
--   api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
--   api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
--   api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })
--
--   api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
--   api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
--   api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })
--
--   api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
--   api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
--   api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
--   -- api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = catppuccin_color.base, bg = "#6CC644" })
--
--   -- LspKind config (extend Popup Menu layout customization)
--   lspkind.init({
--     mode = "symbol_text",
--     preset = "codicons",
--     symbol_map = {
--       Text = "󰉿",
--       Method = "󰆧",
--       Function = "󰊕",
--       Constructor = "",
--       Field = "󰜢",
--       Variable = "󰀫",
--       Class = "󰠱",
--       Interface = "",
--       Module = "",
--       Property = "󰜢",
--       Unit = "󰑭",
--       Value = "󰎠",
--       Enum = "",
--       Keyword = "󰌋",
--       -- Snippet = " ",
--       Snippet = "",
--       Color = "󰏘",
--       File = "󰈙",
--       Reference = "󰈇",
--       Folder = "󰉋",
--       EnumMember = "",
--       Constant = "󰏿",
--       Struct = "󰙅",
--       Event = "",
--       Operator = "󰆕",
--       TypeParameter = "",
--       Copilot = "",
--     }
--   })
-- end
--
-- return M
