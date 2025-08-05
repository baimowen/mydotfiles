return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = {"n"}, desc = "[NvimTree] Toggle NvimTree" }
        },
        opts = {}
    }
}