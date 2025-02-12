require('render-markdown').setup({
    render_modes = { 'n', 'c' },
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
