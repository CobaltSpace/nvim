return {
  {
    'scottmckendry/cyberdream.nvim',
    priority = 1000,
    -- cond = false;
    opts = {
      transparent = true,
    },
    init = function()
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    cond = false,
    opts = {
      transparent_background = true, -- disables setting the background color.
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    cond = false,
    opts = {
      background = {
        dark = 'dragon',
      },
      transparent = true,
    },
    init = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
