ESX = nil

TriggerEvent(eDBarber.GetESX, function(obj) ESX = obj end)

RegisterNetEvent('</eDen:Achat')
AddEventHandler('</eDen:Achat', function(Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        print(Price)
        TriggerClientEvent('esx:showAdvancedNotification', _src,  "Barber", "Barber Shop", "Vous avez payez ~g~"..Price.."$", "CHAR_TOM", 1)
        TriggerClientEvent('</eDen:EnregisteSkin', _src)
	else 
    	TriggerClientEvent('esx:showAdvancedNotification', _src, "Barber", "Barber Shop", 'Vous n\'avez pas suffisament d\'argent !', "CHAR_TOM", 1)
    end
end)