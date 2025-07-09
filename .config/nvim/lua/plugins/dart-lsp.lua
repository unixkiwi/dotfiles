return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          init_options = {
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
            flutterOutline = true,
            outline = true,
          },
        },
      },
    },
  },
}
