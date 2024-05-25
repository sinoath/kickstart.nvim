local map = vim.keymap.set
local opts = 'noremap = true, silent = true, buffer = 0'

map('n', '<leader>xv', '<cmd>vsplit<CR> <cmd>term python3 %<CR>', { noremap = true, silent = true, buffer = 0, desc = 'Split [V]ertically and Execute' })
map('n', '<leader>xh', '<cmd>split<CR> <cmd>term python3 %<CR>', { noremap = true, silent = true, buffer = 0, desc = 'Split [H]orizontally and Execute' })
