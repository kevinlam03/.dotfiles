-- web-devicons
return {
    'nvim-web-devicons',
    lazy = true,
    config = function()
        require('nvim-web-devicons').setup {
            color_icons = true,
            default = true,
        }
    end
}
