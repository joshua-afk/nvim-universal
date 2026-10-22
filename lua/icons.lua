-- Add the icons of diagnostic, arrows, symbol_kinds, mics
-- REF: https://github.com/MariaSolOs/dotfiles/blob/main/.config/nvim/lua/icons.lua

local M = {}

-- For folds
M.arrows = {
  right = '',
  left = '',
  up = '',
  down = '',
}

M.borders = {

}

M.diagnostics = {
  ERROR = '',
  WARN = '',
  HINT = '',
  INFO = '',
}

-- TODO: also check the lua/plugins/git/gitsigns.lua
M.gitsigns = {
  -- add = { text = "┃" },
  -- change = { text = "┃" },
  -- delete = { text = "▁" },
  -- topdelete = { text = "▔" },
  -- changedelete = { text = "┃" },
  -- untracked = { text = "┃" },
  -- staged = {
  --   add = { text = "┇" },
  --   change = { text = "┇" },
  --   changedelete = { text = "┇" },
  --   untracked = { text = "┇" },
  -- }
}

-- For neo-tree
M.lines = {
  vertical_left = "▎",
  vertical_center = "┃",
  -- vertical_center = "│",
  vertical_end = "└",
}

-- For neo-tree
M.tree = {
  folder = {
    api = "󰉙",
    app = "󱋣",
    binary = "󰴉",
    config = "",
    doc = "󰲂",
    eye = "󱞊",
    git = "",
    github = "",
    import = "󰉗",
    lib = "󱥾",
    log = "󰲂",
    node_modules = "",
    spec = "󰴋",
    test = "󰴋",
    tmp = "󰪺",
  },
}

return M
