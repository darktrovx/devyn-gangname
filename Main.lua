local QBCore = exports["qb-core"]:GetCoreObject()
local GangData = nil

local function Handler()
    print(GangData)
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
    GangData = QBCore.Functions.GetPlayerData().metadata
    -- while GangData == nil do
    --     print("Waiting")
    --     Wait(500)
    -- end
    for k,v in pairs(GangData) do 
        print(k,v)
    end
    Handler()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    GangData = nil
    Handler()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    GangData = QBCore.Functions.GetPlayerData().metadata.gang
    while GangData == nil do
        Wait(500)
    end
    Handler()
end)

RegisterNetEvent("QBCore:Client:OnGangUpdate", function(gang)
    GangData = gang
    Handler()
end)