local map = vim.keymap.set

map('n', '<leader>xv', '<cmd>vsplit<CR> <cmd>term python3 %<CR>', { silent = true, desc = 'Split [V]ertically and Execute' })
map('n', '<leader>xh', '<cmd>split<CR> <cmd>term python3 %<CR>', { silent = true, desc = 'Split [H]orizontally and Execute' })
