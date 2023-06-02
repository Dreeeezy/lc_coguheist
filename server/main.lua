local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
vRPclient = Tunnel.getInterface("vRP")

Dz = {}
Tunnel.bindInterface("lc_coguheist", Dz)

local jobCooldown = {} 

RegisterServerEvent('lc_coguheist:jobCooldown')
AddEventHandler('lc_coguheist:jobCooldown',function(source)
	local user_id = vRP.getUserId(source)
	table.insert(jobCooldown,{cooldown = user_id, time = (Config.TruckRobbery.cooldown * 60000)}) 
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(jobCooldown) do
			if v.time <= 0 then
				RemoveCooldownTimer(v.cooldown)
			else
				v.time = v.time - 1000
			end
		end
	end
end)

 
function Dz.checkPoliceCount()
    local source = source
    local user_id = vRP.getUserId(source)
    local cops = vRP.getUsersByPermission('Police')
	return #cops or 0
end

function Dz.GetCooldownTimer()
	local source = source
	local user_id = vRP.getUserId(source)
	if not CheckCooldownTimer(user_id) then
		return nil
	else
		return GetCooldownTimer(user_id)
	end
end


function Dz.getJobFees()
	local source = source
	local user_id = vRP.getUserId(source)
	local money = 0
	if Config.TruckRobbery.computer.fees.bankMoney then 
		money = vRP.getBankMoney(user_id)
	else
		money = vRP.getMoney(user_id)
	end
	if money >= Config.TruckRobbery.computer.fees.amount then
        return true
    else
        return false
    end
end


RegisterServerEvent('policeAlert')
AddEventHandler('policeAlert', function(coords)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local policia = vRP.getUsersByPermission('Police')
        if #policia > 0 then
            for k,v in pairs(policia) do
                local nsource = vRP.getUserSource(parseInt(v))
                if nsource then
                    async(function()
                        async(function()
                            vRPclient._playSound(nsource,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
                            TriggerClientEvent("AdicionarCDS:truck",nsource,coords.x,coords.y,coords.z)
						end)
                    end)
                end
            end
        end
    end
end)

RegisterServerEvent('lc_coguheist:startJobSV')
AddEventHandler('lc_coguheist:startJobSV', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local taskResult = exports['c2n_taskbar']:getTaskBar(source,"medio","Van")
	TriggerEvent('lc_coguheist:jobCooldown', source)
	if Config.TruckRobbery.computer.fees.bankMoney and taskResult then  
		vRP.tryFullPayment(user_id,Config.TruckRobbery.computer.fees.amount)
	else
		vRP.tryPayment(user_id,Config.TruckRobbery.computer.fees.amount)
	end
	TriggerClientEvent('lc_coguheist:startJobCL', source)
end)

RegisterServerEvent('lc_coguheist:jobReward')
AddEventHandler('lc_coguheist:jobReward',function()
	local source = source
	local cfg = Config.TruckRobbery.reward
	local user_id = vRP.getUserId(source)
	local reward = math.random(cfg.money.min, cfg.money.max)
	
	if cfg.money.dirty then 
		vRP.giveInventoryItem(vRP.getUserId(source),'dollars2', tonumber(reward))
	else
		--vRP.giveMoney(user_id,reward)
	end
	TriggerClientEvent('Notify', source, (Lang['reward_notify']:format(reward)))
	
	if cfg.items.enable then
		for k,v in pairs(cfg.items.list) do
			if math.random(0,100) <= v.chance then 
				local amount = math.random(v.min, v.max)
				local name = tostring(v.item)
					vRP.giveInventoryItem(user_id,"acidobenzoico",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"bicarbonato",math.random(0,1),true)			
					vRP.giveInventoryItem(user_id,"mdma",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"compostoquimico",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"prometazina",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"xarope",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"acidolisergico",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"clavicepspurpurea",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"querosene",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"folhadecoca",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"pastabase",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"opio",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"eter",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"etanol",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"cloretodeetila",math.random(0,1),true)				
					vRP.giveInventoryItem(user_id,"papoulas",math.random(0,1),true)
				TriggerClientEvent('Notify', source, (Lang['you_received_item']:format(amount,name)))
			end
		end
	end
end)
				--[[vRP.giveInventoryItem(user_id,"acidobenzoico",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"bicarbonato",math.random(1,2),true)			
					vRP.giveInventoryItem(user_id,"mdma",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"compostoquimico",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"prometazina",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"xarope",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"acidolisergico",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"clavicepspurpurea",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"querosene",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"folhadecoca",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"pastabase",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"opio",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"eter",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"etanol",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"cloretodeetila",math.random(1,2),true)				
					vRP.giveInventoryItem(user_id,"papoulas",math.random(1,2),true)]]

RegisterServerEvent('lc_coguheist:PoliceNotifySV')
AddEventHandler('lc_coguheist:PoliceNotifySV', function(targetCoords, streetName)
	TriggerClientEvent('lc_coguheist:PoliceNotifyCL', -1, (Lang['police_notify']):format(streetName))
	TriggerClientEvent('lc_coguheist:PoliceNotifyBlip', -1, targetCoords)
end)


RegisterServerEvent('lc_coguheist:SyncDataSV')
AddEventHandler('lc_coguheist:SyncDataSV',function(data)
    TriggerClientEvent('lc_coguheist:SyncDataCL', -1, data)
end)


function RemoveCooldownTimer(source)
    for k,v in pairs(jobCooldown) do
        if v.cooldown == source then
            table.remove(jobCooldown,k)
        end
    end
end
function GetCooldownTimer(source)
    for k,v in pairs(jobCooldown) do
        if v.cooldown == source then
            return math.ceil(v.time/60000)
        end
    end
end
function CheckCooldownTimer(source)
    for k,v in pairs(jobCooldown) do
        if v.cooldown == source then
            return true
        end
    end
    return false
end