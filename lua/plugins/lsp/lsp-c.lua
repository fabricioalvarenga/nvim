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

           -- Check if clangd is installed
            if not is_command_available("clangd") then
                io.stdout:write("clangd is not installed. Installing it via homebrew...")
                Status, Exit_Code, Code = os.execute("brew install llvm")
            end

            -- Configure clangd for C and C++
            lspconfig.clangd.setup({
                cmd = { "clangd" }, -- clangd path (define full path if necessary)
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
                capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Enable autocompletion 
            })
        end,
    }
}
