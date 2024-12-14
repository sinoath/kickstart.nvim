local map = vim.keymap.set

map('n', '<leader>xv', '<cmd>vsplit<CR><cmd>term python3 %<CR>i', { silent = true, desc = 'Split [v]ertically and Execute' })
map('n', '<leader>xh', '<cmd>split<CR><cmd>term python3 %<CR>i', { silent = true, desc = 'Split [h]orizontally and Execute' })
map('n', '<leader>xx', '<cmd>term python3 %<CR>i', { silent = true, desc = 'E[x]ecute the file full screen' })
map('n', '<leader>xs', ':w<CR><cmd>term python3 %<CR>i', { silent = true, desc = '[s]ave the file and e[x]ecute full screen' })
