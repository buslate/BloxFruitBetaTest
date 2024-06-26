--[[BloxFruit]]--
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(1, 0, 1, 0) -- ขนาดเต็มหน้าจอ
backgroundFrame.Position = UDim2.new(0, 0, 0, 0) -- ตำแหน่งด้านบนซ้ายของหน้าจอ
backgroundFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- สีดำ
backgroundFrame.BackgroundTransparency = 0.99 -- ความโปร่งใส
backgroundFrame.Parent = screenGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0.5, -100, -1, 0) -- จะให้เริ่มต้นด้านบนของหน้าจอ
textLabel.BackgroundTransparency = 1 -- ทำให้ข้อความโปร่งใส
textLabel.TextColor3 = Color3.new(1, 1, 1) -- สีข้อความ (สีขาว)
textLabel.Text = "Cave Hub is Load"
textLabel.Parent = screenGui
textLabel.BorderSizePixel = 0 -- กำหนดให้ไม่มีขอบ
textLabel.TextScaled = true -- ปรับขนาดข้อความอัตโนมัติ
textLabel.TextWrapped = true -- ให้ข้อความขึ้นบรรทัดใหม่ตามขนาดของ TextLabel
textLabel.TextXAlignment = Enum.TextXAlignment.Center -- จัดข้อความให้อยู่ตรงกลาง
textLabel.TextYAlignment = Enum.TextYAlignment.Center -- จัดข้อความให้อยู่ตรงกลาง
textLabel.Font = Enum.Font.SourceSansBold -- ฟอนต์

local curveIntensity = 10 -- ความโค้ง (1-10)
textLabel.TextScaled = true
textLabel.TextWrapped = true
textLabel.TextStrokeTransparency = 0
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextScaled = true
textLabel.TextSize = 20
textLabel.TextTransparency = 0
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
wait(1)
-- เลื่อน TextLabel มาที่กลางของหน้าจอ
textLabel:TweenPosition(UDim2.new(0.5, -100, 0.5, -25), "Out", "Quint", 1, true)

local placeId = game.PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    BloxFruit = true
end
local placeId = game.PlaceId
if placeId == 2753915549 then
	OldWorld = true
elseif placeId == 4442272183 then
		NewWorld = true
elseif placeId == 7449423635 then
	ThreeWorld = true
end
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
     Title = "Cave Hub",
     SubTitle = "Bypass Fix",
     TabWidth = 180,
     Size = UDim2.fromOffset(500, 320),
     Acrylic = false,                        -- The blur may be detectable, setting this to false disables blur entirely
     Theme = "Dark",
     MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
     Information = Window:AddTab({ Title = "Information", Icon = "rbxassetid://11422155687" }),
     Main = Window:AddTab({ Title = "General", Icon = "home" }),
     Stats = Window:AddTab({ Title = "Stats", Icon = "rbxassetid://11422155046" }),
     Automatic = Window:AddTab({ Title = "Automatic", Icon = "swords" }),
     Shop = Window:AddTab({ Title = "Shop(Sea1)", Icon = "rbxassetid://11419715399" }),
     Shop2 = Window:AddTab({ Title = "Shop(Sea2)", Icon = "rbxassetid://12974422850" }),
     Shop3 = Window:AddTab({ Title = "Shop(Sea3)", Icon = "rbxassetid://12974428978" }),
     DevilFruit = Window:AddTab({ Title = "DevilFruit", Icon = "rbxassetid://12966428028" }),
     Raid = Window:AddTab({ Title = "Raid", Icon = "rbxassetid://11422924864" }),
     Teleport = Window:AddTab({ Title = "Teleport", Icon = "rbxassetid://12967404433" }),
     Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
     Fluent:Notify({
          Title = "Notification",
          Content = "YOYO",
          Duration = 5               -- Set to nil to make the notification not disappear
     })
end
local section = Tabs.Information:AddSection("Welcome")
Tabs.Information:AddParagraph({
     Title = "This Cave Hub",
     Content = "Blox Fruit Script"
})
local section = Tabs.Information:AddSection("Social")
Tabs.Information:AddButton({
     Title = "Join Discord",
     Description = "Pass in your discord and getin :D",
     Callback = function()
          setclipboard(tostring("https://discord.gg/p6b6HwuRq5"))
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "SetClipboard",
                    Duration = 3
               })
          end
     end
})
Tabs.Information:AddButton({
     Title = "Youtube",
     Description = "Copy youtube links",
     Callback = function()
          setclipboard(tostring("https://www.youtube.com/channel/UCKOv7FQXWQSOkx8_R0A1BUA"))
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "SetClipboard",
                    Duration = 3
               })
          end
     end
})
local section = Tabs.Main:AddSection("AutoFarm")
local Toggle = Tabs.Main:AddToggle("MyToggle", { Title = "AutoFarm", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoFarm = Value
_G.FastAttack = Value
_G.AUTOHAKI = Value
_G.AutoEquip = Value
end)

Options.MyToggle:SetValue(false)

if OldWorld then
local section = Tabs.Automatic:AddSection("EastBlue")
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoDressrosa", Default = false })
Toggle:OnChanged(function(Value)
_G.newworld = Value
_G.FastAttack = Value
_G.AUTOHAKI = Value
_G.AutoEquip = Value
end)
Options.MyToggle:SetValue(false)

local section = Tabs.Automatic:AddSection("Sword")
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoPole", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoPole = Value
_G.FastAttack = Value
_G.AUTOHAKI = Value
_G.AutoEquip = Value
end)
Options.MyToggle:SetValue(false)
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoSaber", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoSaber = Value
_G.FastAttack = Value
_G.AUTOHAKI = Value
_G.AutoEquip = Value
end)
Options.MyToggle:SetValue(false)
local section = Tabs.Automatic:AddSection("Combat")
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoSuperHuman", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoSuperHuman = Value
if Value then
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyBlackLeg")
end
end)
Options.MyToggle:SetValue(false)
elseif NewWorld then
local section = Tabs.Automatic:AddSection("Dressrosa")
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoQuestBartilo", Default = false })
Toggle:OnChanged(function(Value)
_G.AutoQuestBartilo = Value
end)
Options.MyToggle:SetValue(false)
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoFactory", Default = false })
Toggle:OnChanged(function(Value)
 _G.AutoFactory = Value
end)
Options.MyToggle:SetValue(false)
local section = Tabs.Automatic:AddSection("")
local Toggle = Tabs.Automatic:AddToggle("MyToggle", {Title = "AutoSuperHuman", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoSuperHuman = Value
if Value then
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyBlackLeg")
end
end)
end
--------------------------------------------[[Click]]--------------------------------------------

function Click()
     local VirtualUser = game:GetService('VirtualUser')
	VirtualUser:CaptureController()
	VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

--------------------------------------------[[EquipTool]]--------------------------------------------

function EquipItem(itemName)
     local player = game:GetService("Players").LocalPlayer
     local backpack = player.Backpack
     local character = player.Character
     if backpack:FindFirstChild(itemName) then
          local tool = backpack:FindFirstChild(itemName)
          tool.Parent = character
     end
end

--------------------------------------------[[Teleport]]--------------------------------------------

function TP(A)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = A
end


--------------------------------------------[[Bypass]]--------------------------------------------

function Bypass(C)
     task.wait(1)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = C
     game.Players.LocalPlayer.Character.Humanoid.Health = 0
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("SetSpawnPoint")
end
--------------------------------------------[[Tween]]--------------------------------------------

function Tween(CF)
     local Distance = (CF.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
     if Distance >= 250 then
          Speed = 270
     elseif Distance <= 170 then
          Speed = 300
     end
     local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), { CFrame = CF })
     tween:Play()
end

function FastTween(p)
     local Distance = (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
     local Speed = 370
     local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), { CFrame = p })
     tween:Play()
end
--TP(CFrame.new(0,0,0))

