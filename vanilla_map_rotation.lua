local bossNum = 0
local currentBonus = 30

addHook("BossDeath",function(mobj)
    bossNum = mobj.info.doomednum
    if bossNum == 209 then
        G_SetCustomExitVars(currentBonus)
        currentBonus = currentBonus + 1
        G_ExitLevel()
    end
end)
-- lua comment
addHook("MapLoad",function(mapnum)
    if not(currentBonus == 30 or currentBonus > 42) then
        if currentBonus == 34 then
            currentBonus = 40
        end
        G_SetCustomExitVars(currentBonus)
        currentBonus = currentBonus + 1
    elseif (currentBonus > 42) then
        currentBonus = 30
        G_SetCustomExitVars(01)
    end
end)
