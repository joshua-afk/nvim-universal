-- Adds indentation guides.
-- Very useful for large projects.
return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup()
    end
  }
}
