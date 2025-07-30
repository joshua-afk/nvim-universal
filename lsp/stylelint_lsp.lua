local file_types = {
  "css",
  "less",
  "scss",
  "sass",
}

local root_file = {
  "jsconfig.json",
  "package.json",
  ".git",
}

local M = {
  filetypes = file_types,
  settings = {
    stylelintplus = {
      autoFixOnFormat = true,
      autoFixOnSave = true
    },
  },
  root_dir = {
    vim.fs.root(0, root_file),
  }
}

return M