--------------------------------------------[[AutoFarm]]--------------------------------------------
function chacklevel()
     local lv = game:GetService("Players").LocalPlayer.Data.Level.Value
     if OldWorld then
          if lv == 1 or lv <= 9 then
               MonName = "Bandit"
               QuestName = "BanditQuest1"
               QuestNumber = 1
               Qusetpos = CFrame.new(1059.37183, 16.1412621, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
               SETPOINT = CFrame.new(971.943237, 15.3500061, 1410.79272, -0.777145505, 0, -0.629321039, 0, 1, 0, 0.629321039, 0, -0.777145505)
               ChackMon1 = CFrame.new(1146.17273, 79.8013916, 1620.93518, 0.9853369, -0.0126142949, 0.170152977,1.76843817e-09, 0.997263253, 0.0739321262, -0.17061992, -0.0728480518, 0.982640326)
          elseif lv == 10 or lv <= 14 then
               MonName = "Monkey"
               QuestName = "JungleQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-1598.08887, 35.950119, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
               SETPOINT = CFrame.new(-1338.24963, 10.9499998, 498.668518, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
               ChackMon1 = CFrame.new(-1691, 76, -36)
          elseif lv == 15 or lv <= 29 then
               MonName = "Gorilla"
               QuestName = "JungleQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-1598.08887, 35.950119, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
               SETPOINT = CFrame.new(-1338.24963, 10.9499998, 498.668518, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
               ChackMon1 = CFrame.new(-1230, 53, -486)
          elseif lv == 30 or lv <= 39 then
               MonName = "Pirate"
               QuestName = "BuggyQuest1"
               QuestNumber = 1
               Qusetpos = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
               SETPOINT = CFrame.new(-1188.51257, 3.85003138, 3817.83667, 0.961273968, -0, -0.275594592, 0, 1, -0, 0.275594592, 0, 0.961273968)
               ChackMon1 = CFrame.new(-1122.01147, 43.0832977, 3946.65112, 0.969741166, -0.0109664053, -0.243889034,-5.26546751e-10, 0.998990595, -0.0449193493, 0.244135454, 0.0435601398, 0.968762279)
          elseif lv == 40 or lv <= 59 then
               MonName = "Brute"
               QuestName = "BuggyQuest1"
               QuestNumber = 2
               Qusetpos = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
               SETPOINT = CFrame.new(-1188.51257, 3.85003138, 3817.83667, 0.961273968, -0, -0.275594592, 0, 1, -0, 0.275594592, 0, 0.961273968)
               ChackMon1 = CFrame.new(-1142.11475, 94.4409103, 4319.72559, 0.94916445, 2.49591583e-08, -0.314780563,4.2021564e-09, 1, 9.19615104e-08, 0.314780563, -8.86093545e-08, 0.94916445)
          elseif lv == 60 or lv <= 74 then
               MonName = "Desert Bandit"
               QuestName = "DesertQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(894.488586, 5.59000683, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
               SETPOINT = CFrame.new(914.938843, 2.48001194, 4113.36572, 0.275584042, 0, 0.961277127, 0, 1, 0, -0.961277127, 0, 0.275584042)
               ChackMon1 = CFrame.new(931.648438, 47.1649513, 4488.71191, 0.60872674, 0.0566120259, 0.791357577,-2.94627389e-09, 0.997450948, -0.0713554993, -0.793379962, 0.0434359983, 0.607175052)
          elseif lv == 75 or lv <= 89 then
               MonName = "Desert Officer"
               QuestName = "DesertQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(894.488586, 5.59000683, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
               SETPOINT = CFrame.new(914.938843, 2.48001194, 4113.36572, 0.275584042, 0, 0.961277127, 0, 1, 0, -0.961277127, 0, 0.275584042)
               ChackMon1 = CFrame.new(1613.95972, 27.0537624, 4379.07666, 0.997716486, -0.00235532317, 0.0675004795,7.81264886e-10, 0.999391794, 0.0348721929, -0.067541562, -0.0347925611, 0.997109652)
          elseif lv == 90 or lv <= 99 then
               MonName = "Snow Bandit"
               QuestName = "SnowQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(1389.74451, 86.1363525, -1298.90784, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
               SETPOINT = CFrame.new(1104.80469, 6.40137196, -1167.79077, -0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, -0.707134247)
               ChackMon1 = CFrame.new(1301.86926, 130.062057, -1387.86096, 0.472290128, 0.0315165818, -0.880879521,1.18503118e-09, 0.999360561, 0.0357556604, 0.881443143, -0.0168870464, 0.471988112)
          elseif lv == 100 or lv <= 119 then
               MonName = "Snowman"
               QuestName = "SnowQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(1389.74451, 86.1363525, -1298.90784, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
               SETPOINT = CFrame.new(1104.80469, 6.40137196, -1167.79077, -0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, -0.707134247)
               ChackMon1 = CFrame.new(1184.17297, 193.148605, -1501.44678, 0.830079734, -0.0770583078, 0.55229491,-3.36578959e-10, 0.990406394, 0.138185307, -0.557644725, -0.114704818, 0.822116256)
          elseif lv == 120 or lv <= 149 then --149
               MonName = "Chief Petty Officer"
               QuestName = "MarineQuest2"
               QuestNumber = 1
               Qusetpos = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               SETPOINT = CFrame.new(-4925.57178, 40.3500137, 4426.08594, 0.325602472, -0, -0.945506752, 0, 1, -0, 0.945506752, 0, 0.325602472)
               ChackMon1 = CFrame.new(-4927.87891, 65.28302, 3993.74365, -0.342275828, -0.0131828887, 0.939507067, 0.00894175656, 0.999810576, 0.0172866601, -0.939556956, 0.0143176485, -0.34209311)
               -- ChackMon2 = CFrame.new(-4691.47168, 97.7189941, 4489.3833, 0.946013093, -0.0095107723, 0.323988855, 8.63156768e-10, 0.999569416, 0.0293426029, -0.324128419, -0.0277584866, 0.945605755)
          elseif lv == 150 or lv <= 174 then
               MonName = "Sky Bandit"
               QuestName = "SkyQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-4839.51562, 716.670715, -2619.4165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
               SETPOINT = CFrame.new(-4920.20996, 716.769897, -2640.80493, -0.777145505, 0, -0.629321039, 0, 1, 0, 0.629321039, 0, -0.777145505)
               ChackMon1 = CFrame.new(-5025.28809, 324.944153, -2828.59619, 0.983840168, 0.00266311644, -0.179029062,-1.32528294e-10, 0.999889374, 0.0148736835, 0.179048866, -0.0146333277, 0.983731329)
          elseif lv == 175 or lv <= 189 then --189
               MonName = "Dark Master"
               QuestName = "SkyQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-4839.51562, 716.670715, -2619.4165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412,0, 0.866007268)
               SETPOINT = CFrame.new(-4920.20996, 716.769897, -2640.80493, -0.777145505, 0, -0.629321039, 0, 1, 0, 0.629321039, 0, -0.777145505)
               ChackMon1 = CFrame.new(-5262.27832, 448.675323, -2258.97241, 0.910784543, 0.00164514664, -0.412878662,3.98000834e-11, 0.999992073, 0.00398454489, 0.412881941, -0.00362906209, 0.91077733)
          elseif lv == 190 or lv <= 209 then
               MonName = "Prisoner"
               QuestName = "PrisonerQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935,0, 0.0175017118)
               SETPOINT = CFrame.new(4857.47705, 4.35001707, 751.836121, 0.515462339, 0, 0.856912255, 0, 1, 0, -0.856912255, 0, 0.515462339)
               ChackMon1 = CFrame.new(5266.19775, 46.4375458, 398.862366, -0.397015303, -0.05177157, 0.916350663,-9.64795688e-10, 0.998407841, 0.0564075969, -0.91781199, 0.0223946795, -0.396383196)
               -- ChackMon2 = CFrame.new(5011.80029, 66.2090912, 549.098083, -0.588193357, 0.0150756342, 0.808579803, -0.0103892582, 0.999602854, -0.0261947419, -0.808653593, -0.0238081161, -0.587803125)
          elseif lv == 210 or lv <= 249 then
               MonName = "Dangerous Prisoner"
               QuestName = "PrisonerQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935,0, 0.0175017118)
               SETPOINT = CFrame.new(4857.47705, 4.35001707, 751.836121, 0.515462339, 0, 0.856912255, 0, 1, 0, -0.856912255, 0, 0.515462339)
               ChackMon1 = CFrame.new(5526.27539, 62.7830849, 509.754547, -0.749680758, 0.00813186448, -0.661749661,-2.69122696e-10, 0.999924481, 0.0122875031, 0.66179961, 0.00921170507, -0.749624193)
          elseif lv == 250 or lv <= 274 then
               MonName = "Toga Warrior"
               QuestName = "ColosseumQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-1580.04688, 7.20000267, -2986.47559, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721,0, -0.515037298)
               SETPOINT = CFrame.new(-1393.33777, 6.38246346, -2836.24414, -0.999848366, 0, 0.017436387, 0, 1, 0, -0.017436387, 0, -0.999848366)
               ChackMon1 = CFrame.new(-1659.17102, 60.7238083, -2789.45776, 0.0239013676, 0.00780060515, 0.999683917,7.38685588e-12, 0.999969542, -0.00780283427, -0.999714315, 0.000186498408, 0.0239006393)
          elseif lv == 275 or lv <= 299 then
               MonName = "Gladiator"
               QuestName = "ColosseumQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-1580.04688, 7.20000267, -2986.47559, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721,0, -0.515037298)
               SETPOINT = CFrame.new(-1393.33777, 6.38246346, -2836.24414, -0.999848366, 0, 0.017436387, 0, 1, 0, -0.017436387, 0, -0.999848366)
               ChackMon1 = CFrame.new(-1296, 10, -3256)
               -- ChackMon2 = CFrame.new(-1371.89587, 61.4580231, -3384.56689, -0.833319247, 0.0151263466, -0.552585065, 0.00835157745, 0.999855936, 0.0147753488, 0.552728951, 0.00769762555, -0.833325505)
          elseif lv == 300 or lv <= 324 then
               MonName = "Military Soldier"
               QuestName = "MagmaQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-5313.37012, 11.2500095, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813,0, -0.499959469)
               SETPOINT = CFrame.new(-5224.17969, 7.75000763, 8469.65332, 0.139430404, 0, 0.990231931, 0, 1, 0, -0.990231931, 0, 0.139430404)
               ChackMon1 = CFrame.new(-5545.14307, 77.7244568, 8384.71094, -0.503312826, -0.101919658, 0.858072639,1.11266569e-08, 0.99301976, 0.117948338, -0.864104271, 0.0593649186, -0.49979955)
          elseif lv == 325 or lv <= 374 then
               MonName = "Military Spy"
               QuestName = "MagmaQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-5313.37012, 11.2500095, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813,0, -0.499959469)
               SETPOINT = CFrame.new(-5224.17969, 7.75000763, 8469.65332, 0.139430404, 0, 0.990231931, 0, 1, 0, -0.990231931, 0, 0.139430404)
               ChackMon1 = CFrame.new(-5860.77539, 125.605713, 8841.04004, 0.123171583, 0.0166577231, -0.992245555,-1.65192332e-10, 0.999859095, 0.0167855378, 0.992385387, -0.00206750119, 0.12315423)
          elseif lv == 375 or lv <= 399 then
               MonName = "Fishman Warrior"
               QuestName = "FishmanQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(61121.2695, 18.8742752, 1564.8844, -0.913477898, 0, -0.406888306, 0, 1, 0, 0.406888306, 0, -0.913477898)
               Warp = CFrame.new(4050, -2.3, -1814)
               ChackMon1 = CFrame.new(60933, 64, 1636)
          elseif lv == 400 or lv <= 449 then
               MonName = "Fishman Commando"
               QuestName = "FishmanQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(61121.2695, 18.8742752, 1564.8844, -0.913477898, 0, -0.406888306, 0, 1, 0, 0.406888306, 0, -0.913477898)
               Warp = CFrame.new(4050, -2.3, -1814)
               ChackMon1 = CFrame.new(61912, 72, 1475)
          elseif lv == 450 or lv <= 474 then
               MonName = "God's Guard"
               QuestName = "SkyExp1Quest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-4721.95215, 844.174683, -1949.24341, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
               SETPOINT = CFrame.new(-4920.20996, 716.769897, -2640.80493, -0.777145505, 0, -0.629321039, 0, 1, 0, 0.629321039, 0, -0.777145505)
               ChackMon1 = CFrame.new(-4707, 885, -1894)
          elseif lv == 475 or lv <= 524 then
               MonName = "Shanda"
               QuestName = "SkyExp1Quest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-7858.44043, 5544.49023, -381.782959, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
               SETPOINT = CFrame.new(-7871.68555, 5544.58984, -333.27121, 0.777145445, 0, 0.629321039, 0, 1, 0, -0.629321039, 0, 0.777145445)
               ChackMon1 = CFrame.new(-7654, 5572, -491)
          elseif lv == 525 or lv <= 549 then
               MonName = "Royal Squad"
               QuestName = "SkyExp2Quest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-7904.68457, 5634.66113, -1409.96729, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               SETPOINT = CFrame.new(-7871.68555, 5544.58984, -333.27121, 0.777145445, 0, 0.629321039, 0, 1, 0, -0.629321039, 0, 0.777145445)
               ChackMon1 = CFrame.new(-7600, 5647, -1444)
          elseif lv == 550 or lv <= 624 then
               MonName = "Royal Soldier"
               QuestName = "SkyExp2Quest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-7904.68457, 5634.66113, -1409.96729, 0, 0, -1, 0, 1, 0, 1, 0, 0)
               SETPOINT = CFrame.new(-7871.68555, 5544.58984, -333.27121, 0.777145445, 0, 0.629321039, 0, 1, 0, -0.629321039, 0, 0.777145445)
               ChackMon1 = CFrame.new(-7797, 5652, -1761)
          elseif lv == 625 or lv <= 649 then
               MonName = "Galley Pirate"
               QuestName = "FountainQuest"
               QuestNumber = 1
               Qusetpos = CFrame.new(5259.77051, 37.7125168, 4050.0249, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
               SETPOINT = CFrame.new(5193.83838, 37.600029, 4145.69922, 0.515462339, 0, 0.856912255, 0, 1, 0, -0.856912255, 0, 0.515462339)
               ChackMon1 = CFrame.new(5554, 69, 3983)
          elseif lv == 650 or lv <= 699 then
               MonName = "Galley Captain"
               QuestName = "FountainQuest"
               QuestNumber = 2
               Qusetpos = CFrame.new(5259.77051, 37.7125168, 4050.0249, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
               SETPOINT = CFrame.new(5193.83838, 37.600029, 4145.69922, 0.515462339, 0, 0.856912255, 0, 1, 0, -0.856912255, 0, 0.515462339)
               ChackMon1 = CFrame.new(5581, 79, 4925)
          end
     end
     if NewWorld then
          if lv == 700 or lv <= 724 then
               MonName = "Raider"
               QuestName = "Area1Quest"
               QuestNumber = 1
               Qusetpos = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
               SETPOINT = CFrame.new(-33.3725662, 28.3748226, 2762.01196, -0.990270376, 0, 0.13915664, 0, 1, 0, -0.13915664, 0, -0.990270376)
               ChackMon1 = CFrame.new(-696, 93, 2376)
          elseif lv == 725 or lv <= 774 then
               MonName = "Mercenary"
               QuestName = "Area1Quest"
               QuestNumber = 2
               Qusetpos = CFrame.new(-429.417114, 72.1100006, 1836.21106, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
               SETPOINT = CFrame.new(-33.3725662, 28.3748226, 2762.01196, -0.990270376, 0, 0.13915664, 0, 1, 0, -0.13915664, 0, -0.990270376)
               ChackMon1 = CFrame.new(-1021, 153, 1391)
          elseif lv == 775 or lv <= 799 then
               MonName = "Swan Pirate"
               QuestName = "Area2Quest"
               QuestNumber = 1
               Qusetpos = CFrame.new(638.438354, 72.082489, 918.282959, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
               SETPOINT = CFrame.new(-379.871765, 72.0878448, 250.478149, -0.999848366, 0, -0.017436387, 0, 1, 0, 0.017436387, 0, -0.999848366)
               ChackMon1 = CFrame.new(993, 150, 1266)
          elseif lv == 800 or lv <= 874 then
               MonName = "Factory Staff"
               QuestName = "Area2Quest"
               QuestNumber = 2
               Qusetpos = CFrame.new(638.438354, 72.082489, 918.282959, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
               SETPOINT = CFrame.new(-379.871765, 72.0878448, 250.478149, -0.999848366, 0, -0.017436387, 0, 1, 0, 0.017436387, 0, -0.999848366)
               ChackMon1 = CFrame.new(148, 152, -33)
          elseif lv == 875 or lv <= 899 then
               MonName = ""
               QuestName = ""
               QuestNumber = 1
               Qusetpos = CFrame.new()
               SETPOINT = CFrame.new()
               ChackMon1 = CFrame.new()
          elseif lv == 900 or lv <= 949 then
               MonName = ""
               QuestName = ""
               QuestNumber = 1
               Qusetpos = CFrame.new()
               SETPOINT = CFrame.new()
               ChackMon1 = CFrame.new()
          end
     end
end

---4627.80518, 848.034973, -1706.73511, 0.890994847, 0, 0.454013437, 0, 1, 0, -0.454013437, 0, 0.890994847


spawn(function()
     while task.wait() do
          if _G.AutoFarm then
               pcall(function()
                    chacklevel()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                         if (SETPOINT.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
                              Tween(Qusetpos)
                         elseif (SETPOINT.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                              Tween(Qusetpos)
                         else
                              task.wait(.5)
                              Bypass(SETPOINT)
                         end
                         if (Qusetpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                              wait(.5)
                              game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StartQuest", QuestName, QuestNumber)
                         end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                         if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, MonName) then
                              if workspace.Enemies:FindFirstChild(MonName) then
                                   for i, v in pairs(workspace.Enemies:GetChildren()) do
                                        if v.Name == MonName then
                                             repeat task.wait()
                                                  Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 0))
                                                  v.Humanoid.WalkSpeed = 0
                                                  v.Humanoid.JumpPower = 0
                                                  v.HumanoidRootPart.CanCollide = false
                                                  v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                             until game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or v.Humanoid.Health <= 0 or not _G.AutoFarm or not game.workspace.Enemies:FindFirstChild(MonName)
                                        end
                                   end
                              else
                                   wait(.5)
                                   FastTween(ChackMon1 * CFrame.new(math.random(-200, 200), 0, math.random(-200, 200)))
                              end
                         else
                              game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AbandonQuest")
                         end
                    end
               end)
          end
     end
end)

coroutine.wrap(function()
     while task.wait() do
          if _G.AutoFarm then
               pcall(function()
                    chacklevel()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                         if (Warp.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
                              FastTween(Warp)
                         elseif (Qusetpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
                              FastTween(Qusetpos)
                         else
                              task.wait(2)
                              FastTween(Warp)
                         end
                         if (Qusetpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                              wait(.5)
                              game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StartQuest", QuestName, QuestNumber)
                         end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                         if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, MonName) then
                              if workspace.Enemies:FindFirstChild(MonName) then
                                   for i, v in pairs(workspace.Enemies:GetChildren()) do
                                        if v.Name == MonName then
                                             repeat task.wait()
                                                  Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 0))
                                                  v.Humanoid.WalkSpeed = 0
                                                  v.Humanoid.JumpPower = 0
                                                  v.HumanoidRootPart.CanCollide = false
                                                  v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                             until game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or v.Humanoid.Health <= 0 or not _G.AutoFarm or not game.workspace.Enemies:FindFirstChild(MonName)
                                        end
                                   end
                              else
                                   task.wait(.5)
                                   FastTween(ChackMon1 * CFrame.new(math.random(-160, 160), 0, math.random(-160, 160)))
                              end
                         else
                              game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AbandonQuest")
                         end
                    end
               end)
          end
     end
end)()

spawn(function()
     while task.wait() do
          if _G.AutoFarm or _G.newworld then
               pcall(function()
                    chacklevel()
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 700 then
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 then
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                    end
               end)
          end
     end
end)
--------------------------------------------[[์Noclip]]--------------------------------------------

coroutine.wrap(function()
     while task.wait() do
          pcall(function()
               if _G.AutoFarm or _G.AutoSaber or _G.newworld or _G.island or _G.AutoPole then
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                         local BodyClip = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
                         if BodyClip then
                              BodyClip:Destroy()
                         end
                    else
                         if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                              local Noclip = Instance.new("BodyVelocity")
                              Noclip.Name = "BodyClip"
                              Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                              Noclip.MaxForce = Vector3.new(math.huge* math.huge, math.huge * math.huge, math.huge * math.huge)
                              Noclip.Velocity = Vector3.new(0,0,0)
                              Noclip.P = math.huge * math.huge
                              Noclip.D = math.huge * math.huge
                         end
                    end
               else
                    local BodyClip = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
                    if BodyClip then
                         BodyClip:Destroy()
                    end
               end
          end)
     end
end)()

coroutine.wrap(function()
     while game:GetService("RunService").Stepped:wait() do
          pcall(function()
               if _G.AutoFarm or _G.AutoSaber or _G.newworld or _G.island or _G.AutoPole or _G.AutoFactory then
                    local character = game.Players.LocalPlayer.Character
                    for _, v in pairs(character:GetChildren()) do
                         if v:IsA("BasePart") then
                              v.CanCollide = false
                         end
                    end
               end
          end)
     end
end)()

--------------------------------------------[[BringMob]]--------------------------------------------

coroutine.wrap(function()
     while task.wait() do
          pcall(function()
               if _G.AutoFarm then
                    chacklevel()
                    pcall(function()
                         for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                              if v.Name == MonName then
                                   local otherPlayersNearby = false
                                        for _, player in pairs(game.Players:GetPlayers()) do
                                             if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                                  local distance = (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                                                  if distance < 650 then
                                                       otherPlayersNearby = true
                                                       break
                                                  end
                                             end
                                        end
                                        if not otherPlayersNearby then
                                             for _, y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                  if y.Name == MonName then
                                                  y.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                                  y.HumanoidRootPart.Size = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                                                  v.HumanoidRootPart.Size = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                                                  y.HumanoidRootPart.CanCollide = false
                                                  v.HumanoidRootPart.CanCollide = false
                                                  y.Humanoid.WalkSpeed = 0
                                                  v.Humanoid.WalkSpeed = 0
                                                  y.Humanoid.JumpPower = 0
                                                  v.Humanoid.JumpPower = 0
                                                  y.Humanoid.AutoRotate = false
                                                  v.Humanoid.AutoRotate = false
                                                  local BP = Instance.new("BodyPosition")
                                                  BP.MaxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                                                  BP.P = math.huge * math.huge
                                                  BP.D = math.huge * math.huge
                                                  y.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                                  v.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                                  local BG_v = Instance.new("BodyGyro")
                                                  BG_v.MaxTorque = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                                                  BG_v.P = math.huge * math.huge
                                                  BG_v.D = math.huge * math.huge
                                                  y.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                                  v.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                                  if sethiddenproperty then
                                                       sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                                  end
                                             end
                                        end
                                   end
                              end
                         end
                    end)
               end
          end)
     end
end)()

coroutine.wrap(function()
     while task.wait() do
          pcall(function()
               if _G.AutoFarm then
                    chacklevel()
                    for i, v in pairs(workspace.Enemies:GetChildren()) do
                         if v.Name == MonName then
                              if v.Humanoid.Health == 0 then
                                   v:Destroy()
                              end
                         end
                    end
               end
          end)
     end
end)()

coroutine.wrap(function()
     while task.wait() do
          pcall(function()
               if _G.AutoPole then
                    for i,v in pairs(game.workspace.Enemies:GetChildren()) do
                         for i,y in pairs(game.workspace.Enemies:GetChildren()) do
                              if v.Name == NameBoss then
                                   if y.Name == NameBoss then
                                        v.Humanoid.WalkSpeed = 0
                                        y.Humanoid.WalkSpeed = 0
                                        v.Humanoid.AutoRotate = false
                                        y.Humanoid.AutoRotate = false
                                        local ICE = Instance.new("BodyPosition")
                                        ICE.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                        ICE.P = math.huge * math.huge
                                        ICE.D = math.huge * math.huge
                                        v.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                        y.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                   end
                              end
                         end
                    end
               end
          end)
     end
end)()
--------------------------------------------[[FastAttack]]--------------------------------------------

_G.FastAttackType = "Normal"

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local cooldownfastattack = tick()

function CurrentWeapon()
    local ac = CombatFrameworkR.activeController
    local ret = ac.blades[1]
    if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
    pcall(function()
        while ret.Parent ~= game.Players.LocalPlayer.Character do ret = ret.Parent end
    end)
    if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
    return ret
end

function AttackFunction()
     local ac = CombatFrameworkR.activeController
     if ac and ac.equipped then
          local Hits = {}
          local Client = game.Players.LocalPlayer
          local Enemies = game:GetService("Workspace").Enemies:GetChildren()
          for i = 1, #Enemies do
               local v = Enemies[i]
               local Human = v:FindFirstChildOfClass("Humanoid")
               if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 70 then
                    table.insert(Hits, Human.RootPart)
               end
          end

          if #Hits > 0 then
               local AcAttack8 = debug.getupvalue(ac.attack, 5)
               local AcAttack9 = debug.getupvalue(ac.attack, 6)
               local AcAttack7 = debug.getupvalue(ac.attack, 4)
               local AcAttack10 = debug.getupvalue(ac.attack, 7)
               local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
               local NumberAc13 = AcAttack7 * 798405
               (function()
                    NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                    AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                    AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
               end)()
               AcAttack10 = AcAttack10 + 1
               debug.setupvalue(ac.attack, 5, AcAttack8)
               debug.setupvalue(ac.attack, 6, AcAttack9)
               debug.setupvalue(ac.attack, 4, AcAttack7)
               debug.setupvalue(ac.attack, 7, AcAttack10)
               for k, v in pairs(ac.animator.anims.basic) do
                    v:Play(0.1, 0.5, 0.2, 0.8)
               end
               if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(CurrentWeapon()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", Hits, 2, "")
               end
          end
     end
end

coroutine.wrap(function()
     while task.wait() do
          if _G.FastAttack then
               pcall(function()
                    for i = 1, 1 do  -- เพิ่มจำนวนการโจมตีในลูปย่อย
                         AttackFunction()
                    end
                    if _G.FastAttackType == "Fast" then
                         if tick() - cooldownfastattack < task.wait() then
                              cooldownfastattack = tick()
                         end
                    elseif _G.FastAttackType == "Normal" then
                         if tick() - cooldownfastattack > 1.5 then
                              task.wait(1)
                              cooldownfastattack = tick()
                         end
                    elseif _G.FastAttackType == "Safety" then
                         if tick() - cooldownfastattack > 0.3 then
                              task.wait(0.5)
                              cooldownfastattack = tick()
                         end
                    end
               end)
          end
     end
end)()
game:GetService("RunService").RenderStepped:Connect(function()
     if _G.FastAttack then
          AttackFunction()
     end
end)

coroutine.wrap(function()
     while task.wait() do
          if _G.AUTOHAKI then
               if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
               end
          end
     end
end)()
--------------------------------------------[[SelectWeapon]]--------------------------------------------
local EquipDistance = 75 -- ระยะห่างที่ต้องการตรวจสอบ

local Weapon = {
    "Melee",
    "Sword",
    "BloxFruit"
}

function UnequipWeapon()
     local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
     if humanoid then
          humanoid:UnequipTools()
     end
end

function CheckAndEquipWeapon(W)
     for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if tool:IsA("Tool") and tool.ToolTip == W then
               local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
               if humanoid then
                    humanoid:EquipTool(tool)
                    return true
               end
          end
     end
     return false
end

coroutine.wrap(function()
     while task.wait(.1) do
          pcall(function()
               if _G.AutoEquip then
                    local player = game.Players.LocalPlayer
                    local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
                    local foundMon = false
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                         if (v.Name == MonName or v.Name == MonQuestName or v.Name == QuestMonName or v.Name == NameMon or v.Name == NameBoss or v.Name == "Mob Leader" or v.Name == "Saber Expert") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                         local enemyPosition = v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Position
                         if enemyPosition and playerPosition and (playerPosition - enemyPosition).Magnitude <= EquipDistance then
                              foundMon = true
                              break
                         end
                         end
                    end
                    if foundMon then
                         -- Equip the selected weapon
                         local weaponEquipped = false
                         if SelectWeapon == "Melee" then
                         weaponEquipped = CheckAndEquipWeapon("Melee")
                         elseif SelectWeapon == "Sword" then
                         weaponEquipped = CheckAndEquipWeapon("Sword")
                         elseif SelectWeapon == "Blox Fruit" then
                         weaponEquipped = CheckAndEquipWeapon("Blox Fruit")
                         else
                         weaponEquipped = CheckAndEquipWeapon("Melee")
                         end
                    else
                         UnequipWeapon()
                    end
               end
          end)
     end
end)()

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "SelectWeapon",
    Values = Weapon,
    Multi = false,
    Default = 1,
})

Dropdown:SetValue()

Dropdown:OnChanged(function(Value)
    SelectWeapon = Value
end)

--------------------------------------------[[Redeemcode]]--------------------------------------------

local section = Tabs.Main:AddSection("EXP x2 Code")
Tabs.Main:AddButton({
     Title = "RedeemAllCode",
     Callback = function()
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("TRIPLEABUSE")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("SEATROLLING")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("24NOADMIN")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("REWARDFUN")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("NEWTROLL")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("SECRET_ADMIN")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("KITT_RESET")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("CHANDLER")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Sub2CaptainMaui")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("kittgaming")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Sub2Fer999")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Enyu_is_Pro")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Magicbus")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("JCWK")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Starcodeheo")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Bluxxy")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("fudd10_v2")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("SUB2GAMERROBOT_EXP1")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("SUB2GAMERROBOT_RESET1")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Sub2UncleKizaru")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Axiore")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Sub2Daigrock")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Bignews")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Sub2NoobMaster123")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("StrawHatMaine")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("TantaiGaming")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Fudd10")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("TheGreatAce")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("Sub2OfficialNoobie")
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Redeem"):InvokeServer("krazydares")
     end
})

--------------------------------------------[[AutoCombat]]--------------------------------------------

function superhuman()
     local Fragments = game:GetService("Players").LocalPlayer.Data.Fragments.Value
     local masterydarkleg = game:GetService("Players").LocalPlayer.Backpack["Black Leg"].Level.Value
          if masterydarkleg <= 300 then
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyBlackLeg")
          elseif masterydarkleg >= 300 then
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyElectro")
          end
     local masteryelectro = game:GetService("Players").LocalPlayer.Backpack.Electro.Level.Value
          if masteryelectro <= 300 then
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyElectro")
          elseif masteryelectro >= 300 then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
          end
     local masteryDragonClaw = nil
     if Fragments >= 1500 then
          if masteryDragonClaw >= 300 then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
          end
     end
end

coroutine.wrap(function()
     while task.wait() do
          if _G.AutoSuperHuman then
               pcall(function()
               superhuman()
               end)
          end
     end
end)()
--------------------------------------------[[AutoNewWorld]]--------------------------------------------

function newworld()
     Monpos = CFrame.new(4853.37549, 4.78490591, 717.703979, -0.453972578, 0, 0.891015649, 0, 1, 0, -0.891015649, 0, -0.453972578)
     Doorpos = CFrame.new(1347.6958, 37.3493462, -1325.87463, 0.519068599, -7.70531372e-08, 0.854732573, 6.44183729e-08, 1, 5.10283336e-08, -0.854732573, 2.85732771e-08, 0.519068599)
     QuestMonName = "Ice Admiral"
end

spawn(function()
     while task.wait() do
          if _G.newworld then
               newworld()
               if game.Players.LocalPlayer.Data.Level.Value >= 700 then
                    if (Monpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10000 then
                         Tween(Monpos)
                    end
                    if (Monpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                         wait(0.5)
                         game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("DressrosaQuestProgress", "Detective")
                    end
                    if game.workspace.Map.Ice.Door.Transparency == 0 then
                         Tween(Monpos)
                    elseif game.workspace.Map.Ice.Door.Transparency == 1 then
                         Tween(Doorpos)
                    end
                    if (Doorpos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10000 then
                         Tween(Doorpos)
                    end
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Key") then
                         repeat task.wait()
                              EquipItem("Key")
                         until (Vector3.new(1347.6958, 37.3493462, -1325.87463, 0.519068599, -7.70531372e-08, 0.854732573, 6.44183729e-08, 1, 5.10283336e-08, -0.854732573, 2.85732771e-08, 0.519068599)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1
                    elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Key") or game.workspace.Map.Ice.Door.Transparency == 0 then
                         Tween(Monpos)
                    end
                    if game.workspace.Map.Ice.Door.Transparency == 1 then
                         if workspace.Enemies:FindFirstChild(QuestMonName) then
                              for i, v in pairs(workspace.Enemies:GetChildren()) do
                                   if v.Name == QuestMonName then
                                   repeat
                                        task.wait()
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                   until not game.workspace.Enemies:FindFirstChild(QuestMonName) or _G.newworld == false
                                   end
                              end
                         end
                    end
                    wait(3)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("DressrosaQuestProgress", "Dressrosa")
               end
          end
     end
end)
--------------------------------------------[[AutoPole]]--------------------------------------------
function pole()
     Setpoint = CFrame.new(-7894.61768, 5547.1416, -380.291199, -0.0348471925, 3.04643821e-09, 0.999392629, 1.74792461e-07, 1, 3.04643821e-09, -0.999392629, 1.74792461e-07, -0.0348471925)
     CheckMon55 = CFrame.new(-7787, 5676, -2423)
     NameBoss = "Thunder God"
end

spawn(function()
     while task.wait() do
          if _G.AutoPole then
               pole()
               if game:GetService("Players").LocalPlayer.Data.Level.Value >= 50 then
                    if (CheckMon55.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
                         Tween(CheckMon55)
                    else
                         TP(Setpoint)
                    end
                    if workspace.Enemies:FindFirstChild(NameBoss) then
                         for i, v in pairs(workspace.Enemies:GetChildren()) do
                              if v.Name == NameBoss then
                                   repeat task.wait()
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                   until not _G.AutoPole
                              end
                         end
                    else
                         wait(.5)
                         Tween(CheckMon55)
                    end
               end
          end
     end
end)
spawn(function()
     while task.wait() do
          pcall(function()
               if _G.AutoPole then
                    pole()
                    for i, v in pairs(workspace.Enemies:GetChildren()) do
                         if v.Name == NameBoss then
                              if v.Humanoid.Health == 0 then
                                   v:Destroy()
                              end
                         end
                    end
               end
          end)
     end
end)

--------------------------------------------[[Saber]]--------------------------------------------


spawn(function()
     while task.wait() do
          if _G.AutoSaber then
               if game:GetService("Players").LocalPlayer.Data.Level.Value >= 200 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                         repeat task.wait()
                              FastTween(CFrame.new(-1609.29956, 40.0520697, 162.820404))
                         until (Vector3.new(-1609.29956, 40.0520697, 162.820404)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10
                         wait(3)
                         for i,v in pairs(game:GetService("Workspace").Map.Jungle.QuestPlates:GetChildren()) do
                              if v.Name == "Plate1" then
                                   repeat wait()
                                   FastTween(v.Button.CFrame)
                                   until (v.Button.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1
                                   wait(.1)
                              end
                              if v.Name == "Plate2" then
                                   repeat wait()
                                   FastTween(v.Button.CFrame)
                                   until (v.Button.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1
                                   wait(.1)
                              end
                              if v.Name == "Plate3" then
                                   repeat wait()
                                   FastTween(v.Button.CFrame)
                                   until (v.Button.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1
                                   wait(.1)
                              end
                              if v.Name == "Plate4" then
                                   repeat wait()
                                   FastTween(v.Button.CFrame)
                                   until (v.Button.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1
                                   wait(.1)
                              end
                              if v.Name == "Plate5" then
                                   repeat wait()
                                   FastTween(v.Button.CFrame)
                                   until (v.Button.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1
                                   wait(.1)
                              end
                         end
                         wait(2)
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1609.29956, 12.0520697, 162.820404, -0.993804812, 2.60902091e-08, 0.11113929, 3.47902116e-08, 1, 7.63408607e-08, -0.11113929, 7.97344768e-08, -0.993804812)
                         wait(2)
                         repeat task.wait()
                              EquipItem("Torch")
                              FastTween(CFrame.new(1113.9502, 4.92147732, 4350.91992, -0.60768199, 3.86533046e-08, 0.794180453, 6.00742425e-08, 1, -2.70375722e-09, -0.794180453, 4.60667628e-08, -0.60768199))
                              EquipItem("Torch")
                         until (Vector3.new(1113.9502, 4.92147732, 4350.91992)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1
                         EquipItem("Torch")
                         wait(1)
                         --fireclickdetector(game:GetService("Workspace").Map.Desert.Burn.Fire.ClickDetector)
                         task.wait(1)
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1113.9502, 4.92147732, 4350.91992, -0.60768199, 3.86533046e-08, 0.794180453, 6.00742425e-08, 1, -2.70375722e-09, -0.794180453, 4.60667628e-08, -0.60768199)
                         EquipItem("Torch")
                         task.wait(1)
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1113.9502, 4.92147732, 4350.91992, -0.60768199, 3.86533046e-08, 0.794180453, 6.00742425e-08, 1, -2.70375722e-09, -0.794180453, 4.60667628e-08, -0.60768199)
                         task.wait(3)
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.87708, 4.9214654, 4349.8501, -0.612586915, -9.68697833e-08, 0.790403247, -1.2634203e-07, 1, 2.4638446e-08, -0.790403247, -8.47679615e-08, -0.612586915)
                         EquipItem("Torch")
                         wait(2)
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1113.33618, 7.5484705, 4365.56396, -0.618000686, 2.54492516e-08, -0.786177576, -8.16741874e-09, 1, 3.87911392e-08, 0.786177576, 3.03939913e-08, -0.618000686)
                         wait(1)
                         repeat task.wait()
                              EquipItem("Cup")
                              FastTween(CFrame.new(1397.73975, 37.3480263, -1321.54456, -0.170597032, -4.99889588e-08, 0.985340893, 2.99880867e-08, 1, 5.59246409e-08, -0.985340893, 3.90890662e-08, -0.170597032))
                         until (Vector3.new(1397.73975, 37.3480263, -1321.54456)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2
                         wait(1)
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                         wait(1)
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                         if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                              warn("kuy")
                              if workspace.Enemies:FindFirstChild("Mob Leader") then
                                   for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v.Name == "Mob Leader" then
                                             repeat task.wait()
                                                  Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                                  v.Humanoid.WalkSpeed = 0
                                                  v.Humanoid.JumpPower = 0
                                                  v.HumanoidRootPart.CanCollide = false
                                                  v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                             until _G.AutoSaber == false
                                        end
                                   end
                              elseif not workspace.Enemies:FindFirstChild("Mob Leader") then
                                   FastTween(CFrame.new(-2878, 8, 5445))
                              end
                         elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                              if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") then
                                   EquipItem("Relic")
                                   repeat task.wait()
                                        EquipItem("Relic")
                                        FastTween(CFrame.new(-1406.60925, 29.8520069, 4.5805192, 0.882920146, 3.62382622e-08, 0.469523162, -3.61928865e-09, 1, -7.03750587e-08, -0.469523162, 6.04362143e-08, 0.882920146))
                                   until(Vector3.new(-1406.60925, 29.8520069, 4.5805192)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2
                                   task.wait(1)
                              else
                                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                              end
                         else
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                         end
                         wait(35)
                         if game.Workspace.Enemies:FindFirstChild("Saber Expert") then
                              for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                   if v.Name == "Saber Expert" then
                                        repeat task.wait()
                                             FastTween(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                             v.Humanoid.WalkSpeed = 0
                                             v.Humanoid.JumpPower = 0
                                             v.HumanoidRootPart.CanCollide = false
                                             v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false
                                   end
                              end
                         else
                              FastTween(CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094))
                         end
                    end
               end
          end
     end
end)

spawn(function()
     while task.wait() do
          pcall(function()
               if _G.AutoSaber then
                    for i, v in pairs(workspace.Enemies:GetChildren()) do
                         if v.Name == NameBoss then
                              if v.Humanoid.Health == 0 then
                                   v:Destroy()
                              end
                         end
                    end
               end
          end)
     end
end)

-------------------------------------------[[AutoStats]]--------------------------------------------

local Toggle = Tabs.Stats:AddToggle("MyToggle", { Title = "Melee", Default = false })
Toggle:OnChanged(function(Value)
_G.Melee = Value
     for i = 1, 500 do
          while _G.Melee do
               task.wait()
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
               "AddPoint", "Melee", point)
          end
     end
end)
Options.MyToggle:SetValue(false)

local Toggle = Tabs.Stats:AddToggle("MyToggle", { Title = "Defense", Default = false })

Toggle:OnChanged(function(Value)
_G.Defense = Value
     for i = 1, 500 do
          while _G.Defense do
               task.wait()
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
               "AddPoint", "Defense", point)
          end
     end
end)
Options.MyToggle:SetValue(false)

local Toggle = Tabs.Stats:AddToggle("MyToggle", { Title = "Sword", Default = false })
Toggle:OnChanged(function(Value)
_G.Sword = Value
     while _G.Sword do
          task.wait()
          for i = 1, 500 do
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AddPoint", "Sword", point)
          end
     end
end)
Options.MyToggle:SetValue(false)

local Toggle = Tabs.Stats:AddToggle("MyToggle", { Title = "Gun", Default = false })
Toggle:OnChanged(function(Value)
_G.Gun = Value
     while _G.Gun do
          task.wait()
          for i = 1, 500 do
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AddPoint", "Gun", point)
          end
     end
end)
Options.MyToggle:SetValue(false)

local Toggle = Tabs.Stats:AddToggle("MyToggle", { Title = "BloxFruit", Default = false })
Toggle:OnChanged(function(Value)
_G.BloxFruit = Value
     while _G.BloxFruit do
          task.wait()
          for i = 1, 500 do
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AddPoint", "Demon Fruit", point)
          end
     end
end)
Options.MyToggle:SetValue(false)

local Slider = Tabs.Stats:AddSlider("Slider", {
     Title = "Point",
     Default = 10,
     Min = 1,
     Max = 100,
     Rounding = 0,
     Callback = function(Value)
          point = Value
     end
})
Slider:SetValue(10)

--------------------------------------------[[Shop]]--------------------------------------------

--[[Haki]]--
     Tabs.Shop:AddParagraph({
          Title = "This is Shop Tab",
          Content = "Show the Store in sea1"
      })
local section = Tabs.Shop:AddSection("Haki")
Tabs.Shop:AddButton({
     Title = "BuyBuso",
     Description = "BuyBuso 25,000",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyBuso",
                    Duration = 2
               })
          end
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyHaki","Buso")
     end
})
Tabs.Shop:AddButton({
     Title = "BuyGeppo",
     Description = "BuyGeppo 10,000",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyGeppo",
                    Duration = 2
               })
          end
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyHaki","Geppo")
     end
})
Tabs.Shop:AddButton({
     Title = "BuySoru",
     Description = "BuySoru 100,000",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuySoru",
                    Duration = 2
               })
          end
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyHaki","Soru")
     end
})

--[[combat]]--

local section = Tabs.Shop:AddSection("Combat")
Tabs.Shop:AddButton({
     Title = "BuyBlackLeg",
     Description = "BuyBlackLeg 150,000 Beli",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyBlackLeg",
                    Duration = 2
               })
          end
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyBlackLeg")
     end
})
Tabs.Shop:AddButton({
     Title = "BuyElectro",
     Description = "BuyElectro 500,000 Beli",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyElectro",
                    Duration = 2
               })
          end
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("BuyElectro")
     end
})
Tabs.Shop:AddButton({
     Title = "BuyFishmanKarate",
     Description = "BuyFishmanKarate 750,000 Beli",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyFishmanKarate",
                    Duration = 2
               })
          end
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
     end
})
Tabs.Shop:AddButton({
     Title = "BuyDragonTalon",
     Description = "BuyDragonTalon 1,500 Fragments",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyDragonTalon",
                    Duration = 2
               })
          end
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
     end
})

