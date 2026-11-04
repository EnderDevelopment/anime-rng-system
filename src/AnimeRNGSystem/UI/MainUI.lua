-- Main UI Script

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remote Events
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local RollEvent = RemoteEvents:WaitForChild("RollEvent")
local EquipEvent = RemoteEvents:WaitForChild("EquipEvent")

-- Player GUI
local function CreatePlayerGUI(player)
    local playerGui = Instance.new("ScreenGui")
    playerGui.Name = "AnimeRNGSystemGUI"
    playerGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = playerGui
    
    -- Roll Button
    local rollButton = Instance.new("TextButton")
    rollButton.Name = "RollButton"
    rollButton.Size = UDim2.new(0, 100, 0, 50)
    rollButton.Position = UDim2.new(0.5, -50, 0.5, -25)
    rollButton.Text = "Roll"
    rollButton.Parent = mainFrame
    
    -- Equip Button
    local equipButton = Instance.new("TextButton")
    equipButton.Name = "EquipButton"
    equipButton.Size = UDim2.new(0, 100, 0, 50)
    equipButton.Position = UDim2.new(0.5, -50, 0.5, 30)
    equipButton.Text = "Equip"
    equipButton.Parent = mainFrame
    
    -- Roll Button Event
    rollButton.MouseButton1Click:Connect(function()
        RollEvent:FireServer()
    end)
    
    -- Equip Button Event
    equipButton.MouseButton1Click:Connect(function()
        EquipEvent:FireServer("Character1") -- Replace with actual character ID
    end)
end

-- Player Added
Players.PlayerAdded:Connect(function(player)
    CreatePlayerGUI(player)
end)