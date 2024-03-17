return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        enabled = true,
        options = {
          theme = "catppuccin"
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1
            }
          }
        }
      })
    end
  }
}
