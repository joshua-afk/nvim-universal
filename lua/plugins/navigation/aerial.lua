local M = {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    "ibhagwan/fzf-lua",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  local aerial = require("aerial")

  aerial.setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      -- TODO: Move these to @lua/core/mappings.lua
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      -- vim.keymap.set("n", "<leader>fa", '<cmd>lua require("aerial").fzf_lua_picker({ profile = "ivy"})<CR>', { buffer = bufnr })
    end,
    backends = { "treesitter", "lsp" },
    layout = {
      width = g.right_sidebar_width,
    },
  })

  -- aerial.fzf_lua_picker()

  -- aerial.fzf_lua_picker()

  -- aerial.fzf_lua_picker({
  --   backends = { "treesitter", "lsp" },
  --   profile = 'ivy',
  -- })

  -- -- You probably also want to set a keymap to toggle aerial
  -- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
end

return M
