return {
    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd.colorscheme("catppuccin")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    { "nvim-treesitter/playground" },
    {
        "ThePrimeagen/harpoon",
        config = function()
            vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
            vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function()
                require("harpoon.ui").nav_file(1)
            end)
            vim.keymap.set("n", "<C-t>", function()
                require("harpoon.ui").nav_file(2)
            end)
            vim.keymap.set("n", "<C-n>", function()
                require("harpoon.ui").nav_file(3)
            end)
            vim.keymap.set("n", "<C-s>", function()
                require("harpoon.ui").nav_file(4)
            end)
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "float",
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                close_on_exit = true,
                --shell = "powershell -NoLogo",
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })
        end,
    },
    { "folke/zen-mode.nvim" },
    { "windwp/nvim-ts-autotag" },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                -- config
            })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup({})
        end,
    },
    { "nvim-lua/plenary.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function() end,
        opts = {},
    },
}
