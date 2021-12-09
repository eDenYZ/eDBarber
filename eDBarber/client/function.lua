MaquillageListe = {"Aucun"}
for i = 1, 71, 1 do
    table.insert(MaquillageListe, GetLabelText("CC_MKUP_" .. i - 1))
end

LipsListe = {"Aucun"}
for i = 1, 10, 1 do
    table.insert(LipsListe, GetLabelText("CC_LIPSTICK_" .. i - 1))
end

RegisterNetEvent('</eDen:EnregisteSkin')
AddEventHandler('</eDen:EnregisteSkin', function()
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)

nosave = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(0, true, 2000)
    DestroyAllCams(true)
end

CreateFace = function()
    local coords = GetEntityCoords(PlayerPedId())
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, coords.x+2.0, coords.y+1.25, coords.z+0.5)
    SetCamFov(cam, 30.0)
    PointCamAtCoord(cam, coords.x, coords.y, coords.z+0.5)
    SetCamShakeAmplitude(cam, 13.0)
    RenderScriptCams(1, 1, 1500, 1, 1)
end

ControlDisable = {20, 24, 27, 178, 177, 189, 190, 187, 188, 202, 239, 240, 201, 172, 173, 174, 175}
OnRenderCam = function()
    DisableAllControlActions(0)
    for k, v in pairs(ControlDisable) do
        EnableControlAction(0, v, true)
    end
    local Control1, Control2 = IsDisabledControlPressed(1, 44), IsDisabledControlPressed(1, 51)
    if Control1 or Control2 then
        local pPed = PlayerPedId()
        SetEntityHeading(pPed, Control1 and GetEntityHeading(pPed) - 2.0 or Control2 and GetEntityHeading(pPed) + 2.0)

        for k, v in pairs(GetActivePlayers()) do 
            if v ~= GetPlayerIndex() then 
                NetworkConcealPlayer(v, true, true) 
            end 
        end
    end
end
