return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require('fzf-lua')
        fzf.setup {
            files = {
                find_opts = "-not -name '*.class'",
                rg_opts = "--files --glob '!*.class'",
            },
            fzf_colors = true,
        }
        local git_modified = function ()
            fzf.fzf_exec('git ls-files -m; git diff --name-only --staged', {
                previewer = "builtin",
                fn_transform = function (entry)
                    return fzf.make_entry.file(entry, {
                        file_icons = true,
                        color_icons = true,
                    })
                end,
                actions = {
                    ['default'] = fzf.actions.file_edit,
                },
            })
        end
        local git_files = function ()
            fzf.fzf_exec('git ls-files', {
                previewer = "builtin",
                fn_transform = function (entry)
                    return fzf.make_entry.file(entry, {
                        file_icons = true,
                        color_icons = true,
                    })
                end,
                actions = {
                    ['default'] = fzf.actions.file_edit,
                },
            })
        end
        vim.keymap.set("n", "<leader>f", function()
            fzf.files({
                actions = {
                    ["ctrl-g"] = {
                        header = "modified",
                        fn = git_files
                    },
                    ["ctrl-h"] = {
                        header = "gitignore",
                        fn = fzf.actions.toggle_ignore
                    }
                }
            })
        end)
        vim.keymap.set("n", "<leader>F", fzf.live_grep_native, { silent = true})
        vim.keymap.set("v", "<leader>F", fzf.grep_visual, { silent = true })
        vim.keymap.set("n", "<leader>b", fzf.buffers, { silent = true })
        vim.keymap.set("n", "<leader>/", fzf.blines, { silent = true })
    end
}
