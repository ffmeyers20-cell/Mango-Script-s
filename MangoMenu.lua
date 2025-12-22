--==============================
-- SERVICIOS
--==============================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--==============================
-- GUI BASE
--==============================
local gui = Instance.new("ScreenGui")
gui.Name = "MangoMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 450, 0, 320)
main.Position = UDim2.new(0.5, -225, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(255,140,40)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- TÍTULO
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -40, 0, 40)
title.Text = "🍊 Mango Menu"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack
title.TextSize = 22

-- CERRAR
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200,60,0)
close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", close)

-- BOTÓN ABRIR
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,50,0,50)
openBtn.Position = UDim2.new(0.5,-25,0.5,-25)
openBtn.Text = "O"
openBtn.Visible = false
openBtn.Active = true
openBtn.Draggable = true
openBtn.BackgroundColor3 = Color3.fromRGB(255,140,40)
openBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", openBtn)

close.MouseButton1Click:Connect(function()
	main.Visible = false
	openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
	main.Visible = true
	openBtn.Visible = false
end)

--==============================
-- PESTAÑAS
--==============================
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(0,120,1,-50)
tabFrame.Position = UDim2.new(0,5,0,45)
tabFrame.BackgroundTransparency = 1

local function createTab(name,y)
	local b = Instance.new("TextButton", tabFrame)
	b.Size = UDim2.new(1,0,0,35)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = name
	b.BackgroundColor3 = Color3.fromRGB(255,170,80)
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.GothamBold
	Instance.new("UICorner", b)
	return b
end

local tSpeed = createTab("Speed",0)
local tJump  = createTab("Jump",40)
local tESP   = createTab("ESP",80)
local tLight = createTab("FullBright",120)
local tTP    = createTab("Teleport",160)
local tFly   = createTab("Fly",200)
local tClip  = createTab("Noclip",240)

--==============================
-- PÁGINAS
--==============================
local pages = {}
local function page()
	local f = Instance.new("Frame", main)
	f.Size = UDim2.new(1,-140,1,-60)
	f.Position = UDim2.new(0,130,0,50)
	f.Visible = false
	f.BackgroundTransparency = 1
	table.insert(pages,f)
	return f
end

local pSpeed = page()
local pJump  = page()
local pESP   = page()
local pLight = page()
local pTP    = page()
local pFly   = page()
local pClip  = page()
pSpeed.Visible = true

local function show(p)
	for _,v in pairs(pages) do v.Visible = false end
	p.Visible = true
end

tSpeed.MouseButton1Click:Connect(function() show(pSpeed) end)
tJump.MouseButton1Click:Connect(function() show(pJump) end)
tESP.MouseButton1Click:Connect(function() show(pESP) end)
tLight.MouseButton1Click:Connect(function() show(pLight) end)
tTP.MouseButton1Click:Connect(function() show(pTP) end)
tFly.MouseButton1Click:Connect(function() show(pFly) end)
tClip.MouseButton1Click:Connect(function() show(pClip) end)

--==============================
-- WALKSPEED
--==============================
local speed = 16
local sb = Instance.new("TextBox", pSpeed)
sb.Size = UDim2.new(0,200,0,40)
sb.Position = UDim2.new(0,20,0,10)
sb.Text = "16"
Instance.new("UICorner", sb)

local sApply = Instance.new("TextButton", pSpeed)
sApply.Size = UDim2.new(0,200,0,40)
sApply.Position = UDim2.new(0,20,0,60)
sApply.Text = "Aplicar Speed"
sApply.BackgroundColor3 = Color3.fromRGB(0,170,0)
sApply.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", sApply)

sApply.MouseButton1Click:Connect(function()
	local v = tonumber(sb.Text)
	if v then speed = v end
end)

--==============================
-- JUMPPOWER
--==============================
local jumpValue = 50
local jumpOn = false

local jb = Instance.new("TextBox", pJump)
jb.Size = UDim2.new(0,200,0,40)
jb.Position = UDim2.new(0,20,0,10)
jb.Text = "50"
Instance.new("UICorner", jb)

local jApply = Instance.new("TextButton", pJump)
jApply.Size = UDim2.new(0,200,0,40)
jApply.Position = UDim2.new(0,20,0,60)
jApply.Text = "Aplicar Jump"
jApply.BackgroundColor3 = Color3.fromRGB(0,170,0)
jApply.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", jApply)

local jToggle = Instance.new("TextButton", pJump)
jToggle.Size = UDim2.new(0,200,0,40)
jToggle.Position = UDim2.new(0,20,0,110)
jToggle.Text = "Jump OFF"
jToggle.BackgroundColor3 = Color3.fromRGB(180,0,0)
jToggle.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", jToggle)

jApply.MouseButton1Click:Connect(function()
	local v = tonumber(jb.Text)
	if v then jumpValue = v end
end)

jToggle.MouseButton1Click:Connect(function()
	jumpOn = not jumpOn
	jToggle.Text = jumpOn and "Jump ON" or "Jump OFF"
	jToggle.BackgroundColor3 = jumpOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(180,0,0)
end)

--==============================
-- ESP (ATRAVIESA PAREDES)
--==============================
local espOn = false
local espBoxes = {}

local espBtn = Instance.new("TextButton", pESP)
espBtn.Size = UDim2.new(0,200,0,40)
espBtn.Position = UDim2.new(0,20,0,10)
espBtn.Text = "ESP OFF"
espBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
espBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", espBtn)

