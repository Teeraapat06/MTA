local screenWidth, screenHeight = guiGetScreenSize()

--Let's create a new browser in local mode. We will not be able to load an external URL.
local webBrowser = createBrowser(screenWidth, screenHeight, true, true )
	
local speedometer = false
--This is the function to render the browser.
function webBrowserRender()
	--Render the browser on the full size of the screen.
	dxDrawImage(0, 0, screenWidth, screenHeight, webBrowser, 0, 0, 0, tocolor(255,255,255,255), true)


    local blood = (getElementData( getLocalPlayer(  ), "blood" ) /120)
    local maxBlood = 100

    if blood > maxBlood then blood = maxBlood end

    local armor = getPedArmor( getLocalPlayer(  ) )
    local maxArmor = 100

    if armor > maxArmor then armor = maxArmor end

    local stammina = getElementData( getLocalPlayer(  ), "stammina" ) or 0
    local maxStammina = 100

    if stammina > maxStammina then stammina = maxStammina end

    local food = getElementData( getLocalPlayer(  ), "food" ) or 0
    local maxFood = 100

    if food > maxFood then food = maxFood end

    local thirst = getElementData( getLocalPlayer(  ), "brain" ) or 0
    local maxThirst = 100

    if thirst > maxThirst then thirst = maxThirst end

    local hud = {
        ["PlayerName"] = (getElementData(localPlayer, "playerID") or 0 ),
        ["playerRadius"] = (getElementData(localPlayer, "chatRadius") or 0 ),
        ["Medic"] = (getElementData(localPlayer, "onlinePolice") or 0 ),
        ["Police"] = (getElementData(localPlayer, "onlineMedic") or 0 ),
        ["Blood"] = math.floor( blood ),
        ["MaxBlood"] = maxBlood,
        ["Armor"] = math.floor( armor ),
        ["MaxArmor"] = maxArmor,
        ["Stammina"] = stammina,
        ["MaxStammina"] = maxStammina,

        ["Food"] = food,
        ["MaxFood"] = maxFood,
        ["Thirst"] = thirst,
        ["MaxThirst"] = maxThirst -- สุดท้ายไม่ต้องใส่ , ก็ได้นะ
    }

    executeBrowserJavascript( webBrowser, "updata ( " .. toJSON( hud ) .. ")" )

end

--The event onClientBrowserCreated will be triggered, after the browser has been initialized.
--After this event has been triggered, we will be able to load our URL and start drawing.
addEventHandler("onClientBrowserCreated", webBrowser, 
	function()
		--After the browser has been initialized, we can load our file.
		loadBrowserURL(webBrowser, "http://mta/local/view/index.html")
		--Now we can start to render the browser.
		addEventHandler("onClientRender", root, webBrowserRender)
	end
)


--=====================================================================================--
--=====================================================================================--

