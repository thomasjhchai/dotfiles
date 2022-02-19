vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
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
      guifg = { attribute = "fg", highlight = "#ff0000" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
     buffer_selected = {
        guifg = {attribute='fg',highlight='TabLineSel'},
        guibg = {attribute='bg',highlight='TabLineSel'},
        gui = 'none'
        },
     buffer_visible = {
        guifg = {attribute='fg',highlight='TabLine'},
        guibg = {attribute='bg',highlight='TabLine'}
        },
    modified = {
        guifg = {attribute='fg',highlight='TabLine'},
        guibg = {attribute='bg',highlight='TabLine'}
        },
     modified_selected = {
        guifg = {attribute='fg',highlight='TabLineSel'},
        guibg = {attribute='bg',highlight='TabLineSel'}
        },
     modified_visible = {
        guifg = {attribute='fg',highlight='TabLine'},
        guibg = {attribute='bg',highlight='TabLine'}
        },

     separator = {
        guifg = {attribute='bg',highlight='TabLine'},
        guibg = {attribute='bg',highlight='TabLine'}
        },
     separator_selected = {
        guifg = {attribute='bg',highlight='TabLineSel'},
        guibg = {attribute='bg',highlight='TabLineSel'}
        },
     separator_visible = {
        guifg = {attribute='bg',highlight='TabLine'},
        guibg = {attribute='bg',highlight='TabLine'}
        },
     indicator_selected = {
        guifg = {attribute='bg',highlight='yellow'},
        guibg = {attribute='bg',highlight='TabLineSel'}
        },
    }
}

