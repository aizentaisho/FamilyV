-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.
-- DO NOT TOUCHY, CONTACT Michael G/TheStonedTurtle if anything is broken.




RegisterNUICallback("player", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local action = data.action
	local newstate = data.newstate

	local text = "~r~OFF"
	if(newstate) then
		text = "~g~ON"
	end


	-- Heal Player
	if action == "heal" then
		SetEntityHealth(playerPed, 200)
		ClearPedBloodDamage(playerPed)
		ClearPedWetness(playerPed)

		if(featureKeepWet)then -- Keep Wet Check.
			SetPedWetnessHeight(playerPed, 2.0)
		end
		drawNotification("~g~Propre et guéri.")

	-- Body Armor
	elseif action == "armor" then
		SetPedArmour(playerPed, 100)
		drawNotification("~g~Armure ajoutée.")

	-- Suicide
	elseif action == "suicide" then
		SetEntityHealth(playerPed, 0)
		drawNotification("~r~Vous vous êtes suicidé.")

	-- God Mode/Invincibility
	elseif action == "god" then
		featurePlayerInvincible = newstate
		drawNotification("Invincibilité : "..tostring(text))

		featurePlayerInvincibleUpdated = true;

	-- Infinite Stamina
	elseif action == "stamina" then
		featurePlayerInfiniteStamina = newstate
		drawNotification("Endurance illimitée : "..tostring(text))

	-- Drunk Mode
	elseif action == "drunk" then
		featurePlayerDrunk = newstate
		drawNotification("Bourré : "..tostring(text))

		featurePlayerDrunkUpdated = true;


	-- Invsibility Toggle
	elseif action == "invisible" then
		featurePlayerInvisible = newstate
		drawNotification("Invisibilité : "..tostring(text))

		featurePlayerInvisibleUpdated = true;


	-- Silent Mode
	elseif action == "silent" then
		featurePlayerNoNoise = newstate
		drawNotification("Silencieux : "..tostring(text))

		featurePlayerNoNoiseUpdated = true;


	-- Everyone Ignores you
	elseif action == "everyone" then
		featurePlayerIgnoredByAll = newstate
		drawNotification("Tout le monde vous ignore : "..tostring(text))

		featurePlayerIgnoredByAllUpdated = true;


	-- Police Ignore You
	elseif action == "police" then
		featurePlayerIgnoredByPolice = newstate
		drawNotification("La police vous ignore : "..tostring(text))

		featurePlayerIgnoredByPoliceUpdated = true;


	-- Never Wanted
	elseif action == "wanted" then
		featurePlayerNeverWanted = newstate
		drawNotification("Jamais recherché : "..tostring(text))

		featurePlayerNeverWantedUpdated = true;

	elseif action == "keepwet" then
		featureKeepWet = newstate
		featureKeepWetUpdated = true;
		drawNotification("Rester mouillé : "..tostring(text))

	elseif action == "fastswim" then
		featurePlayerFastSwim = newstate
		featurePlayerFastSwimUpdated = true;
		drawNotification("Nage rapide : "..tostring(text))

	elseif action == "fastrun" then
		featurePlayerFastRun = newstate
		featurePlayerFastRunUpdated = true;
		drawNotification("Course rapide : "..tostring(text))

	elseif action == "superjump" then
		featurePlayerSuperJump = newstate

		drawNotification("Super saut : "..tostring(text))

	elseif action == "noragdoll" then
		featureNoRagDoll = newstate
		featureNoRagDollUpdated = true
		drawNotification("Pas de Ragdoll : "..tostring(text))

	elseif action == "nightvision" then
		featureNightVision = newstate
		featureNightVisionUpdated = true;
		drawNotification("Vision nocturne : "..tostring(text))

	elseif action == "thermalvision" then
		featureThermalVision = newstate
		featureThermalVisionUpdated = true;
		drawNotification("Vision thermique : "..tostring(text))

	elseif action == "radiooff" then
		featureRadioAlwaysOff = newstate
		featureRadioAlwaysOffUpdated = true;
		drawNotification("Radio toujours éteinte : "..tostring(text))

	elseif action == "keepclean" then
		featureKeepClean = newstate
		drawNotification("Rester propre : "..tostring(text))
	end

	if(cb)then cb("ok") end
end)



