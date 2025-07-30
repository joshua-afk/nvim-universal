local root_file = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

local globals = {
  "api",
  "cmd",
  "fn",
  "g",
  "keymap",
  "loop",
  "o",
  "opt",
  "require",
  "vim",
}

local M = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dirs = root_file,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = globals
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

return M
