return {
        {
                "echasnovski/mini.snippets",
                version = false,
                config = function()
                        local mini_snippets = require("mini.snippets")
                        local gen_loader = mini_snippets.gen_loader
                        mini_snippets.setup({
                                snippets = {
                                        gen_loader.from_lang()
                                },
                        })
                end,
        },

        {
                "echasnovski/mini.move",
                version = false,
                config = function()
                        require("mini.move").setup()
                end
        },

        {
                "echasnovski/mini.pairs",
                version = false,
                config = function()
                        require("mini.pairs").setup()
                end
        },

        {
                "echasnovski/mini.surround",
                version = false,
                config = function()
                        require("mini.surround").setup()
                end
        },

        {
                "echasnovski/mini.indentscope",
                version = false,
                config = function()
                        local indentscope = require("mini.indentscope")
                        indentscope.setup({
                                draw = {
                                        delay = 0,
                                        animation = indentscope.gen_animation.none()
                                },
                        })
                end
        },
}
