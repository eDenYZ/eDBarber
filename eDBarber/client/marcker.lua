ESX = nil
local BarberShop = false

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent(eDBarber.GetESX, function(obj) ESX = obj end)
        Citizen.Wait(10)
        InitMarkerBarberShop()
    end
end)


InitMarkerBarberShop = function()
    BarberShopZone = true
    Citizen.CreateThread(function()
        for _, v in pairs(eDBarber.Barber.Position) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, 71)
        SetBlipScale(blip, 0.60)
        SetBlipColour(blip, 26)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Barber Shop")
        EndTextCommandSetBlipName(blip)
    end
        while BarberShopZone do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
            for _, v in pairs(eDBarber.Barber.Position) do
                local dst1 = GetDistanceBetweenCoords(playerPos, v.pos, true)
                    if dst1 < 4.0 then
                    InZone = true
                    DrawMarker(20, v.pos, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 0, 180, 0, 255, true, true, p19, true) 
                    if dst1 < 2.0 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour intéragir Menu Shop ~b~Barber")
                        if IsControlJustReleased(1, 38) then
                            OpenMenuBarber()
                        end
                    end
                end
            end
            if not InZone then
                Wait(500)
            else
            Wait(1)
        end
    end
    end)
    print("Le Barber Shop a Bien chargé !")
    print("By eDen and Aurezia")
end


