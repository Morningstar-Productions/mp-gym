local config = require 'config.shared'

lib.callback.register('mp-gym:server:givePass', function(source)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)

    if player.Functions.RemoveMoney('cash', config.gymPass.ptem) then
        exports.ox_inventory:AddItem(src, config.gymPass.item, 1)
        return true
    end

    return false
end)

lib.callback.register('mp-gym:server:hasMoney', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    local playerMoney = player.PlayerData.money.cash

    if playerMoney ~= config.gymPass.price then
        return false
    end

    return true
end)