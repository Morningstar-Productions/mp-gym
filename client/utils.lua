---@param data { text: string, coords: vector3, sprite: integer, scale: integer, color: integer }
---@return number
local function createBlips(data)
    local blipID = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(blipID, data.sprite)
    SetBlipScale(blipID, data.scale or 0.65)
    SetBlipColour(blipID, data.color)
    SetBlipAsShortRange(blipID, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.text)
    EndTextCommandSetBlipName(blipID)
    return blipID
end

---@param circles number
---@param time number
local function lockpickGame(circles, time)
    local game = {}

    for i = 1, circles do game[i] = {areaSize = math.random(time, math.ceil(time * 1.5)), speedMultiplier = 0.65} end

    return lib.skillCheck(game, {'1', '2', '3', '4'})
end

return {
    createBlips = createBlips,
    lockpickGame = lockpickGame
}