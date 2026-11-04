-- Inventory Module

local InventoryModule = {}

-- New Inventory
function InventoryModule.New()
    return {
        Characters = {},
        EquippedCharacter = nil
    }
end

-- Add Character
function InventoryModule.AddCharacter(inventory, character)
    table.insert(inventory.Characters, character)
end

-- Equip Character
function InventoryModule.EquipCharacter(inventory, characterId)
    inventory.EquippedCharacter = characterId
end

return InventoryModule