--[[sword]]--

local section = Tabs.Shop:AddSection("Sword")
Tabs.Shop:AddButton({
     Title = "Katana",
     Description = "Katana 5,000 Beli",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "BuyKatana",
                    Duration = 2
               })
          end
     end
})

--------------------------------------------[[DevilFruit]]--------------------------------------------

local section = Tabs.DevilFruit:AddSection("")
Tabs.DevilFruit:AddButton({
     Title = "RandomFruit",
     Description = "GoodLuck :)",
     Callback = function()
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Cousin","Buy")
     end
})

local Toggle = Tabs.DevilFruit:AddToggle("MyToggle", {Title = "AutoRandomFruit", Default = false })

Toggle:OnChanged(function(Value)
_G.Fruit = Value
end)

Options.MyToggle:SetValue(false)
local Toggle = Tabs.DevilFruit:AddToggle("MyToggle", {Title = "AutoStoreFruit", Default = false })

Toggle:OnChanged(function(Value)
_G.SFruit = Value
end)

Options.MyToggle:SetValue(false)


coroutine.wrap(function()
     while task.wait() do
          if _G.Fruit then
               game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Cousin","Buy")
          end
     end
end)()

coroutine.wrap(function()
     if _G.SFruit then
          while _G.SFruit do task.wait()
          function getNil(name,class) 
               for _,v in next, getnilinstances() do 
                    if v.ClassName==class and v.Name==name then 
                         return v;
                    end 
               end 
          end
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StoreFruit","Spin-Spin",getNil("Spin Fruit", "Tool"))
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("StoreFruit","Rubber-Rubber",getNil("Rubber Fruit", "Tool"))
          end
     end
end)()

