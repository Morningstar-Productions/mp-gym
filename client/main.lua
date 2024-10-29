local config = require 'config.shared'
local lockpickGame = require 'client.utils'.lockpickGame

local function useTreadmill()
    if lib.progressCircle({
        label = 'Jogging',
        duration = config.skills.treadmills.ProgressbarDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true },
        anim = { scenario = 'WORLD_HUMAN_JOG_STANDING' },
    }) then
        lib.playAnim(cache.ped, 'amb@world_human_jog_standing@male@idle_a', 'idle_a', 8.0, 8.0, -1, 1)

        local success = lockpickGame(math.random(4, 6), math.random(15, 30))

        if not success then
            StopAnimTask(cache.ped, 'amb@world_human_jog_standing@male@idle_a', 'idle_a', 0)

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'That did not feel too good.',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })
            Wait(3000)
            TriggerServerEvent('hud:server:GainStress', config.skills.treadmills.stress + math.random(5, 10))
        else
            StopAnimTask(cache.ped, 'amb@world_human_jog_standing@male@idle_a', 'idle_a', 0)

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'You feel energized!',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            exports["mz-skills"]:UpdateSkill(config.skills.treadmills.skill, config.skills.treadmills.amount)
            Wait(2000)
            TriggerServerEvent('hud:server:RelieveStress', config.skills.treadmills.stress)
        end
    end
end

local function doChinups()
    StartPlayerTeleport(cache.playerId, -1258.79, -355.49, 35.96, 338.63, false, false, true)

    while IsPlayerTeleportActive() do Wait(0) end

    exports.scully_emotemenu:playEmoteByCommand('chinup')

    if lib.progressCircle({
        label = 'Doing Chinups',
        duration = config.skills.chinups.progressbarDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true },
    }) then
        local success = lockpickGame(math.random(4, 6), math.random(15, 30))

        if not success then
            exports.scully_emotemenu:cancelEmote()

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'That did not feel too good.',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            Wait(3000)
            TriggerServerEvent('hud:server:GainStress', config.skills.chinups.stress + math.random(5, 10))
        else
            exports.scully_emotemenu:cancelEmote()

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'You feel energized!',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            exports["mz-skills"]:UpdateSkill(config.skills.chinups.skill, config.skills.chinups.amount)
            Wait(2000)
            TriggerServerEvent('hud:server:RelieveStress', config.skills.chinups.stress)
        end
    end
end

local function doChinups2()
    StartPlayerTeleport(cache.playerId, -1257.45, -358.75, 35.96, 294.17, false, false, true)

    while IsPlayerTeleportActive() do Wait(0) end

    exports.scully_emotemenu:playEmoteByCommand('chinup')

    if lib.progressCircle({
        label = 'Doing Chinups',
        duration = config.skills.chinups.progressbarDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true },
    }) then
        local success = lockpickGame(math.random(4, 6), math.random(15, 30))

        if not success then
            exports.scully_emotemenu:cancelEmote()

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'That did not feel too good.',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            Wait(3000)
            TriggerServerEvent('hud:server:GainStress', config.skills.chinups.stress + math.random(5, 10))
        else
            exports.scully_emotemenu:cancelEmote()

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'You feel energized!',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            exports["mz-skills"]:UpdateSkill(config.skills.chinups.skill, config.skills.chinups.amount)
            Wait(2000)
            TriggerServerEvent('hud:server:RelieveStress', config.skills.chinups.stress)
        end
    end
end

local function liftWeights()
    TaskStartScenarioInPlace(cache.ped, "world_human_muscle_free_weights", 0, true)

    if lib.progressCircle({
        label = 'Lifting Weights',
        duration = config.skills.liftweights.progressbarDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true }
    }) then
        local success = lockpickGame(math.random(4, 6), math.random(15, 30))
        if not success then
            ClearPedTasks(cache.ped)

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'That did not feel too good.',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            Wait(3000)
            TriggerServerEvent('hud:server:GainStress', config.skills.liftweights.stress + math.random(5, 10))
        else
            ClearPedTasks(cache.ped)

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'You feel stronger!',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            exports["mz-skills"]:UpdateSkill(config.skills.liftweights.skill, config.skills.liftweights.amount)
            Wait(2000)
            TriggerServerEvent('hud:server:RelieveStress', config.skills.liftweights.stress)
        end
    end
end

