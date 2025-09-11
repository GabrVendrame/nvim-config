local blocklist = { "dopamine-club" }

local is_blocklisted = function(opts)
        local function contains(str, substr)
                return string.find(str, substr, 1, true)
        end

        for _, blocklisted in ipairs(blocklist) do
                if contains(opts.workspace, blocklisted) then
                        return true
                end
        end

        return false
end

return {
        "vyfor/cord.nvim",
        build = ":Cord update",
        opts = {
                idle = {
                        icon = "https://media.tenor.com/GOEO_QhhtlYAAAAM/go-to-sleep-anime.gif"
                },
                text = {
                        viewing = function(opts)
                                return is_blocklisted(opts) and "Viewing a file" or ("Viewing " .. opts.filename)
                        end,
                        editing = function(opts)
                                return is_blocklisted(opts) and "Editing a file" or ("Editing " .. opts.filename)
                        end,
                        workspace = function(opts)
                                return is_blocklisted(opts) and "Working" or ("Working on " .. opts.filename)
                        end
                },
        }
}
