local config = require 'config.shared'
local createBlips = require 'client.utils'.createBlips

CreateThread(function()
    Renewed.addPed({
        model = config.gymNPC.pedname,
        dist = 15,
        coords = vec3(-1255.53, -354.77, 35.96),
        heading = 296.64,
        freeze = true,
        invincible = true,
        tempevents = true,
        id = 'gym_ped_purchase',

        target = {
            {
                label = 'Buy Membership',
                name = 'gym_ped_purchase',
                icon = 'fas fa-id-card-clip',
                onSelect = function()
                    lib.registerContext({
                        id = 'gymnpc',
                        title = 'Pump & Run Gymnasium',
                        options = {
                            {
                                title = "Welcome! Please Purchase a Gym Member to workout!",
                                readOnly = true,
                                icon = 'fas fa-circle-info'
                            },
                            {
                                title = 'Buy Gym Membership',
                                description = "Price: $"..config.gymPass.price,
                                onSelect = function()
                                    local alert = lib.alertDialog({
                                        header = 'Pump & Run Gymnasium',
                                        content = 'You are about to purchase a gym membership, would you like to continue?',
                                        centered = true,
                                        cancel = true,
                                        labels = {
                                            confirm = 'Purchase'
                                        }
                                    })

                                    if alert ~= 'confirm' then
                                        return lib.notify({
                                            title = 'Pump & Run Gymnasium',
                                            description = 'Maybe next time then!',
                                            type = 'info',
                                            icon = 'fas fa-dumbbell',
                                            style = { color = '000' },
                                            duration = 7500
                                        })
                                    end

                                    local hasMoney = lib.callback.await('mp-gym:server:hasMoney', false)

                                    if not hasMoney then
                                        return lib.notify({
                                            title = 'Pump & Run Gymnasium',
                                            description = 'You don\'t have enough money!',
                                            type = 'error',
                                            icon = 'fas fa-dumbbell',
                                            style = { color = '000' },
                                            duration = 7500
                                        })
                                    end

                                    if lib.progressCircle({
                                        label = 'Processing Purchase',
                                        duration = 3000,
                                        position = 'bottom',
                                        useWhileDead = false,
                                        canCancel = true,
                                        disable = { move = true, car = true, combat = true },
                                        anim = { dict = 'missheistdockssetup1clipboard@base',  clip = 'base', flag = 8 }
                                    }) then
                                        local gotPass = lib.callback.await('mp-gym:server:givePass', false)

                                        if not gotPass then return end

                                        return lib.notify({
                                            title = 'Pump & Run Gymnasium',
                                            description = 'You don\'t have enough money!',
                                            type = 'error',
                                            icon = 'fas fa-dumbbell',
                                            style = { color = '000' },
                                            duration = 7500
                                        })
                                    end
                                end,
                                icon = 'fas fa-dumbbell'
                            },
                        }
                    })
                    lib.showContext('gymnpc')
                end
            }
        }
    })
end)

local function makeBlip()
    createBlips({
        text = 'Pump & Run Gymnasium',
        coords = vec3(-1262.78, -360.72, 36.99),
        sprite = 311,
        scale = 0.65,
        color = 7
    })
end

CreateThread(makeBlip)