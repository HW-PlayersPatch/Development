function Update_Hgn_DefenseFieldFrigate(CustomGroup, playerIndex, shipID)
    SobGroup_NoSalvageScuttle(CustomGroup, playerIndex, shipID);
    DefenseFieldFrigate_Glow(CustomGroup, playerIndex, shipID);

    if (SobGroup_IsDoingAbility(CustomGroup, AB_DefenseField) == 1) then
        SobGroup_SetMaxSpeedMultiplier(CustomGroup, 0.7);
    else
        SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1);
    end
end
