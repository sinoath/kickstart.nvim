local map = vim.keymap.set

map('n', '<leader>xv', '<cmd>vsplit<CR><cmd>term lua %<CR>i', { silent = true, desc = 'Split [v]ertically and Execute' })
map('n', '<leader>xh', '<cmd>split<CR><cmd>term lua %<CR>i', { silent = true, desc = 'Split [h]orizontally and Execute' })
map('n', '<leader>xx', '<cmd>term lua %<CR>i', { silent = true, desc = 'E[x]ecute the file full screen' })
