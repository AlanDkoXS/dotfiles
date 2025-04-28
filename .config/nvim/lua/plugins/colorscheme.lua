return { -- Configuración de transparencia
{
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("transparent").setup({
            enable = true,
            extra_groups = {"Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier", "Statement",
                            "PreProc", "Type", "Underlined", "Todo", "String", "Function", "Conditional", "Repeat",
                            "Operator", "Structure", "LineNr", "NonText", "SignColumn", "CursorLineNr", "EndOfBuffer"},
            exclude = {}
        })
        vim.cmd("TransparentEnable") -- Ejecutar el comando para habilitar la transparencia
    end
}, -- Plugin para la biblioteca Lush (necesaria para algunos temas)
{"rktjmp/lush.nvim"}, -- Configuración de LazyVim
{
    "LazyVim/LazyVim",
    opts = {
        -- Establecer el esquema de color predeterminado
        colorscheme = "pywal"
    }
}}
