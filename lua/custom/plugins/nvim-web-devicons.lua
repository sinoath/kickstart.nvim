return {
  'nvim-tree/nvim-web-devicons',
  enabled = vim.g.have_nerd_font,
  opts = {
    override = {
      css = {
        icon = '',
        color = '#2196F3',
        cterm_color = '91',
        name = 'Css',
      },
    },
  },
}
