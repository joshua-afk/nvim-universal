-- This plugin is used to align `relativenumber` number with `line numbers`

local ft_ignore = require('ft_ignore')
local utils = require('utils')

local M = {
  "luukvbaal/statuscol.nvim",
}

function M.config()
  local statuscol = require("statuscol")

  statuscol.setup({
    relculright = true,
    separator = " ",
    ft_ignore = ft_ignore.statuscol,
    segments = {
      {
        sign = {
          name = { ".*" },
          text = { ".*" },
          namespace = { ".*" },
          auto = false,
        },
        click = "v:lua.ScSa",
      },
      -- From: https://github.com/mcauley-penney/nvim/blob/main/lua/plugins/statuscol.lua
      {
        text = {
          "%=",
          function(args)
            local mode = vim.fn.mode()
            local normalized_mode = vim.fn.strtrans(mode):lower():gsub("%W", "")

            -- case 1
            if normalized_mode ~= "v" and vim.v.virtnum == 0 then
              return require("statuscol.builtin").lnumfunc(args)
            end

            if vim.v.virtnum < 0 then
              return "-"
            end

            local line = require("statuscol.builtin").lnumfunc(args)

            if vim.v.virtnum > 0 then
              local num_wraps = vim.api.nvim_win_text_height(args.win, {
                start_row = args.lnum - 1,
                end_row = args.lnum - 1,
              })["all"] - 1

              if vim.v.virtnum == num_wraps then
                line = "└"
              else
                line = "├"
              end
            end

            -- Highlight cases
            if normalized_mode == "v" then
              local pos_list = vim.fn.getregionpos(
                vim.fn.getpos("v"),
                vim.fn.getpos("."),
                { type = mode, eol = true }
              )
              local s_row, e_row = pos_list[1][1][2], pos_list[#pos_list][2][2]

              if vim.v.lnum >= s_row and vim.v.lnum <= e_row then
                return utils.hl_str("CursorLineNr", line)
              end
            end

            return vim.fn.line(".") == vim.v.lnum and utils.hl_str("CursorLineNr", line)
              or utils.hl_str("LineNr", line)
          end,
          " ",
        },
        condition = {
          function()
            return vim.wo.number or vim.wo.relativenumber
          end,
        },
      },
      {
        sign = {
          namespace = { "gitsigns" },
          auto = false,

          fillchar = " ",
          -- fillchar = " ",
          maxwidth = 1,
          colwidth = 1,
          -- fillcharhl = "MiniIndentscopeSymbol",
        },
        condition = {
          function(args)
            local is_num = vim.wo[args.win].number
            local is_relnum = vim.wo[args.win].relativenumber

            return is_num or is_relnum
          end,
        },
        click = "v:lua.ScSa",
      },
    },
  })
end

return M