--------------------------------------------[[Misc]]--------------------------------------------

local section = Tabs.Teleport:AddSection("WorldTravel")
Tabs.Teleport:AddButton({
     Title = "EastBlue",
     Description = "Teleport You To EastBlue",
     Callback = function()
          Window:Dialog({
               Title = "Are You Sure?",
               Content = "Teleport You To EastBlue",
               Buttons = {
                    {
                         Title = "Yes!",
                         Callback = function()
                              do
                                   Fluent:Notify({
                                        Title = "Notification",
                                        Content = "TravelEastBlue.",
                                        Duration = 2
                                   })
                              end
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
                         end
                    },
                    {
                         Title = "No!",
                         Callback = function()
                              do
                                   Fluent:Notify({
                                        Title = "Notification",
                                        Content = "Ok.",
                                        Duration = 2
                                   })
                              end
                         end
                    }
               }
          })
     end
})
Tabs.Teleport:AddButton({
     Title = "Dressrosa",
     Description = "Teleport You To Dressrosa",
     Callback = function()
          Window:Dialog({
               Title = "Are You Sure?",
               Content = "Teleport You To Dressrosa",
               Buttons = {
                    {
                         Title = "Yes!",
                         Callback = function()
                              do
                                   Fluent:Notify({
                                        Title = "Notification",
                                        Content = "TravelDressrosa.",
                                        Duration = 2
                                   })
                              end
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                         end
                    },
                    {
                         Title = "No!",
                         Callback = function()
                              do
                                   Fluent:Notify({
                                        Title = "Notification",
                                        Content = "Ok.",
                                        Duration = 2
                                   })
                              end
                         end
                    }
               }
          })
     end
})
Tabs.Teleport:AddButton({
     Title = "Zou",
     Description = "Teleport You To Zou",
     Callback = function()
          Window:Dialog({
               Title = "Are You Sure?",
               Content = "Teleport You To Zou",
               Buttons = {
                    {
                         Title = "Yes!",
                         Callback = function()
                              do
                                   Fluent:Notify({
                                        Title = "Notification",
                                        Content = "TravelZou.",
                                        Duration = 2
                                   })
                              end
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                         end
                    },
                    {
                         Title = "No!",
                         Callback = function()
                              do
                                   Fluent:Notify({
                                        Title = "Notification",
                                        Content = "Ok.",
                                        Duration = 2
                                   })
                              end
                         end
                    }
               }
          })
     end
})

