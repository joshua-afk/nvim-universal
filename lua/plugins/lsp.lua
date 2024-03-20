return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Integrate lsp to cmp as source
      "hrsh7th/cmp-nvim-lsp",

      "onsails/lspkind.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      require('gitblame').setup({
        enabled = false
      })
    end
  }
}
