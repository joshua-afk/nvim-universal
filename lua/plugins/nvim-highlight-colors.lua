return {
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require("nvim-highlight-colors").setup({
        ---@usage 'background'|'foreground'|'virtual'
        render = 'background',

        ---Set virtual symbol (requires render to be set to 'virtual')
        virtual_symbol = '■',

        enable_tailwind = true
      })
    end
  }
}
