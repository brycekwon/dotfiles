return {
    "nvim-mini/mini.statusline",
    name = "mini-statusline",
    version = "v0.*",

    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            name = "web-devicons",
        },
    },

    event = "VeryLazy",

    config = function()
        local sl = require("mini.statusline")

        -- cache buffer list to avoid recalculating on every statusline update
        local buffers_cache = ""
        local buffers_cache_time = 0
        local cache_duration = 100  -- milliseconds

        local function buffers_list(max)
            max = max or 70
            local now = vim.loop.now()

            -- return cached result if still fresh
            if now - buffers_cache_time < cache_duration then
                return buffers_cache
            end

            local cur = vim.api.nvim_get_current_buf()
            local bufs = vim.fn.getbufinfo({ buflisted = 1 })

            local out, used = {}, 0
            for _, b in ipairs(bufs) do
                local name = b.name ~= "" and vim.fn.fnamemodify(b.name, ":t") or "[No Name]"
                if b.changed == 1 then name = name .. "+" end
                local item = (b.bufnr == cur) and ("[" .. name .. "]") or name

                local add = (used == 0) and item or (" " .. item)
                if used + #add > max then
                    table.insert(out, " …")
                    break
                end

                table.insert(out, add)
                used = used + #add
            end

            buffers_cache = table.concat(out)
            buffers_cache_time = now
            return buffers_cache
        end

        sl.setup({
            use_icons = true,
            set_vim_settings = false,
            content = {
                active = function()
                    local mode, mode_hl = sl.section_mode({ trunc_width = 120 })
                    -- local filename = sl.section_filename({ trunc_width = 200 })
                    local bufline = buffers_list(90)

                    return sl.combine_groups({
                        { hl = mode_hl, strings = { mode } },
                        -- { hl = "MiniStatuslineFilename", strings = { filename } },
                        { hl = "MiniStatuslineFilename", strings = { bufline } },
                        "%=",
                        { hl = "MiniStatuslineDevinfo", strings = { "%l:%c", "%p%%" } },
                    })
                end,

                inactive = function()
                    -- local filename = sl.section_filename({ trunc_width = 200 })
                    local bufline = buffers_list(90)

                    return sl.combine_groups({
                        -- { hl = "MiniStatuslineInactive", strings = { filename } },
                        "%=",
                        { hl = "MiniStatuslineInactive", strings = { bufline, "%l:%c", "%p%%" } },
                    })
                end,
            },
        })
    end,
}
