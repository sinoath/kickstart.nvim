local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local config = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local M = {}

-- M.show_docker_images = function()
-- 	print("Hello")
-- end

M.colors = function(opts)
  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = 'Answers',
      finder = finders.new_table {
        results = { -- the table name _have to be_ results
          'red',
          'green',
          'blue',
        },
      },
      sorter = config.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          -- print(vim.inspect(selection))
          vim.api.nvim_put({ selection[1] }, '', false, true)
        end)
        return true
      end,
    })
    :find()
end

M.colors()

return M
