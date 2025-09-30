return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				close_command = function(buffer_number)
					require("mini.bufremove").delete(buffer_number, false) -- avoids quitting Neovim
				end,
				right_mouse_command = function(buffer_number)
					require("mini.bufremove").delete(buffer_number, false)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
	end,
}
