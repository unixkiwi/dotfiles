return {
  "nvim-flutter/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require("flutter-tools").setup({})

    vim.keymap.set("n", "<leader>rf", ":FlutterDebug<CR>", { desc = "Run Flutter Project (Debug)" })
    vim.keymap.set("n", "<leader>rr", ":FlutterRun<CR>", { desc = "Run Flutter Project in (Release)" })
    vim.keymap.set("n", "<leader>rh", ":FlutterReload<CR>", { desc = "Reload Flutter Project" })
    vim.keymap.set("n", "<leader>rr", ":FlutterRestart<CR>", { desc = "Restart Flutter Project" })
    vim.keymap.set("n", "<leader>rl", ":FlutterLogToggle<CR>", { desc = "Toggle Flutter Log buffer" })
  end,
}
