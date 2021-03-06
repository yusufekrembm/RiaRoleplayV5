----   ____    ____         ----   
----  /\  _`\ /\  _`\       ----  
----  \ \ \/\ \ \ \L\ \     ----
----   \ \ \ \ \ \ ,  /     ----
----    \ \ \_\ \ \ \\ \    ----
----     \ \____/\ \_\ \_\  ----
----      \/___/  \/_/\/ /  ----

ESX               				= nil
local PlayerData                = {}
local PoliceJob 				= 'police'

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

-- RegisterNetEvent('esx:setJob')
-- AddEventHandler('esx:setJob', function(job)
	-- PlayerData.job = job
-- end)

local isJudge = false
local isPolice = false
local isSheriff = false
local isMechanic = false
local isMedic = false
local isDoctor = false
local isNews = false
local isPet = false
local isDead = false
local isInstructorMode = false
local myJob = "unemployed"
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local gangNum = 0
local cuffStates = {}

rootMenuConfig =  {
    {
        id = "general",
        displayName = "Genel",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"general:emotes","general:cancelemotes","general:dpkiyafet","general:calculator","general:tasi","general:documents","general:pets"}
    },
	{
        id = "police",
        displayName = "Polis",
        icon = "#police-action",
        enableMenu = function()
            return (not isDead and (isPolice or isSheriff))
        end,
        subMenus = {"police:mdt","police:f6","police:bodycamac"}
    },
    {
        id = "medic",
        displayName = "Doktor",
        icon = "#police-action",
        enableMenu = function()
            return (not isDead and (isMedic))
        end,
        subMenus = {"medic:npcisbaslat","medic:npcisbitir","medic:acilbed"}
    },
	{
        id = "animations",
        displayName = "Y??r??y????ler",
        icon = "#walking",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien" }
    },
    {
        id = "kimlik",
        displayName = "Kimlik ????lemleri",
        icon = "#kimlik-islemler",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "kimlik:goster", "kimlik:gor", "meslek:gor","kimlik:ehliyetgor","kimlik:ehliyetver"}
    },
    {
        id = "expressions",
        displayName = "Y??z ??fadeleri",
        icon = "#expressions",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
        id = "blips",
        displayName = "????aret",
        icon = "#blips",
        enableMenu = function()
            return not isDead
        end,
        subMenus = { "blips:gasstations", --[["blips:trainstations",]] "blips:garages","blips:eczane", "blips:barbershop", "blips:tattooshop"}
    },
    {
        id = "vehicleneon",
        displayName = "Neon A??/Kapat",
        icon = "#general-check-vehicle",
        functionName = "neon:on",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end,
    },
    {
        id = "vehicle",
        displayName = "Ara??",
        icon = "#vehicle-options-vehicle",
        functionName = "veh:options",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), false))
        end,
    },
    {
        id = "generaladdremoveblip",
        displayName = "Blipler",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"general:tattoblip","general:houseblip","general:barberblip"}
    }
}

