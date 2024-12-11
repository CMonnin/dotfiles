local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Leader is the same as my old tmux prefix
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- splitting
  {
    mods   = "LEADER",
    key    = "-",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = "LEADER",
    key    = "\\",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- movement and resizing
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "LeftArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "DownArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "UpArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "RightArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  -- panes navigation
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Leader p to go to previous tab
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Leader n to go to next tab
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = ' ',
    mods = 'LEADER',
    action = wezterm.action.ActivateCommandPalette
  },

}
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrainsMonoNL Nerd Font Mono',
    weight = 'Light',
  },
  'Noto Color Emoji',
}

config.font_rules = {
  {
    intensity = 'Bold',
    font = wezterm.font_with_fallback {
      {
        family = 'JetBrainsMonoNL Nerd Font Mono',
        weight = 'Bold',
      },
      'Noto Color Emoji',
    },
  },
}


config.dpi = 96
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.window_decorations = "RESIZE"
return config
