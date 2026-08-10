-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set in 'jk' in insert mode to ESC key
vim.keymap.set('i', 'jk', '<ESC>')

-- Save a file
vim.keymap.set('n', '<leader>a', '<cmd>w<CR>', { desc = 'S[a]ve current buffer', silent = true })

-- Set yank and paste to and from the b register
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"by', { desc = '[Y]ank in the "b" register' })
vim.keymap.set({ 'n', 'v' }, '<leader>T', '"bd', { desc = 'dele[T]e in the "b" register' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"bp', { desc = '[p]aste after, from the "b" register' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"bP', { desc = '[P]aste before, from the "b" register' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.diagnostic.config { jump = { float = true } } -- Make virtual text to show automatically
---@diagnostic disable: deprecated
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', '[d', vim.diagnostic.jump({ count=-1, float=true }), { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.jump({ count=1, float=true }), { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
---@diagnostic enable: deprecated
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim aware pane navigation:
-- see custom/plugins/smart-splits.lua

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--- Neotree toggle
vim.keymap.set('n', '\\', '<cmd>Neotree reveal toggle<cr>', { desc = 'Toggle on/off the Neotree window' })

-- emmet leader key
vim.g.user_emmet_leader_key = '<A-m>'

-- Git diff shortcuts
vim.keymap.set('n', '<leader>hc', 'do', { desc = 'diffget the changes from the other file' })
vim.keymap.set('n', '<leader>hh', 'd2o', { desc = 'diffget the changes from the left file' })
vim.keymap.set('n', '<leader>hl', 'd3o', { desc = 'diffget the changes from the right file' })
vim.keymap.set('n', '<leader>ht', 'dp', { desc = 'diffput the changes to the other file' })

-- Debugging shortcuts
vim.keymap.set('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = 'Debugging: Toggle [B]reakpoit' })
-- vim.keymap.set('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
-- vim.keymap.set('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set('n', '<leader>da', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = 'Debugging: Clear Breakpoints' })
vim.keymap.set('n', '<leader>dt', '<cmd>Telescope dap list_breakpoints<cr>', { desc = 'Debugging: [T]elescope list brekpoints' })
vim.keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", { desc = 'Debugging: [C]ontinue' })
vim.keymap.set('n', '<leader>dj', "<cmd>lua require'dap'.step_over()<cr>", { desc = 'Debugging: Step Over' })
vim.keymap.set('n', '<leader>dk', "<cmd>lua require'dap'.step_into()<cr>", { desc = 'Debugging: Step Into' })
vim.keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_out()<cr>", { desc = 'Debugging: Step Out' })
vim.keymap.set('n', '<leader>dd', function()
  require('dap').disconnect()
  require('dapui').close()
end, { desc = 'Debugging: [D]isconnect' })
vim.keymap.set('n', '<leader>dx', function()
  require('dap').terminate()
  require('dapui').close()
end, { desc = 'Debugging: E[x]it' })
vim.keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = 'Debugging: [R]eplay Toggle' })
vim.keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>", { desc = 'Debugging: Run [L]ast' })
vim.keymap.set('n', '<leader>di', function()
  require('dap.ui.widgets').hover()
end, { desc = 'Debugging: Hover' })
vim.keymap.set('n', '<leader>d?', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end, { desc = 'Debugging: Centered Float' })
vim.keymap.set('n', '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = 'Debugging: Telescope dap [f]rames' })
vim.keymap.set('n', '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = 'Debugging: Telescope dap commands' })
vim.keymap.set('n', '<leader>de', function()
  require('telescope.builtin').diagnostics { default_text = ':E:' }
end, { desc = 'Debugging: Telescope diagnostic' })

-- Obsidian shortcuts
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<cr>', { desc = '[O]bsidian: [S]earch inside the vault' })
vim.keymap.set('n', '<leader>og', '<cmd>ObsidianTags<cr>', { desc = '[O]bsidian: [T]ags management' })
vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<cr>', { desc = '[O]bsidian: [L]inks of current file' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<cr>', { desc = '[O]bsidian: [L]inks of current file' })
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianTemplate Note<cr>', { desc = '[O]bsidian: [N]ew note from template' })
vim.keymap.set('n', '<leader>om', 'gg<cmd>ObsidianTemplate link<cr>', { desc = '[O]bsidian: [N]ew note from template' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<cr>', { desc = '[O]bsidian: Insert [T]emplate' })
vim.keymap.set('n', '<leader>odd', ':w<cr>:!rm "%:p"<cr>:bd<cr>', { desc = '[O]bsidian: [D]elete note', silent = true })