newSubMenus = {
    ['general:emotes'] = {
        title = "Animasyonlar",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu"
    },   
    ['general:cancelemotes'] = {
        title = "Animasyon ??ptali",
        icon = "#k9-dismiss",
        functionName = "cancelemotes"
    },    
	['general:dpkiyafet'] = {
        title = "K??yafet Men??s??",
        icon = "#police-vehicle",
        functionName = "dpc:ToggleMenu"
    },	
    ['general:calculator'] = {
        title = "Hesap Makinesi",
        icon = "#police-vehicle",
        functionName = "calculator:on"
    },	
    ['general:tasi'] = {
        title = "Kucakla  S??rtla Men??",
        icon = "#police-vehicle",
        functionName = "esx_barbie_lyftupp"
    },	
    ['general:documents'] = {
        title = "Dosyalar",
        icon = "#police-vehicle",
        functionName = "esx_documents:OpenMainMenu"
    },	
    ['general:pets'] = {
        title = "Pet Men??",
        icon = "#police-vehicle",
        functionName = "eden_animal:OpenPetMenu"
    },	
    ['general:tattoblip'] = {
        title = "D??vmeci Blip",
        icon = "#police-vehicle",
        functionName = "mak:toggletattoblip"
    },	
    ['general:houseblip'] = {
        title = "Evler Blip",
        icon = "#police-vehicle",
        functionName = "mak:togglehouseblip"
    },	
    ['general:barberblip'] = {
        title = "Berber Blip",
        icon = "#police-vehicle",
        functionName = "mak:togglebarberblip"
    },	
    ['general:common'] = {
        title = "??ete,Banka ve Bal??k Restaurant",
        icon = "#police-vehicle",
        functionName = "mak:togglecommonblip"
    },
	['meslek:gor'] = {
        title = "Mesle??ini ????ren",
        icon = "#kimlik-goster",
        functionName = "meslekbak"
    },
    ['animations:brave'] = {
        title = "Cesur",
        icon = "#animation-brave",
        functionName = "walkanimation",
        functionParameters = "move_m@casual@d"
    },
    ['kimlik:goster'] = {
        title = "Kimlik G??ster",
        icon = "#kimlik-goster",
        functionName = "kimlikmenu",
        functionParameters = "goster"
    },
    ['kimlik:gor'] = {
        title = "Kimlik G??r",
        icon = "#kimlik-gor",
        functionName = "kimlikmenu",
        functionParameters = "gor"
    },
    ['kimlik:ehliyetgor'] = {
        title = "Ehliyet G??r",
        icon = "#kimlik-gor",
        functionName = "kimlikmenu",
        functionParameters = "ehliyetgor"
    },
    ['kimlik:ehliyetver'] = {
        title = "Ehliyet Ver",
        icon = "#kimlik-gor",
        functionName = "kimlikmenu",
        functionParameters = "ehliyetver"
    },
    ['animations:hurry'] = {
        title = "Hafif tempolu",
        icon = "#animation-hurry",
        functionName = "walkanimation",
        functionParameters = "move_m@gangster@var_i"
    },
    ['animations:business'] = {
        title = "???? adam??",
        icon = "#animation-business",
        functionName = "walkanimation",
        functionParameters = "move_m@gangster@var_e"
    },
    ['animations:tipsy'] = {
        title = "????kili",
        icon = "#animation-tipsy",
        functionName = "walkanimation",
        functionParameters = "MOVE_M@DRUNK@VERYDRUNK"
    },
    ['animations:injured'] = {
        title = "Yaral??",
        icon = "#animation-injured",
        functionName = "walkanimation",
        functionParameters = "move_heist_lester"
    },
    ['animations:tough'] = {
        title = "Kasl??",
        icon = "#animation-tough",
        functionName = "walkanimation",
        functionParameters = "move_characters@michael@fire"
    },
    ['animations:sassy'] = {
        title = "Kad??n",
        icon = "#animation-sassy",
        functionName = "walkanimation",
        functionParameters = "FEMALE_FAST_RUNNER"
    },
    ['animations:sad'] = {
        title = "??zg??n",
        icon = "#animation-sad",
        functionName = "walkanimation",
        functionParameters = "move_m@gangster@var_f"
    },
    ['animations:posh'] = {
        title = "L??ks",
        icon = "#animation-posh",
        functionName = "walkanimation",
        functionParameters = "move_m@bag"
    },
    ['animations:alien'] = {
        title = "Sars??lm????",
        icon = "#animation-alien",
        functionName = "walkanimation",
        functionParameters = "MOVE_M@BAIL_BOND_NOT_TAZERED"
    },
    ['animations:nonchalant'] =
    {
        title = "So??uk",
        icon = "#animation-nonchalant",
        functionName = "walkanimation",
        functionParameters = "move_m@casual@d"
    },
    ['animations:hobo'] = {
        title = "Serseri",
        icon = "#animation-hobo",
        functionName = "walkanimation",
        functionParameters = "clipset@move@trash_fast_turn"
    },
    ['animations:money'] = {
        title = "G??steri??li",
        icon = "#animation-money",
        functionName = "walkanimation",
        functionParameters = "MOVE_M@POSH@"
    },
    ['animations:swagger'] = {
        title = "??al??m",
        icon = "#animation-swagger",
        functionName = "walkanimation",
        functionParameters = "move_characters@Jimmy@slow@"
    },
    ['animations:shady'] = {
        title = "G??lgeli",
        icon = "#animation-shady",
        functionName = "walkanimation",
        functionParameters = "move_p_m_zero_slow"
    },
    ['animations:maneater'] = {
        title = "Yamyam",
        icon = "#animation-maneater",
        functionName = "walkanimation",
        functionParameters = "ANIM_GROUP_MOVE_BALLISTIC"
    },
    ['animations:chichi'] = {
        title = "Korkak",
        icon = "#animation-chichi",
        functionName = "walkanimation",
        functionParameters = "move_f@scared"
    },
    ['animations:default'] = {
        title = "Normal",
        icon = "#animation-default",
        functionName = "walkanimation:default"
    },
    ['blips:gasstations'] = {
        title = "Benzin istasyonlar??",
        icon = "#blips-gasstations",
        functionName = "ygx:togglegas"
    },    
    ['blips:garages'] = {
        title = "Garajlar",
        icon = "#blips-garages",
        functionName = "ygx:togglegaraj"
    },['blips:eczane'] = {
        title = "Eczaneler",
        icon = "#eczane",
        functionName = "ygx:toggleeczane"
    },
    ['blips:barbershop'] = {
        title = "Berber",
        icon = "#blips-barbershop",
        functionName = "ygx:togglebarber"
    },    
    ['blips:tattooshop'] = {
        title = "D??vme",
        icon = "#blips-tattooshop",
        functionName = "ygx:toggletattos"
    },
	--POLIS
    ['police:mdt'] = {
        title = "MDT",
        icon = "#police-vehicle-plate",
        functionName = "mdt:RecieveMenu"
    },
    ['police:f6'] = {
        title = "Polis Aksiyon",
        icon = "#police-vehicle-plate",
        functionName = "police:RecieveMenu"
    },
    ['police:bodycamac'] = {
        title = "Polis Bodycam A??/Kapa",
        icon = "#police-vehicle-plate",
        functionName = "noble:bodycam"
    },
	
   ---- DOKTOR
    ['medic:npcisbaslat'] = {
    title = "NPC ???? Ba??lat",
    icon = "#police-vehicle-plate",
    functionName = "ambulance_mission:startgame"
},

['medic:npcisbitir'] = {
    title = "NPC ???? Bitir",
    icon = "#police-vehicle-plate",
    functionName = "ambulance_mission:stopgame"
},

['medic:acilbed'] = {
    title = "Acil Hasta Yata????",
    icon = "#police-vehicle-plate",
    functionName = "spawn:bed"
},
    ["expressions:angry"] = {
        title="K??zg??n",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  "mood_angry_1" 
    },
    ["expressions:drunk"] = {
        title="Sarho??",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  "mood_drunk_1" 
    },
    ["expressions:dumb"] = {
        title="Aptal",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  "pose_injured_1"
    },
    ["expressions:electrocuted"] = {
        title="Elektrik ??arp??lm????",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  "electrocuted_1"
    },
    ["expressions:grumpy"] = {
        title="Huysuz",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  "mood_drivefast_1" 
    },
    ["expressions:happy"] = {
        title="Mutlu",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  "mood_happy_1"
    },
    ["expressions:injured"] = {
        title="Yaral??",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  "mood_injured_1"
    },
    ["expressions:joyful"] = {
        title="Ne??eli",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  "mood_dancing_low_1"
    },
    ["expressions:mouthbreather"] = {
        title="A??z?? a????k",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = "smoking_hold_1"
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        functionName = "expressions",
        functionParameters = "mood_normal_1"
    },
    ["expressions:oneeye"]  = {
        title="Tek g??z",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = "pose_aiming_1"
    },
    ["expressions:shocked"]  = {
        title="??ok",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = "shocked_1"
    },
    ["expressions:sleeping"]  = {
        title="Uykulu",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = "dead_1"
    },
    ["expressions:smug"]  = {
        title="Kendini be??enmi??",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = "mood_smug_1"
    },
    ["expressions:speculative"]  = {
        title="D??????n??yor",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = "mood_aiming_1"
    },
    ["expressions:stressed"]  = {
        title="Stresli",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = "mood_stressed_1"
    },
    ["expressions:sulking"]  = {
        title="Somurtma",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = "mood_sulk_1" --
    },
    ["expressions:weird"]  = {
        title="Garip",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = "effort_2"
    },
    ["expressions:weird2"]  = {
        title="Garip 2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = "effort_3"
    }
}

