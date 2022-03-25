
SX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/me', 'Eylem belirtmek için emote kullanımı.')
end)

local nbrDisplaying = 1

RegisterCommand('me', function(source, args, raw)
    local text = string.sub(raw, 4)
    TriggerServerEvent('3dme:shareDisplay','~m~ ~s~' .. text .. '~m~')
    ESX.TriggerServerCallback('jeux:sex', function(firstname,lastname)
        text = firstname ..' '..  lastname .. '<b> : '.. text..  '</b> ' 
        TriggerServerEvent('3dme:chat',text)
    end)
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.14)
    Display(GetPlayerFromServerId(source), text, offset)
end)
RegisterNetEvent('3dme:chatyaz')
AddEventHandler('3dme:chatyaz', function(text, source)
    chat(GetPlayerFromServerId(source), text)
end)
function Display(mePlayer, text, offset)
    local displaying = true
    Citizen.CreateThread(function()
        Wait(8000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1

        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 55 then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset-0.900, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end
function chat(mePlayer, text)
    local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
    local coords = GetEntityCoords(PlayerPedId(), false)
    local jeux = Vdist2(coordsMe, coords)

    if jeux < 100 then

        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message system">' .. text .. '</div>',
            multiline = true,
            args = { text}
        })
 
    end
end
function DrawText3D(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.56, 0.56)
		SetTextFont(0)
		SetTextProportional(1)
        SetTextColour(128, 90, 163, 255)
        SetTextDropshadow(10, 100, 100, 100, 255)
		SetTextEntry("STRING")
        SetTextCentre(1)
		AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end