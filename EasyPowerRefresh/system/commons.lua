--[[ 
	Easy Power Refresh
	
	Licensed by Creative Commons Attribution-ShareAlike 4.0
	http://creativecommons.org/licenses/by-sa/4.0/
	
	Designed By Onelua Team.
	Collaborators: Chronoss & Wzjk.
]]

function setupfonts()
charfont = "sa0:data/font/pvf/psexchar.pvf"
cnfont = "sa0:data/font/pvf/cn0.pvf"
jpnfont = "sa0:data/font/pvf/jpn0.pvf"
ltnfont = "sa0:data/font/pvf/ltn4.pvf"
krfont = "sa0:data/font/pvf/kr0.pvf"
jpnpgf = "sa0:data/font/pgf/jpn0.pgf"
ltnpgf = "sa0:data/font/pgf/ltn0.pgf"

char_fnt = font.load(charfont)
if __LANG == "RUSSIAN" or __LANG == "POLISH"  then font.setdefault(ltnpgf) else font.setdefault(jpnpgf) end
end

-- Loading special glyphs (buttons, symbols, etc.)
function preloadsymbols()
 if char_fnt then -- Use oficial ps symbols. Will not work without preloaded psexchr.pvf font
SYMBOL_TRIANGLE   = " "
SYMBOL_CIRCLE	  = "!"
SYMBOL_CROSS	  = "\""
SYMBOL_SQUARE     = "#"
BTN_TRIANGLE      = "$"
BTN_CIRCLE        = "%"
BTN_CROSS  	      = "&"
BTN_SQUARE        = "'"
BTN_TRIANGLE_T    = "("  -- _T - transparent button
BTN_CIRCLE_T	  = ")"
BTN_CROSS_T       = "*"
BTN_SQUARE_T      = "+"
BTN_DPADUP        = ","
BTN_DPADDOWN      = "-"
BTN_DPADLEFT      = "."
BTN_DPADRIGHT     = "/"
BTN_L             = "0"
BTN_R             = "1"
STICK_L           = "2"
STICK_R           = "3"
BTN_SELECT        = "4"
BTN_START         = "5"
BTN_PS            = "6"
BTN_POWER         = "7"
BTN_VOLUP         = "8"
BTN_VOLDN         = "9"
SYMBOL_USB        = ":"
SYMBOL_CLOCK1     = ";"
SYMBOL_CLOCK2     = "<"
SYMBOL_HOME       = "="
SYMBOL_PIN        = ">"
SYMBOL_BACKSPACE  = "@"
SYMBOL_UPARROW    = "A"
SYMBOL_KEYBOARD   = "B"
SYMBOL_ENTER      = "C"
LOGO_PS           = "D"
LOGO_DNAS         = "E"
LOGO_ATRAC        = "F"
LOGO_PSPLUS       = "G"
 else char_fnt = font.load(jpnfont)
