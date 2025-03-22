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
            local on_attach = function(client, _)
                client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
            end
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.jedi_language_server.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.eslint.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.zls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        end,
    },
}
