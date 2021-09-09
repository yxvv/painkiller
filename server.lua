ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('tabletki:use')
AddEventHandler('tabletki:use', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	while xPlayer == nil do
		xPlayer = ESX.GetPlayerFromId(_source)
		Citizen.Wait(10)
	end
	xPlayer.removeInventoryItem('painkiller', 1)
end)

ESX.RegisterUsableItem('painkiller', function(source)
	TriggerClientEvent('tabletki:start', source)
end)