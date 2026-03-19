local theSound = false -- ใช้สำรหับเก็บตัวแปรเสียง ห้ามแก้ไข
local loopedfile = false -- เล่นเสียงวนซ้ำ สำรหับเล่นเสียงโดยไฟล์ เช่น .mp3
local loopedurl = false -- เล่นเสียงวนซ้ำ สำรหับเล่นเสียงโดย URL เช่น ลิงค์เสียงภายนอก
local volume = 1 -- ระดับความดังของเสียง เริ่มต้น 1 ( 0 - 1.0 )
local fileurl = "https://ve61.aadika.xyz/download/fwK7ggA3-bU/mp3/128/1645174978/a468dfaf3a1d3f171e29ce4ff3dab0fab62cdb16f643940586cf88a35da91606/1?f=X2Download.com"
-- fileurl คือ ที่อยู่ของไฟล์เช่น music.mp3 หรือ URL ( ลิงค์เสียงภายนอก )

--[[
    Client : ทำงานเมื่อผู้เมื่อผู้เล่นเข้าร่วมเซิร์ฟเวอร์ Server จะเรียกใช้งานฟังชั่นนี้
]]--
addEvent ( "PlaySoundJoin", true )
addEventHandler ( "PlaySoundJoin", getRootElement(  ), 
function ( )
    theSound = playSound( fileurl, loopedfile, loopedurl )
    print( tostring( theSound ) .. " theSoun " )
    if theSound and isElement( theSound ) then
        setSoundVolume( theSound, volume )
    end
end
)

--[[
    Client : ทำงานเมื่อผู้เล่น เข้าสู่ระบบ สมาชิกสำเร็จ Server จะเรียกใช้งานฟังชั่นนี้
    ปิดเสียง และทำลายตัวแปรเสียงทำหมด
]]--
addEvent ( "MutePlaySoundLogin", true )
addEventHandler ( "MutePlaySoundLogin", getRootElement(  ), 
function ( )
    if theSound and isElement( theSound ) then
        stopSound( theSound )
    end
    sound = false
end
)
local screenWidth, screenHeight = guiGetScreenSize( )
local font = guiCreateFont( "font/US.ttf", 17)
local font1 = guiCreateFont( "font/US.ttf", 24)
local font2 = guiCreateFont( "font/US.ttf", 26)
local font3 = guiCreateFont( "font/US.ttf", 28)
local font4 = guiCreateFont( "font/US.ttf", 30)

