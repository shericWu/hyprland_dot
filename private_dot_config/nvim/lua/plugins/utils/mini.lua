return {
    {
        "echasnovski/mini.animate",
        version = false,

        config = function()
            local animate = require("mini.animate")
            animate.setup({
                cursor = { enable = false },
                scroll = { enable = false },
                resize = {
                    timing = animate.gen_timing.exponential({
                        duration = 100,
                        unit = "total"
                    }),
                }
            })
        end
    },
    {
        "echasnovski/mini.trailspace",
        version = false,
        opts = {}
    }
}
