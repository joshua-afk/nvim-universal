local M = {
  "chrisgrieser/nvim-chainsaw"
}

function M.config()
  require("chainsaw").setup {
    -- marker = "🪚",
    marker = "︻デ┳═ー",

    logHighlightGroup = false,
    logStatements = {
      variableLog = {
        javascript = "console.log('%s %s:', %s);",
        ruby = {
          "puts '=========================================='",
          "pp '{{marker}} {{var}}:', {{var}}",
          "puts '=========================================='",
        },
      },
      emojiLog = {
        ruby = {
          "puts '{{marker}}: {{emoji}}'"
        },
      },
    },
    -- configuration for specific logtypes
    logTypes = {
      emojiLog = {
        emojis = { "ʘ‿ʘ", "ಥ‿ಥ", "(ツ)", "(⌐■_■)", "(－_－)", "ಠ_ಠ" },
      },
    },
  }
end

return M
