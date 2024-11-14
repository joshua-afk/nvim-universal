return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("lint").linters_by_ft = {
        -- bash = { "shellcheck" },
        ruby = { "rubocop" },
        -- sh = { "shellcheck" }, -- this also lints the `.env` file, which is annoying
      }

      api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        group = vim.api.nvim_create_augroup("Linting", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  }
}