ESX 						  = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('job_peche_s:recolte')
AddEventHandler('job_peche_s:recolte', function()

	local _source = source

	local xPlayer  = ESX.GetPlayerFromId(source)

		xPlayer.addInventoryItem('fish', 1)

end)
