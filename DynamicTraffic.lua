CreateThread(
    function()
        while true do
            Wait(0)
            
            local playerPed = GetPlayerPed(-1)
            local playerId = PlayerId()
            
            --[[ DISABLE VEHICLE GENERATORS IN PLAYER AREA ]]
            
            local DensityMultiplier = 1.0
            local hour = GetClockHours()
            if (hour >= 00 and hour <= 01) then
            DensityMultiplier = 0.1
            elseif (hour >= 01 and hour <= 02) then
            DensityMultiplier = 0.1
            elseif (hour >= 02 and hour <= 03) then
            DensityMultiplier = 0.1
            elseif (hour >= 03 and hour <= 04) then
            DensityMultiplier = 0.1
            elseif (hour >= 04 and hour <= 05) then
            DensityMultiplier = 0.2
            elseif (hour >= 05 and hour <= 06) then
            DensityMultiplier = 0.3
            elseif (hour >= 06 and hour <= 07) then
            DensityMultiplier = 0.5
            elseif (hour >= 07 and hour <= 10) then
            DensityMultiplier = 1.0
            elseif (hour >= 10 and hour <= 11) then
            DensityMultiplier = 0.5
            elseif (hour >= 11 and hour <= 12) then
            DensityMultiplier = 0.5
            elseif (hour >= 12 and hour <= 14) then
            DensityMultiplier = 0.7
            elseif (hour >= 14 and hour <= 15) then
            DensityMultiplier = 0.5
            elseif (hour >= 15 and hour <= 16) then
            DensityMultiplier = 0.5
            elseif (hour >= 15 and hour <= 16) then
            DensityMultiplier = 0.7
            elseif (hour >= 16 and hour <= 19) then
            DensityMultiplier = 1.0
            elseif (hour >= 19 and hour <= 21) then
            DensityMultiplier = 0.5
        elseif (hour >= 21 and hour <= 00) then
            DensityMultiplier = 0.3
            end

            --[[ DISABLE VEHICLE GENERATORS IN PLAYER AREA ]]
            local pos = GetEntityCoords(playerPed)
            RemoveVehiclesFromGeneratorsInArea(
                pos['x'] - 500.0,
                pos['y'] - 500.0,
                pos['z'] - 500.0,
                pos['x'] + 500.0,
                pos['y'] + 500.0,
                pos['z'] + 500.0
            )

            --[[ POLICE DISPATCH SPAWNS OFF ]]
            for i = 1, 12 do
                EnableDispatchService(i, false)
            end
            SetPlayerWantedLevel(playerId, 0, false)
            SetPlayerWantedLevelNow(playerId, false)
            SetPlayerWantedLevelNoDrop(playerId, 0, false)

            
            -- [[ SET THE DENSITY OF AI]]
            SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
            SetPedDensityMultiplierThisFrame(DensityMultiplier)
            SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
            SetParkedVehicleDensityMultiplierThisFrame(0)
            SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
            
            --[[ POLICE IGNORE PLAYER ]]
            SetPoliceIgnorePlayer(playerPed, true)
            SetDispatchCopsForPlayer(playerPed, false)
            
        end
    end
)

