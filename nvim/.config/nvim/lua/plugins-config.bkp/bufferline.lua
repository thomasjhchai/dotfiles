
require('bufferline').setup {
  options = {
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    offsets = {
        {
            filetype = 'NvimTree',
            text = 'NVIMTree',
            text_align = 'left'
        }
    },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = 'thick',
    enforce_regular_tabs = true,
    always_show_bufferline = false
  },

  highlights = {
      fill = {
      fg = { attribute = "fg", highlight = "#ff0000" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
     buffer_visible = {
        fg = {attribute='fg',highlight='TabLine'},
        bg = {attribute='bg',highlight='TabLine'}
        },
    modified = {
        fg = {attribute='fg',highlight='TabLine'},
        bg = {attribute='bg',highlight='TabLine'}
        },
     modified_selected = {
        fg = {attribute='fg',highlight='TabLineSel'},
        bg = {attribute='bg',highlight='TabLineSel'}
        },
     modified_visible = {
        fg = {attribute='fg',highlight='TabLine'},
        bg = {attribute='bg',highlight='TabLine'}
        },

     separator = {
        fg = {attribute='bg',highlight='TabLine'},
        bg = {attribute='bg',highlight='TabLine'}
        },
     separator_selected = {
        fg = {attribute='bg',highlight='TabLineSel'},
        bg = {attribute='bg',highlight='TabLineSel'}
        },
     separator_visible = {
        fg = {attribute='bg',highlight='TabLine'},
        bg = {attribute='bg',highlight='TabLine'}
        },
     indicator_selected = {
        fg = {attribute='bg',highlight='yellow'},
        bg = {attribute='bg',highlight='TabLineSel'}
        },
    }
}

