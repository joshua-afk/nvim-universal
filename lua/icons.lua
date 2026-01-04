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

-- For neo-tree,
M.lines = {
  vertical = "│",
  vertical_end = "└",
}

return M
