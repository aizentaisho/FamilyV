ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function getGroup(identifier)
  return MySQL.Sync.fetchScalar("SELECT users.group FROM users WHERE identifier=@identifier", {['@identifier'] = identifier})
end

RegisterServerEvent('overhead:checkadmin_s')
AddEventHandler('overhead:checkadmin_s', function()
    		local xPlayer = ESX.GetPlayerFromId(source)
            local adminLevel = 0
            adminLevel = getGroup(xPlayer.identifier)	
            print(adminLevel)
            TriggerClientEvent('overhead:client_checkadmin',source, adminLevel)
        
end)