-- General options
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shell = 'nu'
vim.o.shellpipe = '| save'
vim.o.shellquote = '"'
vim.o.shellredir = '| save'
vim.o.shellcmdflag = '-c'
vim.o.timeout = false

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Mapping functions
local function rename_word()
    local rename_target = vim.fn.input("(Rename) Target word: ", "")
    local rename_value = vim.fn.input("(Rename) Substitution: ", "")

    vim.cmd(string.format([[%%substitute/\<%s\>/%s/gc]], rename_target, rename_value))
end

-- Keybindings
vim.keymap.set('n', 'gh', '0') -- Jump to first column
vim.keymap.set('v', 'gh', '0') -- Jump to first column (Visual)
vim.keymap.set('n', 'gl', '$') -- Jump to last column
vim.keymap.set('v', 'gl', '$') -- Jump to first column (Visual)
vim.keymap.set('n', 'gj', 'G') -- Jump to first line
vim.keymap.set('v', 'gj', 'G') -- Jump to first column (Visual)
vim.keymap.set('n', 'gk', 'gg') -- Jump to last line
vim.keymap.set('v', 'gk', 'gg') -- Jump to first column (Visual)
vim.keymap.set('n', 'ga', '^') -- Jump to first character in line
vim.keymap.set('v', 'ga', '^') -- Jump to first character in line (Visual)
vim.keymap.set('n', 'dl', 'dd') -- Delete line
vim.keymap.set('n', '<Leader>w', '<C-w>') -- Use <Leader>w for all window commands
vim.keymap.set('n', '<Leader>n', rename_word) -- Rename by word in the current file

-- Theme
vim.o.termguicolors = true

local color_light = '#e7e7e7'
local color_light_d1 = '#a7a7a7'
local color_light_d2 = '#777777'
local color_light_d3 = '#474747'

local color_dark = '#202020'

local color_red = '#f76767'
local color_yellow = '#ffe767'
local color_green = '#97e767'
local color_blue = '#87c5ff'
local color_purple = '#a797f7'

local function highlight(group, guifg, guibg, gui)
    vim.cmd(('highlight %s guifg=%s guibg=%s gui=%s'):format(group, guifg, guibg, gui))
end

highlight('Normal', color_light, color_dark, 'none')
highlight('Statement', color_yellow, 'none', 'bold')
highlight('String', color_green, 'none', 'none')
highlight('Comment', color_light_d2, 'none', 'italic')
highlight('Constant', color_purple, 'none', 'italic')
highlight('Boolean', color_yellow, 'none', 'none')
highlight('Number', color_red, 'none', 'none')
highlight('identifier', color_light, 'none', 'none')
highlight('function', color_light_d1, 'none', 'none')
highlight('PreProc', color_purple, 'none', 'bold')
highlight('Type', color_light_d1, 'none', 'none')
highlight('Special', color_light_d1, 'none', 'none')
highlight('Error', color_dark, color_red, 'none')
highlight('Todo', color_yellow, 'none', 'bold')
highlight('Added', color_green, 'none', 'none')
highlight('Changed', color_yellow, 'none', 'none')
highlight('Removed', color_red, 'none', 'none')