function fromlogin ( )
    showCursor ( true )
    showChat ( false)

    form_bg = guiCreateStaticImage ( 1, 1, 1920,1080, "img/bg.png", false)
    -- guiSetVisible ( form_bg, false)

    bgsz = guiCreateStaticImage ( screenWidth*0.275, screenHeight*0.289, screenWidth*0.448, screenHeight*0.467, "img/black.png", false, form_bg)
    guiSetVisible ( bgsz, false)
    guiSetProperty ( bgsz, "Disabled", "true")
    guiSetAlpha(bgsz, 0.50)
    form_login = guiCreateStaticImage ( screenWidth*0.27928, screenHeight*0.2943, screenWidth*0.44, screenHeight*0.456, "img/black.png", false, form_bg)
    guiSetVisible ( form_login, false)

    login_user = guiCreateLabel ( screenWidth*0.105, screenHeight*0.051, screenWidth*0.448, screenHeight*0.467, "Username:", false, form_login)
    guiSetFont ( login_user, font )
    login_user2 = guiCreateEdit( screenWidth*0.105, screenHeight*0.087, screenWidth*0.23, screenHeight*0.038, "", false, form_login)
    guiEditSetMaxLength ( login_user2, 32 )

    login_pass = guiCreateLabel ( screenWidth*0.105, screenHeight*0.137, screenWidth*0.448, screenHeight*0.467, "Password:", false, form_login)
    guiSetFont ( login_pass, font )
    login_pass2 = guiCreateEdit( screenWidth*0.105, screenHeight*0.172, screenWidth*0.23, screenHeight*0.038, "", false, form_login)
    guiEditSetMaxLength ( login_pass2, 32 )
    guiEditSetMasked ( login_pass2, true)

    checkbox_save = guiCreateCheckBox(screenWidth*0.124, screenHeight*0.3, screenWidth*0.23, screenHeight*0.038, "(Save Password!)", false, false, form_login)
	guiSetFont( checkbox_save, "default-small")

    btn_login = guiCreateStaticImage ( screenWidth*0.125, screenHeight*0.34, screenWidth*0.2, screenHeight*0.07, "img/orange.png", false, form_login)
    guiSetAlpha(btn_login, 0.97)
    mag_login = guiCreateLabel ( 0.2, 0.3, 1, 1, "Log in", true, btn_login)
    guiSetFont ( mag_login, font )



    form_register = guiCreateStaticImage ( screenWidth*0.27928, screenHeight*0.2943, screenWidth*0.44, screenHeight*0.456, "img/black.png", false, form_bg)
    guiSetVisible ( form_register, false)
    reg_user = guiCreateLabel ( screenWidth*0.105, screenHeight*0.051, screenWidth*0.448, screenHeight*0.467, "Username:", false, form_register)
    guiSetFont ( reg_user, font )
    reg_user2 = guiCreateEdit( screenWidth*0.105, screenHeight*0.087, screenWidth*0.23, screenHeight*0.038, "", false, form_register)
    guiEditSetMaxLength ( reg_user2, 32 )

    reg_pass = guiCreateLabel ( screenWidth*0.105, screenHeight*0.137, screenWidth*0.448, screenHeight*0.467, "Password:", false, form_register)
    guiSetFont ( reg_pass, font )
    reg_pass2 = guiCreateEdit( screenWidth*0.105, screenHeight*0.172, screenWidth*0.23, screenHeight*0.038, "", false, form_register)
    guiEditSetMaxLength ( reg_pass2, 32 )
    guiEditSetMasked ( reg_pass2, true)

    reg_confirmpass = guiCreateLabel ( screenWidth*0.105, screenHeight*0.215, screenWidth*0.448, screenHeight*0.467, "Confirm Password:", false, form_register)
    guiSetFont ( reg_confirmpass, font )
    reg_confirmpass2 = guiCreateEdit( screenWidth*0.105, screenHeight*0.25, screenWidth*0.23, screenHeight*0.038, "", false, form_register)
    guiEditSetMaxLength ( reg_confirmpass2, 32 )
    guiEditSetMasked ( reg_confirmpass2, true)

    show_pass = guiCreateCheckBox(screenWidth*0.124, screenHeight*0.3, screenWidth*0.23, screenHeight*0.038, "(Show Password!)", false, false, form_register)
	guiSetFont( show_pass, "default-small")

    btn_register = guiCreateStaticImage ( screenWidth*0.125, screenHeight*0.34, screenWidth*0.2, screenHeight*0.07, "img/green.png", false, form_register)
    guiSetAlpha(btn_register, 0.97)
    mag_register = guiCreateLabel ( 0.2, 0.3, 1, 1, "Sign up", true, btn_register)
    guiSetFont ( mag_register, font )


    local x, y, w, h = screenWidth*0.0881, screenHeight*0.753, screenWidth*0.13, screenHeight*0.055

    login2 = guiCreateLabel ( x, y, w, h, "Login", false, form_bg)
    guiSetVisible ( login2, false)
    login = guiCreateLabel ( x, y, w, h, "Login", false, form_bg)
    guiSetFont ( login, font1 )

    local x2, y2, w2, h2 = screenWidth*0.0881, screenHeight*0.819, screenWidth*0.13, screenHeight*0.055 -- 0.0371

    register2 = guiCreateLabel ( x2, y2, w2, h2, "Register", false, form_bg)
    guiSetVisible ( register2, false)
    register = guiCreateLabel ( x2, y2, w2, h2, "Register", false, form_bg)
    guiSetFont ( register, font1 )

    local username, password = loadLoginFromXML()
	
	if not ( username == "" or password == "") then
		guiCheckBoxSetSelected ( checkbox_save, true )
		guiSetText ( login_user2, tostring(username))
		guiSetText ( login_pass2, tostring(password))
	else
		guiCheckBoxSetSelected ( checkbox_save, false )
		guiSetText ( login_user2, tostring(username))
		guiSetText ( login_pass2, tostring(password))
	end

