ESX = nil
workercount = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('m3:uber:checkWorkers', function(source, cb)
	if workercount >= Config.MaxWorker then
		cb(false)
	else
		cb(true)
		workercount = workercount + 1
	end
end)

RegisterServerEvent('m3:uber:finished')
AddEventHandler('m3:uber:finished', function()
	workercount = workercount - 1
end)

RegisterServerEvent('m3:uber:New')
AddEventHandler('m3:uber:New', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT * FROM m3_uber_points WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] == nil then
			MySQL.Async.execute("INSERT INTO m3_uber_points (identifier, point, money) VALUES (@identifier, @point, @money)", {['@identifier'] = xPlayer.identifier, ['@point'] = Config.DefaultStartPoint, ['@money'] = 0})
		end
	end)
end)

RegisterServerEvent('m3:uber:success')
AddEventHandler('m3:uber:success', function(basket, extratime)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local winnings = 0

	if extratime > 3 then
		extratime = 3
	elseif extratime == 2 then
		extratime = 2
	elseif extratime < 2 then
		extratime = 1
	end

	MySQL.Async.fetchAll('SELECT * FROM m3_uber_points WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
			if result[1].point >= 98 then
				result[1].point = 97
			end
			MySQL.Async.execute("UPDATE m3_uber_points SET point = @point WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['@point'] = result[1].point + extratime})

			TriggerClientEvent('esx:showNotification', _source, _U('ubereast_scoredelivery'))

			for i=1, #basket, 1 do
				xPlayer.removeInventoryItem(basket[i].name, 1)
				winnings = winnings + basket[i].price + (Config.EarningsPerDelivery * (result[1].point / 30))
			end

			MySQL.Async.execute("UPDATE m3_uber_points SET money = @money WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['@money'] = math.ceil(result[1].money + winnings)})
			TriggerClientEvent('esx:showNotification', _source, _U('ubereast_paid'))
		end
	end)		
end)

ESX.RegisterServerCallback('m3:uber:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)

RegisterServerEvent('m3:uber:failed')
AddEventHandler('m3:uber:failed', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT * FROM m3_uber_points WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
			if result[1].point <= Config.PointsToDropOnFail then
				result[1].point = Config.PointsToDropOnFail
			end
			MySQL.Async.execute("UPDATE m3_uber_points SET point = @point WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['point'] = result[1].point - Config.PointsToDropOnFail})

			TriggerClientEvent('esx:showNotification', _source, _U('ubereast_dropped'))
		end
	end)
end)


ESX.RegisterServerCallback('m3:uber:checkMoney', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_uber_points WHERE identifier = @identifier',{['@identifier'] = xPlayer.identifier},function(result)
		local uberr = {}
		for i=1, #result, 1 do
			table.insert(uberr, {id = result[i].id,money=result[i].money,point=result[i].point}) 
		end
		cb(uberr)
	end)
end)



RegisterServerEvent('m3:uber:getMoney')
AddEventHandler('m3:uber:getMoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT * FROM m3_uber_points WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
			if result[1].money > 0 then
				MySQL.Async.execute("UPDATE m3_uber_points SET money = @money WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['money'] = 0})
				xPlayer.addAccountMoney('bank', result[1].money)
				TriggerClientEvent('esx:showNotification', _source, _U('ubereast_moneyt') .. result[1].money .. '$')
			else
				TriggerClientEvent('esx:showNotification', _source, _U('ubereast_nomoney')) 
			end
		end
	end)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		workercount = 0
		print('[^2m3:gcphone uber^0] - The employee table is emptied.')
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		print('[^2m3:gcphone uber^0] - Started!')
	end
end)
