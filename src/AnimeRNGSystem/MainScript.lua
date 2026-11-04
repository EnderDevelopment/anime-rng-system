-- Anime RNG System Main Script

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Modules
local RarityModule = require(script.RarityModule)
local InventoryModule = require(script.InventoryModule)
local AnimationModule = require(script.AnimationModule)
local PitySystemModule = require(script.PitySystemModule)

-- Remote Events
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local RollEvent = RemoteEvents:WaitForChild("RollEvent")
local EquipEvent = RemoteEvents:WaitForChild("EquipEvent")

-- Player Data
local PlayerData = {}

-- Initialize Player Data
local function InitializePlayerData(player)
    PlayerData[player] = {
        Inventory = InventoryModule.New(),
        PityCounter = PitySystemModule.New()
    }
end

-- Roll Function
local function Roll(player)
    local rarity = RarityModule.GetRandomRarity(PlayerData[player].PityCounter)
    local character = RarityModule.GetRandomCharacter(rarity)
    InventoryModule.AddCharacter(PlayerData[player].Inventory, character)
    AnimationModule.PlayRollAnimation(player, character)
    PitySystemModule.IncrementPityCounter(PlayerData[player].PityCounter)
end

-- Equip Function
local function Equip(player, characterId)
    InventoryModule.EquipCharacter(PlayerData[player].Inventory, characterId)
end

-- Player Added
Players.PlayerAdded:Connect(function(player)
    InitializePlayerData(player)
    
    -- Roll Event
    RollEvent.OnServerEvent:Connect(function(player)
        Roll(player)
    end)
    
    -- Equip Event
    EquipEvent.OnServerEvent:Connect(function(player, characterId)
        Equip(player, characterId)
    end)
end)

-- Player Removing
Players.PlayerRemoving:Connect(function(player)
    PlayerData[player] = nil
end)