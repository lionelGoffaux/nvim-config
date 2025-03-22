return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = {
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(client, _)
					client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
				end,
				settings = {
					-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
					["rust-analyzer"] = {
						-- enable clippy on save
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		},
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			-- crates.show()
			-- require("core.utils").load_mappings("crates")
		end,
	},
}