Citizen.CreateThread(function()
    --while true do
        --Citizen.Wait(15000)
        --PlayerData = {}
            while PlayerData == nil or PlayerData.job == nil do
                Citizen.Wait(0)
            end
                
            if PlayerData.job.name == 'police' then
                isPolice = true
                isSheriff = false 
                isMedic = false 
                isNews = false
                isMechanic = false
				isPet = false
			elseif PlayerData.job.name == 'sheriff' then
                isPolice = false
				isSheriff = true
                isMedic = false 
                isNews = false
                isMechanic = false
				isPet = false
            elseif PlayerData.job.name == 'ambulance' then 
                isPolice = false
				isSheriff = false				
                isMedic = true
                isNews = false
                isMechanic = false
				isPet = false
            elseif PlayerData.job.name == "reporter" then 
                isPolice = false
				isSheriff = false				
                isMedic = false 
                isNews = true 
                isMechanic = false
				isPet = false
            elseif PlayerData.job.name == 'mechanic' then 
                isPolice = false
				isSheriff = false
                isMedic = false
                isNews = false
                isMechanic = true
				isPet = false
            elseif PlayerData.job.name == 'illegalmechanic' then 
                isPolice = false
				isSheriff = false
                isMedic = false
                isNews = false
                isMechanic = true
				isPet = false
            elseif PlayerData.job.name == 'ivan' then 
                isPolice = false
				isSheriff = false
                isMedic = false
                isNews = false
                isMechanic = false
				isPet = true
            elseif PlayerData.job.name == 'mechanic2' then 
                isPolice = false
				isSheriff = false
                isMedic = false
                isNews = false
                isMechanic = true
				isPet = false
            elseif PlayerData.job.name == 'mechanic3' then 
                isPolice = false
				isSheriff = false
                isMedic = false
                isNews = false
                isMechanic = true
				isPet = false
			elseif PlayerData.job.name == 'mechanic4' then 
                isPolice = false
				isSheriff = false
                isMedic = false
                isNews = false
                isMechanic = true
				isPet = false	
            else
                isPolice = false
				isSheriff = false				
                isMedic = false 
                isNews = false  
                isMechanic = false 
				isPet = false
            end

            myJob = job
           -- print(isPolice)
            --print(isMedic)
            --print(isNews)
   -- end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    if PlayerData.job.name == 'police' then
        isPolice = true
        isSheriff = false 
        isMedic = false 
        isNews = false
        isMechanic = false
        isPet = false
    elseif PlayerData.job.name == 'sheriff' then
        isPolice = false
        isSheriff = true
        isMedic = false 
        isNews = false
        isMechanic = false
        isPet = false
    elseif PlayerData.job.name == 'ambulance' then 
        isPolice = false
        isSheriff = false 
        isMedic = true
        isNews = false
        isMechanic = false
		isPet = false
    elseif PlayerData.job.name == "news" then 
        isPolice = false
        isSheriff = false 
        isMedic = false 
        isNews = true 
        isMechanic = false
		isPet = false
    elseif PlayerData.job.name == 'mechanic' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = true
		isPet = false
    elseif PlayerData.job.name == 'ivan' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = false
		isPet = true
    elseif PlayerData.job.name == 'mechanic1' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = true
		isPet = false
    elseif PlayerData.job.name == 'mechanic2' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = true
		isPet = false
    elseif PlayerData.job.name == 'mechanic3' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = true
		isPet = false
    elseif PlayerData.job.name == 'mechanic3' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = true
		isPet = false
    elseif PlayerData.job.name == 'mechanic4' then 
        isPolice = false
        isSheriff = false
        isMedic = false
        isNews = false
        isMechanic = true
		isPet = false
    else
        isPolice = false
        isSheriff = false 
        isMedic = false 
        isNews = false  
        isMechanic = false 
		isPet = false
    end

    myJob = job.name
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)

RegisterNetEvent("drivingInstructor:instructorToggle")
AddEventHandler("drivingInstructor:instructorToggle", function(mode)
    if myJob == "driving instructor" then
        isInstructorMode = mode
    end
end)

RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
end)

function GetPlayers()
    local players = {}

    for i = 0, 32 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end
