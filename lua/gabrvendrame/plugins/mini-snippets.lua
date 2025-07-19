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
}