--------------------------------------------[[Misc(Teleport)]]--------------------------------------------


if OldWorld then

local islands = {"Pirate starter", "Marine starter", "Jungle", "Pirate Village", "Desert", "Frozen Village", "MarineFord", "Sky 1st Floor", "Prison", "Sky 2st Floor", "Sky 3st Floor"}

function getCFrameForIsland(islandName)
     local positions = {
          ["Pirate starter"] = CFrame.new(1071.2832, 16.3085976, 1426.86792),
          ["Marine starter"] = CFrame.new(-2573.3374, 6.88881969, 2046.99817),
          ["Jungle"] = CFrame.new(-1249.77222, 11.8870859, 341.356476),
          ["Pirate Village"] = CFrame.new(-1122.34998, 4.78708982, 3855.91992),
          ["Desert"] = CFrame.new(1094.14587, 6.47350502, 4192.88721),
          ["Frozen Village"] = CFrame.new(1198.00928, 27.0074959, -1211.73376),
          ["MarineFord"] = CFrame.new(-4505.375, 20.687294, 4260.55908),
          ["Sky 1st Floor"] = CFrame.new(-4970.21875, 717.707275, -2622.35449),
          ["Prison"] = CFrame.new(4854.16455, 5.68742752, 740.194641),
          ["Sky 2st Floor"] = CFrame.new(-4813.0249, 903.708557, -1912.69055),
          ["Sky 3st Floor"] = CFrame.new(-7952.31006, 5545.52832, -320.704956)
     }
     return positions[islandName]
