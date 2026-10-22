<div align="center">

# nvim-universal

Personal Neovim config built on lazy.nvim, native LSP (`vim.lsp.config`) and Catppuccin Macchiato.
Tuned for Ruby, JavaScript/TypeScript and SQL on Linux, with some Windows and WSL support.

![Last commit](https://img.shields.io/github/last-commit/joshua-afk/nvim-universal?style=for-the-badge&logo=git&color=000F10&logoColor=dark%20orange&labelColor=302D41)
[![](https://img.shields.io/badge/Neovim-0.11+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

</div>

---

## Requirements

| Tool | Used for |
|---|---|
| Neovim 0.11+ | Native LSP configs in `lsp/` and LSP folding (developed on 0.12-dev) |
| git, gcc | lazy.nvim bootstrap, building treesitter parsers |
| A [Nerd Font](https://www.nerdfonts.com) | Icons in neo-tree, bufferline and the status column |
| fd, fzf, ripgrep | File search and grep in fzf-lua |
| Node.js `v20.19.0` via [fnm](https://github.com/Schniz/fnm) | Mason npm servers, copilot.vim, eslint_d. The path is hardcoded in `init.lua` |
| [mise](https://mise.jdx.dev) + `ruby-lsp` gem | ruby-lsp runs through `mise x --` so it uses the project's Ruby |
| lazygit | `<leader>lg` |
| xclip (X11) or wl-clipboard (Wayland) | System clipboard (`clipboard=unnamedplus`) |
| luarocks + ImageMagick | image.nvim (`magick_rock` processor) |
| Terminal with the kitty graphics protocol | image.nvim (`backend = "kitty"`) |
| dolphin (optional) | Reveal files in the file manager (`<leader><leader>` falls back to `xdg-open`) |

### Arch Linux

```sh
sudo pacman -S neovim git gcc fd fzf ripgrep lazygit xclip luarocks imagemagick
```

Then install [fnm](https://github.com/Schniz/fnm) and [mise](https://mise.jdx.dev), and set up Node:

```sh
fnm install v20.19.0
npm install -g neovim
```

## Installation

```sh
git clone https://github.com/joshua-afk/nvim-universal ~/.config/nvim
nvim
```

On first start:

- lazy.nvim installs every plugin. Run `:Lazy restore` to match the versions in `lazy-lock.json`.
- Mason installs `emmet_ls`, `lua_ls`, `ts_ls` and `rubocop`.
- nvim-treesitter installs the parsers listed in `lua/plugins/core/nvim-treesitter.lua`.

Run `:checkhealth` if something doesn't load.

## Structure

```
.
├── after/
│   ├── filetype.lua           # Extra filetype detection (rasi, kitty, vifm)
│   └── ftplugin/              # Per-filetype options (indent, colorcolumn, wrap)
├── lsp/                       # Native LSP server configs, enabled in lua/core/lsp.lua
├── lua/
│   ├── auto-commands/         # Auto-reload, buffer and cursorline autocmds
│   ├── core/
│   │   ├── abbreviations.lua
│   │   ├── diagnostic.lua     # Diagnostic signs and display
│   │   ├── highlights.lua     # Custom highlights, re-applied on ColorScheme
│   │   ├── lazy-plugins.lua   # lazy.nvim bootstrap and plugin folder imports
│   │   ├── lsp.lua            # vim.lsp.enable() and LSP keymaps
│   │   ├── mappings.lua
│   │   ├── neovide.lua
│   │   ├── options.lua
│   │   └── archive/           # Old configs, not loaded
│   ├── plugins/
│   │   ├── ai/                # copilot.vim
│   │   ├── colorschemes/      # catppuccin (active) and alternatives
│   │   ├── core/              # treesitter, Comment, dial, neoscroll, auto-session, ...
│   │   ├── database/          # vim-dadbod-ui
│   │   ├── debugging/         # nvim-chainsaw
│   │   ├── formatters/        # conform.nvim
│   │   ├── git/               # gitsigns, git-blame, fugitive
│   │   ├── linters/           # nvim-lint
│   │   ├── lsp/               # mason, fidget
│   │   ├── navigation/        # fzf-lua, neo-tree, aerial, multicursor, telescope
│   │   ├── nice-to-have/      # bufferline, statuscol, indent-blankline, render-markdown, ...
│   │   └── archive/           # Retired plugin specs, not imported
│   ├── ctrl_s_shell.lua       # <C-s> persistent :shell terminal
│   ├── ft_ignore.lua          # Filetypes excluded from UI plugins
│   ├── icons.lua              # Shared icons
│   └── utils.lua
├── snippets/                  # Custom snippets
├── .fdignore                  # Paths hidden from fzf-lua file search
├── init.lua                   # Globals, OS detection, Node provider, module loading
└── lazy-lock.json
```

### Conventions

- Each plugin lives in its own file as `local M = { ... }` with an `M.config()` function.
- Plugin folders are imported one by one in `lua/core/lazy-plugins.lua`. A new folder needs an `import` line there.
- Turn a plugin off with `enabled = false`. Retire it by moving the file into `lua/plugins/archive/`, which lazy.nvim never imports.
- LSP servers are configured in `lsp/<server>.lua` and turned on in the `vim.lsp.enable()` list in `lua/core/lsp.lua`.

## Key mappings

Leader is `<Space>`. This is a summary. See `lua/core/mappings.lua` and `lua/core/lsp.lua` for the full list.

### Files and search

| Keys | Action |
|---|---|
| `<leader>ff` | Find files (visual: grep the selection) |
| `<leader>fg` | Live grep |
| `<leader>fw` | Grep the word under the cursor |
| `<leader>fb` | Buffers |
| `<leader>fr` | Resume the last picker |
| `<leader>e` | Toggle neo-tree (floating) |
| `<leader>i` | Reveal the current file in neo-tree |
| `<leader>a` | Toggle the aerial outline |
| `<leader><leader>` | Open the file's folder in the system file manager |

### Buffers and windows

| Keys | Action |
|---|---|
| `<Tab>` | Alternate buffer (skips terminals) |
| `<leader>1`..`<leader>9`, `<leader>$` | Go to buffer N, or the last one |
| `<leader>x` / `<leader>X` | Close the buffer / close all others |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move between splits |
| `<leader>vs` / `<leader>sp` | Vertical / horizontal split |
| `<leader>w` / `<leader>q` | Write / quit |

### LSP and code

| Keys | Action |
|---|---|
| `K` | Hover |
| `<C-]>`, `<C-LeftMouse>` | Go to definition |
| `<C-t>` | Go to definition in a vertical split |
| `<leader>ca` | Code action |
| `<leader>fl` | LSP references |
| `<leader>k` / `<leader>j` | Diagnostic float / next diagnostic |
| `<leader>K` | Toggle diagnostic virtual lines |
| `<leader>ft` | Format with conform |
| `<leader>fo` | Toggle fold |
| `<C-a>` / `<C-x>` | Increment / decrement (dial.nvim) |
| `<leader>n` | Add a cursor at the next match (multicursor) |

### Git

| Keys | Action |
|---|---|
| `<leader>h` | Preview hunk |
| `[g` / `]g` | Previous / next hunk |
| `<leader>gb` | Toggle inline blame |
| `<leader>go` | Open the blamed commit in the browser |
| `<leader>gd` | Diff split (fugitive) |
| `<leader>gl` | Git log for the current buffer |
| `<leader>lg` / `<leader>lc` | lazygit / lazygit for the current file |

### Tools

| Keys | Action |
|---|---|
| `<C-s>` | Toggle a persistent `:shell` terminal tab (`'<C-s>` opens it in the current window) |
| `<Esc>` (terminal) | Normal mode, but only while Claude Code is the foreground process |
| `<leader>tt` / `<leader>tT` | Run the nearest test / the whole file (vim-test) |
| `<leader>d` | Toggle the database UI (dadbod) |
| `<leader>u` | Toggle UI extras: indent guides, blame, git signs, illuminate, diagnostics |
| `<leader>cl` / `<leader>cr` | Insert a variable log / remove all logs (chainsaw) |

## Updating

- `:Lazy sync` updates plugins and rewrites `lazy-lock.json`.
- `:Lazy clean` after archiving a plugin removes it from `lazy-lock.json`.
- `:Lazy restore` rolls plugins back to the versions in `lazy-lock.json`.
