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

            -- Check if pyright is installed
            if not is_command_available("basedpyright") then
                io.stdout:write("basedpyright is not installed. Installing it via homebrew...")
                Status, Exit_Code, Code = os.execute("brew install basedpyright")
            end

            -- Configure Pyright
            lspconfig.basedpyright.setup({
                settings = {
                    basedpyright = {
                        analysis = {
                            diagnosticMode = "openFilesOnly",
                            inlayHints = {
                                callArgumentNames = true
                            }
                        }
                    }
                }
            })
       end,
    },
}
