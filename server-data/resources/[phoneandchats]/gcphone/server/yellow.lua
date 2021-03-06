function YellowGetPagess (accountId, cb)
  if accountId == nil then
    MySQL.Async.fetchAll([===[
      SELECT *
      FROM yellow_tweets
      ORDER BY time DESC LIMIT 130
      ]===], {}, cb)
  end
end

function BankUserTransfer (identifier, cb)
    MySQL.Async.fetchAll([===[
      SELECT *
      FROM bank_transfer
      ]===], {}, cb)
end

ESX.RegisterServerCallback('gcphone:GetYellowUsers', function(source, cb)
  local e = getIdentity(source)
  MySQL.Async.fetchAll('SELECT * FROM yellow_tweets WHERE phone_number = @phone_number ORDER BY time DESC LIMIT 130',{["@phone_number"]=e.phone_number},function(result)
    local usersyellow = {}
    for i=1, #result, 1 do
      table.insert(usersyellow, {id = result[i].id,	firstname=result[i].firstname, lastname=result[i].lastname, message=result[i].message, image=result[i].image, time=result[i].time }) 
    end
    cb(usersyellow)
  end)
end)

function getUserYellow(phone_number, firstname, cb)
  MySQL.Async.fetchAll("SELECT firstname, phone_number FROM users WHERE users.firstname = @firstname AND users.phone_number = @phone_number", {
    ['@phone_number'] = phone_number,
	['@firstname'] = firstname
  }, function (data)
    cb(data[1])
  end)
end


RegisterServerEvent('gcPhone:bank_gkst')
AddEventHandler('gcPhone:bank_gkst', function(identifier)
  local sourcePlayer = tonumber(source)
    BankUserTransfer(nil, function (bankgks)
      TriggerClientEvent('gcPhone:bank_gkst', sourcePlayer, bankgks)
    end)
end)


function YellowPostPages (phone_number, firstname, lastname, message, image, sourcePlayer, cb)
    getUserYellow(phone_number, firstname, function (user)
    MySQL.Async.insert("INSERT INTO yellow_tweets (`phone_number`, `firstname`, `lastname`, `message`, `image`) VALUES(@phone_number, @firstname, @lastname, @message, @image);", {
	  ['@phone_number'] = phone_number,
	  ['@firstname'] = firstname,
	  ['@lastname'] = lastname,
      ['@message'] = message,
	  ['@image'] = image
    }, function (id)
      MySQL.Async.fetchAll('SELECT * from yellow_tweets WHERE id = @id', {
        ['@id'] = id
      }, function (pagess)
        pages = pagess[1]
        pages['firstname'] = user.firstname
        pages['phone_number'] = user.phone_number
        TriggerClientEvent('gcPhone:yellow_newPagess', -1, pages)
        TriggerEvent('gcPhone:yellow_newPagess', pages)
        TriggerClientEvent('DeleteYellow', sourcePlayer)
      end)
    end)
  end)
end

function YellowUsersDelete (yellowId, phone_number, sourcePlayer)
    MySQL.Async.execute('DELETE FROM yellow_tweets WHERE id = @id AND phone_number = @phone_number', {
      ['@id'] = yellowId,
	  ['@phone_number'] = phone_number
    }, function (result)
      TriggerClientEvent('DeleteYellow', sourcePlayer)
	end)
end

RegisterServerEvent('gcPhone:yellow_usersDeleteTweet')
AddEventHandler('gcPhone:yellow_usersDeleteTweet', function(yellowId, phone_number)
  local sourcePlayer = tonumber(source)
  local name = getIdentity(source)
  YellowUsersDelete(yellowId, name.phone_number, sourcePlayer)
end)


function YellowShowError (sourcePlayer, title, message, image)
  TriggerClientEvent('gcPhone:yellow_showError', sourcePlayer, message, image)
end
function YellowShowSuccess (sourcePlayer, title, message, image)
  TriggerClientEvent('gcPhone:yellow_showSuccess', sourcePlayer, title, message, image)
end

RegisterServerEvent('gcPhone:yellow_getPagess')
AddEventHandler('gcPhone:yellow_getPagess', function(phone_number, firstname)
  local sourcePlayer = tonumber(source)
    YellowGetPagess(nil, function (pagess)
      TriggerClientEvent('gcPhone:yellow_getPagess', sourcePlayer, pagess)
    end)
end)

function getIdentity(source)
  local _source = source
  local sourcePlayer = tonumber(_source)
  xPlayer = ESX.GetPlayerFromId(_source)
  identifier = xPlayer.identifier
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			phone_number = identity['phone_number'],
		}
	else
		return nil
	end
end

RegisterServerEvent('gcPhone:yellow_postPagess')
AddEventHandler('gcPhone:yellow_postPagess', function(firstname, phone_number, lastname, message, image)
  local sourcePlayer = tonumber(source)
  local name = getIdentity(source)
  YellowPostPages(name.phone_number, name.firstname, name.lastname, message, image, sourcePlayer)
end)

--[[
  Discord WebHook
  set discord_webhook 'https//....' in config.cfg
--]]
AddEventHandler('gcPhone:yellow_newPagess', function (pages)
  -- print(json.encode(pages))
  local discord_webhook = GetConvar('discord_webhook', Config.YellowWeb)
  if discord_webhook == '' then
    return
  end
  local headers = {
    ['Content-Type'] = 'application/json'
  }
  local data = {
    ["username"] = pages.firstname,
    ["embeds"] = {{
      ["color"] = 1942002
    }}
  }
  local isHttp = string.sub(pages.message, 0, 7) == 'http://' or string.sub(pages.message, 0, 8) == 'https://'
  local ext = string.sub(pages.message, -4)
  local isImg = ext == '.png' or ext == '.pjg' or ext == '.gif' or string.sub(pages.message, -5) == '.jpeg'

    data['embeds'][1]['title'] = pages.firstname .. pages.lastname .." adl?? Sar?? Sayfalara Yeni Post Att??!"
    data['embeds'][1]['image'] = { ['url'] = pages.image }
	data['embeds'][1]['description'] = pages.message

  PerformHttpRequest(discord_webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
end)
