-- Snacks' keymaps picker (<leader>sk) can't be reordered or pinned - it just
-- fuzzy-matches every registered keymap in registration order. This gives a
-- second, curated picker for the handful of mappings worth remembering.
local favorites = {
  { lhs = "<leader>ca", desc = "Code action" },
  { lhs = "<leader>rn", desc = "Rename symbol" },
  { lhs = "<leader>gg", desc = "Lazygit (Root Dir)" },
  { lhs = "<leader>gv", desc = "Diffview: uncommitted work (tree + index)" },
  { lhs = "<leader>gm", desc = "Diffview: branch commits vs trunk" },
  { lhs = "<leader>gV", desc = "Diffview: history of current file" },
  { lhs = "<leader>ghr", desc = "Discard hunk (restore to branch, then :w)" },
  { lhs = "<leader>ghR", desc = "Discard every hunk in the file (then :w)" },
  { lhs = "]h", desc = "Next hunk" },
  { lhs = "[h", desc = "Previous hunk" },
  { lhs = "1gt", desc = "Go to tab 1 (files)" },
  { lhs = "gt", desc = "Next tab (toggle files <-> Diffview)" },
  { lhs = "2gt", desc = "Go to tab 2 (Diffview)" },
  { lhs = "<leader>br", desc = "Delete buffers to the right" },
  { lhs = "<leader>bl", desc = "Delete buffers to the left" },
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