end
function is(land)
     local targetCFrame = getCFrameForIsland(land)
     if targetCFrame then
          Tween(targetCFrame)
     else
          print("Unknown island: " .. land)
     end
end
local section = Tabs.Teleport:AddSection("Island Teleport")
     local Dropdown = Tabs.Teleport:AddDropdown("Dropdown", {
          Title = "Select Island",
          Values = islands,
          Multi = false,
          Default = 1,
     })

     Dropdown:SetValue()

     Dropdown:OnChanged(function(Value)
          land = Value
     end)

     local Toggle = Tabs.Teleport:AddToggle("MyToggle", {Title = "Teleport", Default = false})

     Toggle:OnChanged(function(Value)
          _G.island = Value
          if _G.island then
               is(Dropdown.Value)  -- เรียกใช้ฟังก์ชัน is พร้อมกับค่า Dropdown ที่เลือก
          end
     end)
     Options.MyToggle:SetValue(false)
elseif NewWorld then
     local islands = {""}

function getCFrameForIsland(islandName)
    local positions = {

    }
    return positions[islandName]
end
function is(land)
     local targetCFrame = getCFrameForIsland(land)
     if targetCFrame then
          Tween(targetCFrame)
     else
          print("Unknown island: " .. land)
     end
end
local section = Tabs.Teleport:AddSection("Island Teleport")
     local Dropdown = Tabs.Teleport:AddDropdown("Dropdown", {
          Title = "Select Island",
          Values = islands,
          Multi = false,
          Default = 1,
     })

     Dropdown:SetValue()

     Dropdown:OnChanged(function(Value)
          land = Value
     end)

     local Toggle = Tabs.Teleport:AddToggle("MyToggle", {Title = "Teleport", Default = false})

     Toggle:OnChanged(function(Value)
          _G.island = Value
          if _G.island then
               is(Dropdown.Value)  -- เรียกใช้ฟังก์ชัน is พร้อมกับค่า Dropdown ที่เลือก
          end
     end)
     Options.MyToggle:SetValue(false)
