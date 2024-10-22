-- Adds indentation guides.
-- Very useful for large projects.
return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup({
        indent = {
          char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
        },
      })
    end
  }
}
