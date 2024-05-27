local actions = require ('telescope.actions')
local actions_state = require ('telescope.actions.state')

require ('telescope').setup{
    defaults = {
        -- change builtin defaults here
        prompt_prefix = ">> ",
        mappings = {
            i = {
                -- Hitting <ESC> once to close floating windows. Default is to change to "N" mode
                ["<ESC>"] = actions.close,
                ["<C-a>"] = function()
                    print(vim.inspect(actions_state.get_selected_entry()))
                end
            },
        },
    }
}
