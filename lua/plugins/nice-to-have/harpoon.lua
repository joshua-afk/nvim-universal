local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  enabled = false
}

function M.config()
  local harpoon = require("harpoon")

  local options = { noremap = true, silent = true }

  keymap.set('n', '<leader>a', function()
    harpoon:list():add()
  end, options)

  keymap.set('n', '<leader>h', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, options)

  -- api.nvim_set_keymap('n', '<c-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, options)

  -- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
  -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  keymap.set("n", "<c-f>", function() harpoon:list():select(1) end, options)
  keymap.set("n", "<c-p>", function() harpoon:list():select(2) end, options)
  keymap.set("n", "<c-y>", function() harpoon:list():select(3) end, options)
  --
  -- -- Toggle previous & next buffers stored within Harpoon list
  -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end

return M
