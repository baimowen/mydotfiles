return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjin/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {}
    },
    {
        "MunifTanjim/nui.nvim",
        url = "https://github.com/MunifTanjim/nui.nvim.git",
        lazy = true,
    }
}