end
--------------------------------------------[[AutoFactory]]--------------------------------------------

function Factory()
     spawnpoint = CFrame.new(-379.871765, 72.0878448, 250.478149, -0.999848366, 0, -0.017436387, 0, 1, 0, 0.017436387, 0, -0.999848366)
     Pak = CFrame.new(282, 74, -282)
     NameMon = "Core"
end

spawn(function()
     while task.wait() do
          if _G.AutoFactory then
               pcall(function()
                    Factory()
                    if (spawnpoint.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
                         Tween(spawnpoint)
                    else
                         Bypass(Pak)
                    end
                    if game.Workspace.Enemies:FindFirstChild("Core") then
                         for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                              if v.Name == "Core" and v.Humanoid.Health > 0 then
                                   repeat task.wait()
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0))
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                   until not _G.Factory or game.workspace.Map.Dressrosa.SmileFactory.Door.Transparency == 0
                              end
                         end
                    end
                    if game.workspace.Map.Dressrosa.SmileFactory.Door.Transparency == 0 then
                         Tween(Pak)
                    end
               end)
          end
     end
end)

--------------------------------------------[[Setting]]--------------------------------------------
Tabs.Settings:AddButton({
     Title = "Rejoin",
     Description = "",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "Rejoin Server...",
                    Duration = 5               -- Set to nil to make the notification not disappear
               })
          end
          wait(1.5)
          local ts = game:GetService("TeleportService")
          local p = game:GetService("Players").LocalPlayer
          ts:Teleport(game.PlaceId, p)
     end
})
Tabs.Settings:AddButton({
     Title = "Hop to a low server",
     Description = "",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "Hop to a low server...",
                    Duration = 5               -- Set to nil to make the notification not disappear
               })
          end
          wait(1.5)
          local Http = game:GetService("HttpService")
          local TPS = game:GetService("TeleportService")
          local Api = "https://games.roblox.com/v1/games/"
          local _place = game.PlaceId
          local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
          function ListServers(cursor)
               local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
               return Http:JSONDecode(Raw)
          end
          local Server, Next; repeat
               local Servers = ListServers(Next)
               Server = Servers.data[1]
               Next = Servers.nextPageCursor
          until Server
          TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
     end
})
Tabs.Settings:AddButton({
     Title = "FpsBoots",
     Description = "",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "FreeFireMode👽",
                    Duration = 3 -- Set to nil to make the notification not disappear
               })
          end
          local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
          local g = game
          local w = g.Workspace
          local l = g.Lighting
          local t = w.Terrain
          sethiddenproperty(l, "Technology", 2)
          sethiddenproperty(t, "Decoration", false)
          t.WaterWaveSize = 0
          t.WaterWaveSpeed = 0
          t.WaterReflectance = 0
          t.WaterTransparency = 0
          l.GlobalShadows = 0
          l.FogEnd = 9e9
          l.Brightness = 0
          settings().Rendering.QualityLevel = "Level01"
          for i, v in pairs(w:GetDescendants()) do
               if v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
               elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
                    v.Transparency = 1
               elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
               elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
               elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
               elseif v:IsA("MeshPart") and decalsyeeted then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
               elseif v:IsA("SpecialMesh") and decalsyeeted then
                    v.TextureId = 0
               elseif v:IsA("ShirtGraphic") and decalsyeeted then
                    v.Graphic = 0
               elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                    v[v.ClassName .. "Template"] = 0
               end
          end
          for i = 1, #l:GetChildren() do
               e = l:GetChildren()[i]
               if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                    e.Enabled = false
               end
          end
          w.DescendantAdded:Connect(function(v)
               wait() --prevent errors and shit
               if v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
               elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                    v.Transparency = 1
               elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
               elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
               elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
               elseif v:IsA("MeshPart") and decalsyeeted then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
               elseif v:IsA("SpecialMesh") and decalsyeeted then
                    v.TextureId = 0
               elseif v:IsA("ShirtGraphic") and decalsyeeted then
                    v.ShirtGraphic = 0
               elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                    v[v.ClassName .. "Template"] = 0
               end
          end)
     end
})
Tabs.Settings:AddButton({
     Title = "Remove Lava Dmange",
     Description = "Remove All Lava Dmange",
     Callback = function()
          for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy()
			end
		end
		for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy()
			end
		end
     end
})

