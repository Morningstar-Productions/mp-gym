local config = require 'config.shared'

lib.callback.register('mp-gym:server:givePass', function(source)
    local src = source

    if Renewed.removeMoney(src, 'cash', config.gymPass.price) then
        exports.ox_inventory:AddItem(src, config.gymPass.item, 1)
        return true
    end

    return false
end)

lib.callback.register('mp-gym:server:hasMoney', function(source)
    local playerMoney = Renewed.getMoney(source, 'cash')

    if playerMoney ~= config.gymPass.price then
        return false
    end

    return true
end)
