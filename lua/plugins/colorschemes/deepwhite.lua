return {
  {
    'Verf/deepwhite.nvim',
    opts = {},
    lazy = false,
    priority = 1000,
    config = function()
      local deepwhite = require("deepwhite")

      vim.cmd.colorscheme("deepwhite")

      deepwhite.setup({
        low_blue_light = true
      })
    end
  }
}
