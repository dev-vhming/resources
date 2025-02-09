QBCore = exports['et-core']:GetCoreObject()

local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local hasAlreadyEnteredMarker = false
local allMyOutfits = {}
local isPurchaseSuccessful = false
local PlayerData = {}

-- Net Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('fivem-appearance:getPlayerSkin', function(appearance)
		exports['fivem-appearance']:setPlayerAppearance(appearance)
		PlayerData = QBCore.Functions.GetPlayerData()
		
		if Config.Debug then  -- This will detect if the player model is set as "player_zero" aka michael. Will then set the character as a freemode ped based on gender.
			Wait(5000)
			if GetEntityModel(PlayerPedId()) == `player_zero` then
				print('Player detected as "player_zero", Starting CreateFirstCharacter event')
				TriggerEvent('et-clothes:client:CreateFirstCharacter')
			end
		end
		
	end)
end)

RegisterNetEvent('et-clothes:client:CreateFirstCharacter', function()  -- Event renamed so you dont need to change anything for this to work... hopefully....
	QBCore.Functions.GetPlayerData(function(PlayerData)
		local skin = 'mp_m_freemode_01'
		if PlayerData.charinfo.gender == 1 then
            skin = "mp_f_freemode_01" 
        end
		exports['fivem-appearance']:setPlayerModel(skin)
		local config = {
			ped = true,
			headBlend = true,
			faceFeatures = true,
			headOverlays = true,
			components = true,
			props = true,
		}
		exports['fivem-appearance']:setPlayerAppearance(appearance)
		exports['fivem-appearance']:startPlayerCustomization(function(appearance)
			if (appearance) then
				TriggerServerEvent('fivem-appearance:save', appearance)
				print('Player Clothing Saved')
			else
				print('Canceled')
			end
		end, config)
	end)
end, false)

