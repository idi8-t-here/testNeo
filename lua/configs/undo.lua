if vim.fn.has("persistent_undo") == 1 then
    local target_path = vim.fn.expand('~/.undodir')

    -- Create the directory and any parent directories
    -- if the location does not exist.
    if not vim.fn.isdirectory(target_path) then
        vim.fn.mkdir(target_path, "p", 0700)
    end
    --wait nigga 
    vim.o.undodir = target_path
    vim.o.undofile = true
end

