randomPrice = true --Random the price of each stations
price = 1 --If random price is on False, set the price here for 1 liter


ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local players = {}
local StationsPrice = {}

RegisterServerEvent("essence:addPlayer")
AddEventHandler("essence:addPlayer", function()
	local _source = source
	TriggerClientEvent("essence:sendPrice", source, StationsPrice)
	table.insert(players,_source)
end)

AddEventHandler("playerDropped", function(reason)
	local _source = source
	local newPlayers = {}
	
	for _,k in pairs(players) do
		if(k~=_source) then
			table.insert(newPlayers, k)
		end
	end

	players = {}
	players = newPlayers
end)


RegisterServerEvent("essence:playerSpawned")
AddEventHandler("essence:playerSpawned", function()
	local _source = source
	SetTimeout(2000, function()
		TriggerClientEvent("essence:sendPrice", _source, StationsPrice)
		TriggerClientEvent("essence:sendEssence", _source, serverEssenceArray)
	end)
end)

RegisterServerEvent("essence:setToAllPlayerEscense")
AddEventHandler("essence:setToAllPlayerEscense", function(essence, vplate, vmodel)
	local bool, ind = searchByModelAndPlate(vplate, vmodel)
	if(vplate ~=nil and vmodel~=nil and essence ~=nil and bool and ind ~= nil) then
		serverEssenceArray[ind].es = essence
	else
		table.insert(serverEssenceArray,{plate=vplate,model=vmodel,es=essence})
	end
	for _,k in pairs(players) do
		TriggerClientEvent("essence:setEssence", k, essence, vplate,vmodel)
	end

end)


RegisterServerEvent("essence:buy")
AddEventHandler("essence:buy", function(amount, index,e)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local price = StationsPrice[index]

	if(e) then
		price = index
	end
	
	local toPay = round(amount*price,2)
	if(toPay > xPlayer.getMoney()) then
		TriggerClientEvent("showNotif", _source, "~r~You don't have enought money.")
	else
		xPlayer.removeMoney(toPay)
		TriggerClientEvent("essence:hasBuying", _source, amount)
	end
end)


RegisterServerEvent("essence:requestPrice")
AddEventHandler("essence:requestPrice",function()
	TriggerClientEvent("essence:sendPrice", source, StationsPrice)
end)


function round(num, dec)
  local mult = 10^(dec or 0)
  return math.floor(num * mult + 0.5) / mult
end


function renderPrice()
    for i=0,34 do
        if(randomPrice) then
            StationsPrice[i] = math.random(15,50)/100
        else
        	StationsPrice[i] = price
        end
    end
end


renderPrice()


function searchByModelAndPlate(plate, model)

	for i,k in pairs(serverEssenceArray) do
		if(k.plate == plate and k.model == model) then
			return true, i
		end
	end

	return false, nil
end
