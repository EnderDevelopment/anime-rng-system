-- Pity System Module

local PitySystemModule = {}

-- New Pity Counter
function PitySystemModule.New()
    return {
        Counter = 0,
        PityThreshold = 50
    }
end

-- Increment Pity Counter
function PitySystemModule.IncrementPityCounter(pityCounter)
    pityCounter.Counter = pityCounter.Counter + 1
    if pityCounter.Counter >= pityCounter.PityThreshold then
        pityCounter.Counter = 0
    end
end

return PitySystemModule