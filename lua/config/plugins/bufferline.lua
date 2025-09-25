local bufline = require("bufferline")
return bufline.setup{
  options = {
    themable = true,
    color_icons = true,
    mode = "buffers",
    tab_size = 20,
    enforce_regular_tabs = true,
    show_buffer_close_icons = true,
    sort_by = "extensions",
    indicator = {
      icon = "",
      style = 'icon',
    },
    hover = {
      enabled = true,
      delay = 10,
      reveal = {'close'}
    },
    style_preset = {
      bufline.style_preset.no_italic
    },
  },
  highlights = {
    buffer_selected = {
      fg = "#FFFFFF",
      bold = true,
    },
    buffer_visible = {
      fg = "#666666"
    },
  },
}
