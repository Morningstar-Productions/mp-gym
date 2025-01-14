local config = require 'config.shared'

lib.callback.register('mp-gym:server:givePass', function(source)
    if Renewed.removeMoney(source, config.gymPass.price, config.gymPass.moneyType) then
        exports.ox_inventory:AddItem(source, config.gymPass.item, 1)
        return true
    end

    return false
end)

lib.callback.register('mp-gym:server:hasMoney', function(source)
    local playerMoney = Renewed.getMoney(source, config.gymPass.moneyType)

    if playerMoney >= config.gymPass.price then
        return true
    end

    return false
end)
