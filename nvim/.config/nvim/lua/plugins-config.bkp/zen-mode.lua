require ('zen-mode').setup {
    window = {
        width = 0.8 -- set to 80% of the editor width
    },
    plugins = {
        options = {
          enabled = true,
          ruler = true, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    },
}