Citizen.CreateThread(function()
	while true do
		Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerID = PlayerId()
		if playerPed then


			-- Keep Wet
			if(featureKeepWet and featureKeepWetUpdated) then
				SetPedWetnessHeight(playerPed, 2.0)
				featureKeepWetUpdated = false;
			end


			-- Silent (NOT WORKING?)
			if(featurePlayerNoNoiseUpdated)then
				if(featurePlayerNoNoise)then
					SetPlayerNoiseMultiplier(playerID, 0.0)
				else
					SetPlayerNoiseMultiplier(playerID, 1.0)
				end
				featurePlayerNoNoiseUpdated = false
			end


			-- Fast Swim
			if(featurePlayerFastSwimUpdated)then
				if(featurePlayerFastSwim)then
					SetSwimMultiplierForPlayer(playerID, 1.49)
				else
					SetSwimMultiplierForPlayer(playerID, 1.0)
				end
				featurePlayerFastSwimUpdated = false
			end


			-- Fast Run
			if(featurePlayerFastRunUpdated)then
				if(featurePlayerFastRun)then
					SetRunSprintMultiplierForPlayer(playerID, 1.49)
				else
					SetRunSprintMultiplierForPlayer(playerID, 1.0)
				end
				featurePlayerFastRunUpdated = false
			end


			-- Super Jump
			if (featurePlayerSuperJump)then
				SetSuperJumpThisFrame(playerID)
			end


			-- No Ragdoll
			if ( featureNoRagDoll ) then
				SetPedCanRagdoll( playerPed, false )
			else
				SetPedCanRagdoll( playerPed, true )
			end


			-- Night Vision
			if(featureNightVisionUpdated)then
				SetNightvision(featureNightVision)

				featureNightVisionUpdated = false
			end


			-- Thermal Vision
			if (featureThermalVisionUpdated)then
				SetSeethrough(featureThermalVision)

				featureThermalVisionUpdated = false
			end


			-- Radio Off
			if (featureRadioAlwaysOffUpdated)then
				if(IsPedInAnyVehicle(playerPed, false))then
					SetVehicleRadioEnabled(GetVehiclePedIsUsing(playerPed), not featureRadioAlwaysOff)
				end
				SetUserRadioControlEnabled(not featureRadioAlwaysOff)
			end


			-- Godmode
			if(featurePlayerInvincibleUpdated) then
				SetEntityInvincible(playerPed, featurePlayerInvincible)
				featurePlayerInvincibleUpdated = false;
			end


			-- Stamina
			if featurePlayerInfiniteStamina then
				RestorePlayerStamina(playerID, 1.0)
			end


			-- Keep Clean
			if featureKeepClean then
				ClearPedBloodDamage(playerPed)
			end


			-- Drunk
			if ( featurePlayerDrunkUpdated ) then
				SetPedIsDrunk( playerPed, drunk )

				if ( featurePlayerDrunk ) then
					_LoadClipSet( "move_m@drunk@verydrunk" )

					SetPedMovementClipset( playerPed, "move_m@drunk@verydrunk", 1.0 )
					ShakeGameplayCam( "DRUNK_SHAKE", 1.0 )
				else
					ResetPedMovementClipset( playerPed, 1.0 )
					StopGameplayCamShaking( true )
					RemoveClipSet( "move_m@drunk@verydrunk" )
				end

				featurePlayerDrunkUpdated = false;
			end


			-- Invisibility
			if(featurePlayerInvisibleUpdated)then
				if featurePlayerInvisible then
					SetEntityVisible(playerPed, false, 0)
				else
					SetEntityVisible(playerPed, true, 0)
				end
				featurePlayerInvisibleUpdated = false;
			end


			-- Everyone Ignores Me
			SetEveryoneIgnorePlayer(PlayerID, featurePlayerIgnoredByAll)
			if(featurePlayerIgnoredByAll) then
				SuppressShockingEventsNextFrame()
			end


			-- Police Ignore Me & Don't Dispatch
			SetPoliceIgnorePlayer(PlayerID, featurePlayerIgnoredByPolice)
			if(featurePlayerIgnoredByPolice) then
				SetDispatchCopsForPlayer(playerID, false)
			else
				SetDispatchCopsForPlayer(playerID, true)
			end


			-- Never Wanted & clears wanted level.
			if(featurePlayerNeverWanted) then
				if(GetPlayerWantedLevel(PlayerID) > 0) then
					ClearPlayerWantedLevel(PlayerID)
				end
				SetMaxWantedLevel(0)
			else
				SetMaxWantedLevel(5)
			end

		end
	end
end)
