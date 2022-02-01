OpenMenuBarber = function()
    local main = RageUI.CreateMenu(("Menu %s"):format(eDBarber.NameMenu), "Shop "..eDBarber.NameMenu);
    main.EnableMouse = true
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    main:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        FreezeEntityPosition(PlayerPedId(), true)
        CreateFace()
        Citizen.Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Separator("↓ ~b~Bienvenue a la boutique ~s~↓")

            RageUI.List("Cheveux",  eDBarber.Barber.Liste.CheveuxListe, eDBarber.Barber.Liste.CheveuxIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.CheveuxIndex = Index
                    TriggerEvent("skinchanger:change", "hair_1", eDBarber.Barber.Liste.CheveuxIndex)
                end
            })

            RageUI.List("Barbe",eDBarber.Barber.Liste.BarbeListe, eDBarber.Barber.Liste.BarberIndex, nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.BarberIndex = Index
                    TriggerEvent("skinchanger:change", "beard_1", eDBarber.Barber.Liste.BarberIndex)
                end
            })

            RageUI.List("Sourcils",eDBarber.Barber.Liste.SourcilsListe, eDBarber.Barber.Liste.SourcilIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.SourcilIndex = Index
                    TriggerEvent("skinchanger:change", "eyebrows_1", eDBarber.Barber.Liste.SourcilIndex)
                end
            })

            RageUI.List("Lentilles",eDBarber.Barber.Liste.LentillesListe, eDBarber.Barber.Liste.LentillesIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.LentillesIndex = Index
                    TriggerEvent("skinchanger:change", "eye_color", eDBarber.Barber.Liste.LentillesIndex)
                end
            })

            RageUI.List("Maquillage ",MaquillageListe, eDBarber.Barber.Liste.MakeupIndex,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.MakeupIndex = Index
                     TriggerEvent("skinchanger:change", "makeup_1", eDBarber.Barber.Liste.MakeupIndex)
                end
            })

            RageUI.List("Rouge a levre",LipsListe, eDBarber.Barber.Liste.RougeLevre,nil,{},true,{
                onActive = function()
                    OnRenderCam()
                end,
                onListChange = function(Index, Item)
                    eDBarber.Barber.Liste.RougeLevre = Index
                     TriggerEvent("skinchanger:change", "lipstick_1", eDBarber.Barber.Liste.RougeLevre)
                end
            })

            RageUI.Button("Valider et payer : ~g~"..eDBarber.Barber.Price.."$" , false, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                onActive = function()
                    OnRenderCam()
                end,
                onSelected = function()
                    RageUI.CloseAll()
                    TriggerServerEvent("</eDen:Achat", eDBarber.Barber.Price)
                end
            })
       
        end,function()
            RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut,  eDBarber.Barber.CouleurCheveux.Primaire[1],  eDBarber.Barber.CouleurCheveux.Primaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurCheveux.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurCheveux.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "hair_color_1",  eDBarber.Barber.CouleurCheveux.Primaire[2])
                end
            }, 2)

            RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, eDBarber.Barber.CouleurCheveux.Secondaire[1], eDBarber.Barber.CouleurCheveux.Secondaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurCheveux.Secondaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurCheveux.Secondaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "hair_color_2", eDBarber.Barber.CouleurCheveux.Secondaire[2])
                end
            }, 2)

            RageUI.PercentagePanel(eDBarber.Barber.CouleurBarbes.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurBarbes.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'beard_2',Percentage*10)
                end
            }, 3) 

            RageUI.ColourPanel("Couleur de barbe", RageUI.PanelColour.HairCut, eDBarber.Barber.CouleurBarbes.Primaire[1],  eDBarber.Barber.CouleurBarbes.Primaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurBarbes.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurBarbes.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "beard_3",  eDBarber.Barber.CouleurBarbes.Primaire[2])
                end
            }, 3)

            RageUI.PercentagePanel(eDBarber.Barber.CouleurSourcil.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurSourcil.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'eyebrows_2',Percentage*10)
                end
            }, 4) 

            RageUI.ColourPanel("Couleur Primaire",RageUI.PanelColour.HairCut,eDBarber.Barber.CouleurSourcil.Primaire[1],eDBarber.Barber.CouleurSourcil.Primaire[2],{
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurSourcil.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurSourcil.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "eyebrows_3",  eDBarber.Barber.CouleurSourcil.Primaire[2])
                end
            },4)

            RageUI.PercentagePanel(eDBarber.Barber.CouleurMakeup.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurMakeup.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'makeup_2',Percentage*10)
                end
            }, 6) 

            RageUI.PercentagePanel(eDBarber.Barber.CouleurRougeLevre.OpaPercent, 'Opacité', '0%', '100%', {
                onProgressChange = function(Percentage)
                    eDBarber.Barber.CouleurRougeLevre.OpaPercent = Percentage
                    TriggerEvent('skinchanger:change', 'lipstick_2',Percentage*10)
                end
            }, 7) 

            RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut,  eDBarber.Barber.CouleurRougeLevre.Primaire[1],  eDBarber.Barber.CouleurRougeLevre.Primaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurRougeLevre.Primaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurRougeLevre.Primaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "lipstick_3",  eDBarber.Barber.CouleurRougeLevre.Primaire[2])
                end
            }, 7)

            RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, eDBarber.Barber.CouleurRougeLevre.Secondaire[1], eDBarber.Barber.CouleurRougeLevre.Secondaire[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    eDBarber.Barber.CouleurRougeLevre.Secondaire[1] = MinimumIndex
                    eDBarber.Barber.CouleurRougeLevre.Secondaire[2] = CurrentIndex
                    TriggerEvent("skinchanger:change", "lipstick_4", eDBarber.Barber.CouleurRougeLevre.Secondaire[2])
                end
            }, 7)
        main.Closed = function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
            FreezeEntityPosition(PlayerPedId(), false)
            RenderScriptCams(0, true, 2000)
            DestroyAllCams(true)
        end
    end)
        if not RageUI.Visible(main) then main = RMenu:DeleteType('main', true) end
    end
end




