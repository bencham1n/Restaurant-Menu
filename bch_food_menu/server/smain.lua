
lib.locale()
local found = false
RegisterServerEvent('bch:notifyJobOfOrder')
AddEventHandler('bch:notifyJobOfOrder', function(restaurantIndex, itemName, price)
    
    local src = source
    local xPlayerSrc = ESX.GetPlayerFromId(src)
    if not xPlayerSrc then return end

    
    local playerName = xPlayerSrc.get('firstName') or ""

    
    local rest = BCH.restaurants[restaurantIndex]
    if not rest then
        print(("DEBUG: BCH.restaurants[%s] neexistuje"):format(tostring(restaurantIndex)))
        return
    end

    local targetJob = rest.job
    
    
    for _, playerId in pairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))
        if xPlayer and xPlayer.job and xPlayer.job.name == targetJob then
            found = true

           
            
            local msg = string.format(
                "%s %s %s %s $%s %s %s",
                playerName,            -- napr. "John"
                locale("ordered"),     -- napr. "si objednal"
                itemName,              -- napr. "burger"
                locale("for"),         -- napr. "za"
                price,                 -- napr. "2000"
                locale("in"),          -- napr. "v"
                rest.name              -- napr. "Burger Shot"
            )


            local informationsmsg =  locale("succes")

            TriggerClientEvent('bch:showJobNotification', playerId, msg)
            TriggerClientEvent('bch:showJobNotification', playerId, informationsmsg)
        else
            
            if BCH.debug then
                print(string.format(
                    "%s %s %s %s $%s %s %s",
                    playerName,
                    locale("ordered"),
                    itemName,
                    locale("for"),
                    price,
                    locale("in"),
                    rest.name
                ))
            end

            
                local fallbackMsg = string.format(
            locale("no_job_online"),
            rest.name   
        )
        TriggerClientEvent('bch:showJobNotification', playerId, fallbackMsg)
        if BCH.debug then
            print("[DEBUG] Žiadny hráč s jobom " .. targetJob .. " online, posielam spätnú notifikáciu objednávateľovi: " .. fallbackMsg)
        end

            
        end
    end
end)
