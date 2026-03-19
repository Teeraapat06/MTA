addEventHandler ( "onPlayerJoin", root, 
function ( )
    triggerClientEvent( source, "PlaySoundJoin", source )
end
)

--[[
    server : ทำงานเมื่อผู้เล่นเข้าสู่ระบบ สมาชิกสำเร็จ
    สั่งทำงาน ฟังชั่นชื่อ MuteMusicLogin ที่อยู่ในไฟล์ Client
]]
addEventHandler("onPlayerLogin", root,
function ( )
    triggerClientEvent( source, "MutePlaySoundLogin", source )
end
)

function addNotification(player, text, type)
	if (player and text and type) then
		triggerClientEvent(player, 'addNotification', player, text, type)
	end
end

function resourceStart ( )
    showCursor ( source, true ) 
    showChat ( source, false) 
end
addEventHandler ("onResourceStart", getRootElement(), resourceStart)

function ResourceStop ( )
    showCursor ( source, true ) 
    showChat ( source, true) 
end
addEventHandler ("onResourceStop", getRootElement(), ResourceStop)

function setCameraOnPlayerJoin ( )
    showCursor ( source, true ) 
    showChat ( source, false ) 
    fadeCamera( source, true, 5 )
    setCameraMatrix( source, -1425.1640625, -292.2099609375, 14.1484375, -1425.1640625, -292.2099609375, 14.1484375 )
end
addEventHandler( "onPlayerJoin", root, setCameraOnPlayerJoin)

function onPlayerclicklogin ( text, status, status2, username, password, checksave )
    if (status == "login_1") then
        addNotification(client, text, status2)
    elseif (status == "login_2") then
        addNotification(client, text, status2)
    elseif (status == "login_3") then
        addNotification(client, text, status2)
    elseif (status == "login_4") then
        addNotification(client, text, status2)
    elseif (status == "login_success") then

        local account = getAccount( username, password )
        if ( account ~= false ) then
            logIn( client, account, password )
            triggerEvent("onPlayerDayZLogin", getRootElement(), username, password, client)
		    triggerClientEvent(client, "onClientPlayerLogin", client)
            triggerClientEvent(client, "Welcometotheserver", client)

            if (checksave == true) then
			    triggerClientEvent(client, "saveLoginToXML", getRootElement(), username, password)
			else
			    triggerClientEvent(client, "resetSaveXML", getRootElement(), username, password)
			end

            addNotification(client, text, status2)
        else
            addNotification(client, "ชื่อผู้ใช้งานไม่ถูกต้อง !", "error")
        end
        
    end

end
addEvent( "onPlayerclicklogin", true)
addEventHandler( "onPlayerclicklogin", root, onPlayerclicklogin)

function onPlayerclickregister ( text, status, status2, username, password )
    if (status == "register_1") then
        addNotification(client, text, status2)
    elseif (status == "register_2") then
        addNotification(client, text, status2)
    elseif (status == "register_3") then
        addNotification(client, text, status2)
    elseif (status == "register_4") then
        addNotification(client, text, status2)
    elseif (status == "register_5") then
        addNotification(client, text, status2)
    elseif (status == "register_6") then
        addNotification(client, text, status2)
    elseif (status == "register_success") then

        local accountAdded = addAccount(username, password)

        if (accountAdded) then
            local playername = getPlayerName ( client )
            outputChatBox("ยินดีต้อนรับเข้าสู่ประเทศ ".. playername .." ข้อมูลของตัวเราเเละหรัสผ่านของเรา" , client, 255, 255, 255, true)
            outputChatBox("#FF0000 ID :  #A6A6A6".. username , client, 255, 255, 255, true)
            outputChatBox("#FF0000 PASS :  #A6A6A6" .. password , client, 255, 255, 255, true)

            logIn(client, accountAdded, password)
            triggerEvent("onPlayerDayZRegister", getRootElement(), username, password, client)
            triggerClientEvent(client, "onClientPlayerLogin", client)
            addNotification(client, text, status2)
            triggerClientEvent(client, "Welcometotheserver", client)
        else
            addNotification(client, "ชื่อผู้ใช้งานนี้มีอยู่แล้ว !", "error")
        end
        
    end

end
addEvent( "onPlayerclickregister", true)
addEventHandler( "onPlayerclickregister", root, onPlayerclickregister)