local function clearESP()
	for _,v in pairs(espBoxes) do
		if v then v:Destroy() end
	end
	espBoxes = {}
end

local function enableESP()
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local box = Instance.new("BoxHandleAdornment")
			box.Adornee = plr.Character.HumanoidRootPart
			box.Size = Vector3.new(4,6,2)
			box.AlwaysOnTop = true
			box.ZIndex = 10
			box.Transparency = 0.4
			box.Color3 = Color3.fromRGB(80,160,255)
			box.Parent = plr.Character
			table.insert(espBoxes, box)
		end
	end
end

espBtn.MouseButton1Click:Connect(function()
	espOn = not espOn
	if espOn then
		espBtn.Text = "ESP ON"
		espBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
		enableESP()
	else
		espBtn.Text = "ESP OFF"
		espBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
		clearESP()
	end
end)

--==============================
-- FULLBRIGHT
--==============================
local fbOn = false

local fbBtn = Instance.new("TextButton", pLight)
fbBtn.Size = UDim2.new(0,200,0,40)
fbBtn.Position = UDim2.new(0,20,0,10)
fbBtn.Text = "FullBright OFF"
fbBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
fbBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", fbBtn)

fbBtn.MouseButton1Click:Connect(function()
	fbOn = not fbOn
	if fbOn then
		Lighting.Brightness = 5
		Lighting.ClockTime = 12
		Lighting.FogEnd = 100000
		fbBtn.Text = "FullBright ON"
		fbBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
	else
		Lighting.Brightness = 1
		fbBtn.Text = "FullBright OFF"
		fbBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
	end
end)

--==============================
-- TELEPORT
--==============================
local savedCFrame

local saveBtn = Instance.new("TextButton", pTP)
saveBtn.Size = UDim2.new(0,200,0,40)
saveBtn.Position = UDim2.new(0,20,0,10)
saveBtn.Text = "Guardar Posición"
saveBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
saveBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", saveBtn)

local tpBtn = Instance.new("TextButton", pTP)
tpBtn.Size = UDim2.new(0,200,0,40)
tpBtn.Position = UDim2.new(0,20,0,60)
tpBtn.Text = "Teleport"
tpBtn.BackgroundColor3 = Color3.fromRGB(0,120,255)
tpBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", tpBtn)

saveBtn.MouseButton1Click:Connect(function()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		savedCFrame = player.Character.HumanoidRootPart.CFrame
	end
end)

tpBtn.MouseButton1Click:Connect(function()
	if savedCFrame and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = savedCFrame
	end
end)

--==============================
-- FLY
--==============================
local flyOn = false
local bodyGyro, bodyVel

local function startFly()
	local char = player.Character
	if not char then return end
	local hrp = char:WaitForChild("HumanoidRootPart")

	bodyGyro = Instance.new("BodyGyro", hrp)
	bodyVel = Instance.new("BodyVelocity", hrp)
	bodyGyro.P = 9e4
	bodyGyro.MaxTorque = Vector3.new(9e9,9e9,9e9)
	bodyVel.MaxForce = Vector3.new(9e9,9e9,9e9)

	RunService.RenderStepped:Connect(function()
		if flyOn then
			bodyGyro.CFrame = workspace.CurrentCamera.CFrame
			bodyVel.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
		end
	end)
end

local flyOnBtn = Instance.new("TextButton", pFly)
flyOnBtn.Size = UDim2.new(0,200,0,40)
flyOnBtn.Position = UDim2.new(0,20,0,10)
flyOnBtn.Text = "Fly ON"
flyOnBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
flyOnBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", flyOnBtn)

local flyOffBtn = Instance.new("TextButton", pFly)
flyOffBtn.Size = UDim2.new(0,200,0,40)
flyOffBtn.Position = UDim2.new(0,20,0,60)
flyOffBtn.Text = "Fly OFF"
flyOffBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
flyOffBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", flyOffBtn)

flyOnBtn.MouseButton1Click:Connect(function()
	flyOn = true
	startFly()
end)

flyOffBtn.MouseButton1Click:Connect(function()
	flyOn = false
	if bodyGyro then bodyGyro:Destroy() end
	if bodyVel then bodyVel:Destroy() end
end)

--==============================
-- NOCLIP
--==============================
local noclip = false

local ncOn = Instance.new("TextButton", pClip)
ncOn.Size = UDim2.new(0,200,0,40)
ncOn.Position = UDim2.new(0,20,0,10)
ncOn.Text = "Noclip ON"
ncOn.BackgroundColor3 = Color3.fromRGB(0,170,0)
ncOn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", ncOn)

local ncOff = Instance.new("TextButton", pClip)
ncOff.Size = UDim2.new(0,200,0,40)
ncOff.Position = UDim2.new(0,20,0,60)
ncOff.Text = "Noclip OFF"
ncOff.BackgroundColor3 = Color3.fromRGB(180,0,0)
ncOff.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", ncOff)

ncOn.MouseButton1Click:Connect(function()
	noclip = true
end)

ncOff.MouseButton1Click:Connect(function()
	noclip = false
end)

RunService.Stepped:Connect(function()
	if noclip and player.Character then
		for _,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

--==============================
-- APLICAR SPEED Y JUMP
--==============================
RunService.RenderStepped:Connect(function()
	local char = player.Character
	if not char then return end
	local h = char:FindFirstChildOfClass("Humanoid")
	if not h then return end

	h.WalkSpeed = speed
	if jumpOn then
		h.UseJumpPower = true
		h.JumpPower = jumpValue
	end
end)
