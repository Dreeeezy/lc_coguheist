
isCop = false
local streetName
local _

Citizen.CreateThread(function()
	CreateTruckRobberyMapBlip()
end)

RegisterNetEvent('lc_coguheist:ShowNotifyESX')
AddEventHandler('lc_coguheist:ShowNotifyESX', function(msg)
	ShowNotify(msg)
end)

function ShowNotify(msg)
	TriggerEvent('Notify','aviso',msg,5000)
end

function NotifyPoliceFunction()
	TriggerServerEvent('lc_coguheist:PoliceNotifySV', GetEntityCoords(GetPlayerPed(-1)), streetName)
end

RegisterNetEvent('lc_coguheist:PoliceNotifyCL')
AddEventHandler('lc_coguheist:PoliceNotifyCL', function(alert)
	if isCop then
		TriggerEvent('chat:addMessage', { args = {(Lang['dispatch_name']).. alert}})
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		streetName,_ = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

RegisterNetEvent('lc_coguheist:PoliceNotifyBlip')
AddEventHandler('lc_coguheist:PoliceNotifyBlip', function(targetCoords)
	local cfg = Config.TruckRobbery.police
	if isCop and cfg.blip.show then 
		local alpha = cfg.blip.alpha
		local alertBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, cfg.blip.radius)

		SetBlipHighDetail(alertBlip, true)
		SetBlipColour(alertBlip, cfg.blip.color)
		SetBlipAlpha(alertBlip, alpha)
		SetBlipAsShortRange(alertBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(cfg.blip.time * 4)
			alpha = alpha - 1
			SetBlipAlpha(alertBlip, alpha)

			if alpha == 0 then
				RemoveBlip(alertBlip)
				return
			end
		end
	end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

function DrawMissionText(text)
    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.5,0.955)
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
end

function LoadModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end