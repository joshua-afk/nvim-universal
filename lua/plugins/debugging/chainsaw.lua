return {
  {
    "chrisgrieser/nvim-chainsaw",
    config = function()
      require("chainsaw").setup {
        marker = "🪚",
        logHighlightGroup = false,
        logStatements = {
          variableLog = {
            javascript = "console.log('%s %s:', %s);",
          },
        },
      }
    end
  },

}