local function doYoga()
    exports.scully_emotemenu:playEmoteByCommand('yoga')

    if lib.progressCircle({
        label = 'Doing Yoga',
        duration = config.skills.yoga.progressbarDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true }
    }) then
        local success = lockpickGame(math.random(4, 6), math.random(15, 30))
        if not success then
            exports.scully_emotemenu:cancelEmote()

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'That did not feel too good.',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            Wait(3000)
            TriggerServerEvent('hud:server:GainStress', config.skills.yoga.stress + math.random(5, 10))
        else
            exports.scully_emotemenu:cancelEmote()

            lib.notify({
                title = 'Pump & Run Gymnasium',
                description = 'You feel at peace...',
                type = 'error',
                icon = 'fas fa-dumbbell',
                style = { color = '000' },
                duration = 7500,
            })

            exports["mz-skills"]:UpdateSkill(config.skills.yoga.skill, config.skills.yoga.amount)
            Wait(2000)
            TriggerServerEvent('hud:server:RelieveStress', config.skills.yoga.stress)
        end
    end
end

local function checkPass()
    local hasPass = exports.ox_inventory:Search('count', config.gymPass.item)

    if not hasPass > 1 then
        return lib.notify({
            title = 'Pump & Run Gymnasium',
            description = 'You don\'t have a membership pass.',
            type = 'error',
            icon = 'fas fa-dumbbell',
            style = { color = '000' },
            duration = 7500,
        })
    end
end

local function loadZones()
    for k, v in pairs(config.treadmillLocs) do
        exports.ox_target:addBoxZone({
            coords = vec3(v.coords.x, v.coords.y, v.coords.z),
            size = vec3(2, 1, 5),
            rotation = 300,
            drawSprite = true,
            options = {
                {
                    label = 'Use Treadmill',
                    name = 'treadmill_'..k,
                    icon = 'fas fa-person-running',
                    onSelect = function()
                        checkPass()
                        useTreadmill()
                    end,
                    canInteract = function(_, distance)
                        return distance <= 2.0
                    end
                }
            }
        })
    end

    exports.ox_target:addBoxZone({
        coords = vec3(-1258.97, -356.16, 36.99),
        size = vec3(2, 1, 5),
        rotation = 300,
        drawSprite = true,
        options = {
            {
                label = 'Do Chinups',
                name = 'chinups',
                icon = 'fas fa-arrow-up',
                onSelect = function()
                    checkPass()
                    doChinups()
                end,
                canInteract = function(_, distance)
                    return distance <= 2.0
                end
            }
        }
    })

    exports.ox_target:addBoxZone({
        coords = vec3(-1257.71, -358.84, 36.99),
        size = vec3(2, 1, 5),
        rotation = 300,
        drawSprite = true,
        options = {
            {
                label = 'Do Chinups',
                name = 'chinups',
                icon = 'fas fa-arrow-up',
                onSelect = function()
                    checkPass()
                    doChinups2()
                end,
                canInteract = function(_, distance)
                    return distance <= 2.0
                end
            }
        }
    })

    exports.ox_target:addBoxZone({
        coords = vec3(-1268.11, -366.05, 36.99),
        size = vec3(2, 1, 5),
        rotation = 300,
        drawSprite = true,
        options = {
            {
                label = 'Lift Weights',
                name = 'liftweights',
                icon = 'fas fa-dumbbell',
                onSelect = function()
                    checkPass()
                    liftWeights()
                end,
                canInteract = function(_, distance)
                    return distance <= 2.0
                end
            }
        }
    })

    exports.ox_target:addBoxZone({
        coords = vec3(-1269.8, -362.56, 36.96),
        size = vec3(2, 1, 5),
        rotation = 300,
        drawSprite = true,
        options = {
            {
                label = 'Lift Weights',
                name = 'liftweights2',
                icon = 'fas fa-dumbbell',
                onSelect = function()
                    checkPass()
                    liftWeights()
                end,
                canInteract = function(_, distance)
                    return distance <= 2.0
                end
            }
        }
    })

    exports.ox_target:addBoxZone({
        coords = vec3(-1262.34, -360.87, 36.96),
        size = vec3(5, 5, 5),
        rotation = 300,
        drawSprite = true,
        options = {
            {
                label = 'Start Yoga',
                name = 'yoga',
                icon = 'fas fa-face-smile',
                onSelect = function()
                    checkPass()
                    doYoga()
                end,
                canInteract = function(_, distance)
                    return distance <= 2.0
                end
            }
        }
    })
end

AddEventHandler('Renewed-Lib:client:PlayerLoaded', function()
    loadZones()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= cache.resource then return end
    loadZones()
end)