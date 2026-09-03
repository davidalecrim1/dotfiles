-- Snacks' keymaps picker (<leader>sk) can't be reordered or pinned - it just
-- fuzzy-matches every registered keymap in registration order. This gives a
-- second, curated picker for the handful of mappings worth remembering.
local favorites = {
  { lhs = "<leader>ca", desc = "Code action" },
  { lhs = "<leader>rn", desc = "Rename symbol" },
  { lhs = "<leader>gg", desc = "Lazygit (Root Dir)" },
  { lhs = "<leader>sr", desc = "Search and Replace" },
}

local function favorite_keymaps()
  Snacks.picker.pick({
    source = "favorite_keymaps",
    items = vim.tbl_map(function(f)
      return { text = f.lhs .. " " .. f.desc, lhs = f.lhs, desc = f.desc }
    end, favorites),
    format = function(item)
      return {
        { item.lhs, "SnacksPickerKeymapLhs" },
        { "  " },
        { item.desc },
      }
    end,
    confirm = function(picker, item)
      picker:close()
      vim.schedule(function()
        local keys = vim.api.nvim_replace_termcodes(item.lhs, true, false, true)
        vim.api.nvim_feedkeys(keys, "m", false)
      end)
    end,
  })
end

return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>sK", favorite_keymaps, desc = "Favorite Keymaps" },
  },
}
