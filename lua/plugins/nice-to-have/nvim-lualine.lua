return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        enabled = true,
        extensions = {
          'neo-tree',
        },
        options = {
          theme = "catppuccin",
          -- disabled_filetypes = {
          --   statusline = { 'neo-tree' },
          -- },
        },
        sections = {
          lualine_c = {
            -- {
            --   'filename',
            --   path = 1
            -- }
          }
        }
      })
    end
  }
}
