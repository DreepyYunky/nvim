vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.number = true

-- set the terminal to PowerShell

vim.cmd("set shell=pwsh.exe")
vim.cmd("set shellcmdflag=-command")
vim.cmd("set shellquote=/")
vim.cmd("set shellxquote=")

-- enable mouse
vim.o.mouse = 'a'

-- Sync clipboard
vim.o.clipboard = 'unnamedplus'
