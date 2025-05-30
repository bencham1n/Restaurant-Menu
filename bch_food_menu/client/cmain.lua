


local spawnedProps = {}
lib.locale()

for i, rest in pairs(BCH.restaurants) do
    
    local model = `prop_drinkmenu`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local prop = CreateObject(model, rest.location.coords.x, rest.location.coords.y, rest.location.coords.z, false, true, true)
    SetEntityHeading(prop, rest.location.heading)
    FreezeEntityPosition(prop, true)
    SetEntityAsMissionEntity(prop, true, true)
    table.insert(spawnedProps, prop)

    
    exports.ox_target:addSphereZone({
        coords = rest.location.coords,
        radius = 2.0,
        name = "restaurant_zone_" .. i,
        debug = false,
        options = {
            {
                label = locale("open_menu"),
                icon = "fa-solid fa-utensils",
                name = "open_restaurant_" .. i,
                onSelect = function()
                    openRestaurantMenu(i)
                end
            }
        }
    })
end






local resTimeout = false
local resInterval = BCH.cooldown_time  


function openRestaurantMenu(index)
    local rest = BCH.restaurants[index]
    local options = {}

    for _, item in pairs(rest.food) do
        table.insert(options, {
            title = string.format("%s - $%s", item.item, item.price),
            description = item.description,
            image = "nui://ox_inventory/web/images/" .. item.item .. ".png",
            onSelect = function()
                
                if resTimeout then
                    local elapsed    = GetGameTimer() - BCH.cooldown_start
                    local remaining  = math.max(0, resInterval - elapsed)
                    local remainingSec = math.ceil(remaining / 1000)

                    
                    notify(
                        locale("cooldown_title"),                              
                        string.format(locale("cooldown"), remainingSec),       
                        5000,                                                   
                        "info"                                                  
                    )
                    return
                end

                
                resTimeout = true
                BCH.cooldown_start = GetGameTimer()

                SetTimeout(resInterval, function()
                    resTimeout = false
                end)

                
                
                if BCH.debug then
                    print("Objednal si si " .. item.item .. " za " .. item.price .. "$")
                end

                
                TriggerServerEvent('bch:notifyJobOfOrder', index, item.item, item.price)
            end
        })
    end

    
    lib.registerContext({
        id = 'restaurant_menu_' .. index,
        title = rest.name,
        options = options
    })

    lib.showContext('restaurant_menu_' .. index)
end






RegisterNetEvent('bch:showJobNotification', function(msg)
    if BCH.debug then
print(msg)
    end
notify (locale("notify_title"), msg, 3000, "success")
end)




function notify(title, message, time, type)
    if BCH.NotifyType == "ox" then
        lib.notify({
            title = title,
            description = message,
            duration = time,
            type = type
        })
    elseif BCH.NotifyType == "esx" then
        ESX.ShowNotification(title, message, type, time)
    elseif BCH.NotifyType == "okok" then
        exports['okokNotify']:Alert(title, message, time, type, true)
    elseif BCH.NotifyType == "custom" then
        print("custom") -- change this to custom
    end
end