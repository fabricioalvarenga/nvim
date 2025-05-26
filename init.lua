require("config.lazy")
require("config.base")
require("config.maps")
--require('config.highlights')

local has = function(x)
    return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"
local is_linux = has "linux"

if is_mac then
    require("config.macos")
end

if is_win then
    require("config.windows")
end

if is_linux then
    require("config.linux")
end
