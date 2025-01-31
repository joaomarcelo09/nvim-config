require("blink.cmp").setup({
            snippets = {
                -- Function to use when expanding LSP provided snippets
                expand = function(snippet)
                    require("mini.snippets").default_insert(
                        { body = snippet },
                        { empty_tabstop = "", empty_tabstop_final = "" }
                    )
                end,
            },
            keymap = {
                preset = "enter",
                ["<d-d>"] = { "show_documentation" },
                ["<c-n>"] = {},
                ["<c-p>"] = {},
            },
            completion = {
                ghost_text = {
                    enabled = true,
                },
                menu = {
                    draw = {
                        -- We don't need label_description now because label and label_description are already
                        -- conbined together in label by colorful-menu.nvim.
                        columns = { { "kind_icon" }, { "label", gap = 2 }, { "provider" } },
                        components = {
                            label = {
                                -- width = { fill = true, max = 110 },
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                            provider = {
                                text = function(ctx)
                                    return "[" .. ctx.item.source_name:sub(1, 3):upper() .. "]"
                                end,
                                highlight = "BlinkCmpKindLabel",
                            },
                        },
                    },
                },
            },
        })
