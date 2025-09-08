return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local km = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				opts.desc = "Show LSP references"
				km.set("n", "<leader>cR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				km.set("n", "<leader>cD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				km.set("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				km.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "See available code actions"
				km.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				km.set("n", "<leader>cr", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				km.set("n", "<leader>cE", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				km.set("n", "<leader>ce", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				km.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				km.set("n", "<leader>cR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			update_in_insert = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = {
				spacing = 4,
				source = "if_many",
			},
			underline = true,
			severity_sort = true,
		})

		-- require("lspconfig").dartls.setup({
		-- 	cmd = { "dart", "language-server", "--protocol=lsp" },
		-- 	filetypes = { "dart" },
		-- 	init_options = {
		-- 		closingLabels = true,
		-- 		flutterOutline = true,
		-- 		onlyAnalyzeProjectsWithOpenFiles = true,
		-- 		outline = true,
		-- 		suggestFromUnimportedLibraries = true,
		-- 	},
		-- 	settings = {
		-- 		dart = {
		-- 			completeFunctionCalls = true,
		-- 			showTodos = true,
		-- 		},
		-- 	},
		-- })

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
