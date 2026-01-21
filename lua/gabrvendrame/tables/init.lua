local I = {}

local servers = require("gabrvendrame.tables.servers")
local formatters = require("gabrvendrame.tables.formatters")
local linters = require("gabrvendrame.tables.linters")
local debuggers = require("gabrvendrame.tables.debuggers")

I.get_servers = servers.get_servers
I.get_formatters = formatters.get_formatters
I.get_linters = linters.get_linters
I.get_debuggers = debuggers.get_debuggers

return I
