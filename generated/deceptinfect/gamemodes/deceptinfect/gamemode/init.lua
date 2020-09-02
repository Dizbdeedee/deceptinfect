AddCSLuaFile("haxe_cl_init.lua")
local exports = include("haxe_init.lua")
deceptinfect_HAXE = exports.__env
for i,p in pairs(exports) do
    if i ~= "__env" then
        _G[i] = p
    end
end