# Restaurant-Menu

IF YOU NEED ANY HELP JOIN OUR DISCORD SERVER WE WILL HELP YOU
https://discord.gg/ppsYwSnN3R






Setting Up Your Restaurant Menus in FiveM
This document explains how to configure the restaurant menus for your FiveM server. It covers everything from basic settings to defining each restaurant's location and the delicious items they serve!

1. Core Settings
These are the fundamental options that apply to your entire restaurant system.

Notification Type (BCH.NotifyType = "ox")
This setting determines how players receive notifications when they interact with the menu (e.g., when an order is placed or completed).
"ox" means it's set up to work with the "ox_lib" notification system, a popular choice for FiveM servers.
Debug Mode (BCH.debug = true)
When set to true, debug messages will appear in your server console. This is incredibly helpful for troubleshooting and seeing what's happening behind the scenes if something isn't working as expected.
Recommendation: While developing, keep this true. Once your server is live and stable, change it to false to reduce console spam and improve performance.
Order Cooldown (BCH.cooldown_time = 60000)
This defines the minimum time (in milliseconds) a player must wait between placing orders.
The current value of 60000 means a 60-second cooldown. This prevents players from spamming orders and helps manage the flow of food preparation in your virtual city.
2. Defining Your Restaurants
The BCH.restaurants section is where you list every eatery in your city. Each restaurant is a separate block of information, detailing its name, associated job, location, and, of course, its menu!

Here's a breakdown of what each part means for each individual restaurant:

Example Restaurant Structure

{
    name = "Restaurant Name", -- What players see
    job = "job_name",          -- Required job to access this menu
    location = {
        coords = vector3(X, Y, Z), -- Where players stand to open the menu
        heading = H                -- Direction the player faces at the location
    },
    food = {
        -- List of food items
    }
}

2.1. Burger Shot
A classic fast-food joint known for its juicy burgers!

name = "Burger Shot": This is the name displayed to players.
job = "burgershot": Only players who have the job burgershot will be able to access and use this restaurant's menu.
location:
coords = vector3(47.6420, -1363.6177, 29.3456): These are the exact 3D coordinates (X, Y, Z) in the game world where players need to stand to interact with the Burger Shot menu.
heading = 180.0: This specifies the direction (in degrees) a player will face when they open the menu at this location.
food: This section lists all the items available for purchase at Burger Shot.
Item: Burger (item = "burger")
price = 2000: How much this item costs in your in-game currency.
description = "Šťavnatý hovädzí burger.": A short, enticing description of the burger. (You'll want to translate this to English: "A juicy beef burger.")
Item: Fries (item = "fries")
price = 1000: The cost of the fries.
description = "Chrumkavé hranolky.": A description of the fries. (You'll want to translate this to English: "Crispy fries.")
2.2. Pizza This
Your go-to spot for a fresh, hot pizza!

name = "Pizza This": The name of this pizza place.
job = "pizza": Only players with the pizza job can use this menu.
location:
coords = vector3(50.5762, -1372.1018, 29.3522): The 3D coordinates where the Pizza This menu can be accessed.
heading = 90.0: The direction a player will face at this location.
food: The menu items available at Pizza This.
Item: Pizza (item = "pizza")
price = 2500: The cost of the pizza.
description = "Čerstvo upečená pizza s mozzarellou.": A description of the pizza. (You'll want to translate this to English: "Freshly baked pizza with mozzarella.")
3. Adding New Restaurants (Example Structure)
To add more restaurants to your server, simply copy the structure of an existing restaurant block and fill in the details. The commented-out example below shows how you can add a new one:


--[[
{
    name = "Example Restaurant Name", -- The name displayed in-game
    job = "example_job",             -- The job required to use this menu (e.g., "chef", "cafe_worker")
    location = {
        coords = vector3(X, Y, Z),   -- The coordinates where the menu will open
        heading = H                  -- The direction the player faces at the menu location
    },
    food = {
        {
            item = "item_name_1",        -- The item's identifier (used in scripts)
            price = 1500,                -- The cost of this item
            description = "A tasty dish!"-- A description of the item for players
        },
        {
            item = "item_name_2",
            price = 500,
            description = "A refreshing drink."
        }
    }
},
--]]
