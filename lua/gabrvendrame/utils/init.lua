local I = {}

local utils = require("gabrvendrame.utils.utils")

I.set_keymaps = utils.set_keymaps
I.setup_inlay_hints = utils.setup_inlay_hints
I.setup_diagnostics = utils.setup_diagnostics
I.get_ensure_installed = utils.get_ensure_installed

return I
