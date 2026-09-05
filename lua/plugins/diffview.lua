-- Change-review surface: file panel on the left, diff on the right.
-- LazyVim already owns <leader>gd/<leader>gf/<leader>gg, so this lives on <leader>gv.
local function toggle(cmd)
  return function()
    local lib = require("diffview.lib")
    if lib.get_current_view() then
      vim.cmd("DiffviewClose")
    else
      vim.cmd(cmd)
    end
  end
end

-- Diff the whole branch against where it forked off the trunk.
local function diff_trunk()
  local function exists(ref)
    return vim.system({ "git", "rev-parse", "--verify", "--quiet", ref }):wait().code == 0
  end
  local trunk = exists("origin/main") and "origin/main"
    or exists("origin/master") and "origin/master"
    or exists("main") and "main"
    or "master"
  vim.cmd("DiffviewOpen " .. trunk .. "...HEAD")
end

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gv", toggle("DiffviewOpen"), desc = "Diffview (working tree)" },
    { "<leader>gV", toggle("DiffviewFileHistory %"), desc = "Diffview (file history)" },
    { "<leader>gm", diff_trunk, desc = "Diffview (vs trunk)" },
  },
  opts = function()
    local actions = require("diffview.actions")
    return {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        merge_tool = { layout = "diff3_mixed", winbar_info = true },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 36 },
      },
      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
          -- o/l open the diff but keep the cursor in the panel for browsing;
          -- <cr> opens it and jumps into the diff, like VS Code's file list.
          { "n", "<cr>", actions.focus_entry, { desc = "Open diff and focus it" } },
          { "n", "s", actions.toggle_stage_entry, { desc = "Stage / unstage entry" } },
          { "n", "u", actions.toggle_stage_entry, { desc = "Stage / unstage entry" } },
          { "n", "S", actions.stage_all, { desc = "Stage all" } },
          { "n", "U", actions.unstage_all, { desc = "Unstage all" } },
          { "n", "X", actions.restore_entry, { desc = "Discard changes in entry" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        },
      },
    }
  end,
}
