-- local M = {
--   "aserowy/tmux.nvim"
-- }
--
-- function M.config()
--   return require("tmux").setup({
--     copy_sync = {
--       enable = true,
--       -- redirect_to_clipboard = true,
--       -- sync_registers_keymap_put = true,
--       -- sync_registers_keymap_reg = true,
--       -- sync_deletes = true,
--       -- sync_unnamed = true
--     },
--     navigation = {
--       cycle_navigation = true,
--       enable_default_keybindings = true,
--     },
--     resize = {
--       -- enables default keybindings (A-hjkl) for normal mode
--       enable_default_keybindings = false,
--     }
--   })
-- end
--
-- return M


return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
