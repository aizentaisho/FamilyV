-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.

local drawRouteTarget = nil


-- Returns all player names in alphabetical order.
function getOnlinePlayersAndNames()
    local players = {}
    local me = PlayerId(-1)
    for i=0, maxPlayers, 1 do
        if(NetworkIsPlayerConnected(i) and i ~= me) then
            local playerName = GetPlayerName(i)
            local scoreboardID = GetPlayerServerId(i)

            table.insert(players, {
            	['ped'] = GetPlayerPed(i),
            	['menuName']=playerName,
            	['data'] = {
            		['sub'] = "playeroptions",
            		['share'] = scoreboardID
            	},
            	['id'] = i
            })
        end
    end
    return players
end



-- Spectate target player.
function spectatePlayer(target)
	local playerPed = GetPlayerPed(-1) -- yourself

	if(featureSpectate)then
		if (not IsScreenFadedOut() and not IsScreenFadingOut()) then
			DoScreenFadeOut(1000)
			while (not IsScreenFadedOut()) do
				Wait(0)
			end

			local targetpos = GetEntityCoords(target['ped'], false)

			RequestCollisionAtCoord(targetpos['x'],targetpos['y'],targetpos['z'])
			NetworkSetInSpectatorMode(true, target['ped'])

			if(IsScreenFadedOut()) then
				DoScreenFadeIn(1000)
			end
		end


		drawNotification("Spectateur sur ~b~<C>"..target['menuName'].."</C>.")
	else
		if(not IsScreenFadedOut() and not IsScreenFadingOut()) then
			DoScreenFadeOut(1000)
			while (not IsScreenFadedOut()) do
				Wait(0)
			end

			local targetpos = GetEntityCoords(playerPed, false)

			RequestCollisionAtCoord(targetpos['x'],targetpos['y'],targetpos['z'])
			NetworkSetInSpectatorMode(false, target['ped'])

			if(IsScreenFadedOut()) then
				DoScreenFadeIn(1000)
			end
		end

		drawNotification("Spectateur sur ~b~<C>"..target['menuName'].."</C> ~s~arrêté.")
	end
end


-- Draw Route to player on map.


-- Draw Initial Route
function drawRoute(target)
	local targetId = tonumber(target['id'])
	if (featureDrawRoute) then
		if (DoesEntityExist(target['ped'])) then
			local drawroute = GetEntityCoords(target['ped'], false)
			SetNewWaypoint(drawroute['x'], drawroute['y'])
			drawNotification("Itinéraire vers :~n~~b~<C>"..target['menuName'].."</C>.")
		end
	else
		SetWaypointOff()
		drawNotification("Itinéraire supprimé.")
	end
end


-- Update draw route.
function updateDrawRoute()
	if(not IsWaypointActive())then
		featureDrawRoute = false
		return
	end

	local target = drawRouteTarget
	local targetId = target['id']
	if(featureDrawRoute)then
		if(NetworkIsPlayerConnected(targetId))then
			local drawroute = GetEntityCoords(target['ped'], false)

			SetNewWaypoint(drawroute['x'], drawroute['y'])
		else
			SetWaypointOff()
			featureDrawRoute = false
			drawRouteTarget = nil
			-- drawNotification("Le joueur "..target['menuName'].." s'est ~r~<C>déconnecté</C>.")
		end
	end
end



-- Teleport to Player
function teleportToPlayer(target)
	local playerPed = GetPlayerPed(-1) -- Yourself

	if(DoesEntityExist(target['ped']))then
		-- Turns off spectator mode just in case.
		NetworkSetInSpectatorMode(false, target['ped'])
		featureSpectate = false
	end


	local targetPed = playerPed
	if(IsPedInAnyVehicle(playerPed, 0))then
		local v = GetVehiclePedIsUsing(playerPed)
		if(GetPedInVehicleSeat(v, -1) == playerPed) then
			targetPed = v
		end
	else
		ClearPedTasksImmediately(playerPed)
	end

	local x,y,z = table.unpack(GetEntityCoords(target['ped']))
	--Citizen.Trace("XYZ: "..tostring(x).." "..tostring(y).." "..tostring(z))
	z = z + 3.5
	RequestCollisionAtCoord(x,y,z)
	SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)

	drawNotification("Téléporté à ~b~<C>"..target['menuName'].."</C>.")
end



