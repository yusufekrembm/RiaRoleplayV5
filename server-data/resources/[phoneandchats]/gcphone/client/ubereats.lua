ESX = nil
deliverystarted = false
currentCoordId = 0
deliverytime = Config.MaxDeliveryTime
maxdeliverytime = Config.MaxDeliveryTime
basket = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNUICallback('uberephone', function()
	if GetCurrentResourceName() == 'gcphone' then
		if not deliverystarted then
			TriggerServerEvent('m3:uber:New')
			ESX.TriggerServerCallback('m3:uber:checkWorkers', function(result)
				if result then
						local randomcount = math.random(1, Config.MaxDeliveryCount)
						local itemcount = 0
						for i=1, #Config.Items, 1 do
							itemcount = itemcount + 1 
						end
						for i=1, randomcount do
							local randomitem = math.random(1, itemcount)
							table.insert(basket, {name = Config.Items[randomitem].item, label = Config.Items[randomitem].label, price = Config.Items[randomitem].price})
							--TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Sipariş: 1x ' ..Config.Items[randomitem].label, length = 15000})
							--TriggerEvent('notification', 'Sipariş: 1x \n' ..Config.Items[randomitem].label , 1)
							ESX.ShowNotification('1x' ..Config.Items[randomitem].label)
						end
						DeliveryHouse()
						deliverystarted = true
				else
					ESX.ShowNotification(_U('ubereast_enough'))
				end
			end)
		else
			ESX.ShowNotification(_U('ubereast_delivery'))
		end
	else
		ESX.ShowNotification(_U('ubereast_gcphone'))
	end
end)

RegisterCommand('uberliste', function()
	for i = 1, #basket, 1 do
		ESX.ShowNotification('1x' ..basket[i].label)
	end
end)


RegisterNUICallback('uberpara', function(data, cb)
  ESX.TriggerServerCallback('m3:uber:checkMoney', function(uberr)
    SendNUIMessage({event = 'uber_para', uberr = uberr})
  end)
end)


RegisterNUICallback('ubercek', function()
	TriggerServerEvent('m3:uber:getMoney')
end)

RegisterNUICallback('uberbittir', function()
	missiontext('Time Left:~r~ ' .. deliverytime .. ' minute', 1)
	deliverystarted = false
	deliverytime = Config.MaxDeliveryTime
	basket = {}
	RemoveBlip(deliveryblip)
	TriggerServerEvent('m3:uber:finished')
	TriggerServerEvent('m3:uber:failed')
	ESX.ShowNotification(_U('ubereast_delaycancel'))
end)

function DeliveryHouse()
	local coordcount = 0
	for i=1, #Config.Coords, 1 do
		coordcount = coordcount + 1 
	end
	local randomcoord = math.random(1, coordcount)
	currentCoordId = randomcoord
	deliveryblip = AddBlipForCoord(Config.Coords[currentCoordId].coords.x, Config.Coords[currentCoordId].coords.y, Config.Coords[currentCoordId].coords.z - 1)
	SetBlipSprite(deliveryblip, 280)
	SetBlipColour(deliveryblip, 69)
	SetBlipScale(deliveryblip, 1.0)
	SetBlipAsShortRange(deliveryblip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Delivery')
	EndTextCommandSetBlipName(deliveryblip)

	SetNewWaypoint(Config.Coords[currentCoordId].coords.x, Config.Coords[currentCoordId].coords.y)
	missiontext('Time Left:~g~ ' .. deliverytime .. ' minute', 60000)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		if deliverystarted then
			deliverytime = deliverytime - 1
			
			if deliverytime <= (maxdeliverytime / 3) then
				SetBlipColour(deliveryblip, 59)
				missiontext('Time Left:~g~ ' .. deliverytime .. ' minute', 60000)
			elseif deliverytime <= (maxdeliverytime / 3) * 2 then
				SetBlipColour(deliveryblip, 46)
				missiontext('Time Left:~y~ ' .. deliverytime .. ' minute', 60000)
			elseif deliverytime <= (maxdeliverytime / 3) * 3 then
				missiontext('Time Left:~g~ ' .. deliverytime .. ' minute', 60000)
			end
			if deliverytime <= 0 then
				failed()
			end
		end
	end
end)

