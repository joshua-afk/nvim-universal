<div align="center">

![Last commit](https://img.shields.io/github/last-commit/joshua-afk/nvim-universal?style=for-the-badge&logo=git&color=000F10&logoColor=dark%20orange&labelColor=302D41)
[![](https://img.shields.io/badge/Neovim-0.10+-blueviolet.svg?style=for-the-badge&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41)](https://github.com/neovim/neovim)

</div>

---

## File Architecture
**NOT UPDATED**
```
├── after
│   └── ftplugin
│       ├── blade.lua
│       ├── css.lua
│       ├── gitcommit.lua
│       ├── html.lua
│       ├── javascript.lua
│       ├── markdown.lua
│       ├── pug.lua
│       ├── ruby.lua
│       ├── scss.lua
│       └── sql.lua
├── lua
│   ├── plugins
│   │   ├── completion
│   │   │   └── init.lua
│   │   ├── lsp
│   │   │   └── init.lua
│   │   ├── obsidian
│   │   │   └── init.lua
│   │   ├── blame.lua
│   │   ├── catppuccin.lua
│   │   ├── comment.lua
│   │   ├── dressing.lua
│   │   ├── illuminate.lua
│   │   ├── indent-blankline.lua
│   │   ├── nvim-lualine.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── project.lua
│   │   ├── telescope-fzf.lua
│   │   ├── telescope.lua
│   │   └── tmux.lua
│   ├── abbreviations.lua
│   ├── auto-commands.lua
│   ├── lazy-plugins.lua
│   ├── mappings.lua
│   ├── neovide.lua
│   └── settings.lua
├── snippets
│   └── snipmate
│       ├── javascript
│       │   ├── javascript-axios.snippets
│       │   ├── javascript-express.snippets
│       │   ├── javascript-moment.snippets
│       │   ├── javascript-mssql.snippets
│       │   ├── javascript-node.snippets
│       │   ├── javascript-react.snippets
│       │   └── javascript-webix.snippets
│       ├── markdown.snippets
│       └── ruby.snippets
├── .gitignore
├── README.md
├── init.lua
└── lazy-lock.json
```
## ArchOS and variants
`$ sudo pacman -S luarocks xclip`

install fnm (fast node version manager)
install latest version of node

`$ npm install -g neovim`

`$ sudo pacman -S luarocks`
