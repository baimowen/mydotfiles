return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', "williamboman/mason.nvim" },

        -- example calling setup directly for each LSP
        config = function()
        vim.diagnostic.config({
            underline = false,
            signs = false,
            update_in_insert = false,
            virtual_text = { spacing = 2, prefix = "●" },
            severity_sort = true,
            float = {
            border = "rounded",
            },
        })

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')
        
        lspconfig['lua_ls'].setup({ capabilities = capabilities })
        
       end
    }
}