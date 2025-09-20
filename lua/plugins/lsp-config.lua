return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()

			local ensure_installed = {
				"lua-language-server",
				"stylua",
				"rust-analyzer",
				"jedi-language-server",
				"flake8",
				"ruff",
				"debugpy",
				"black",
				"typescript-language-server",
				"tailwindcss-language-server",
				"eslint-lsp",
				"prettierd",
				"clangd",
				"clang-format",
				"codelldb",
				"zls",
				"gopls",
				"gofumpt",
				"goimports-reviser",
				"golines",
			}

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if ensure_installed and #ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
				end
			end, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = vim.lsp.config
			lspconfig("lua_ls", {
				capabilities = capabilities,
			})

			lspconfig("jedi_language_server", {
				capabilities = capabilities,
			})

			lspconfig("ts_ls", {
				capabilities = capabilities,
			})

			lspconfig("tailwindcss", {
				capabilities = capabilities,
			})

			lspconfig("eslint", {
				capabilities = capabilities,
			})

			lspconfig("clangd", {
				capabilities = capabilities,
			})

            lspconfig("zls", {
				capabilities = capabilities,
			})

			lspconfig("gopls", {
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = { "go.work", "go.mod", ".git" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
				on_attach = function(client, bufnr)
					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