end
addEventHandler( "onClientResourceStart", resourceRoot, fromlogin )

addEventHandler( "onClientGUIClick", resourceRoot,
function ()

    if (source == login or source == login2) then
        guiSetFont ( login2, font2 )
        guiSetVisible ( login2, true)
        guiSetFont ( login2, font3 )
        guiLabelSetColor( login2, math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) )

        guiSetVisible ( form_login, true)
        guiSetVisible ( form_register, false)

         guiSetVisible ( bgsz, true)

    elseif (source == register or source == register2) then
        guiSetFont ( register2, font2 )
        guiSetVisible ( register2, true)
        guiSetFont ( register2, font3 )
        guiLabelSetColor( register2, math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) )
        
        guiSetVisible ( form_login, false)
        guiSetVisible ( form_register, true)

        guiSetVisible ( bgsz, true)

    end

    if (source == btn_register or source == mag_register) then
        local username = guiGetText(reg_user2)
        local password = guiGetText(reg_pass2)
        local password2 = guiGetText(reg_confirmpass2)
        onclientClicking( "register", username, password, password2)
    elseif (source == btn_login or source == mag_login) then
        local username = guiGetText(login_user2)
        local password = guiGetText(login_pass2)
        onclientClicking( "login", username, password)
    end

    if (source == show_pass) then
        if (guiCheckBoxGetSelected ( show_pass ) == true) then
            guiEditSetMasked ( reg_pass2, false)
            guiEditSetMasked ( reg_confirmpass2, false)
        else
            guiEditSetMasked ( reg_pass2, true)
            guiEditSetMasked ( reg_confirmpass2, true)
        end
    end

    if (source == form_bg) then
        guiSetVisible ( form_login, false)
        guiSetVisible ( form_register, false)
        guiSetVisible ( bgsz, false)
    end

end
)

addEventHandler ( "onClientMouseLeave", resourceRoot,
function ()

    if (source == login or source == login2) then
        guiSetFont ( login, font1 )
        guiSetVisible ( login2, false)
    elseif (source == register or source == register2) then
        guiSetFont ( register, font1 )
        guiSetVisible ( register2, false)
    end

    if (source == btn_login or source == mag_login) then
        guiSetPosition ( mag_login, 0.2, 0.3, true )
    elseif (source == btn_register or source == mag_register) then
        guiSetPosition ( mag_register, 0.2, 0.3, true )
    end
    
end
)

addEventHandler ( "onClientMouseEnter", resourceRoot,
function ()

    if (source == login or source == login2 ) then
        guiSetFont ( login, font2 )
        guiSetVisible ( login2, true)
        guiSetFont ( login2, font3 )
        guiLabelSetColor( login2, math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) )
    elseif (source == register or source == register2) then
        guiSetFont ( register, font2 )
        guiSetVisible ( register2, true)
        guiSetFont ( register2, font3 )
        guiLabelSetColor( register2, math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) )
    end

    if (source == btn_login or source == mag_login) then
        guiSetPosition ( mag_login, 0.15, 0.2, true )
    elseif (source == btn_register or source == mag_register) then
        guiSetPosition ( mag_register, 0.15, 0.2, true )
    end

end
)

