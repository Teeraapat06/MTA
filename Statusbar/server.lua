function getOnlinePolice()
	local t = {}
	for k,v in ipairs ( getElementsByType("player") ) do
		if getElementData(v,"PolicePed") and not getElementData(v,"OffDuty") then
			table.insert(t,v)
		end		
	end
	return t
end

function getOnlineMedic()
	local t = {}
	for k,v in ipairs ( getElementsByType("player") ) do
		if getElementData(v,"MedicPed") and not getElementData(v,"OffDuty") then
			table.insert(t,v)
		end
	end
	return t
end

function getOnlineMc()
	local t = {}
	for k,v in ipairs ( getElementsByType("player") ) do
		if getElementData(v,"Mc") and not getElementData(v,"OffDuty") then
			table.insert(t,v)
		end
	end
	return t
end

function checktimeOnline()
local Polices = getOnlinePolice()
local Medics = getOnlineMedic()
local Mcs = getOnlineMc()
	--if #Polices ~= 0 or #Medics ~= 0 or #Mcs ~= 0 then
		for i,player in ipairs(getElementsByType("player"))do
			setElementData(player,"onlinePolice",#Polices or 0)
			setElementData(player,"onlineMedic",#Medics or 0)
			setElementData(player,"onlineMc",#Mcs or 0)
		end
	--end
end 
setTimer(checktimeOnline,1500,0)