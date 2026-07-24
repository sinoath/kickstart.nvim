return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  cond = function()
    local cwd = vim.fn.getcwd()
    local root_vault = '/home/sinoath/Documents/Obsidian/'
    -- Add new valut locations inside the table
    local my_vaults = {
      root_vault .. 'test',
      root_vault .. 'myObsNotes',
      root_vault .. 'study',
      root_vault .. 'personal',
    }
    for _, v in ipairs(my_vaults) do
      return string.find(cwd, v)
    end
    return false
  end,
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'test',
        path = '$HOME/Documents/Obsidian/test',
      },
      {
        name = 'myObsNotes',
        path = '$HOME/Documents/Obsidian/myObsNotes',
      },
      {
        name = 'personal',
        path = '$HOME/Documents/Obsidian/study',
      },
      {
        name = 'study',
        path = '$HOME/Documents/Obsidian/personal',
      },
    },
    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',
    ui = { enable = false },
    disable_frontmatter = true,
    templates = {
      folder = '$HOME/Documents/Obsidian/test/Templates/',
    },
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        suffix = tostring(os.time()) .. '-' .. suffix
      end
      return suffix
    end,
  },
}
