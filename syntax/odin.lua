if vim.fn.exists("b:current_syntax") == 1 then
    return
end

vim.cmd([[let b:current_syntax = "odin"]])

local original_compatible_options = vim.o.cpoptions
vim.cmd("set cpoptions&")

vim.cmd("syntax keyword Statement using transmute cast distinct opaque where dynamic")
vim.cmd("syntax keyword Statement struct enum union bit_field bit_set")
vim.cmd("syntax keyword Statement package proc map import export foreign")
vim.cmd("syntax keyword Statement return defer")
vim.cmd("syntax keyword Statement or_return or_else")
vim.cmd("syntax keyword Statement inline no_inline")
vim.cmd("syntax keyword Statement if when else do for switch case continue break in")

vim.cmd("syntax keyword Type string cstring bool b8 b16 b32 b64 rune any rawptr")
vim.cmd("syntax keyword Type f16 f32 f64 f16le f16be f32le f32be f64le f64be")
vim.cmd("syntax keyword Type u8 byte u16 u32 u64 u128 u16le u32le u64le u128le u16be")
vim.cmd("syntax keyword Type u32be u64be u128be uint uintptr i8 i16 i32 i64 i128")
vim.cmd("syntax keyword Type i16le i32le i64le i128le i16be i32be i64be i128be")
vim.cmd("syntax keyword Type int complex complex32 complex64 complex128 matrix typeid")
vim.cmd("syntax keyword Type quaternion quaternion64 quaternion128 quaternion256")
vim.cmd("syntax keyword Boolean true false")
vim.cmd("syntax keyword Constant nil")
vim.cmd([[syntax match Type /\<\u\(\w\+\)\?\>/]])
vim.cmd([[syntax match Constant '\s\+---\(\s\|$\)']])
vim.cmd([[syntax match Function /\<\w\+\>\( :: proc\)\@=/]])
vim.cmd([[syntax match Function /\<\w\+\>\((\)\@=/]])
vim.cmd([[syntax match Constant /\<\u\(\u\|\d\|_\)\+\>/]])
vim.cmd([[syntax match Number /\<\d\+/]])
vim.cmd([[syntax match Float /\(\d\+\)\?\.\d\+/]])
vim.cmd([[syntax match Statement /#\<\a\w*\>/]])
vim.cmd [[syntax match PreProc /@(\?/]]
vim.cmd [[syntax match PreProc /\(@(\?\)\@<=\w\+/]]
vim.cmd [[syntax match PreProc /\(@.*\)\@<=)/]]

vim.cmd([[syntax region String start=/`/ end=/`/]])
vim.cmd([[syntax region Character start=/'/ skip=/\\'/ end=/'/]])
vim.cmd([[syntax region String start=/"/ skip=/\\"/ end=/"/]])
vim.cmd([[syntax region Comment start=/\/\// end=/$/]])
vim.cmd([[syntax region Comment start=/\/\*/ end=/\*\// contains=Comment]])

vim.o.cpoptions = original_compatible_options