-- Teleport into player Vehicle
function teleportIntoPlayerVehicle(target)
	local playerPed = GetPlayerPed(-1)

	-- Prevents false "false" returns by being far away from target.
	local x,y,z = table.unpack(GetEntityCoords(target['ped']))
	RequestCollisionAtCoord(x,y,z)


	if(not IsPedInAnyVehicle(target['ped'], false))then
		drawNotification("~b~<C>"..target['menuName'].."</C> ~s~n'est dans aucun véhicule.")
		return
	end

	local targetVeh = GetVehiclePedIsIn(target['ped'], false)

	if(targetVeh == GetVehiclePedIsIn(playerPed))then
		drawNotification("Vous êtes déjà dans le véhicule de ".."~b~<C>"..target['menuName'].."</C>.")
		return
	end

	if(GetVehicleDoorsLockedForPlayer(targetVeh, playerPed))then
		drawNotification("~b~Le véhicule de <C>"..target['menuName'].."'s</C> ~s~est verrouillé.")
		return
	end

	local seatNum = 0 + GetVehicleNumberOfPassengers(targetVeh)
	local passNum = GetVehicleMaxNumberOfPassengers(targetVeh)


	while (seatNum < passNum) do
		if(IsVehicleSeatFree(targetVeh, seatNum))then
			local playerPedID = PlayerPedId()
			ClearPedTasksImmediately(playerPedID)
			SetPedIntoVehicle(playerPed, targetVeh, seatNum)
			NetworkSetInSpectatorMode(false, target['ped'])
			break
		else
			seatNum = seatNum + 1
		end
	end

	if (seatNum >= passNum) then
		drawNotification("~b~Le véhicule de <C>"..target['menuName'].."</C> ~s~est plein.")
	    return
	end

	drawNotification("Téléporté dans le véhicule de ~b~<C>"..target['menuName'].."</C> ~s~.")
end



-- Relationship Toggles
function toggleRelationshipBlip(colorID, typeText, target)
	local blip = GetBlipFromEntity(target['ped']);
	SetBlipColour(blip, colorID)
	SetBlipNameToPlayerName(blip, target['menuName'])
	drawNotification("~b~<C>"..target['menuName'].."</C>~s~ marqué comme "..typeText)
end



RegisterNUICallback("otherplayer", function(data, cb)
	local playerPed = GetPlayerPed(-1) -- Yourself
	local targetServerID;             -- Target


	local allPlayers = getOnlinePlayersAndNames() --Active Users

	local action = data.action
	local newstate = data.newstate

	if action == "relationship" then
		targetServerID = tonumber(data.data[4])
	else
		targetServerID = tonumber(data.data[3])
	end

	local target = nil
	for _,value in pairs(allPlayers) do
		if(tostring(value.data.share) == tostring(targetServerID))then
			target = value
		end
	end

	if(target == nil)then
		-- drawNotification("Le joueur s'est ~r~<C>déconnecté</C>.")
		return
	end

	local text = "~r~OFF"
	if(newstate) then
		text = "~g~ON"
	end


	-- Relationships
	if action == "relationship" then
		local relationshipType = data.data[3]

		-- Friendly
		if(relationshipType == "friendly")then
			toggleRelationshipBlip(3, "ami",target)

		--Normal
		elseif(relationshipType == "normal")then
			toggleRelationshipBlip(0, "normal",target)

		--Hostile
		elseif(relationshipType == "hostile")then
			toggleRelationshipBlip(1, "hostile",target)
		end

	-- Teleport to the player.
	elseif action == "teleportto" then
		teleportToPlayer(target)

	-- Teleport inside their vehicle
	elseif action == "teleportinside" then
		teleportIntoPlayerVehicle(target)

	--Draw Route to player
	elseif action == "drawroute" then
		featureDrawRoute = newstate
		drawRouteTarget = target
		drawRoute(target)

	-- Spectate player.
	elseif action == "spectate" then
		featureSpectate = newstate
		spectatePlayer(target)
	end

	cb("ok")
end)




-- Return all player names to the trainer
RegisterNUICallback("getonlineplayers", function(data,cb)
	--Citizen.Trace("Get Online Players")
	local players = getOnlinePlayersAndNames()
	local playerCount = getTableLength(players)

	if(playerCount < 1)then
		drawNotification("~r~Aucun joueur dans la session.")
		return
	end


	local playerJSON = json.encode(players, {indent = true})
	--Citizen.Trace(playerJSON)

	SendNUIMessage({
		createonlineplayersmenu = true,
		menuName = "getonlineplayers",
		menudata = playerJSON
	})
end)


-- Update draw route every 2 seconds
Citizen.CreateThread(function()
	while true do
		Wait(2000)

		if(featureDrawRoute)then
			updateDrawRoute()
		end
	end
end)
