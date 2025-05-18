require('render-markdown').setup({
    -- priority = 1000,
    completions = { blink = { enabled = true } },
    render_modes = { 'n', 'c', 'i'},
    present = 'none',
    enabled = true,
    injections = {
        gitcommit = {
            enabled = true,
            query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
        },
    },
})