SYMBOL_TRIANGLE	  = string.char(0xe2)..string.char(0x96)..string.char(0xb3)
SYMBOL_CIRCLE	  = string.char(0xe2)..string.char(0x97)..string.char(0x8b)
SYMBOL_CROSS	  = string.char(0xe2)..string.char(0x95)..string.char(0xb3)
SYMBOL_SQUARE	  = string.char(0xe2)..string.char(0x96)..string.char(0xa1)
BTN_TRIANGLE      = string.char(0xe2)..string.char(0x96)..string.char(0xb3) -- button symbol is not exists in psp/psv fonts so you may need a trick: draw SYMBOL_CIRCLE bottom that SYMBOL_TRIANGLE AND at the same coords
BTN_CIRCLE        = string.char(0xe2)..string.char(0x97)..string.char(0x8e)
BTN_CROSS  	      = string.char(0xe2)..string.char(0x8a)..string.char(0x97)
BTN_SQUARE        = string.char(0xe3)..string.char(0x8b)..string.char(0xba)
BTN_TRIANGLE_T    = BTN_TRIANGLE
BTN_CIRCLE_T	  = BTN_CIRCLE
BTN_CROSS_T       = BTN_CROSS
BTN_SQUARE_T      = BTN_SQUARE
BTN_DPADUP        = string.char(0xe2)..string.char(0x87)..string.char(0xa7)
BTN_DPADDOWN      = string.char(0xe2)..string.char(0x87)..string.char(0xa9)
BTN_DPADLEFT      = string.char(0xe2)..string.char(0x87)..string.char(0xa6)
BTN_DPADRIGHT     = string.char(0xe2)..string.char(0x87)..string.char(0xa8)
BTN_L             = string.char(0xe2)..string.char(0x93)..string.char(0x81)
BTN_R             = string.char(0xe2)..string.char(0x93)..string.char(0x87)
STICK_L           = "L-Analog"                                              -- alt text only :/
STICK_R           = "R-Analog"
BTN_SELECT        = "Select"
BTN_START         = "Start"
BTN_PS            = "PS Button"
BTN_POWER         = string.char(0xe2)..string.char(0x93)..string.char(0x9b)
BTN_VOLUP         = string.char(0xe2)..string.char(0x8a)..string.char(0x95)
BTN_VOLDN         = string.char(0xe2)..string.char(0x8a)..string.char(0x96)
SYMBOL_USB        = string.char(0xe2)..string.char(0x87)..string.char(0x8c)
SYMBOL_CLOCK1     = "_"
SYMBOL_CLOCK2     = "_"
SYMBOL_HOME       = string.char(0xe2)..string.char(0xbe)..string.char(0x95)
SYMBOL_PIN        = string.char(0xe2)..string.char(0x98)..string.char(0x9f)
SYMBOL_BACKSPACE  = string.char(0xe2)..string.char(0x86)..string.char(0x90)
SYMBOL_UPARROW    = string.char(0xe2)..string.char(0x86)..string.char(0x91)
SYMBOL_KEYBOARD   = string.char(0xe2)..string.char(0x8a)..string.char(0x9e)
SYMBOL_ENTER      = string.char(0xe2)..string.char(0x86)..string.char(0x99)
LOGO_PS           = string.char(0xe3)..string.char(0x8e)..string.char(0xb0)
LOGO_DNAS         = "DNAS"
LOGO_ATRAC        = string.char(0xe2)..string.char(0x99)..string.char(0xab)
LOGO_PSPLUS       = LOGO_PS..string.char(0xe2)..string.char(0x9c)..string.char(0x9a)
 end

end

function onAppInstall(step, size_argv, written, file, totalsize, totalwritten)

	if back then back:blit(0,0) end

	if step == 2 then												--Confirmation
		os.delay(10)
		return 10 -- Ok
	elseif step == 4 then											-- Installing
		screen.print(910,30,"Easy Power Refresh",1,color.white,color.blue,__ARIGHT)
		screen.print(910,60,"v2.0",1,color.white,color.blue,__ARIGHT)
		screen.print(70,50,strings.install,1,color.white,color.blue)
		screen.print(10,435,title, 0.9, color.white, color.green, __ALEFT)
		screen.print(10,470,version, 0.9, color.white, color.green, __ALEFT)
		screen.flip()
	end

end

