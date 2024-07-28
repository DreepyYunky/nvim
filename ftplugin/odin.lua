-- ~/.config/nvim/after/ftplugin/odin.lua
vim.bo.indentexpr = 'v:lua.my_language_indent()'

function _G.my_language_indent()
    -- Your custom indent logic
    -- Example: return current indent + 4 spaces
    local line = vim.fn.getline(vim.v.lnum)
    if line:match('{') then
        return vim.fn.indent(vim.v.lnum - 1) + 4
    else
        return vim.fn.indent(vim.v.lnum - 1)
    end
end

