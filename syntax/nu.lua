if vim.fn.exists("b:current_syntax") == 1 then
    return
end

local original_compatible_options = vim.o.cpoptions
vim.cmd("set cpoptions&")

vim.cmd("syntax keyword Keyword let return def alias")
vim.cmd("syntax keyword Type string")
vim.cmd("syntax keyword Constant null")
vim.cmd([[syntax region String start=/"/ skip=/\\"/ end=/"/]])
vim.cmd([[syntax region Comment start=/#/ end=/$/]])

vim.cmd("syntax keyword Function cd values length print default transpose ansi open lines each reduce append save get insert source")
vim.cmd([[syntax match Function /\<path join\>/]])
vim.cmd([[syntax match Function /\<path expand\>/]])
vim.cmd([[syntax match Function /\<path exists\>/]])
vim.cmd([[syntax match Function /\<split column\>/]])

vim.cmd([[let b:current_syntax = "nu"]])

vim.o.cpoptions = original_compatible_options
