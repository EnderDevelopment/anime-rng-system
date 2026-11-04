-- Rarity Module

local RarityModule = {}

-- Rarity Tiers
local RarityTiers = {
    Common = {Weight = 70, Characters = {"Character1", "Character2", "Character3"}},
    Uncommon = {Weight = 20, Characters = {"Character4", "Character5", "Character6"}},
    Rare = {Weight = 8, Characters = {"Character7", "Character8", "Character9"}},
    Epic = {Weight = 1.9, Characters = {"Character10", "Character11", "Character12"}},
    Legendary = {Weight = 0.1, Characters = {"Character13", "Character14", "Character15"}}
}

-- Get Random Rarity
function RarityModule.GetRandomRarity(pityCounter)
    local totalWeight = 0
    for _, tier in pairs(RarityTiers) do
        totalWeight = totalWeight + tier.Weight
    end
    
    local randomValue = math.random() * totalWeight
    local cumulativeWeight = 0
    
    for rarity, tier in pairs(RarityTiers) do
        cumulativeWeight = cumulativeWeight + tier.Weight
        if randomValue <= cumulativeWeight then
            return rarity
        end
    end
end

-- Get Random Character
function RarityModule.GetRandomCharacter(rarity)
    local characters = RarityTiers[rarity].Characters
    return characters[math.random(1, #characters)]
end

return RarityModule