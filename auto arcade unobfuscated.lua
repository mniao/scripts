local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer

local toggled = false
local isRunning = false

local args = {
    [1] = "EndDialogue",
    [2] = {
        ["NPC"] = "Item Machine",
        ["Option"] = "Option1",
        ["Dialogue"] = "Dialogue1"
    }
}


local function update(newValue)
	toggled = newValue

	if toggled then
		isRunning = true
		while toggled do
			plr.Character.RemoteEvent:FireServer(unpack(args))
			wait(.25)
		end
		isRunning = false
	end
end

local material = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua')))()
local newUi = material.Load({
	SizeY = 80,
	Title = "Auto Arcade",
	Theme = "Dark",
	Style = 3
})

local mainPage = newUi.New({
	Title = ""
})

local mainToggle = mainPage.Toggle({
	Text = "Enable",
	Callback = update,
	Enabled = toggled
})