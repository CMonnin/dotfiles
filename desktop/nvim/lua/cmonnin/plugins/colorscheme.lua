return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 500,
    config = function()
      vim.g.gruvbox_material_background = 'soft'
      vim.opt.background = 'dark'
      vim.cmd.colorscheme('gruvbox-material')

      vim.api.nvim_create_user_command('ToggleBackground', function()
        if vim.o.background == 'dark' then
          vim.o.background = 'light'
        else
          vim.o.background = 'dark'
        end
      end, {})

      vim.keymap.set('n', '<leader>tb', ':ToggleBackground<CR>',
        { noremap = true, silent = true, desc = "Toggle light/dark mode" })
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
}
