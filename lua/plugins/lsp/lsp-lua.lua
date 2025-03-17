return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require("lspconfig")

            -- Function to check if command "which" exists in the system
            local function is_command_available(command)
                local handle = io.popen("which " .. command) -- try to open pipe using "which"
                -- Check if handle was open correctly
                if handle then
                    local result = handle:read("*a")
                    handle:close()
                    return result ~= "" -- return true if commmand was found (isn't an empty string)
                else
                    return false -- if handle is nil, the execution failed
                end
            end

           -- Check if lua-language-server is installed
            if not is_command_available("lua-language-server") then
                io.stdout:write("lua-language-server is not installed. Installing it via homebrew...")
                Status, Exit_Code, Code = os.execute("brew install lua-language-server")
            end

            -- Configure lua-language-server 
            lspconfig.lua_ls.setup({
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name

                        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = { Lua = {} }
            })
        end,
    },
}
