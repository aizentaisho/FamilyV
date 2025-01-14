-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.


-- Update voice feature variables
function updateVoiceDistanceVariables(distance)
	featureVPTooClose = false
	featureVPVeryClose = false
	featureVPClose = false
	featureVPNearby = false
	featureVPDistant = false
	featureVPFar = false
	featureVPVeryFar = false
	featureVPAllPlayers = false
	if(distance == 0)then
		featureVPAllPlayers = true;
	elseif(distance == 5)then
		featureVPTooClose = true
	elseif(distance == 25)then
		featureVPVeryClose = true
	elseif(distance == 75)then
		featureVPClose = true
	elseif(distance == 200)then
		featureVPNearby = true
	elseif(distance == 500)then
		featureVPDistant = true
	elseif(distance == 2500)then
		featureVPFar = true
	elseif(distance == 8000)then
		featureVPVeryFar = true
	end
end



RegisterNUICallback("voiceopts", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local action = data.action
	local state = data.newstate
	local request = data.data[3]
	local text,text2

	if(state) then
		text = "~g~ON"
		text2 = "~r~OFF"
	else
		text = "~r~OFF"
		text2 = "~g~ON"
	end

	if(action=="channel")then
		if(request == "0" or request == 0)then
			NetworkClearVoiceChannel()
			drawNotification("Canal vocal réinitialisé")
		else
			NetworkSetVoiceChannel(tonumber(request))
			drawNotification("Maintenant dans le canal vocal : "..request)
		end
	elseif(action=="distance")then
		local distance = tonumber(request) + 0.00

		NetworkSetTalkerProximity(distance)
		updateVoiceDistanceVariables(distance)
		if(distance > 0)then
			drawNotification("Distance de la voix : "..distance.." mètres")
		else
			drawNotification("Distance de la voix : Tous les joueurs")
		end
	elseif(action=="voicetoggle")then
		featureVoiceChat = state
		NetworkSetVoiceActive(state)
		drawNotification("Chat vocal : "..text)


	elseif(action=="showtoggle")then
		featureShowVoiceChatSpeaker = state
		if(not state)then
			SendNUIMessage({hidevoice=true})
		end
		drawNotification("Overlay d'orateurs : "..text)

	end

	if(cb)then cb("ok") end
end)


-- Update voice names
Citizen.CreateThread(function()
	local me = PlayerId(-1)
	while true do
		Citizen.Wait(0)

		if(featureShowVoiceChatSpeaker)then
			local names = {}
			local nameCount = 0

			for i=0, maxPlayers, 1 do
	    		if(NetworkIsPlayerConnected(i)) then
					if(NetworkIsPlayerTalking(i))then
						table.insert(names, GetPlayerName(i))
						nameCount = nameCount + 1
					end
				end
			end

			if(nameCount > 0)then
				local results = json.encode(names, {indent=true})

				SendNUIMessage({
					showvoice = true,
					talkingplayers = results
				})
			else
				SendNUIMessage({
					hidevoice = true
				})
			end
		end

	end
end)