AddEventHandler('fivem-appearance:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

RegisterNetEvent('fivem-appearance:clothingShop', function()
	exports['et-menu']:openMenu({
        {
            header = "👚 | Cửa hàng quần áo",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Mua quần áo - $"..Config.Money,
			txt = "Mua quần áo từ cửa hàng đa lựa chọn",
            params = {
                event = "fivem-appearance:clothingMenu",
            }
        },
		{
            header = "Thay quần áo",
			txt = "Mặc bất kỳ trang phục nào trong tủ quần áo của bạn",
            params = {
                event = "fivem-appearance:pickNewOutfit",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
		{
            header = "Lưu trang phục ",
			txt = "Lưu quần áo bạn đang mặc vào tủ quần áo của bạn",
            params = {
                event = "fivem-appearance:saveOutfit",
            }
        },
		{
            header = "Xóa quần áo",
			txt = "Vâng... Nếu có điều gì bạn không thích, bạn là nhất",
            params = {
                event = "fivem-appearance:deleteOutfitMenu",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)

RegisterNetEvent('fivem-appearance:pickNewOutfit', function(data)
    local id = data.id
    local number = data.number
	TriggerEvent('fivem-appearance:getOutfits')
	Wait(150)
	local outfitMenu = {
        {
            header = '< Quay lại',
            params = {
                event = 'fivem-appearance:clothingShop'
            }
        }
    }
    for i=1, #allMyOutfits, 1 do
        outfitMenu[#outfitMenu + 1] = {
            header = allMyOutfits[i].name,
            params = {
                event = 'fivem-appearance:setOutfit',
                args = {
					-- number = (1 + i),
					ped = allMyOutfits[i].pedModel, 
					components = allMyOutfits[i].pedComponents, 
					props = allMyOutfits[i].pedProps
				}
            }
        }
    end
    exports['et-menu']:openMenu(outfitMenu)
end)

RegisterNetEvent('fivem-appearance:getOutfits', function()
	TriggerServerEvent('fivem-appearance:getOutfits')
end)

RegisterNetEvent('fivem-appearance:sendOutfits', function(myOutfits)
	local Outfits = {}
	for i=1, #myOutfits, 1 do
		table.insert(Outfits, {id = myOutfits[i].id, name = myOutfits[i].name, pedModel = myOutfits[i].ped, pedComponents = myOutfits[i].components, pedProps = myOutfits[i].props})
	end
	allMyOutfits = Outfits
end)

RegisterNetEvent('fivem-appearance:setOutfit', function(data)
	local pedModel = data.ped
	local pedComponents = data.components
	local pedProps = data.props
	local playerPed = PlayerPedId()
	local currentPedModel = exports['fivem-appearance']:getPedModel(playerPed)
	if currentPedModel ~= pedModel then
    	exports['fivem-appearance']:setPlayerModel(pedModel)
		Wait(500)
		playerPed = PlayerPedId()
		exports['fivem-appearance']:setPedComponents(playerPed, pedComponents)
		exports['fivem-appearance']:setPedProps(playerPed, pedProps)
		local appearance = exports['fivem-appearance']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
	else
		exports['fivem-appearance']:setPedComponents(playerPed, pedComponents)
		exports['fivem-appearance']:setPedProps(playerPed, pedProps)
		local appearance = exports['fivem-appearance']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
	end
	-- TriggerEvent('fivem-appearance:clothingShop')
end)

RegisterNetEvent('fivem-appearance:saveOutfit', function()
	local keyboard = exports['et-input']:ShowInput({
        header = "Tên Outfit của bạn",
        submitText = "Tạo Outfit",
        inputs = {
            {
                text = "Tên Outfit",
                name = "input",
                type = "text",
                isRequired = true
            },
        },
    })

	if keyboard ~= nil then
		local playerPed = PlayerPedId()
		local pedModel = exports['fivem-appearance']:getPedModel(playerPed)
		local pedComponents = exports['fivem-appearance']:getPedComponents(playerPed)
		local pedProps = exports['fivem-appearance']:getPedProps(playerPed)
		Wait(500)
		TriggerServerEvent('fivem-appearance:saveOutfit', keyboard.input, pedModel, pedComponents, pedProps)
		QBCore.Functions.Notify('Outfit '..keyboard.input.. ' này đã được lưu', 'success')
	end
end)

RegisterNetEvent('fivem-appearance:deleteOutfitMenu', function(data)
    local id = data.id
    local number = data.number
	TriggerEvent('fivem-appearance:getOutfits')
	Wait(150)
	local DeleteMenu = {
        {
            header = '< Quay lại',
            params = {
                event = 'fivem-appearance:clothingShop'
            }
        }
    }
    for i=1, #allMyOutfits, 1 do
        DeleteMenu[#DeleteMenu + 1] = {
            header = 'Delete "'..allMyOutfits[i].name..'"',
			txt = 'Bạn sẽ không bao giờ có thể lấy lại được!',
            params = {
				event = 'fivem-appearance:deleteOutfit',
				args = allMyOutfits[i].id
			}
        }
    end
    exports['et-menu']:openMenu(DeleteMenu)
end)

RegisterNetEvent('fivem-appearance:deleteOutfit', function(id)
	TriggerServerEvent('fivem-appearance:deleteOutfit', id)
	-- TriggerEvent('fivem-appearance:clothingShop')
	QBCore.Functions.Notify('Outfit đã xóa', 'error')
end)

RegisterNetEvent("fivem-appearance:purchase", function(bool)
    isPurchaseSuccessful = bool
end)

RegisterNetEvent('fivem-appearance:clothingMenu', function()
	TriggerServerEvent('fivem-appearances:buyclothing')
	Wait(500)
	if isPurchaseSuccessful then
		local config = {
			ped = false,
			headBlend = false,
			faceFeatures = false,
			headOverlays = false,
			components = true,
			props = true
		}
		
		exports['fivem-appearance']:startPlayerCustomization(function(appearance)
			if appearance then
				TriggerServerEvent('fivem-appearance:save', appearance)
				print('Quần áo đã lưu')
				Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
				TriggerServerEvent('Select:Tattoos')
			else
				print('Đã hủy')
				Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
				TriggerServerEvent('Select:Tattoos')
			end
		end, config)
	end
end)

RegisterNetEvent('fivem-appearance:barberMenu', function()
	local config = {
		ped = false,
		headBlend = false,
		faceFeatures = false,
		headOverlays = true,
		components = false,
		props = false
	}

	exports['fivem-appearance']:startPlayerCustomization(function (appearance)
		if appearance then
			TriggerServerEvent('fivem-appearance:save', appearance)
			print('Quần áo đã lưu')
			Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
			TriggerServerEvent('Select:Tattoos')
		else
			print('Đã hủy')
			Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
			TriggerServerEvent('Select:Tattoos')
		end
	end, config)
end)

-- Backwords Events so you dont need to replace these

RegisterNetEvent('et-clothing:client:openMenu', function()  -- Admin Menu clothing event
	Wait(500)
	local config = {
		ped = true,
		headBlend = true,
		faceFeatures = true,
		headOverlays = true,
		components = true,
		props = true
	}
	
	exports['fivem-appearance']:startPlayerCustomization(function(appearance)
		if appearance then
			TriggerServerEvent('fivem-appearance:save', appearance)
			print('Quần áo đã lưu')
			Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
			TriggerServerEvent('Select:Tattoos')
		else
			print('Đã hủy')
			Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
			TriggerServerEvent('Select:Tattoos')
		end
	end, config)
end)

RegisterNetEvent('et-clothing:client:openOutfitMenu', function()  -- Name is so that you dont have to replace the event, Used in Appartments, Bossmenu, etc...
	exports['et-menu']:openMenu({
        {
            header = "👔 | Tùy chọn trang phục",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
		{
            header = "Thay đổi trang phục",
			txt = "Chọn bất kỳ trang phục nào đã lưu của bạn",
            params = {
                event = "fivem-appearance:pickNewOutfitApp",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
		{
            header = "Lưu Outfit mới",
			txt = "Lưu một bộ trang phục mới mà bạn có thể sử dụng sau này",
            params = {
                event = "fivem-appearance:saveOutfit",
            }
        },
		{
            header = "Xóa trang phục",
			txt = "Yeah... Chúng tôi cũng không thích cái đó",
            params = {
                event = "fivem-appearance:deleteOutfitMenu",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)


RegisterNetEvent('fivem-appearance:pickNewOutfitApp', function(data)
    local id = data.id
    local number = data.number
	TriggerEvent('fivem-appearance:getOutfits')
	Wait(150)
	local outfitMenu = {
        {
            header = '< Quay lại',
            params = {
                event = 'et-clothing:client:openOutfitMenu'
            }
        }
    }
    for i=1, #allMyOutfits, 1 do
        outfitMenu[#outfitMenu + 1] = {
            header = allMyOutfits[i].name,
            params = {
                event = 'fivem-appearance:setOutfit',
                args = {
					-- number = (1 + i),
					ped = allMyOutfits[i].pedModel, 
					components = allMyOutfits[i].pedComponents, 
					props = allMyOutfits[i].pedProps
				}
            }
        }
    end
    exports['et-menu']:openMenu(outfitMenu)
end)

RegisterNetEvent('fivem-appearance:deleteOutfitMenuApp', function(data)
    local id = data.id
    local number = data.number
	TriggerEvent('fivem-appearance:getOutfits')
	Wait(150)
	local DeleteMenu = {
        {
            header = '< Quay lại',
            params = {
                event = 'fivem-appearance:clothingShop'
            }
        }
    }
    for i=1, #allMyOutfits, 1 do
        DeleteMenu[#DeleteMenu + 1] = {
            header = 'Delete "'..allMyOutfits[i].name..'"',
			txt = 'You will never be able to get this back!',
            params = {
				event = 'fivem-appearance:deleteOutfit',
				args = allMyOutfits[i].id
			}
        }
    end
    exports['et-menu']:openMenu(DeleteMenu)
end)

-- Theads

--CreateThread(function()
--    while true do

--        Wait(0)

--        if CurrentAction ~= nil then

        --    if IsControlPressed(1, 38) then
    --            Wait(500)

            --    if CurrentAction == 'clothingMenu' then
    --                TriggerEvent("fivem-appearance:clothingShop")
        --        end
           
    --            if CurrentAction == 'barberMenu' then
    --                TriggerEvent("fivem-appearance:barberMenu")
    --            end
--
    --        end
--        end
--    end
--end)

CreateThread(function()
	for k,v in ipairs(Config.BarberShops) do
		local blip = AddBlipForCoord(v)

		SetBlipSprite (blip, 71)
		-- SetBlipColour (blip, 47)
		SetBlipScale (blip, 0.6)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('[Làm Đẹp] Cắt tóc 31 Shines')
		EndTextCommandSetBlipName(blip)
	end
	for k,v in ipairs(Config.ClothingShops) do
		local data = v
		if data.blip == true then
			local blip = AddBlipForCoord(data.coords)

			SetBlipSprite (blip, 73)
			SetBlipColour (blip, 47)
			SetBlipScale (blip, 0.6)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('[Làm Đẹp] Quần áo Louis Vuitton')
			EndTextCommandSetBlipName(blip)
		end
	end
end)

CreateThread(function()
	while true do
		local playerCoords, isInClothingShop, isInPDPresets, isInBarberShop, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, false, nil, true
		local sleep = 2000
		for k,v in pairs(Config.ClothingShops) do
			local data = v
			local distance = #(playerCoords - data.coords)

			if distance < Config.DrawDistance then
				sleep = 0
				if distance < data.MarkerSize.x then
					isInClothingShop, currentZone = true, k
				end
			end
		end

		for k,v in pairs(Config.BarberShops) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				sleep = 0
				if distance < Config.MarkerSize.x then
					isInBarberShop, currentZone = true, k
				end
			end
		end
		
		if (isInClothingShop and not hasAlreadyEnteredMarker) or (isInClothingShop and LastZone ~= currentZone) then
			hasAlreadyEnteredMarker, LastZone = true, currentZone
			CurrentAction     = 'clothingMenu'
			exports['et-drawtext']:DrawText('[E] Clothing Menu','left')
		end

		if (isInBarberShop and not hasAlreadyEnteredMarker) or (isInBarberShop and LastZone ~= currentZone) then
			hasAlreadyEnteredMarker, LastZone = true, currentZone
			CurrentAction     = 'barberMenu'
			exports['et-drawtext']:DrawText('[E] Barber Menu','left')
		end

		if not isInClothingShop and not isInBarberShop and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			sleep = 1000
			TriggerEvent('fivem-appearance:hasExitedMarker', LastZone)
			exports['et-drawtext']:HideText()
		end
		Wait(sleep)
	end
end)

-- Command(s)

RegisterCommand('reloadskin', function()
	local playerPed = PlayerPedId()
	local maxhealth = GetEntityMaxHealth(playerPed)
	local health = GetEntityHealth(playerPed)
	QBCore.Functions.TriggerCallback('fivem-appearance:getPlayerSkin', function(appearance)
		exports['fivem-appearance']:setPlayerAppearance(appearance)
	end)
	for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
	SetPedMaxHealth(PlayerId(), maxhealth)
	Citizen.Wait(1000) -- Safety Delay
	SetEntityHealth(PlayerPedId(), health)
    end
end)

-- Testing Command

RegisterCommand('skinmenu', function()
	local config = {
		ped = true,
		headBlend = true,
		faceFeatures = true,
		headOverlays = true,
		components = true,
		props = true,
	}
	exports['fivem-appearance']:startPlayerCustomization(function (appearance)
		if (appearance) then
			TriggerServerEvent('fivem-appearance:save', appearance)
			print('Player Clothing Saved')
			Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
			TriggerServerEvent('Select:Tattoos')
		else
			print('Canceled')
			Wait(1000) -- Wait is needed to clothing menu dosent overwrite the tattoos
			TriggerServerEvent('Select:Tattoos')
		end
	end, config)
end, false)
