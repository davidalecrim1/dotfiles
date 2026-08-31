-- LazyGit reuses `activeBorderColor` for two different things: the border
-- of the panel that currently has keyboard focus, AND the label of the
-- "currently shown" tab inside grouped, UNFOCUSED panels (e.g. "Local
-- branches" vs "Remotes"/"Tags"). There's no separate LazyGit config field
-- to split these, so an attention-grabbing color (orange) ends up looking
-- like a focus indicator even on panels that aren't focused. Green reads
-- fine in both places, since it's LazyGit's own conventional default.
return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      theme = {
        activeBorderColor = { fg = "String", bold = true },
      },
    },
  },
}