Tabs.Settings:AddButton({
     Title = "Remove Fog",
     Description = "Remove All Fog",
     Callback = function()
          do
               Fluent:Notify({
                    Title = "Notification",
                    Content = "Remove Fog!",
                    Duration = 5 -- Set to nil to make the notification not disappear
               })
          end
          local Lighting = game:GetService("Lighting")
          Lighting.FogEnd = 100000
          for i, v in pairs(Lighting:GetDescendants()) do
               if v:IsA("Atmosphere") then
                    v:Destroy()
               end
          end
     end
})


local Lighting = game:GetService("Lighting")

local Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "FullBright", Default = false })

Toggle:OnChanged(function(Value)
_G.FullBright = Value
     if _G.FullBright then
          while _G.FullBright do task.wait(.0001)
               Lighting.Brightness = 2
               Lighting.ClockTime = 14
               Lighting.GlobalShadows = false
               Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
          end
     end
end)

Options.MyToggle:SetValue(false)
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(2)

repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
po.ChildAdded:connect(function(a)
     if a.Name == 'ErrorPrompt' then
          repeat
               ts:Teleport(game.PlaceId)
               wait(2)
          until false
     end
end)
wait(.1)
textLabel:TweenPosition(UDim2.new(0.5, -100, 1, 0), "Out", "Quint", 1, true)
wait(1)
screenGui:Destroy()

-------------------------------------------------[[Toggle UI]]--------------------------------------------

do
     local ToggleUI = game.CoreGui:FindFirstChild("MyToggle") 
     if ToggleUI then
     ToggleUI:Destroy()
     end
end

local MyToggle = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

--Properties:

MyToggle.Name = "MyToggle"
MyToggle.Parent = game.CoreGui
MyToggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = MyToggle
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.156000003, 0, -0, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Image = "rbxassetid://17156242075"
ImageButton.MouseButton1Click:Connect(function()
game.CoreGui:FindFirstChild("ScreenGui").Enabled = not game.CoreGui:FindFirstChild("ScreenGui").Enabled
end)


UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton


setfpscap(1000)
