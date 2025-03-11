local M = {
  "aserowy/tmux.nvim"
}

function M.config()
  return require("tmux").setup({
    copy_sync = {
      enable = true,
      -- redirect_to_clipboard = true,
      -- sync_registers_keymap_put = true,
      -- sync_registers_keymap_reg = true,
      -- sync_deletes = true,
      -- sync_unnamed = true
    },
    navigation = {
      cycle_navigation = false,
      enable_default_keybindings = false,
    },
    resize = {
      -- enables default keybindings (A-hjkl) for normal mode
      enable_default_keybindings = false,
    }
  })
end

return M
