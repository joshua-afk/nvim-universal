local M = {}

function M.hl_str(hl, str)
  return "%#" .. hl .. "#" .. str .. "%*"
end

return M
