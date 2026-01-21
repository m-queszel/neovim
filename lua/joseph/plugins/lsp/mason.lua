return {
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
        },

        config = function()

            local mason = require("mason")

            local mason_lspconfig = require("mason-lspconfig")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                    "html",
                    "cssls",
                    "tailwindcss",
                    "lua_ls",
                    "emmet_language_server",
                    "phpactor",
                    "intelephense",
                    "vue_ls",
                    "ts_ls",
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true,
            })
        end,
    },
}
