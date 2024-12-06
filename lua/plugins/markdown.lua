-- TODO: Obsidian nvim and this plugin might be conflicting each other.
return {
  -- 'render-markdown.nvim'
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
        -- Replaces '-'|'+'|'*' of 'list_item'
        -- How deeply nested the list is determines the 'level' which is used to index into the list using a cycle
        -- The item number in the list is used to index into the value using a clamp if the value is also a list
        -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
        icons = { '●', '○', '◆', '◇' },
        -- Replaces 'n.'|'n)' of 'list_item'
        -- How deeply nested the list is determines the 'level' which is used to index into the list using a cycle
        -- The item number in the list is used to index into the value using a clamp if the value is also a list
        ordered_icons = {},
        -- Padding to add to the left of bullet point
        left_pad = 0,
        -- Padding to add to the right of bullet point
        right_pad = 1,
        -- Highlight for the bullet icon
        highlight = 'RenderMarkdownBullet',
      },
      quote = {
        -- Turn on / off block quote & callout rendering
        enabled = true,
        -- Replaces '>' of 'block_quote'
        icon = '▋',
        -- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text if
        -- not configured correctly with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'. A
        -- combination of these that is likely to work is showbreak = '  ' (2 spaces), breakindent = true,
        -- breakindentopt = '' (empty string). These values are not validated by this plugin. If you want
        -- to avoid adding these to your main configuration then set them in win_options for this plugin.
        repeat_linebreak = true,
        -- Highlight for the quote icon
        highlight = 'RenderMarkdownQuote',
      },
      win_options = {
        showbreak = { default = vim.api.nvim_get_option_value('showbreak', {}), rendered = '  ' },
        breakindent = { default = vim.api.nvim_get_option_value('breakindent', {}), rendered = true },
        breakindentopt = { default = vim.api.nvim_get_option_value('breakindentopt', {}), rendered = '' },}
    },
  },
  -- 'toppair/peek.nvim'
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  }
}
