return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { silent = true })
  end,
}