function usbMassStorage()

	local bufftmp = screen.buffertoimage()
	while usb.actived() != 1 do
		buttons.read()
		power.tick(1)

		if bufftmp then bufftmp:blit(0,0) elseif back then back:blit(0,0) end

		local titlew = string.format(strings.connectusb)
		local w,h = screen.textwidth(titlew,1) + 30,70
		local x,y = 480 - (w/2), 272 - (h/2)

		draw.fillrect(x, y, w, h, color.new(0x2f,0x2f,0x2f,0xff))
		draw.rect(x, y, w, h,color.white)
			screen.print(480,y+13, strings.connectusb,1,color.white,color.black,__ACENTER)
			screen.print(char_fnt,420,y+40, BTN_CIRCLE_T,1,color.white,color.black,__ALEFT)
			screen.print(450,y+40, " "..strings.cancelusb,1,color.white,color.black,__ALEFT)
		screen.flip()

		if buttons.circle then return false end
	end

	buttons.read()--fflush

	--[[
		// 0:	USBDEVICE_MODE_MEMORY_CARD
		// 1:	USBDEVICE_MODE_GAME_CARD
		// 2:	USBDEVICE_MODE_SD2VITA
		// 3:	USBDEVICE_MODE_PSVSD
		"ux0:","ur0:","uma0:","gro0:","grw0:"
	]]
	local mode_usb = -1
	local title = string.format(strings.usbmode)
	local w,h = screen.textwidth(title,1) + 120,145
	local x,y = 480 - (w/2), 272 - (h/2)
	while true do
		buttons.read()
		power.tick(1)
		if bufftmp then bufftmp:blit(0,0) elseif back then back:blit(0,0) end

		draw.fillrect(x, y, w, h, color.new(0x2f,0x2f,0x2f,0xff))
			screen.print(480, y+5, title,1,color.white,color.black, __ACENTER)
			screen.print(char_fnt, 410,y+35, BTN_CROSS_T, 1,color.white,color.black, __ALEFT)
			screen.print(440,y+35, strings.sd2vita, 1,color.white,color.black, __ALEFT)
			screen.print(char_fnt, 410,y+55, BTN_SQUARE_T, 1,color.white,color.black, __ALEFT)
			screen.print(440,y+55, strings.memcard, 1,color.white,color.black, __ALEFT)
			screen.print(char_fnt, 410,y+75, BTN_TRIANGLE_T, 1,color.white,color.black, __ALEFT)
			screen.print(440,y+75, strings.gamecard, 1,color.white,color.black, __ALEFT)
			screen.print(char_fnt, 420,y+110, BTN_CIRCLE_T, 1,color.white,color.black, __ALEFT)
			screen.print(450,y+110, strings.cancel, 1,color.white,color.black, __ALEFT)
		screen.flip()

		if buttons.released.cross or buttons.released.square or
			buttons.released.triangle or buttons.released.circle then break end
	end--while

	if buttons.released.cross then			-- Press X
		mode_usb = 2
	elseif buttons.released.square then		-- Press []
		mode_usb = 0
	elseif buttons.released.triangle then	-- Press Triangle
		mode_usb = 1
	else
		return
	end

	local conexion = usb.start(mode_usb)
	if conexion == -1 then os.message(strings.usbfail,0) return end

	local titlew = string.format(strings.usbconnection)
	local w,h = screen.textwidth(titlew,1) + 30,70
	local x,y = 480 - (w/2), 272 - (h/2)
	while not buttons.circle do
		buttons.read()
		power.tick(1)

		if bufftmp then bufftmp:blit(0,0) elseif back then back:blit(0,0) end

		draw.fillrect(x,y,w,h,color.new(0x2f,0x2f,0x2f,0xff))
		draw.rect(x,y,w,h,color.white)
			screen.print(480,y+13, strings.usbconnection,1,color.white,color.black,__ACENTER)
			screen.print(char_fnt,420,y+40, BTN_CIRCLE_T,1,color.white,color.black,__ALEFT)
			screen.print(450,y+40, strings.cancelusb,1,color.white,color.black,__ALEFT)
		screen.flip()
	end

	usb.stop()

	--Update Search Nonpdrm games
	scan.app()
	infodevices()
	buttons.read()--fflush

end

--[[
	## Library Scroll ##
	Designed By DevDavis (Davis Nuñez) 2011 - 2016.
	Based on library of Robert Galarga.
	Create a obj scroll, this is very usefull for list show
	]]
function newScroll(a,b,c)
	local obj = {ini=1,sel=1,lim=1,maxim=1,minim = 1}

	function obj:set(tab,mxn,modemintomin) -- Set a obj scroll
		obj.ini,obj.sel,obj.lim,obj.maxim,obj.minim = 1,1,1,1,1
		--os.message(tostring(type(tab)))
		if(type(tab)=="number")then
			if tab > mxn then obj.lim=mxn else obj.lim=tab end
			obj.maxim = tab
		else
			if #tab > mxn then obj.lim=mxn else obj.lim=#tab end
			obj.maxim = #tab
		end
		if modemintomin then obj.minim = obj.lim end
	end

	function obj:max(mx)
		obj.maxim = #mx
	end

	function obj:up()
		if obj.sel>obj.ini then obj.sel=obj.sel-1
		elseif obj.ini-1>=obj.minim then
			obj.ini,obj.sel,obj.lim=obj.ini-1,obj.sel-1,obj.lim-1
		end
	end

	function obj:down()
		if obj.sel<obj.lim then obj.sel=obj.sel+1
		elseif obj.lim+1<=obj.maxim then
			obj.ini,obj.sel,obj.lim=obj.ini+1,obj.sel+1,obj.lim+1
		end
	end

	if a and b then
		obj:set(a,b,c)
	end

	return obj

end

infoux0, infour0, infouma0 = {},{},{}
function infodevices()
	infoux0 = os.devinfo("ux0:")
	if files.exists("ur0:") then
		infour0 = os.devinfo("ur0:")
	end
	if files.exists("uma0:") then
		infouma0 = os.devinfo("uma0:")
	end

	infoux0.maxf = files.sizeformat(infoux0.max or 0)
	infour0.maxf = files.sizeformat(infour0.max or 0)
	infouma0.maxf = files.sizeformat(infouma0.max or 0)

	infoux0.freef = files.sizeformat(infoux0.free or 0)
	infour0.freef = files.sizeformat(infour0.free or 0)
	infouma0.freef = files.sizeformat(infouma0.free or 0)

end
