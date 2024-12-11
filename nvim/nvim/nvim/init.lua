require("cmonnin")
require("cmonnin.lazy")

function Transparent_bg(color)
  color = color or "gruvbox"
  success, msg = pcall(vim.cmd, "colorscheme " .. color)
  if not success then
    print("Failed to load color scheme '" .. color .. "': " .. msg)
    return
  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Transparent_bg()
