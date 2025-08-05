return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        opts = {
            options = {
                theme = "catppuccin",
                -- section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostic" },
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = { "encoding", "fileformat", "filetype", "progress" },
                lualine_z = { "location" },
            }
        }
    }
}