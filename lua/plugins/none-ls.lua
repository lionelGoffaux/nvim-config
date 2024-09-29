return {
	"nvimtools/none-ls.nvim",
  dependencies = {
      "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        require("none-ls.diagnostics.ruff"),
        require("none-ls.diagnostics.flake8"),
        null_ls.builtins.formatting.zigfmt,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.clang_format,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
