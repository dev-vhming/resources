local QBCore = exports['et-core']:GetCoreObject()

-- Callback

QBCore.Functions.CreateCallback('et-customs:server:checkMoney', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('cash', amount) then cb(true)
    elseif Player.Functions.RemoveMoney('bank', amount) then cb(true)
    else cb(false) end
end)