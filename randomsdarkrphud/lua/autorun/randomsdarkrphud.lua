/////////////////////////////
//Author:ThatRandomPerson45//
//		Version:0.1		   //
/////////////////////////////
if !CLIENT then return end
hook.Add( "InitPostEntity", "HUDStart", function()
	print( "Initialization hook called" )
surface.CreateFont("RandomFont", {
	font="Arial",
	size=25,
	weight=500,
	blursize=0,
	scanlines=0,
	antialias=true,
	underline=false,
	italic=false,
	strikeout=false,
	symbol=false,
	rotary=false,
	shadow=false,
	additive=false,
	outline=false,
})

local client = LocalPlayer()

local hide = {
	["CHudHealth"]=true,
	["CHudBattery"]=true,
	["CHudAmmo"]=true,
	["CHudSecondaryAmmo"]=true,
	["DarkRP_Hungermod"]=true
}
local function HUDShouldDraw(name)
	if (hide[name]) then
		return false;
	end
end
hook.Add("HUDShouldDraw", "HUDHider", HUDShouldDraw)

hook.Add("HUDPaint", "DrawMyHud", function()
	draw.RoundedBox(10, 6, ScrH()-140, 516, ScrH(), Color(255,255,255,100))

	local name = client:Name()
	draw.RoundedBox(10, 170, ScrH()-135, 350, 25, Color(40,40,40))
	draw.SimpleText(client:Name(), "RandomFont", 175, ScrH()-135, Color(255,255,255), 0, 0)

	draw.SimpleText(team.GetName(client:Team()), "RandomFont", 510, ScrH()-135, Color( 255, 255, 255, 255 ), 2, 2)

	local health = client:Health()
	draw.RoundedBox(10, 8, ScrH()-100, 300+4, 30+4, Color(40,40,40))
	draw.RoundedBox(10, 10, ScrH()-98, health*3, 30, Color(255,120,120))
	draw.SimpleText(health.."%","RandomFont", 10+150, ScrH()-98+15, Color( 255, 255, 255, 255 ), 1, 1)
	
	local armor = client:Armor()
	draw.RoundedBox(10, 8, ScrH()-60, 300+4, 30+4, Color(40,40,40))
	draw.RoundedBox(10, 10, ScrH()-58, armor*3, 30, Color(0,0,102))
	draw.SimpleText(armor.."%","RandomFont", 10+150, ScrH()-58+15, Color( 255, 255, 255, 255 ), 1, 1)

	draw.RoundedBox(10, 8, ScrH()-135, 150+4, 25+4, Color(40,40,40))
	draw.RoundedBox(10, 10, ScrH()-133, 150, 25, Color(0,204,0))
	
	draw.SimpleText( "$"..client:getDarkRPVar("money"), "RandomFont", 15, ScrH()-133, Color(255,255,255), 0, 0)

	draw.RoundedBox(10, 320, ScrH()-100, 200, 74.5, Color(40,40,40))

	if (client:GetActiveWeapon():GetPrintName()!=nil) then
		draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "RandomFont", 325, ScrH()-95, Color(255,255,255,255),0,0)
	end

	if (client:GetActiveWeapon():Clip1() != -1) then
		draw.SimpleText("Ammo: "..client:GetActiveWeapon():Clip1().."/"..client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()),"RandomFont",325,ScrH()-75,Color(255,255,255),0,0)
	else
		draw.SimpleText("Ammo: "..client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "RandomFont", 325, ScrH()-75, Color( 255, 255, 255, 255 ), 0, 0)
	end

	if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) >0) then
		draw.SimpleText("Secondary: "..client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), "RandomFont", 325, ScrH()-55, Color( 255, 255, 255, 255 ), 0, 0)
	end
end)
end)