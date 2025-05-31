🍽️ Restaurant Menu System for FiveM
Welcome to the Restaurant Menu system! This guide will walk you through setting up and configuring dynamic restaurant menus for your FiveM server, from core settings to defining unique eateries and their delicious offerings.

🆘 Need Assistance?
If you encounter any issues or have questions, join our Discord server for help:
👉 https://discord.gg/ppsYwSnN3R

⚙️ Configuration Guide
This section details how to configure your Restaurant-Menu script.

1. Core Settings
These foundational settings apply across your entire restaurant system.

Notification Type (BCH.NotifyType = "ox")

This setting dictates how players receive in-game notifications related to menu interactions (e.g., order placed, order completed).
"ox": Configured to work seamlessly with the ox_lib notification system, a widely used library in FiveM.
Debug Mode (BCH.debug = true)

When set to true, detailed debug messages will appear in your server console. This is invaluable for troubleshooting and monitoring script behavior.
Recommendation: Keep this true during development. Once your server is stable and live, change it to false to minimize console spam and optimize performance.
Order Cooldown (BCH.cooldown_time = 60000)

This defines the minimum time (in milliseconds) a player must wait between placing orders.
The default value of 60000 sets a 60-second cooldown, preventing order spam and helping manage the virtual kitchen's workflow.
2. Defining Your Restaurants
The BCH.restaurants section is where you bring your virtual eateries to life! Each restaurant is defined by a block of information, specifying its name, required job, physical location, and, of course, its tempting menu items.

Here’s a breakdown of the structure for each individual restaurant:

{
    name = "Restaurant Name",       -- What players will see in-game
    job = "job_name",               -- The specific job role required to access this menu
    location = {
        coords = vector3(X, Y, Z),  -- The exact 3D coordinates where players interact with the menu
        heading = H                 -- The direction the player faces when opening the menu
    },
    food = {
        -- List of food items available at this restaurant
    }
}


2.1. Burger Shot
A classic fast-food joint, renowned for its juicy burgers and crispy fries!

name = "Burger Shot": The display name for this restaurant.
job = "burgershot": Only players with the burgershot job can access and use this menu.
location:
coords = vector3(47.6420, -1363.6177, 29.3456): The precise in-game 3D coordinates where players must stand to interact with the Burger Shot menu.
heading = 180.0: The direction (in degrees) a player will face when they open the menu at this spot.
food: The delicious items available for purchase:
Burger (item = "burger")
price = 2000: Cost in your in-game currency.
description = "A juicy beef burger."
Fries (item = "fries")
price = 1000: Cost of the fries.
description = "Crispy fries."
2.2. Pizza This
Your go-to spot for a fresh, hot pizza!

name = "Pizza This": The display name for this pizza parlor.
job = "pizza": Only players with the pizza job can use this menu.
location:
coords = vector3(50.5762, -1372.1018, 29.3522): The 3D coordinates where the Pizza This menu can be accessed.
heading = 90.0: The direction a player will face at this location.
food: The delectable menu items available:
Pizza (item = "pizza")
price = 2500: Cost of the pizza.
description = "Freshly baked pizza with mozzarella."
3. Adding New Restaurants
To expand your culinary empire, simply copy the example structure below and populate it with details for your new restaurant.

--[[
{
    name = "Example Restaurant Name",    -- The name displayed in-game (e.g., "Sushi Bar", "Coffee Shop")
    job = "example_job",                 -- The job required to use this menu (e.g., "chef", "barista")
    location = {
        coords = vector3(X, Y, Z),       -- The coordinates where the menu will open
        heading = H                      -- The direction the player faces at the menu location
    },
    food = {
        {
            item = "item_name_1",        -- The item's identifier (used by other scripts)
            price = 1500,                -- The cost of this item
            description = "A tasty dish!" -- A player-facing description of the item
        },
        {
            item = "item_name_2",
            price = 500,
            description = "A refreshing drink."
        }
    }
},
--]]
