local callActive = false
local haveTarget = false
local isCall = false
local work
local target = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)




        -- Press Y key to get the call

        if IsControlJustPressed(1, 246) and callActive then
			if isCall == false then
				TriggerServerEvent("call:getCall", work)
				SendNotification("~w~Vous avez pris ~g~l'appel ~w~!")
				target.blip = AddBlipForCoord(target.pos.x, target.pos.y, target.pos.z)
				SetBlipRoute(target.blip, true)
				haveTarget = true
				isCall = true
				callActive = false
			else
				SendNotification("Vous avez ~r~déjà un appel~w~ en cours !")
			end
        -- Press L key to decline the call
        elseif IsControlJustPressed(1, 249) and callActive then
            SendNotification("Vous avez ~r~refusé~w~ l'appel.")
            callActive = false
        end
        if haveTarget then
            DrawMarker(1, target.pos.x, target.pos.y, target.pos.z-1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 250, 100, 100, 200, 0, 0, 0, 0)
            local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
            if Vdist(target.pos.x, target.pos.y, target.pos.z, playerPos.x, playerPos.y, playerPos.z) < 2.0 then
                RemoveBlip(target.blip)
                haveTarget = false
				isCall = false
            end
        end
    end
end)

RegisterNetEvent("call:cancelCall")
AddEventHandler("call:cancelCall", function()
	if haveTarget then
		RemoveBlip(target.blip)
        haveTarget = false
		isCall = false
	else
		TriggerEvent("itinerance:notif", "~r~Vous n'avez aucun appel en cours !")
	end
end)

RegisterNetEvent("call:callIncoming")
AddEventHandler("call:callIncoming", function(job, pos, msg)
    callActive = true
    work = job
    target.pos = pos
	if work == "police" then
		SendNotification("~b~APPEL EN COURS:~w~ " ..tostring(msg))
	elseif work == "tow" then
		SendNotification("~o~APPEL EN COURS:~w~ " ..tostring(msg))
	elseif work == "taxi" then
		SendNotification("~y~APPEL EN COURS:~w~ " ..tostring(msg))
    elseif work == "gouv" then
        SendNotification("~y~APPEL EN COURS:~w~ " ..tostring(msg))
	elseif work == "medic" then
		SendNotification("~r~APPEL EN COURS:~w~ " ..tostring(msg))
	end
end)

RegisterNetEvent("call:taken")
AddEventHandler("call:taken", function()
    callActive = false
    SendNotification("L'appel a été ~g~pris~w~.")
end)

RegisterNetEvent("target:call:taken")
AddEventHandler("target:call:taken", function(taken)
    if taken == 1 then
        SendNotification("Quelqu'un a pris votre ~g~appel~w~ !")
    elseif taken == 0 then
        SendNotification("Aucune personne n'est ~r~disponible~w~.")
    elseif taken == 2 then
        SendNotification("Veuillez rappeler dans ~y~quelques instants~w~.")
    end
end)

-- If player disconnect, remove him from the inService server table
AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", nil)
end)

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end


RegisterNetEvent("call:notify")
AddEventHandler("call:notify", function()
    SendNotification("Appuyez sur ~g~Y ~w~pour accepter ou ~r~N ~w~pour refuser !")

end)
