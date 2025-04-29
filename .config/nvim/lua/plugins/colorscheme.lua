return {
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("transparent").setup({
                enable = false,
                extra_groups = {
                    "Normal",
                    "NormalNC",
                    "Comment",
                    "Constant",
                    "Special",
                    "Identifier",
                    "Statement",
                    "PreProc",
                    "Type",
                    "Underlined",
                    "Todo",
                    "String",
                    "Function",
                    "Conditional",
                    "Repeat",
                    "Operator",
                    "Structure",
                    "LineNr",
                    "NonText",
                    "SignColumn",
                    "CursorLineNr",
                    "EndOfBuffer",
                },
                exclude = {},
            })
            --vim.cmd("TransparentEnable")
        end,
    }, -- Plugin for Lush (need for some themes)
    { "rktjmp/lush.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "pywal",
        },
    },
}
