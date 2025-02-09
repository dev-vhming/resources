local QBCore = exports['et-core']:GetCoreObject()

-- Events

RegisterNetEvent('et-phone:server:InvoiceHandler')

-- EVENT HANDLER(S) --

-- Has player paid something this --
--[[AddEventHandler('et-phone:server:InvoiceHandler', function(paid, amount, source, resource)

    if paid and resource == GetCurrentResourceName() then
        if amount >= config.minPayment then
            if Config.RenewedBanking then
                local cid = Player.PlayerData.citizenid
                local name = ("%s %s"):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname)
                exports['Renewed-Banking']:handleTransaction(cid, "Phone Invoice", amount, "Paid off phone invoice of $"..amount, name, name, "withdraw")
            end
            -- Do shit
        end
    end
end)]]




RegisterNetEvent('et-phone:server:PayMyInvoice', function(society, amount, invoiceId, sendercitizenid, resource)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local SenderPly = QBCore.Functions.GetPlayerByCitizenId(sendercitizenid)
    if Player.PlayerData.money.bank >= amount then
        Player.Functions.RemoveMoney('bank', amount, "paid-invoice")
        if SenderPly and Config.BillingCommissions and Config.BillingCommissions[society] then
            local commission = math.ceil(amount * Config.BillingCommissions[society])
            SenderPly.Functions.AddMoney('bank', commission)
        end

        if SenderPly then
            TriggerClientEvent('et-phone:client:CustomNotification', SenderPly.PlayerData.source,
                "Invoice Paid off by " .. SenderPly.PlayerData.charinfo.firstname .. ".",
                "Recent Invoice of $" .. amount .. " has been paid.",
                "fas fa-file-invoice-dollar",
                "#1DA1F2",
                7500
            )
        end

        TriggerClientEvent('et-phone:client:RemoveInvoiceFromTable', src, invoiceId)
        TriggerEvent("et-phone:server:InvoiceHandler", true, amount, src, resource)

        exports.oxmysql:execute('DELETE FROM phone_invoices WHERE id = ?', {invoiceId})
    end
end)

RegisterNetEvent('et-phone:server:DeclineMyInvoice', function(amount, invoiceId, sendercitizenid, resource)
    local Ply = QBCore.Functions.GetPlayer(source)
    local SenderPly = QBCore.Functions.GetPlayerByCitizenId(sendercitizenid)
    if not Ply then return end

    exports.oxmysql:execute('DELETE FROM phone_invoices WHERE id = ?', {invoiceId})
    if SenderPly then
        TriggerClientEvent('et-phone:client:CustomNotification', SenderPly.PlayerData.source,
            "Invoice Declined by " .. SenderPly.PlayerData.charinfo.firstname .. ".",
            "Recent invoice of $" .. amount .. " has been declined.",
            "fas fa-file-invoice-dollar",
            "#1DA1F2",
            7500
        )
    end

    TriggerClientEvent('et-phone:client:RemoveInvoiceFromTable', source, invoiceId)
    TriggerEvent("et-phone:server:InvoiceHandler", false, amount, source, resource)
end)


RegisterNetEvent('et-phone:server:CreateInvoice', function(billed, biller, amount)
    local billedID = tonumber(billed)
    local cash = tonumber(amount)
    local billedCID = QBCore.Functions.GetPlayer(billedID)
    local billerInfo = QBCore.Functions.GetPlayer(biller)

    local resource = GetInvokingResource()

    if not billedID or not cash or not billedCID or not billerInfo then return end
    MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)',{
        billedCID.PlayerData.citizenid,
        cash,
        billerInfo.PlayerData.job.name,
        billerInfo.PlayerData.charinfo.firstname,
        billerInfo.PlayerData.citizenid
    }, function(id)
        if id then
            TriggerClientEvent('et-phone:client:AcceptorDenyInvoice', billedCID.PlayerData.source, id, billerInfo.PlayerData.charinfo.firstname, billerInfo.PlayerData.job.name, billerInfo.PlayerData.citizenid, cash, resource)
        end
    end)
end)

QBCore.Functions.CreateCallback('et-phone:server:GetInvoices', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local invoices = exports.oxmysql:executeSync('SELECT * FROM phone_invoices WHERE citizenid = ?', {Player.PlayerData.citizenid})
    cb(invoices)
end)
