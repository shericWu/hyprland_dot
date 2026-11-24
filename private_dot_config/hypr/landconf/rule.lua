--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/configuring/core/rules/
-- Rules are left anonymous (no `name`) on purpose: named rules are evaluated
-- before anonymous ones, so naming only some would change their order.

hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" }) -- You'll probably like this.
hl.window_rule({ match = { class = "(kitty)" }, opacity = "0.85 override" })
hl.window_rule({ match = { class = "(foot)" },  opacity = "0.85 override" })
hl.window_rule({ match = { title = "(cava)" },  opacity = "0.3 override" })

-- Windows on special workspaces: floating, centered, 75% of the monitor
hl.window_rule({
    match  = { workspace = "s[true]" },
    float  = true,
    center = true,
    size   = { "monitor_w*0.75", "monitor_h*0.75" },
})

-- Smart gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 20 })
hl.window_rule({ match = { float = false, workspace = "f[1]" },   border_size = 0, rounding = 20 })