function missiontext(text, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(time, 1)
end

Citizen.CreateThread(function()
	while true do
		local letSleep = true
		Citizen.Wait(5)
		if deliverystarted then
			local pPed = GetPlayerPed(-1)
			local pCoords = GetEntityCoords(pPed)
			local distance = GetDistanceBetweenCoords(pCoords, Config.Coords[currentCoordId].coords.x, Config.Coords[currentCoordId].coords.y, Config.Coords[currentCoordId].coords.z, false)
			if distance < 15.0 then
				letSleep = false
				DrawMarker(2, Config.Coords[currentCoordId].coords.x, Config.Coords[currentCoordId].coords.y, Config.Coords[currentCoordId].coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 255, 255, 100, false, true, 2, true, false, false, false)
				if distance < 2.5 then
					DrawText3D(Config.Coords[currentCoordId].coords.x, Config.Coords[currentCoordId].coords.y, Config.Coords[currentCoordId].coords.z + 0.3, '[E] - Kapıyı Çal')
					if IsControlJustPressed(0, 38) then
						TaskGoStraightToCoord(pPed, Config.Coords[currentCoordId].coords.x, Config.Coords[currentCoordId].coords.y, Config.Coords[currentCoordId].coords.z, 10.0, 10, Config.Coords[currentCoordId].heading, 0.5)
						Citizen.Wait(3000)
						ClearPedTasksImmediately(pPed)

						while not HasAnimDictLoaded("timetable@jimmy@doorknock@") do 
							RequestAnimDict("timetable@jimmy@doorknock@") 
							Citizen.Wait(0)
						end

						TaskPlayAnim(pPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 8.0, -1, 4, 0, 0, 0, 0 )  
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'door', 0.5)
						Citizen.Wait(1200)
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'door', 0.5)

						while IsEntityPlayingAnim(pPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 3) do 
							Citizen.Wait(0) 
						end          

						Citizen.Wait(1000)

						ClearPedTasksImmediately(pPed)

						local isinHome = math.random(1,100)
						if isinHome <= Config.isinHomeChange then
							local itemlistok = false local checkall = true
							for i=1, #basket, 1 do
								ESX.TriggerServerCallback('m3:uber:getItemAmount', function(count)
									
									if count > 0 then
										itemlistok = i
									else
										itemlistok = false checkall = false
										ESX.ShowNotification('missing' ..basket[i].label)
									end
								end, basket[i].name)
							end
							local time = 1
							repeat
								Citizen.Wait(1)
								time = time + 1
								if itemlistok == #basket and checkall then
									successDelivery()
								end
							until itemlist == #basket or time == 1000
						else
							failedForNotHome()
						end
					end
				end
			end
		end
		if letSleep then
			Citizen.Wait(1500)
		end
	end
end)

function failed()
	missiontext('Time Left:~r~ ' .. deliverytime .. ' minute', 1)
	deliverystarted = false
	deliverytime = Config.MaxDeliveryTime
	basket = {}
	RemoveBlip(deliveryblip)
	TriggerServerEvent('m3:uber:finished')
	TriggerServerEvent('m3:uber:failed')
	ESX.ShowNotification(_U('ubereast_delaycancel'))
end

function successDelivery()
	missiontext('Time Left:~r~ ' .. deliverytime .. ' minute', 1)
	TriggerServerEvent('m3:uber:success', basket, Config.MaxDeliveryTime - deliverytime)
	deliverystarted = false
	deliverytime = Config.MaxDeliveryTime
	basket = {}
	RemoveBlip(deliveryblip)
	TriggerServerEvent('m3:uber:finished')
	ESX.ShowNotification(_U('ubereast_suceess'))
end

function failedForNotHome()
	missiontext('Time Left:~r~ ' .. deliverytime .. ' minute', 1)
	deliverystarted = false
	deliverytime = Config.MaxDeliveryTime
	basket = {}
	RemoveBlip(deliveryblip)
	TriggerServerEvent('m3:uber:finished')
	ESX.ShowNotification(_U('ubereast_nobodyhome'))
end

function  DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	local scale = 0.35
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropshadow(0)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 380
        DrawRect(_x, _y + 0.0120, 0.0 + factor, 0.025, 41, 11, 41, 100)
	end
end
