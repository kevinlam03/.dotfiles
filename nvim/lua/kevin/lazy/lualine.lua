-- Statusline
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {{
                    'filename',
                    path = 1,
                }},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {{
                    function()
                        local current_line = vim.fn.line('.')
                        local total_lines = vim.fn.line('$')
                        return string.format("%3d/%d", current_line, total_lines)
                    end
                }}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {
                lualine_a = {{
                    'buffers',
                    show_filename_only = true,
                    mode = 0,
                }},
            },
            inactive_winbar = {},
            extensions = {}
        }
    end
}
