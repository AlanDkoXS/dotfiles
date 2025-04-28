-- This file contains the configuration for integrating pywal colors with Neovim.
-- It reads the colors from the ~/.cache/wal/colors-wal.vim file and applies them to the Neovim colorscheme.
local M = {}

-- Function to read the colors from the pywal vim file
local function read_wal_colors()
    local colors = {}
    local file_path = os.getenv("HOME") .. "/.cache/wal/colors-wal.vim"

    local file = io.open(file_path, "r")
    if not file then
        print("Error: Could not open pywal colors file at " .. file_path)
        return nil
    end

    for line in file:lines() do
        -- Parse variable declarations like: let color0 = "#02020E"
        local var, value = line:match('let%s+([%w_]+)%s*=%s*"(#[%x]+)"')
        if var and value then
            colors[var] = value
        end
    end

    file:close()
    return colors
end

-- Function to create a colorscheme based on pywal colors
local function create_pywal_theme()
    local colors = read_wal_colors()
    if not colors then
        return
    end

    -- Create the colorscheme
    vim.cmd([[
    highlight clear
    syntax reset
    ]])

    -- Set basic color assignments
    vim.api.nvim_set_hl(0, "Normal", {
        fg = colors.foreground,
        bg = colors.background
    })
    vim.api.nvim_set_hl(0, "NormalFloat", {
        fg = colors.foreground,
        bg = colors.background
    })
    vim.api.nvim_set_hl(0, "Comment", {
        fg = colors.color8,
        italic = true
    })
    vim.api.nvim_set_hl(0, "Constant", {
        fg = colors.color4
    })
    vim.api.nvim_set_hl(0, "String", {
        fg = colors.color2
    })
    vim.api.nvim_set_hl(0, "Identifier", {
        fg = colors.color6
    })
    vim.api.nvim_set_hl(0, "Function", {
        fg = colors.color5
    })
    vim.api.nvim_set_hl(0, "Statement", {
        fg = colors.color1
    })
    vim.api.nvim_set_hl(0, "PreProc", {
        fg = colors.color3
    })
    vim.api.nvim_set_hl(0, "Type", {
        fg = colors.color2
    })
    vim.api.nvim_set_hl(0, "Special", {
        fg = colors.color5
    })
    vim.api.nvim_set_hl(0, "Error", {
        fg = colors.color1,
        bold = true
    })
    vim.api.nvim_set_hl(0, "Todo", {
        fg = colors.color14,
        bold = true
    })

    -- UI elements
    vim.api.nvim_set_hl(0, "StatusLine", {
        fg = colors.foreground,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "StatusLineNC", {
        fg = colors.color8,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "TabLine", {
        fg = colors.color8,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "TabLineFill", {
        fg = colors.foreground,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "TabLineSel", {
        fg = colors.foreground,
        bg = colors.background
    })
    vim.api.nvim_set_hl(0, "Title", {
        fg = colors.color4,
        bold = true
    })

    -- Line numbers
    vim.api.nvim_set_hl(0, "LineNr", {
        fg = colors.color8
    })
    vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = colors.color7,
        bold = true
    })
    vim.api.nvim_set_hl(0, "SignColumn", {
        bg = "NONE"
    })

    -- Search
    vim.api.nvim_set_hl(0, "Search", {
        fg = colors.background,
        bg = colors.color3
    })
    vim.api.nvim_set_hl(0, "IncSearch", {
        fg = colors.background,
        bg = colors.color1
    })

    -- Cursor
    vim.api.nvim_set_hl(0, "Cursor", {
        fg = colors.background,
        bg = colors.cursor
    })
    vim.api.nvim_set_hl(0, "CursorLine", {
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "CursorColumn", {
        bg = colors.color0
    })

    -- Visual
    vim.api.nvim_set_hl(0, "Visual", {
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "VisualNOS", {
        bg = colors.color0
    })

    -- Pmenu (popup menu)
    vim.api.nvim_set_hl(0, "Pmenu", {
        fg = colors.foreground,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "PmenuSel", {
        fg = colors.background,
        bg = colors.color4
    })
    vim.api.nvim_set_hl(0, "PmenuSbar", {
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "PmenuThumb", {
        bg = colors.color8
    })

    -- Folded
    vim.api.nvim_set_hl(0, "Folded", {
        fg = colors.color8,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "FoldColumn", {
        fg = colors.color8,
        bg = "NONE"
    })

    -- Diff
    vim.api.nvim_set_hl(0, "DiffAdd", {
        fg = colors.color2,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "DiffChange", {
        fg = colors.color3,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "DiffDelete", {
        fg = colors.color1,
        bg = colors.color0
    })
    vim.api.nvim_set_hl(0, "DiffText", {
        fg = colors.color4,
        bg = colors.color0
    })

    -- Spell
    vim.api.nvim_set_hl(0, "SpellBad", {
        undercurl = true,
        sp = colors.color1
    })
    vim.api.nvim_set_hl(0, "SpellCap", {
        undercurl = true,
        sp = colors.color4
    })
    vim.api.nvim_set_hl(0, "SpellRare", {
        undercurl = true,
        sp = colors.color5
    })
    vim.api.nvim_set_hl(0, "SpellLocal", {
        undercurl = true,
        sp = colors.color3
    })

    -- Misc
    vim.api.nvim_set_hl(0, "VertSplit", {
        fg = colors.color0,
        bg = "NONE"
    })
    vim.api.nvim_set_hl(0, "NonText", {
        fg = colors.color8
    })
    vim.api.nvim_set_hl(0, "SpecialKey", {
        fg = colors.color8
    })
    vim.api.nvim_set_hl(0, "Directory", {
        fg = colors.color4
    })
    vim.api.nvim_set_hl(0, "ErrorMsg", {
        fg = colors.color1,
        bold = true
    })
    vim.api.nvim_set_hl(0, "WarningMsg", {
        fg = colors.color3,
        bold = true
    })
    vim.api.nvim_set_hl(0, "MoreMsg", {
        fg = colors.color2
    })
    vim.api.nvim_set_hl(0, "Question", {
        fg = colors.color2
    })
    vim.api.nvim_set_hl(0, "MatchParen", {
        bg = colors.color8
    })

    -- Set colorscheme name
    vim.g.colors_name = "pywal"

    print("Pywal colors loaded successfully!")
end

-- Setup function for the plugin
function M.setup()
    -- Create an autocmd to load the colors when Neovim starts
    vim.api.nvim_create_autocmd({"VimEnter"}, {
        callback = function()
            create_pywal_theme()
        end
    })

    -- Create a command to manually reload pywal colors
    vim.api.nvim_create_user_command("PywalReload", function()
        create_pywal_theme()
    end, {})
end

return {
    "LazyVim/LazyVim",
    opts = {
        -- Set colorscheme to be transparent and use pywal colors
        colorscheme = function()
            -- Apply transparency settings
            vim.api.nvim_set_hl(0, "Normal", {
                bg = "NONE"
            })
            vim.api.nvim_set_hl(0, "NormalFloat", {
                bg = "NONE"
            })

            -- Initialize pywal colors
            M.setup()

            return "pywal" -- Return the name of our colorscheme
        end
    }
}
