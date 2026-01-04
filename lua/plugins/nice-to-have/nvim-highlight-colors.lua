-- Highlight the "text" of colors in NVIM

local M = {
  'brenoprata10/nvim-highlight-colors'
}

function M.config()
  require("nvim-highlight-colors").setup({
    ---@usage 'background'|'foreground'|'virtual'
    render = 'background',

    ---Set virtual symbol (requires render to be set to 'virtual')
    virtual_symbol = '■',

    enable_tailwind = true,
    enable_var_usage = true,
    enable_named_colors = true,
  })
end

return M
