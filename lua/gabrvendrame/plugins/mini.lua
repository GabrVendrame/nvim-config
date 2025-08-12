return {
        {
                "echasnovski/mini.snippets",
                version = false,
                opts = {
                        snippets = {
                                function()
                                        return require("mini.snippets").gen_loader().from_lang()
                                end
                        }
                }
        },
        {
                "echasnovski/mini.move",
                version = false,
                opts = {}
        },
        {
                "echasnovski/mini.surround",
                version = false,
                opts = {}
        },
        {
                "echasnovski/mini.indentscope",
                version = false,
                opts = {
                        draw = {
                                delay = 0,
                                animation = function()
                                        return 0
                                end
                        }
                }
        }
}
