local WhiteList = {}

 local notwhitelisted = "Vous devez être whitelisté pour rejoindre le serveur, rejoignez discord.gg/HY6D2UZ"
 local steamiderr = "Erreur: Impossible de récupérer votre Steam ID"
 local trouve = false

 AddEventHandler("playerConnecting", function(playerName, setKickReason)

    local steamID = GetPlayerIdentifiers(source)[1] or false
     print("Whitelist: "..playerName.."["..steamID.."] tente de se connecter.")

       if not steamID then
        setKickReason(steamiderr)
        CancelEvent()

        print("Whitelist: "..playerName.." a ete kick, aucun Steam ID.")
       end

       local result = MySQL.Sync.fetchAll('SELECT * FROM whitelist')

        for i=1, #result, 1 do
            local id   = result[i].identifier

            table.insert(WhiteList, tostring(id))
            --print ("Trouve dans la BDD : " ..id)
            --print ("Tente de se connecter : "..steamID)
        end

      for i=1, #WhiteList, 1 do
       --print(tostring(WhiteList[i]))
       --print(tostring(steamID))

          if(tostring(WhiteList[i]) == tostring(steamID))then
              trouve = true
         end
      end

      --print(trouve)
      if(trouve)then
           print("Whitelist: "..playerName.."["..steamID.."]  a rejoint le serveur.")
           trouve = false
           WhiteList = {}

      else
        setKickReason(notwhitelisted)
        CancelEvent()

        print("Whitelist: "..playerName.."["..steamID.."] a ete kick, non whitelist.")
        trouve = false
        WhiteList = {}
        return
     end
end)
