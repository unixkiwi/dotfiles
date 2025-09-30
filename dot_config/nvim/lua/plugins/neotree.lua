return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- add options here
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
      },
      window = {
        position = "left",
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<C-b>"] = "close_window",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    })
  end,
}
