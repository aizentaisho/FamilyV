local listOn = false
local isadmin = nil




RegisterNetEvent('overhead:client_checkadmin')
AddEventHandler('overhead:client_checkadmin', function(adminlevel)
    isadmin  = tostring(adminlevel)
end)

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end


Citizen.CreateThread(function()
    listOn = false
    while true do
        Wait(0)

        if IsControlPressed(0, 20)--[[ INPUT_PHONE ]] then
            if not listOn then
                local players = {}
                ptable = GetPlayers()
                for _, i in ipairs(ptable) do
                    local wantedLevel = GetPlayerWantedLevel(i)
                    r, g, b = GetPlayerRgbColour(i)
                    if(isadmin=="superadmin")then
                        table.insert(players, 
                    '<tr style=\"color: rgb(' .. r .. ', ' .. g .. ', ' .. b .. ')\"><td>' .. GetPlayerServerId(i) .. '</td><td>'.. GetPlayerName(i) ..'</td></tr>'
                    )
                    
                    else
                        table.insert(players, 
                    '<tr style=\"color: rgb(' .. r .. ', ' .. g .. ', ' .. b .. ')\"><td>' .. GetPlayerServerId(i) .. '</td><td>********************</td></tr>'
                    )

                    end

                end
                
                SendNUIMessage({ text = table.concat(players) })

                listOn = true
                while listOn do
                    Wait(0)
                    if(IsControlPressed(0, 20) == false) then
                        listOn = false
                        SendNUIMessage({
                            meta = 'close'
                        })
                        break
                    end
                end
            end
        end
    end
end)

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end



AddEventHandler("playerSpawned", function()
    TriggerServerEvent("overhead:checkadmin_s")
    drawNotification(isadmin)
end)