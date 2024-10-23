return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme('gruvbox-material')

      vim.api.nvim_create_user_command('ToggleBackground', function()
        if vim.o.background == 'dark' then
        else
          vim.o.background = 'dark'
        end
      end, {})

      vim.keymap.set('n', '<leader>tb', ':ToggleBackground<CR>',
        { noremap = true, silent = true, desc = "Toggle light/dark mode" })
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 500 },
}
