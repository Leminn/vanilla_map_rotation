local bossNum = 0
local currentBonus = 30

addHook("BossDeath",function(mobj) -- On boss death
    bossNum = mobj.info.doomednum -- Grab the boss number
    if bossNum == 209 then -- If the boss number is 209 (Brak/Final Boss)
        G_SetCustomExitVars(currentBonus) -- Set next level to the current selected bonus level
        currentBonus = currentBonus + 1 -- Sets to the next bonus level for when the players beat the current one.
        G_ExitLevel() -- Exit the level
    end
end)

addHook("MapLoad",function(mapnum) -- On map load
    if not(currentBonus == 30 or currentBonus > 42) then -- If this is a valid bonus level
        if currentBonus == 34 then -- If on MAP33 (will be added up to 34) then skip ahead to MAP40
            currentBonus = 40
        end
        G_SetCustomExitVars(currentBonus) -- Set next level to the current bonus level
        currentBonus = currentBonus + 1 
    elseif (currentBonus > 42) then -- If the player has finished all bonus levels
        currentBonus = 30 -- Reset bonus counter
        G_SetCustomExitVars(01) -- Take player back to level 1
    end
end)
