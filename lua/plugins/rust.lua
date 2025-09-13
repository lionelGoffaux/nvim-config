return {
    {
        "rust-lang/rust.vim",
        ft = "rust",
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
        ft = "rust",
        config = function(_, _)
            vim.g.rustaceanvim = {
                -- LSP configuration
                server = {
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                },
            }
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
