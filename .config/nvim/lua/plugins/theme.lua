return {
  "Mofiqul/vscode.nvim",
  config = function()
    vim.o.background = "dark"

    local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      italic_comments = true,
      underline_links = true,
      terminal_colors = true,

      color_overrides = {
        vscBack = "#131313",
      },
      group_overrides = {
        Normal = { bg = "#131313" },
      },
    })

    vim.cmd.colorscheme("vscode")
  end,
}
