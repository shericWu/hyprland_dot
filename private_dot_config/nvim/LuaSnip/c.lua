local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
    s(
        { trig = "main" },
        fmta(
            [[
                int main() {

                    <>

                    return 0;
                }
            ]],
            {
                i(0),
            }
        )
    ),
    s(
        { trig = "if" },
        fmta(
            [[
                if (<>) {
                    <>
                }
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),
    s(
        { trig = "ifelse" },
        fmta(
            [[
                if (<>) {
                    <>
                }
                else {
                    <>
                }
            ]],
            {
                i(1),
                i(2),
                i(0),
            }
        )
    ),
    s(
        { trig = "while" },
        fmta(
            [[
                while (<>) {
                    <>
                }
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),
    s(
        { trig = "for" },
        fmta(
            [[
                for (<>; <>; <>) {
                    <>
                }
            ]],
            {
                i(1),
                i(2),
                i(3),
                i(0),
            }
        )
    ),
}
