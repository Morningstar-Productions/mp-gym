local config = require 'config.shared'
local QBX = exports.qbx_core

lib.callback.register('mp-gym:server:givePass', function(source)
    local src = source
    local player = QBX:GetPlayer(src)

    if player.Functions.RemoveMoney('cash', config.gymPass.ptem) then
        exports.ox_inventory:AddItem(src, config.gymPass.item, 1)
        return true
    end

    return false
end)

lib.callback.register('mp-gym:server:hasMoney', function(source)
    local player = QBX:GetPlayer(source)
    local playerMoney = player.PlayerData.money.cash

    if playerMoney ~= config.gymPass.price then
        return false
    end

    return true
end)