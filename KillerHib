--// ☠️ KILLER HUB v4 - FINAL STABLE ☠️ //--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end

local char = getChar()
local humanoid = char:WaitForChild("Humanoid")

local savedSpeed = 16
local savedJump = 50
local noclip = false
local esp = false
local savedCFrame
local damageMultiplier = 1

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "KillerHub"
gui.ResetOnSpawn = false

-- Sound
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://9118828561"
sound.Volume = 1

-- OPEN BUTTON
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,60,0,60)
openBtn.Position = UDim2.new(0,20,0.5,-30)
openBtn.Text = "KILL"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 16
openBtn.BackgroundColor3 = Color3.fromRGB(0,160,170)
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.Active = true
openBtn.Draggable = true
Instance.new("UICorner", openBtn)

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,460,0,330)
main.Position = UDim2.new(0.5,-230,0.5,-165)
main.BackgroundColor3 = Color3.fromRGB(0,110,120)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,34)
title.BackgroundTransparency = 1
title.Text = "☠️ KILLER HUB ☠️"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

-- CLOSE
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0,32,0,32)
closeBtn.Position = UDim2.new(1,-38,0,2)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 15
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.BackgroundColor3 = Color3.fromRGB(0,160,170)
Instance.new("UICorner", closeBtn)

closeBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	sound:Play()
end)

openBtn.MouseButton1Click:Connect(function()
	main.Visible = true
	sound:Play()
end)

-- CREDITOS (MAS GRANDES, DISCRETOS)
local credits = Instance.new("TextLabel", main)
credits.Size = UDim2.new(1,0,0,24)
credits.Position = UDim2.new(0,0,1,-24)
credits.BackgroundTransparency = 1
credits.Text = "Creado Por Mango Script's"
credits.Font = Enum.Font.Gotham
credits.TextSize = 14
credits.TextColor3 = Color3.fromRGB(35,35,35)

-- TABS
local tabs, pages = {}, {}

local colors = {
	Move   = Color3.fromRGB(0,110,120),
	Combat = Color3.fromRGB(120,70,70),
	Visual = Color3.fromRGB(70,70,120),
	Player = Color3.fromRGB(70,120,70),
	TP     = Color3.fromRGB(120,120,70)
}

local function tab(name, y)
	local b = Instance.new("TextButton", main)
	b.Size = UDim2.new(0,90,0,30)
	b.Position = UDim2.new(0,10,0,y)
	b.Text = name
	b.Font = Enum.Font.Gotham
	b.TextSize = 13
	b.BackgroundColor3 = Color3.fromRGB(0,140,150)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	return b
end

local function page()
	local f = Instance.new("Frame", main)
	f.Size = UDim2.new(1,-120,1,-60)
	f.Position = UDim2.new(0,110,0,42)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

local function show(name)
	for _,v in pairs(pages) do v.Visible = false end
	pages[name].Visible = true
	main.BackgroundColor3 = colors[name] or main.BackgroundColor3
	sound:Play()
end

tabs.Move   = tab("Move",45)
tabs.Combat = tab("Combat",80)
tabs.Visual = tab("ESP",115)
tabs.Player = tab("Jugador",150)
tabs.TP     = tab("TP",185)

pages.Move   = page()
pages.Combat = page()
pages.Visual = page()
pages.Player = page()
pages.TP     = page()

show("Move")

for n,b in pairs(tabs) do
	b.MouseButton1Click:Connect(function()
		show(n)
	end)
end

-- UI helpers
local function box(t,y,p)
	local b = Instance.new("TextBox", p)
	b.Size = UDim2.new(0.9,0,0,28)
	b.Position = UDim2.new(0.05,0,0,y)
	b.PlaceholderText = t
	b.BackgroundColor3 = Color3.fromRGB(0,90,100)
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.Gotham
	b.TextSize = 13
	Instance.new("UICorner", b)
	return b
end

local function btn(t,y,p)
	local b = Instance.new("TextButton", p)
	b.Size = UDim2.new(0.9,0,0,32)
	b.Position = UDim2.new(0.05,0,0,y)
	b.Text = t
	b.BackgroundColor3 = Color3.fromRGB(0,160,170)
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	Instance.new("UICorner", b)
	return b
end

-- MOVE
local speedBox = box("Speed (16)",8,pages.Move)
btn("Apply Speed",40,pages.Move).MouseButton1Click:Connect(function()
	savedSpeed = tonumber(speedBox.Text) or 16
end)

local jumpBox = box("JumpPower (50)",78,pages.Move)
btn("Apply Jump",110,pages.Move).MouseButton1Click:Connect(function()
	savedJump = tonumber(jumpBox.Text) or 50
end)

-- COMBAT
local dmgBox = box("Damage Multiplier",8,pages.Combat)
btn("Apply Damage",40,pages.Combat).MouseButton1Click:Connect(function()
	damageMultiplier = tonumber(dmgBox.Text) or 1
end)

-- PLAYER
local noclipBtn = btn("Noclip: OFF",10,pages.Player)
noclipBtn.MouseButton1Click:Connect(function()
	noclip = not noclip
	noclipBtn.Text = noclip and "Noclip: ON" or "Noclip: OFF"
end)

-- TP
btn("Save Position",10,pages.TP).MouseButton1Click:Connect(function()
	savedCFrame = char.HumanoidRootPart.CFrame
end)

btn("Teleport Back",42,pages.TP).MouseButton1Click:Connect(function()
	if savedCFrame then
		char.HumanoidRootPart.CFrame = savedCFrame
	end
end)

-- FORCE SPEED & JUMP
RunService.Heartbeat:Connect(function()
	char = getChar()
	humanoid = char:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = savedSpeed
		humanoid.UseJumpPower = true
		humanoid.JumpPower = savedJump
	end
end)

-- NOCLIP
RunService.Stepped:Connect(function()
	if noclip and char then
		for _,v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

-- ESP (EL QUE TE GUSTA, INTACTO)
local highlights = {}
local espBtn = btn("ESP: OFF",10,pages.Visual)

espBtn.MouseButton1Click:Connect(function()
	esp = not esp
	espBtn.Text = esp and "ESP: ON" or "ESP: OFF"
	for _,h in pairs(highlights) do h:Destroy() end
	highlights = {}
end)

RunService.RenderStepped:Connect(function()
	if not esp then return end
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (plr.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
			if not highlights[plr] then
				highlights[plr] = Instance.new("Highlight", plr.Character)
			end
			highlights[plr].FillColor = dist <= 10 and Color3.new(1,0,0) or Color3.new(0,0,1)
		end
	end
end)