function onclientClicking ( command, username, password, password2 )
    local localPlayerName = getPlayerName(getLocalPlayer())
    if (command == "login") then
        --  success , info , warning , error
        if (username:match("^%s*$")) then
            triggerServerEvent( "onPlayerclicklogin", getLocalPlayer(), "ชื่อผู้ใช้ว่างเปล่า! กรุณากรอบ Username","login_1", "warning", username, password )
        elseif (password:match("^%s*$")) then
            triggerServerEvent( "onPlayerclicklogin", getLocalPlayer(), "รหัสผ่านว่างเปล่า! กรุณากรอบ Password","login_2", "warning", username, password )
        elseif not (string.len(username) >= 4) then
            triggerServerEvent( "onPlayerclicklogin", getLocalPlayer(), "ชื่อผู้ใช้ของคุณสั้นเกินไป แนะนำมากกว่า 4 ตัว", "login_3", "warning", username, password )
        elseif not (string.len(password) >= 4) then
            triggerServerEvent( "onPlayerclicklogin", getLocalPlayer(), "รหัสผ่านของคุณสั้นเกินไป แนะนำมากกว่า 4 ตัว", "login_4", "warning", username, password )
        else

            if guiCheckBoxGetSelected ( checkbox_save ) == true then
                checksave = true
		    else
			    checksave = false
			end
            
            triggerServerEvent( "onPlayerclicklogin", getLocalPlayer(), "ยินดีต้อนรับคุณ : " ..localPlayerName.. " เข้าสู่เซิร์ฟเวอร์ ", "login_success", "success", username, password, checksave)

        end

    elseif (command == "register") then

        if (username:match("^%s*$")) then
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "ชื่อผู้ใช้ว่างเปล่า! กรุณากรอบ Username", "register_1", "warning", username, password )
        elseif (password:match("^%s*$")) then
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "รหัสผ่านว่างเปล่า! กรุณากรอบ Password", "register_2", "warning", username, password )
        elseif (password2:match("^%s*$")) then
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "ยืนยันรหัสผ่านว่างเปล่า! กรุณากรอบ Confirm Password", "register_3", "warning", username, password )
        elseif not (string.len(username) >= 0) then
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "ชื่อผู้ใช้ของคุณสั้นเกินไป แนะนำมากกว่า 4 ตัว", "register_4", "warning", username, password )
        elseif not (string.len(password) >= 0) then
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "รหัสผ่านของคุณสั้นเกินไป แนะนำมากกว่า 4 ตัว", "register_5", "warning", username, password )
        elseif (password ~= password2) then
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "รหัสผ่านไม่ตรงกัน! กรุณาลองใหม่อีกครั้ง", "register_6", "warning", username, password )
        else
            triggerServerEvent( "onPlayerclickregister", getLocalPlayer(), "ยินดีต้อนรับคุณ ID " ..username.. " PASS "..password.." เข้าสู่เซิร์ฟเวอร์ ", "register_success", "success", username, password )
        end

    end
end

function Welcometotheserver ( )
    guiSetVisible ( form_bg, false)
    showCursor ( false)
    showChat ( true) 
end
addEvent ( "Welcometotheserver", true)
addEventHandler ( "Welcometotheserver", root, Welcometotheserver)

function loadLoginFromXML ( )

	local xml_save_log_File = xmlLoadFile ("xml/userdata.xml")

    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("xml/userdata.xml", "login")
    end

    local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
    local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)

    if usernameNode and passwordNode then
        return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
    else
		return "", ""
    end

    xmlUnloadFile ( xml_save_log_File )

end

function saveLoginToXML ( username, password )

    local xml_save_log_File = xmlLoadFile ("xml/userdata.xml")

    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("xml/userdata.xml", "login")
    end

	if (username ~= "") then
		local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
		if not usernameNode then
			usernameNode = xmlCreateChild(xml_save_log_File, "username")
		end
		xmlNodeSetValue (usernameNode, tostring(username))
	end

	if (password ~= "") then
		local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
		if not passwordNode then
			passwordNode = xmlCreateChild(xml_save_log_File, "password")
		end		
		xmlNodeSetValue (passwordNode, tostring(password))
	end

    xmlSaveFile(xml_save_log_File)
    xmlUnloadFile (xml_save_log_File)
end

addEvent("saveLoginToXML", true)
addEventHandler("saveLoginToXML", getRootElement(), saveLoginToXML)

function resetSaveXML ( )

		local xml_save_log_File = xmlLoadFile ("xml/userdata.xml")

		if not xml_save_log_File then
			xml_save_log_File = xmlCreateFile("xml/userdata.xml", "login")
		end

		if (username ~= "") then
			local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
			if not usernameNode then
				usernameNode = xmlCreateChild(xml_save_log_File, "username")
			end
		end

		if (password ~= "") then
			local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
			if not passwordNode then
				passwordNode = xmlCreateChild(xml_save_log_File, "password")
			end		
			xmlNodeSetValue (passwordNode, "")
		end

		xmlSaveFile(xml_save_log_File)
		xmlUnloadFile (xml_save_log_File)

end
addEvent("resetSaveXML", true)
addEventHandler("resetSaveXML", getRootElement(), resetSaveXML)

