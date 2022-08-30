local QBCore = exports["qb-core"]:GetCoreObject()
local GangData = nil

local function Handler()
    if GangData == nil or GangData.name == "none" then
        SendNUIMessage({
            action = 'REMOVE',
            gang = GangData
        })
    else
        SendNUIMessage({
            action = 'UPDATE',
            gang = GangData
        })
    end
end

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    GangData = QBCore.Functions.GetPlayerData().gang
    Wait(5000)
    Handler()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    GangData = nil
    Handler()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    GangData = QBCore.Functions.GetPlayerData().gang
    Handler()
end)

RegisterNetEvent("QBCore:Client:OnGangUpdate", function(gang)
    GangData = gang
    Handler()
end)