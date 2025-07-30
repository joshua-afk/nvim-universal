local file_types = {
  "css",
  "eruby",
  "html",
  "javascript",
  "javascriptreact",
  "less",
  "pug",
  "sass",
  "scss",
  "typescriptreact",
  "vue"
}

local M = {
  cmd = {
    "emmet-ls",
    "--stdio"
  },
  filetypes = file_types,
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
}

return M
