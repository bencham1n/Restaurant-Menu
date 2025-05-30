BCH = {}
BCH.NotifyType = "ox"
BCH.debug = true
BCH.cooldown_time = 60000  -- cooldown for example 60 seconds / cooldown na 60 sekund
BCH.restaurants = {
    {
        name = "Burger Shot",
        job = "burgershot",
        location = {
            coords = vector3(47.6420, -1363.6177, 29.3456),
            heading = 180.0
        },
        food = {
            {
                item = "burger",
                price = 2000,
                description = "Šťavnatý hovädzí burger."
            },
            {
                item = "fries",
                price = 1000,
                description = "Chrumkavé hranolky."
            }
        }
    },
    {
        name = "Pizza This",
        job = "pizza", 
        location = {
            coords = vector3(50.5762, -1372.1018, 29.3522),
            heading = 90.0
        },
        food = {
            {
                item = "pizza",
                price = 2500,
                description = "Čerstvo upečená pizza s mozzarellou."
            }
        }
    }
}

--    --{
       -- name = "Example",
       -- job = "Example",
      --  location = {
       --     coords = vector3(47.6420, -1363.6177, 29.3456),
     --       heading = 180.0
      --  },
     --   food = {
     --       {
     --           item = "Example",
     --           price = 2000,
    --            description = "Example."
      --      },
     --       {
      --          item = "fries",
    --            price = 1000,
    --            description = "Example."
    --        }
  --      }
 --   },