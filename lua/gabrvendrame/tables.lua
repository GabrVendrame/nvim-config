local T = {}

function T.get_servers()
        return {
                ts_ls = {
                        init_options = {
                                hostInfo = "NVIM-0.11.3",
                                locale = "pt-BR"
                        },
                        settings = {
                                preferences = {
                                        quotePreference = "double",
                                },
                                typescript = {
                                        format = {
                                                indentSize = 4,
                                                tabSize = 4,
                                                semicolons = "insert",
                                                trimTrailingWhiteSpace = true,
                                        }
                                },
                                javascript = {
                                        format = {
                                                indentSize = 4,
                                                tabSize = 4,
                                                semicolons = "insert",
                                                trimTrailingWhiteSpace = true,
                                        },
                                },
                        },
                },
                lua_ls = {
                        settings = {
                                Lua = {
                                        runtime = {
                                                version = "LuaJIT",
                                        },
                                        completion = {
                                                callSnippet = "Replace",
                                        },
                                        diagnostics = {
                                                globals = { 'vim', 'require' },
                                        },
                                },
                        },
                },
                gopls = {
                        settings = {
                                gopls = {
                                        analyses = {
                                                unreachable = true,
                                                unusedparams = true,
                                                S1002 = true, -- omit comparison with boolean constants. Ex: if x == true {} -> if x {}
                                        },
                                },
                        },
                },
                dockerls = {},
                pylsp = {},
        }
end

function T.get_formatters()
        return {
                "stylua",
                "black",
                "sqruff",
                "prettier",
        }
end

function T.get_linters()
        return {
                "mypy",
        }
end

function T.get_debuggers()
        return {}
end

return T
