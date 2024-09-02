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
    key    = "|",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  }
}
config.font = wezterm.font('JetBrainsMono NL Nerd Font Mono')
config.dpi = 96
config.color_scheme = 'Gruvbox Material (Gogh)'
config.window_decorations = "RESIZE"
return config
