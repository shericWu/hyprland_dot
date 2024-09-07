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
	-- [maths]
	s(
		{ trig = "mm" },
		fmta(
			[[
                $$
                    <>
                $$
            ]],
			{
				i(0),
			}
		)
	),
	-- [math constructs]
	s(
		{ trig = "ff" },
		fmta(
			[[
                \frac{<>}{<>}
            ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{ trig = "^" },
		fmta(
			[[
                ^{<>}
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "-" },
		fmta(
			[[
                _{<>}
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "sqrt" },
		fmta(
			[[
                \sqrt{<>}
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "sqrtN" },
		fmta(
			[[
                \sqrt[<>]{<>}
            ]],
			{
				i(1),
				i(2),
			}
		)
	),
	-- [math functions]
	s(
		{ trig = "sin" },
		fmta(
			[[
                \sin(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "cos" },
		fmta(
			[[
                \cos(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "tan" },
		fmta(
			[[
                \tan(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "cot" },
		fmta(
			[[
                \tan(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "sec" },
		fmta(
			[[
                \sec(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "csc" },
		fmta(
			[[
                \csc(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "exp" },
		fmta(
			[[
                \exp(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "log" },
		fmta(
			[[
                \log(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "ln" },
		fmta(
			[[
                \ln(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "lg" },
		fmta(
			[[
                \lg(<>)
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "min" },
		fmta(
			[[
                \min(<>, <>)
            ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{ trig = "max" },
		fmta(
			[[
                \max(<>, <>)
            ]],
			{
				i(1),
				i(2),
			}
		)
	),
	-- [math functions 2]
	s(
		{ trig = "lim" },
		fmta(
			[[
                \lim
            ]],
			{}
		)
	),
	s(
		{ trig = "limto" },
		fmta(
			[[
                \lim_{<> \to <>}
            ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{ trig = "int" },
		fmta(
			[[
                \int
            ]],
			{}
		)
	),
	s(
		{ trig = "int-" },
		fmta(
			[[
                \int_{<>}^{<>}
            ]],
			{
				i(1),
				i(2),
			}
		)
	),
	-- [text in maths]
	s(
		{ trig = "tt" },
		fmta(
			[[
                \text{<>}
            ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "spa" },
		fmta(
			[[
                \ \ \ \ <>
            ]],
			{ i(0) }
		)
	),
	-- [environment]
	s(
		{ trig = "env" },
		fmta(
			[[
                \begin{<>}
                    <>
                \end{<>}
            ]],
			{
				i(1),
				i(0),
				rep(1),
			}
		)
	),
	s(
		{ trig = "cases" },
		fmta(
			[[
                \begin{cases}
                    <>  &<> \\
                    <>  &<>
                \end{cases}
            ]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
			}
		)
	),
	-- [Arrows]
	s(
		{ trig = "rarrow" },
		fmta(
			[[
                \rightarrow
            ]],
			{}
		)
	),
	s(
		{ trig = "longrarrow" },
		fmta(
			[[
                \longrightarrow
            ]],
			{}
		)
	),
	s(
		{ trig = "Rarrow" },
		fmta(
			[[
                \Rightarrow
            ]],
			{}
		)
	),
	s(
		{ trig = "longRarrow" },
		fmta(
			[[
                \Longrightarrow
            ]],
			{}
		)
	),
	s(
		{ trig = "lrarrow" },
		fmta(
			[[
                \leftrightarrow
            ]],
			{}
		)
	),
	s(
		{ trig = "LRarrow" },
		fmta(
			[[
                \Leftrightarrow
            ]],
			{}
		)
	),
	s(
		{ trig = "xrarrow" },
		fmta(
			[[
                \xrightarrow{<>}
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "xRarrow" },
		fmta(
			[[
                \xRightarrow{<>}
            ]],
			{
				i(1),
			}
		)
	),
	-- [Fences]
	s(
		{ trig = "langle" },
		fmta(
			[[
                \langle <> \rangle
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "lceil" },
		fmta(
			[[
                \lceil <> \rceil
            ]],
			{
				i(0),
			}
		)
	),
	s(
		{ trig = "lfloor" },
		fmta(
			[[
                \lfloor <> \rfloor
            ]],
			{
				i(0),
			}
		)
	),
	-- [Greek Letters]
	s(
		{ trig = "mathbb" },
		fmta(
			[[
                \mathbb{<>}
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "forall" },
		fmta(
			[[
                \forall
            ]],
			{}
		)
	),
	s(
		{ trig = "exists" },
		fmta(
			[[
                \exists
            ]],
			{}
		)
	),
	s(
		{ trig = "infty" },
		fmta(
			[[
                \infty
            ]],
			{}
		)
	),
	s(
		{ trig = "gga" },
		fmta(
			[[
                \alpha
            ]],
			{}
		)
	),
	s(
		{ trig = "ggb" },
		fmta(
			[[
                \beta
            ]],
			{}
		)
	),
	s(
		{ trig = "ggg" },
		fmta(
			[[
                \gamma
            ]],
			{}
		)
	),
	s(
		{ trig = "ggd" },
		fmta(
			[[
                \delta
            ]],
			{}
		)
	),
	s(
		{ trig = "ggD" },
		fmta(
			[[
                \Delta
            ]],
			{}
		)
	),
	s(
		{ trig = "gge" },
		fmta(
			[[
                \epsilon
            ]],
			{}
		)
	),
	s(
		{ trig = "ggE" },
		fmta(
			[[
                \varepsilon
            ]],
			{}
		)
	),
	s(
		{ trig = "ggt" },
		fmta(
			[[
                \theta
            ]],
			{}
		)
	),
	s(
		{ trig = "ggT" },
		fmta(
			[[
                \Theta
            ]],
			{}
		)
	),
	s(
		{ trig = "ggk" },
		fmta(
			[[
                \kappa
            ]],
			{}
		)
	),
	s(
		{ trig = "ggl" },
		fmta(
			[[
                \lambda
            ]],
			{}
		)
	),
	s(
		{ trig = "ggL" },
		fmta(
			[[
                \Lambda
            ]],
			{}
		)
	),
	s(
		{ trig = "ggs" },
		fmta(
			[[
                \sigma
            ]],
			{}
		)
	),
	s(
		{ trig = "ggS" },
		fmta(
			[[
                \Sigma
            ]],
			{}
		)
	),
	s(
		{ trig = "ggo" },
		fmta(
			[[
                \omega
            ]],
			{}
		)
	),
	s(
		{ trig = "ggO" },
		fmta(
			[[
                \Omega
            ]],
			{}
		)
	),
	s(
		{ trig = "ggp" },
		fmta(
			[[
                \partial
            ]],
			{}
		)
	),
	-- [html colors]
	s(
		{ trig = "colorRed" },
		fmt(
			[[
                <font color=#D1616C> [] </font>
            ]],
			{ i(1) },
			{ delimiters = "[]" }
		)
	),
	s(
		{ trig = "colorYellow" },
		fmt(
			[[
                <font color=#EBCB8B> [] </font>
            ]],
			{ i(1) },
			{ delimiters = "[]" }
		)
	),
	s(
		{ trig = "colorGreen" },
		fmt(
			[[
                <font color=#A3BE8C> [] </font>
            ]],
			{ i(1) },
			{ delimiters = "[]" }
		)
	),
	s(
		{ trig = "colorBlue" },
		fmt(
			[[
                <font color=#88C0D0> [] </font>
            ]],
			{ i(1) },
			{ delimiters = "[]" }
		)
	),
	-- [KATEX colors]
	s(
		{ trig = "mmRed" },
		fmt(
			[[
                \textcolor{#D1616C}{<>}
            ]],
			{ i(1) },
			{ delimiters = "<>" }
		)
	),
	s(
		{ trig = "mmYellow" },
		fmt(
			[[
                \textcolor{#EBCB8B}{<>}
            ]],
			{ i(1) },
			{ delimiters = "<>" }
		)
	),
	s(
		{ trig = "mmGreen" },
		fmt(
			[[
                \textcolor{#A3BE8C}{<>}
            ]],
			{ i(1) },
			{ delimiters = "<>" }
		)
	),
	s(
		{ trig = "mmBlue" },
		fmt(
			[[
                \textcolor{#88C0D0}{<>}
            ]],
			{ i(1) },
			{ delimiters = "<>" }
		)
	),
	s(
		{ trig = "plantuml_component" },
		fmta(
			[[
                ```plantuml
                    skinparam BackgroundColor transparent
                    skinparam component {
                        Style rectangle
                        BackgroundColor #2e3440
                        FontColor #ffffff
                        ArrowColor #e5e9f0
                        ArrowFontColor #eceff4
                    }
                    skinparam note {
                        BackgroundColor #d8dee9
                        FontColor #000000
                    }

                    <>
                ```
            ]],
			{ i(0) }
		)
	),
}
