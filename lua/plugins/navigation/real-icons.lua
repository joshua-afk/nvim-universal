local M = {
  "Mirsmog/real-icons.nvim",
  enabled = true,
  build = ":RealIconsInstallPack material",
}

function M.config()
  require("real-icons").setup({
    pack = "material",

    integrations = {
      bufferline = false,
      lualine = false,
      mini_files = false,
      neo_tree = true,
      nvim_tree = false,
      oil = false,
      snacks_picker = false,
      telescope = false,
      telescope_file_browser = false,
    },
  })
end

return M
