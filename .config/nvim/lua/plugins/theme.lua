return {
  "Mofiqul/vscode.nvim",
  config = function()
    vim.o.background = "dark"

    local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      italic_comments = true,
      underline_links = true,
      terminal_colors = true,
      transparent = true,

      -- color_overrides = {
      --   vscLineNumber = "#FFFFFF",
      -- },
      -- group_overrides = {
      --   Normal = { bg = "#131313" },
      -- },
    })

    vim.cmd.colorscheme("vscode")
  end,
}
