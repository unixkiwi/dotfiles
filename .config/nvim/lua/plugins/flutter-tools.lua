return {
  "nvim-flutter/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require("flutter-tools").setup({})
  end,
}
