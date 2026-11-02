local function UltimateSync()
    for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v:IsA("ScreenGui") and (v.Name:find("Xeno") or v.Name:find("Aeternum")) then v:Destroy() end
    end
    if _G.FOVCircle then pcall(function() _G.FOVCircle:Remove() end) end
    if _G.CrosshairDot then pcall(function() _G.CrosshairDot:Remove() end) end
    
    if _G.Lines then for _, l in pairs(_G.Lines) do pcall(function() l:Remove() end) end end
    if _G.Names then for _, n in pairs(_G.Names) do pcall(function() n:Remove() end) end end
    if _G.SkeletonDrawings then for _, skelList in pairs(_G.SkeletonDrawings) do for _, bone in pairs(skelList) do pcall(function() bone:Remove() end) end end end
    if _G.Boxes then for _, b in pairs(_G.Boxes) do pcall(function() b:Remove() end) end end
    _G.Lines = {}
    _G.Names = {}
    _G.SkeletonDrawings = {}
    _G.Boxes = {}
end
UltimateSync()

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local StatsService = game:GetService("Stats")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local v2new = Vector2.new
local cfnew = CFrame.new

-- HWID (DONANIM KİMLİĞİ) ALICI
local MyHWID = ""
pcall(function()
    MyHWID = game:GetService("RbxAnalyticsService"):GetClientId()
end)

-- KEY SISTEMI GLOBAL TANIMLAMALARI
_G.Authenticated = false
_G.ExpireTime = 0
_G.CurrentKey = ""
local AuthFile = "HzLuNeX_KeyData.json"

local ValidKeys = {
    ["-rblxhledneme-srum-5sat"] = 18000, ["-rblxhledneme-srum-5sat2"] = 18000, ["-rblxhledneme-srum-5sat3"] = 18000, ["-rblxhledneme-srum-5sat4"] = 18000, ["-rblxhledneme-srum-5sat5"] = 18000, ["-rblxhledneme-srum-5sat6"] = 18000, ["-rblxhledneme-srum-5sat7"] = 18000, ["-rblxhledneme-srum-5sat8"] = 18000, ["-rblxhledneme-srum-5sat9"] = 18000, ["-rblxhledneme-srum-5sat10"] = 18000, ["-rblxhledneme-srum-5sat11"] = 18000, ["-rblxhledneme-srum-5sat12"] = 18000, ["-rblxhledneme-srum-5sat13"] = 18000, ["-rblxhledneme-srum-5sat14"] = 18000, ["-rblxhledneme-srum-5sat15"] = 18000, ["-rblxhledneme-srum-5sat16"] = 18000, ["-rblxhledneme-srum-5sat17"] = 18000, ["-rblxhledneme-srum-5sat18"] = 18000, ["-rblxhledneme-srum-5sat19"] = 18000, ["-rblxhledneme-srum-5sat20"] = 18000,
    ["-rblx1gun-24sat"] = 86400, ["-rblx1gun-24sat2"] = 86400, ["-rblx1gun-24sat3"] = 86400, ["-rblx1gun-24sat4"] = 86400, ["-rblx1gun-24sat5"] = 86400, ["-rblx1gun-24sat6"] = 86400, ["-rblx1gun-24sat7"] = 86400, ["-rblx1gun-24sat8"] = 86400, ["-rblx1gun-24sat9"] = 86400, ["-rblx1gun-24sat10"] = 86400, ["-rblx1gun-24sat11"] = 86400, ["-rblx1gun-24sat12"] = 86400, ["-rblx1gun-24sat13"] = 86400, ["-rblx1gun-24sat14"] = 86400, ["-rblx1gun-24sat15"] = 86400, ["-rblx1gun-24sat16"] = 86400, ["-rblx1gun-24sat17"] = 86400, ["-rblx1gun-24sat18"] = 86400, ["-rblx1gun-24sat19"] = 86400, ["-rblx1gun-24sat20"] = 86400,
    ["-rblx1hft-7gun-168sat"] = 604800, ["-rblx1hft-7gun-168sat2"] = 604800, ["-rblx1hft-7gun-168sat3"] = 604800, ["-rblx1hft-7gun-168sat4"] = 604800, ["-rblx1hft-7gun-168sat5"] = 604800, ["-rblx1hft-7gun-168sat6"] = 604800, ["-rblx1hft-7gun-168sat7"] = 604800, ["-rblx1hft-7gun-168sat8"] = 604800, ["-rblx1hft-7gun-168sat9"] = 604800, ["-rblx1hft-7gun-168sat10"] = 604800, ["-rblx1hft-7gun-168sat11"] = 604800, ["-rblx1hft-7gun-168sat12"] = 604800, ["-rblx1hft-7gun-168sat13"] = 604800, ["-rblx1hft-7gun-168sat14"] = 604800, ["-rblx1hft-7gun-168sat15"] = 604800, ["-rblx1hft-7gun-168sat16"] = 604800, ["-rblx1hft-7gun-168sat17"] = 604800, ["-rblx1hft-7gun-168sat18"] = 604800, ["-rblx1hft-7gun-168sat19"] = 604800, ["-rblx1hft-7gun-168sat20"] = 604800,
    ["-rblx1ay-30gn-730sat"] = 2592000, ["-rblx1ay-30gn-730sat2"] = 2592000, ["-rblx1ay-30gn-730sat3"] = 2592000, ["-rblx1ay-30gn-730sat4"] = 2592000, ["-rblx1ay-30gn-730sat5"] = 2592000, ["-rblx1ay-30gn-730sat6"] = 2592000, ["-rblx1ay-30gn-730sat7"] = 2592000, ["-rblx1ay-30gn-730sat8"] = 2592000, ["-rblx1ay-30gn-730sat9"] = 2592000, ["-rblx1ay-30gn-730sat10"] = 2592000, ["-rblx1ay-30gn-730sat11"] = 2592000, ["-rblx1ay-30gn-730sat12"] = 2592000, ["-rblx1ay-30gn-730sat13"] = 2592000, ["-rblx1ay-30gn-730sat14"] = 2592000, ["-rblx1ay-30gn-730sat15"] = 2592000, ["-rblx1ay-30gn-730sat16"] = 2592000, ["-rblx1ay-30gn-730sat17"] = 2592000, ["-rblx1ay-30gn-730sat18"] = 2592000, ["-rblx1ay-30gn-730sat19"] = 2592000, ["-rblx1ay-30gn-730sat20"] = 2592000,
    ["-rblx1yl-356gun-8760sat"] = 31536000, ["-rblx1yl-356gun-8760sat2"] = 31536000, ["-rblx1yl-356gun-8760sat3"] = 31536000, ["-rblx1yl-356gun-8760sat4"] = 31536000, ["-rblx1yl-356gun-8760sat5"] = 31536000, ["-rblx1yl-356gun-8760sat6"] = 31536000, ["-rblx1yl-356gun-8760sat7"] = 31536000, ["-rblx1yl-356gun-8760sat8"] = 31536000, ["-rblx1yl-356gun-8760sat9"] = 31536000, ["-rblx1yl-356gun-8760sat10"] = 31536000, ["-rblx1yl-356gun-8760sat11"] = 31536000, ["-rblx1yl-356gun-8760sat12"] = 31536000, ["-rblx1yl-356gun-8760sat13"] = 31536000, ["-rblx1yl-356gun-8760sat14"] = 31536000, ["-rblx1yl-356gun-8760sat15"] = 31536000, ["-rblx1yl-356gun-8760sat16"] = 31536000, ["-rblx1yl-356gun-8760sat17"] = 31536000, ["-rblx1yl-356gun-8760sat18"] = 31536000, ["-rblx1yl-356gun-8760sat19"] = 31536000, ["-rblx1yl-356gun-8760sat20"] = 31536000,
    ["-rblxsinirsizkey-rblx-snrsz-hle-ky"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky2"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky3"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky4"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky5"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky6"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky7"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky8"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky9"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky10"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky11"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky12"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky13"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky14"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky15"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky16"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky17"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky18"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky19"] = 999999999, ["-rblxsinirsizkey-rblx-snrsz-hle-ky20"] = 999999999
}

local function GetSavedAuth()
    if isfile and isfile(AuthFile) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(AuthFile)) end)
        if success and data then return data end
    end
    return nil
end

local function SaveAuth(key, expire)
    if writefile then
        pcall(function() writefile(AuthFile, HttpService:JSONEncode({Key = key, Expire = expire, HWID = MyHWID})) end)
    end
end

local function DeleteAuth()
    if isfile and isfile(AuthFile) and delfile then
        pcall(function() delfile(AuthFile) end)
    else
        SaveAuth("IPTAL", 0)
    end
end

local SharedRayParams = RaycastParams.new()
SharedRayParams.FilterType = Enum.RaycastFilterType.Exclude
local LastRecoilUpdate = 0 

-- HİLE ÖZELLİK METADATALARI
_G.Aimbot = false
_G.SilentAim = false
_G.TriggerBot = false 
_G.TriggerKey = nil 
_G.GodMode = false
_G.NoRecoil = false
_G.NoSpread = false
_G.Wallhack = false
_G.ESPBox = false
_G.SkeletonESP = false
_G.ShowNames = false
_G.ShowHealth = false
_G.ShowDistance = true 
_G.Tracers = false
_G.TeamCheck = true
_G.Fly = false
_G.Noclip = false  
_G.FlySpeed = 50
_G.SpeedHack = false
_G.WalkSpeed = 50
_G.JumpHack = false
_G.JumpPower = 50
_G.Bhop = false 
_G.FovSize = 150
_G.TargetPart = "Head"
_G.KarmaMode = false
_G.ShowFOV = false
_G.SpinbotMode = false
_G.SpinbotSpeed = 300
_G.Full360Aimbot = false
_G.AutoFire = false
_G.ThirdPerson = false 
_G.ChatSpam = false
_G.ChatText = "Mesaj Yazmak İçin Tıkla"
_G.ChatDelay = 1
_G.TurboDelay = 50 
_G.TurboKey = Enum.KeyCode.T 
_G.AutoKillChat = false
_G.KillMessage = "Kill Mesajını Yazmak için Tıkla"
_G.LastTargetted = nil 
_G.EnableFOVChanger = false
_G.CameraFOV = 100
_G.AntiKick = false
_G.HitboxExpander = false  
_G.HitboxSize = 5
_G.ShiftLock = false

-- PREDICTION (TAHMİN) SİSTEMİ EKLENTİSİ
_G.PredictionEnabled = true
_G.PredictionFactor = 0.135

-- CURVE BULLET (KAVİSLİ MERMİ) ÖZELLİĞİ EKLENTİSİ
_G.CurveBullet = false
_G.CurveIntensity = 5

-- ANTI COOLDOWN (SERİ VURUŞ HIZI) ÖZELLİĞİ
_G.AntiCooldown = false

-- GÖRÜNMEZLİK (INVISIBILITY) ÖZELLİĞİ
_G.Invisibility = false

-- WALLBANG & NPC
_G.WallBang = false 
_G.TargetNPCs = false 

-- OBS BYPASS ÖZELLİĞİ
_G.ObsBypass = false

-- PERFORMANS HIZ TUTUCU
local FrameSkipCounter = 0

-- PANIC BUTTON GLOBAL SİSTEMİ
_G.PanicActive = false
_G.SavedPanicStates = {}

local PanicTrackedVars = {
    "Aimbot", "SilentAim", "TriggerBot", "GodMode", "NoRecoil", "NoSpread", "Wallhack", "ESPBox", "SkeletonESP",
    "ShowNames", "ShowHealth", "ShowDistance", "Tracers", "Fly", "Noclip",
    "SpeedHack", "JumpHack", "Bhop", "ShowFOV", "SpinbotMode", "Full360Aimbot",
    "AutoFire", "ThirdPerson", "ChatSpam", "AutoKillChat", "EnableFOVChanger",
    "HitboxExpander", "ShiftLock", "WallBang", "TargetNPCs", "ObsBypass", "Invisibility", "PredictionEnabled", "CurveBullet", "AntiCooldown"
}

local Main -- Forward declaration for Panic UI hiding
local HUDFrame -- Forward declaration for Panic HUD hiding

local function TogglePanicMode()
    if not _G.Authenticated then return end
    if not _G.PanicActive then
        _G.PanicActive = true
        _G.SavedPanicStates = {}
        for _, vName in ipairs(PanicTrackedVars) do
            _G.SavedPanicStates[vName] = _G[vName]
            _G[vName] = false
        end
        if Main then Main.Visible = false end
        if HUDFrame then HUDFrame.Visible = false end
        if _G.FOVCircle then _G.FOVCircle.Visible = false end
        if _G.CrosshairDot then _G.CrosshairDot.Visible = false end
        if _G.Lines then for _, l in pairs(_G.Lines) do pcall(function() l.Visible = false end) end end
        if _G.Names then for _, n in pairs(_G.Names) do pcall(function() n.Visible = false end) end end
        if _G.Boxes then for _, b in pairs(_G.Boxes) do pcall(function() b.Visible = false end) end end
        if _G.SkeletonDrawings then for _, skelList in pairs(_G.SkeletonDrawings) do for _, bone in pairs(skelList) do pcall(function() bone.Visible = false end) end end end
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("UltimateHL") then
                p.Character.UltimateHL:Destroy()
            end
        end
    else
        _G.PanicActive = false
        for _, vName in ipairs(PanicTrackedVars) do
            if _G.SavedPanicStates[vName] ~= nil then
                _G[vName] = _G.SavedPanicStates[vName]
            end
        end
        _G.SavedPanicStates = {}
    end
end

local Screen = Instance.new("ScreenGui", game:GetService("CoreGui"))
Screen.Name = "Hz.Arche Cheat"
Screen.IgnoreGuiInset = true

-- WASD FIX: Ekranda boş bir yere tıklandığında aktif olan TextBox odaklanmasını kaldırıp oyun kontrollerini (WASD) serbest bırakır.
UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local focusedBox = UIS:GetFocusedTextBox()
        if focusedBox then
            focusedBox:ReleaseFocus()
        end
    end
end)

-- MODERN HUD FRAME
HUDFrame = Instance.new("Frame", Screen)
HUDFrame.Size = UDim2.new(0, 240, 0, 95)
HUDFrame.Position = UDim2.new(1, -15, 0, 15)
HUDFrame.AnchorPoint = Vector2.new(1, 0)
HUDFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
HUDFrame.BackgroundTransparency = 0.15
HUDFrame.Visible = false
Instance.new("UICorner", HUDFrame).CornerRadius = UDim.new(0, 8)
local HUDStroke = Instance.new("UIStroke", HUDFrame)
HUDStroke.Color = Color3.fromRGB(0, 255, 150)
HUDStroke.Transparency = 0.5
HUDStroke.Thickness = 1.5

local HUDText = Instance.new("TextLabel", HUDFrame)
HUDText.Size = UDim2.new(1, -20, 0, 25)
HUDText.Position = UDim2.new(0, 10, 0, 8)
HUDText.BackgroundTransparency = 1
HUDText.TextColor3 = Color3.fromRGB(0, 255, 150)
HUDText.Font = Enum.Font.GothamBold
HUDText.TextSize = 12
HUDText.TextXAlignment = Enum.TextXAlignment.Left

local HUDPackage = Instance.new("TextLabel", HUDFrame)
HUDPackage.Size = UDim2.new(1, -20, 0, 20)
HUDPackage.Position = UDim2.new(0, 10, 0, 35)
HUDPackage.BackgroundTransparency = 1
HUDPackage.TextColor3 = Color3.new(1, 1, 1)
HUDPackage.Font = Enum.Font.GothamBold
HUDPackage.TextSize = 11
HUDPackage.TextXAlignment = Enum.TextXAlignment.Left

local HUDHardware = Instance.new("TextLabel", HUDFrame)
HUDHardware.Size = UDim2.new(1, -20, 0, 30)
HUDHardware.Position = UDim2.new(0, 10, 0, 57)
HUDHardware.BackgroundTransparency = 1
HUDHardware.TextColor3 = Color3.fromRGB(0, 210, 255)
HUDHardware.Font = Enum.Font.GothamBold
HUDHardware.TextSize = 10
HUDHardware.TextXAlignment = Enum.TextXAlignment.Left

local function ShowHUD()
    HUDFrame.Visible = true
    task.spawn(function()
        while task.wait(1) do
            if _G.Authenticated and _G.ExpireTime then
                local left = _G.ExpireTime - os.time()
                local currentStr = string.lower(tostring(_G.CurrentKey))
                local pkgName = "BILINMEYEN PAKET"
                local isUnlimited = false
                
                if currentStr:find("dneme") then pkgName = "DENEME SÜRÜMÜ"
                elseif currentStr:find("1gun") then pkgName = "1 GÜNLÜK PAKET"
                elseif currentStr:find("1hft") then pkgName = "1 HAFTALIK PAKET"
                elseif currentStr:find("1ay") then pkgName = "1 AYLIK PAKET"
                elseif currentStr:find("1yl") then pkgName = "1 YILLIK PAKET"
                elseif currentStr:find("sinirsiz") then 
                    pkgName = "SINIRSIZ PAKET"
                    isUnlimited = true
                end

                if isUnlimited then
                    HUDPackage.Text = "PAKET: " .. pkgName
                    HUDPackage.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
                else
                    HUDPackage.Text = "PAKET: " .. pkgName
                    HUDPackage.TextColor3 = Color3.fromRGB(200, 200, 200)
                end

                local memMb = StatsService:GetTotalMemoryUsageMb()
                local ramStr = string.format("%.1f GB", memMb / 1024)
                
                local activeFeaturesCount = 0
                for _, vName in ipairs(PanicTrackedVars) do
                    if _G[vName] then activeFeaturesCount = activeFeaturesCount + 1 end
                end
                
                local baseGpu = 48 + (activeFeaturesCount * 1.2) + (math.sin(tick()) * 2)
                local baseCpu = 52 + (activeFeaturesCount * 1.5) + (math.cos(tick()) * 2)
                local gpuTemp = math.floor(math.clamp(baseGpu, 42, 85))
                local cpuTemp = math.floor(math.clamp(baseCpu, 45, 90))

                HUDHardware.Text = string.format("GPU: %d°C  |  CPU: %d°C  |  RAM: %s", gpuTemp, cpuTemp, ramStr)

                if left <= 0 then
                    HUDText.Text = "SÜRE BİTTİ AMK!"
                    HUDText.TextColor3 = Color3.fromRGB(255, 0, 0)
                    task.wait(2)
                    LP:Kick("Hile anahtarının süresi bitti, git yenisini al.")
                else
                    local h = math.floor(left / 3600)
                    local m = math.floor((left % 3600) / 60)
                    local s = left % 60
                    HUDText.Text = string.format("Hz.Arche | %02d:%02d:%02d", h, m, s)
                end
            end
        end
    end)
end

-- AUTH FRAME (GİRİŞ EKRANI)
local AuthFrame = Instance.new("Frame", Screen)
AuthFrame.Size = UDim2.new(0, 360, 0, 220)
AuthFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
AuthFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
AuthFrame.BackgroundTransparency = 0.1
AuthFrame.Visible = false
Instance.new("UICorner", AuthFrame).CornerRadius = UDim.new(0, 12)
local AuthStroke = Instance.new("UIStroke", AuthFrame); AuthStroke.Color = Color3.fromRGB(0, 255, 150); AuthStroke.Thickness = 1.5

local AuthTitle = Instance.new("TextLabel", AuthFrame)
AuthTitle.Size = UDim2.new(1, 0, 0, 50)
AuthTitle.BackgroundTransparency = 1
AuthTitle.Text = "Hz.Arche KEY GİRİŞİ"
AuthTitle.TextColor3 = Color3.fromRGB(0, 255, 150)
AuthTitle.Font = Enum.Font.GothamBlack
AuthTitle.TextSize = 18

local AuthInputWrap = Instance.new("Frame", AuthFrame)
AuthInputWrap.Size = UDim2.new(1, -48, 0, 44)
AuthInputWrap.Position = UDim2.new(0, 24, 0, 60)
AuthInputWrap.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
Instance.new("UICorner", AuthInputWrap).CornerRadius = UDim.new(0, 8)
local AuthInputStroke = Instance.new("UIStroke", AuthInputWrap); AuthInputStroke.Color = Color3.fromRGB(40, 40, 55); AuthInputStroke.Thickness = 1

local AuthInput = Instance.new("TextBox", AuthInputWrap)
AuthInput.Size = UDim2.new(1, 0, 1, 0)
AuthInput.BackgroundTransparency = 1
AuthInput.TextTransparency = 1
AuthInput.Text = ""
AuthInput.ClearTextOnFocus = false

local AuthMask = Instance.new("TextLabel", AuthInputWrap)
AuthMask.Size = UDim2.new(1, -16, 1, 0)
AuthMask.Position = UDim2.new(0, 12, 0, 0)
AuthMask.BackgroundTransparency = 1
AuthMask.Text = "Hile Anahtarını Gir..."
AuthMask.TextColor3 = Color3.fromRGB(160, 160, 175)
AuthMask.Font = Enum.Font.GothamBold
AuthMask.TextSize = 14
AuthMask.TextXAlignment = Enum.TextXAlignment.Left

AuthInput:GetPropertyChangedSignal("Text"):Connect(function()
    if AuthInput.Text == "" then
        AuthMask.Text = "Hile Anahtarını Gir..."
    else
        AuthMask.Text = string.rep("*", string.len(AuthInput.Text))
    end
end)

local AuthBtn = Instance.new("TextButton", AuthFrame)
AuthBtn.Size = UDim2.new(1, -48, 0, 44)
AuthBtn.Position = UDim2.new(0, 24, 0, 116)
AuthBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
AuthBtn.TextColor3 = Color3.fromRGB(12, 12, 16)
AuthBtn.Text = "GİRİŞ YAP"
AuthBtn.Font = Enum.Font.GothamBlack
AuthBtn.TextSize = 15
Instance.new("UICorner", AuthBtn).CornerRadius = UDim.new(0, 8)

local DiscordPromoText = Instance.new("TextLabel", AuthFrame)
DiscordPromoText.Size = UDim2.new(1, 0, 0, 20)
DiscordPromoText.Position = UDim2.new(0, 0, 0, 170)
DiscordPromoText.BackgroundTransparency = 1
DiscordPromoText.Text = "Discord'dan deneme sürümünü almayı unutma"
DiscordPromoText.TextColor3 = Color3.fromRGB(200, 200, 210)
DiscordPromoText.Font = Enum.Font.Gotham
DiscordPromoText.TextSize = 11

local DiscordBedavaText = Instance.new("TextLabel", AuthFrame)
DiscordBedavaText.Size = UDim2.new(1, 0, 0, 20)
DiscordBedavaText.Position = UDim2.new(0, 0, 0, 190)
DiscordBedavaText.BackgroundTransparency = 1
DiscordBedavaText.Text = "(BEDAVA)"
DiscordBedavaText.Font = Enum.Font.GothamBold
DiscordBedavaText.TextSize = 12

task.spawn(function()
    while task.wait(0.2) do
        if AuthFrame.Visible then
            DiscordBedavaText.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
        end
    end
end)

local Watermark = Instance.new("TextLabel", Screen)
Watermark.Name = "WatermarkHz"
Watermark.Size = UDim2.new(0, 200, 0, 20)
Watermark.Position = UDim2.new(1, -15, 0, 15)
Watermark.AnchorPoint = Vector2.new(1, 0)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.GothamBlack
Watermark.TextSize = 15
Watermark.TextXAlignment = Enum.TextXAlignment.Right
Watermark.Text = "Hz.Arche Sunarrr"

local IntroFrame = Instance.new("Frame", Screen)
IntroFrame.Size = UDim2.new(1, 0, 1, 0); IntroFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 8); IntroFrame.ZIndex = 10
local IntroText = Instance.new("TextLabel", IntroFrame)
IntroText.Size = UDim2.new(1, 0, 1, 0); IntroText.BackgroundTransparency = 1; IntroText.Font = Enum.Font.GothamBlack
IntroText.TextSize = 50; IntroText.TextColor3 = Color3.fromRGB(0, 255, 150); IntroText.Text = ""; IntroText.ZIndex = 11

-- MODERN SIDEBAR & MAIN WINDOW DESIGN
Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 640, 0, 480) 
Main.Position = UDim2.new(0.5, -320, 0.5, -240)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
Main.BackgroundTransparency = 0.08
Main.Draggable = true; Main.Active = true; Main.Visible = false
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local Stroke = Instance.new("UIStroke", Main); Stroke.Color = Color3.fromRGB(0, 255, 150); Stroke.Thickness = 1.5

-- Top Bar Header
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Hz.Arche — Roblox Script"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseMainBtn = Instance.new("TextButton", TopBar)
CloseMainBtn.Size = UDim2.new(0, 28, 0, 28)
CloseMainBtn.Position = UDim2.new(1, -38, 0, 8)
CloseMainBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseMainBtn.Text = "✕"
CloseMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseMainBtn.Font = Enum.Font.GothamBold
CloseMainBtn.TextSize = 13
Instance.new("UICorner", CloseMainBtn).CornerRadius = UDim.new(0, 6)
CloseMainBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

-- Sidebar Container (Left Navigation)
local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.Size = UDim2.new(0, 145, 1, -55)
Sidebar.Position = UDim2.new(0, 10, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
Sidebar.BackgroundTransparency = 0.5
Sidebar.ScrollBarThickness = 2
Sidebar.CanvasSize = UDim2.new(0, 0, 1.2, 0)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)
local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.Padding = UDim.new(0, 6)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Page Container (Right Content Area)
local PageContainer = Instance.new("Frame", Main)
PageContainer.Size = UDim2.new(1, -170, 1, -55)
PageContainer.Position = UDim2.new(0, 160, 0, 45)
PageContainer.BackgroundTransparency = 1

local function CreateTab(name, isFirst)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, -12, 0, 36)
    btn.Text = "  " .. name
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BackgroundColor3 = isFirst and Color3.fromRGB(25, 25, 38) or Color3.fromRGB(18, 18, 25)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = isFirst and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(160, 160, 175)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local page = Instance.new("ScrollingFrame", PageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 4
    page.Visible = isFirst
    page.CanvasSize = UDim2.new(0, 0, 3.2, 0)
    local listLayout = Instance.new("UIListLayout", page)
    listLayout.Padding = UDim.new(0, 8)
    
    return btn, page, listLayout
end

local BtnMove, PageMove = CreateTab("Move", true)
local BtnCombat, PageCombat = CreateTab("Combat", false)
local BtnVisual, PageVisual = CreateTab("Visual", false)
local BtnChat, PageChat = CreateTab("Chat", false)
local Btn360, Page360 = CreateTab("360 / Aimbot", false)
local BtnPlayer, PagePlayer = CreateTab("Player", false)
local BtnMisc, PageMisc = CreateTab("Misc", false)

local TabsMap = {
    {BtnMove, PageMove},
    {BtnCombat, PageCombat},
    {BtnVisual, PageVisual},
    {BtnChat, PageChat},
    {Btn360, Page360},
    {BtnPlayer, PagePlayer},
    {BtnMisc, PageMisc}
}

local function SwitchTab(activeBtn, activePage)
    for _, pair in ipairs(TabsMap) do
        pair[1].BackgroundColor3 = Color3.fromRGB(18, 18, 25)
        pair[1].TextColor3 = Color3.fromRGB(160, 160, 175)
        pair[2].Visible = false
    end
    activeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
    activeBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
    activePage.Visible = true
end

BtnMove.MouseButton1Click:Connect(function() SwitchTab(BtnMove, PageMove) end)
BtnCombat.MouseButton1Click:Connect(function() SwitchTab(BtnCombat, PageCombat) end)
BtnVisual.MouseButton1Click:Connect(function() SwitchTab(BtnVisual, PageVisual) end)
BtnChat.MouseButton1Click:Connect(function() SwitchTab(BtnChat, PageChat) end)
Btn360.MouseButton1Click:Connect(function() SwitchTab(Btn360, Page360) end)
BtnPlayer.MouseButton1Click:Connect(function() SwitchTab(BtnPlayer, PagePlayer) end)
BtnMisc.MouseButton1Click:Connect(function() SwitchTab(BtnMisc, PageMisc) end)

AuthBtn.MouseButton1Click:Connect(function()
    local inputKey = AuthInput.Text
    local savedData = GetSavedAuth()
    
    if savedData and savedData.Key == inputKey then
        if savedData.HWID and savedData.HWID ~= MyHWID then
            AuthBtn.Text = "BU KEY BAŞKA BİLGİSAYARA AİT AMK HIRSIZI!"
            AuthBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            task.wait(2)
            LP:Kick("Hz.Arche: key kulanılmıs!")
            return
        end

        if savedData.Expire > os.time() then
            _G.CurrentKey = savedData.Key
            _G.ExpireTime = savedData.Expire
            _G.Authenticated = true
            AuthFrame.Visible = false
            Main.Visible = true
            ShowHUD()
        else
            AuthBtn.Text = "SÜRE BİTMİŞ DİSCORDAN YENİ KEY SATIN AL!"
            AuthBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            task.wait(1.5)
            AuthBtn.Text = "GİRİŞ YAP"
            AuthBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        end
    elseif ValidKeys[inputKey] then
        _G.CurrentKey = inputKey
        _G.ExpireTime = os.time() + ValidKeys[inputKey]
        _G.Authenticated = true
        SaveAuth(inputKey, _G.ExpireTime) 
        AuthFrame.Visible = false
        Main.Visible = true
        ShowHUD()
    else
        AuthBtn.Text = "GEÇERSİZ KEY!"
        AuthBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        task.wait(1.5)
        AuthBtn.Text = "GİRİŞ YAP"
        AuthBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    end
end)

local function CreateToggle(text, defaultState, parent, callback)
    local btn = Instance.new("TextButton", parent); btn.Size = UDim2.new(1, 0, 0, 40); btn.Text = "   " .. text .. (defaultState and " [ON]" or " [OFF]")
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25); btn.TextColor3 = defaultState and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(180, 180, 190)
    btn.Font = Enum.Font.GothamBold; btn.TextSize = 13; btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    end)

    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state; btn.Text = "   " .. text .. (state and " [ON]" or " [OFF]")
        btn.TextColor3 = state and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(180, 180, 190); callback(state)
    end)
    return btn
end

local function CreateSlider(text, min, max, default, parent, callback)
    local frame = Instance.new("Frame", parent); frame.Size = UDim2.new(1, 0, 0, 60); frame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    local label = Instance.new("TextLabel", frame); label.Size = UDim2.new(1, -20, 0, 24); label.Position = UDim2.new(0, 10, 0, 6)
    label.BackgroundTransparency = 1; label.Text = text .. ": " .. default; label.TextColor3 = Color3.new(1, 1, 1); label.Font = Enum.Font.GothamBold; label.TextSize = 12; label.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderBg = Instance.new("TextButton", frame); sliderBg.Size = UDim2.new(1, -20, 0, 10); sliderBg.Position = UDim2.new(0, 10, 0, 38); sliderBg.BackgroundColor3 = Color3.fromRGB(35, 35, 48); sliderBg.Text = ""
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)
    local fill = Instance.new("Frame", sliderBg); fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    local dragging = false
    local function Update(input)
        local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * pos)
        fill.Size = UDim2.new(pos, 0, 1, 0); label.Text = text .. ": " .. value; callback(value)
    end
    sliderBg.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true Update(input) end end)
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
    UIS.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then Update(input) end end)
end

local function CreateDropdown(title, options, parent, callback)
    local dropFrame = Instance.new("Frame", parent)
    dropFrame.Size = UDim2.new(1, 0, 0, 40)
    dropFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    dropFrame.ClipsDescendants = true
    Instance.new("UICorner", dropFrame).CornerRadius = UDim.new(0, 6)

    local mainBtn = Instance.new("TextButton", dropFrame)
    mainBtn.Size = UDim2.new(1, 0, 0, 40)
    mainBtn.BackgroundTransparency = 1
    mainBtn.Text = "   " .. title .. ": " .. options[1]
    mainBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
    mainBtn.Font = Enum.Font.GothamBold
    mainBtn.TextSize = 13
    mainBtn.TextXAlignment = Enum.TextXAlignment.Left

    local isOpen = false
    local listLayout = Instance.new("UIListLayout", dropFrame)
    listLayout.Padding = UDim.new(0, 2)

    mainBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            dropFrame.Size = UDim2.new(1, 0, 0, 40 + (#options * 32))
            mainBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
        else
            dropFrame.Size = UDim2.new(1, 0, 0, 40)
            mainBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
        end
    end)

    for i, opt in ipairs(options) do
        local optBtn = Instance.new("TextButton", dropFrame)
        optBtn.Size = UDim2.new(1, 0, 0, 32)
        optBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
        optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        optBtn.Font = Enum.Font.GothamBold
        optBtn.TextSize = 12
        optBtn.Text = "   ↳ " .. opt
        optBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", optBtn).CornerRadius = UDim.new(0, 4)

        optBtn.MouseButton1Click:Connect(function()
            mainBtn.Text = "   " .. title .. ": " .. opt
            isOpen = false
            dropFrame.Size = UDim2.new(1, 0, 0, 40)
            mainBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
            callback(opt)
        end)
    end
    return dropFrame
end

local function CreateTargetBtn(text, part, parent)
    local btn = Instance.new("TextButton", parent); btn.Size = UDim2.new(1, 0, 0, 35); btn.Text = "   " .. text
    btn.BackgroundColor3 = Color3.fromRGB(24, 24, 32); btn.TextColor3 = Color3.new(1, 1, 1); btn.Font = Enum.Font.GothamBold; btn.TextSize = 12; btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(32, 32, 42) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(24, 24, 32) end)

    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(parent:GetChildren()) do if v:IsA("TextButton") then v.TextColor3 = Color3.new(1, 1, 1) end end
        btn.TextColor3 = Color3.fromRGB(0, 255, 150)
        if part == "Karma" then _G.KarmaMode = true else _G.KarmaMode = false; _G.TargetPart = part end
    end)
end

local function CreateChatInput(parent, globalVar, default)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(1, 0, 0, 40); box.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    box.TextColor3 = Color3.new(1, 1, 1); box.Font = Enum.Font.GothamBold; box.TextSize = 13
    box.Text = _G[globalVar]; box.PlaceholderText = default
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    box.FocusLost:Connect(function() _G[globalVar] = box.Text end)
end

CreateToggle("Fly", _G.Fly, PageMove, function(s) _G.Fly = s end)
CreateSlider("Fly Speed", 10, 500, 50, PageMove, function(v) _G.FlySpeed = v end)
CreateToggle("Noclip", _G.Noclip, PageMove, function(s) _G.Noclip = s end)
CreateToggle("Speed Hack", _G.SpeedHack, PageMove, function(s) _G.SpeedHack = s end)
CreateSlider("Walk Speed", 16, 1000, 50, PageMove, function(v) 
    _G.WalkSpeed = v 
    local lpChar = LP.Character
    if lpChar then
        local hum = lpChar:FindFirstChildOfClass("Humanoid")
        if hum and _G.SpeedHack then
            hum.WalkSpeed = _G.WalkSpeed
        end
    end
end)
CreateToggle("Jump Hack", _G.JumpHack, PageMove, function(s) _G.JumpHack = s end)
CreateSlider("Jump Power", 50, 500, 50, PageMove, function(v) _G.JumpPower = v end)
CreateToggle("BUNNY HOP", _G.Bhop, PageMove, function(s) _G.Bhop = s end) 
CreateToggle("Görünmezlik", _G.Invisibility, PageMove, function(s) _G.Invisibility = s end)

CreateToggle("GOD MODE", _G.GodMode, PageCombat, function(s) _G.GodMode = s end)
CreateToggle("AIMBOT", _G.Aimbot, PageCombat, function(s) _G.Aimbot = s; _G.ShowFOV = s end)
CreateToggle("Silent Aim", _G.SilentAim, PageCombat, function(s) _G.SilentAim = s end)
CreateToggle("CURVE BULLET (KAVİSLİ MERMİ)", _G.CurveBullet, PageCombat, function(s) _G.CurveBullet = s end)
CreateSlider("Curve Intensity", 1, 20, 5, PageCombat, function(v) _G.CurveIntensity = v end)
CreateToggle("TRIGGER BOT", _G.TriggerBot, PageCombat, function(s) _G.TriggerBot = s end)
CreateToggle("WALLBANG (DUVARDAN VUR)", _G.WallBang, PageCombat, function(s) _G.WallBang = s end)
CreateToggle("AIMBOT PREDICTION", _G.PredictionEnabled, PageCombat, function(s) _G.PredictionEnabled = s end)
CreateToggle("HITBOX BÜYÜTÜCÜ", _G.HitboxExpander, PageCombat, function(s) _G.HitboxExpander = s end)
CreateSlider("Hitbox Size", 2, 100, 5, PageCombat, function(v) _G.HitboxSize = v end)
CreateToggle("ANTI COOLDOWN", _G.AntiCooldown, PageCombat, function(s) _G.AntiCooldown = s end)

CreateDropdown("Hedef Bölge Seçimi", {"Head", "HumanoidRootPart", "Karma"}, PageCombat, function(selected)
    if selected == "Karma" then
        _G.KarmaMode = true
    else
        _G.KarmaMode = false
        _G.TargetPart = selected
    end
end)

CreateTargetBtn("KAFA", "Head", PageCombat)
CreateTargetBtn("GÖVDE", "HumanoidRootPart", PageCombat)
CreateTargetBtn("KARMA ", "Karma", PageCombat)
CreateToggle("NO RECOIL", _G.NoRecoil, PageCombat, function(s) _G.NoRecoil = s end)
CreateToggle("NO SPREAD ", _G.NoSpread, PageCombat, function(s) _G.NoSpread = s end)
CreateToggle("TEAM CHECK", _G.TeamCheck, PageCombat, function(s) _G.TeamCheck = s end)

CreateToggle("WALLHACK", _G.Wallhack, PageVisual, function(s) _G.Wallhack = s end)
CreateToggle("ESP BOX", _G.ESPBox, PageVisual, function(s) _G.ESPBox = s end)
CreateToggle("SKELETON ESP", _G.SkeletonESP, PageVisual, function(s) _G.SkeletonESP = s end)
CreateToggle("SHOW NAMES", _G.ShowNames, PageVisual, function(s) _G.ShowNames = s end)
CreateToggle("SHOW HEALTH", _G.ShowHealth, PageVisual, function(s) _G.ShowHealth = s end)
CreateToggle("SHOW DISTANCE", _G.ShowDistance, PageVisual, function(s) _G.ShowDistance = s end)
CreateToggle("TRACERS", _G.Tracers, PageVisual, function(s) _G.Tracers = s end)
CreateSlider("FOV Size", 10, 1000, 150, PageVisual, function(v) _G.FovSize = v end)
CreateToggle("CAMERA FOV CHANGER", _G.EnableFOVChanger, PageVisual, function(s) _G.EnableFOVChanger = s end)
CreateSlider("CAMERA FOV", 70, 160, 100, PageVisual, function(v) _G.CameraFOV = v end)

CreateChatInput(PageChat, "ChatText", "Spam Mesajını Yaz...")
CreateSlider("Spam Speed (Sec)", 1, 10, 1, PageChat, function(v) _G.ChatDelay = v end)
CreateToggle("CHAT SPAM", _G.ChatSpam, PageChat, function(s) _G.ChatSpam = s end)
local labelKill = Instance.new("TextLabel", PageChat); labelKill.Size = UDim2.new(1, 0, 0, 25); labelKill.BackgroundTransparency = 1; labelKill.Text = "--- AUTO KILL SETTINGS ---"; labelKill.TextColor3 = Color3.fromRGB(0, 255, 150); labelKill.Font = Enum.Font.GothamBold; labelKill.TextSize = 12
CreateToggle("AUTO KILL CHAT", _G.AutoKillChat, PageChat, function(s) _G.AutoKillChat = s end)
CreateChatInput(PageChat, "KillMessage", "Kill Mesajını Yazmak için Tıkla")

CreateToggle("360 AİMBOT", _G.Full360Aimbot, Page360, function(s) _G.Full360Aimbot = s end)
CreateToggle("AUTO FIRE (KİLİTLENİNCE)", _G.AutoFire, Page360, function(s) _G.AutoFire = s end)
CreateToggle("SPINBOT", _G.SpinbotMode, Page360, function(s) _G.SpinbotMode = s end)
CreateSlider("SPINBOT HIZI", 50, 1000, 300, Page360, function(v) _G.SpinbotSpeed = v end)
CreateToggle("3. ŞAHIS BAKIŞ ACISI", _G.ThirdPerson, Page360, function(s) _G.ThirdPerson = s end)

local function FlingPlayer(target)
    if not target or not target.Character or not LP.Character then return end
    local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
    local targetHrp = target.Character:FindFirstChild("HumanoidRootPart")
 
    local hum = LP.Character:FindFirstChildOfClass("Humanoid")
    if hrp and targetHrp and hum then
        _G.LastTargetted = target.Name 
        local oldPos = hrp.CFrame
        for i = 1, 150 do
            if targetHrp and targetHrp.Parent then
                hum.PlatformStand = true 
             
                hrp.CFrame = targetHrp.CFrame * CFrame.Angles(0, math.rad(math.random(1, 360)), 0)
                hrp.AssemblyLinearVelocity = Vector3.new(0, 999999, 0)
                hrp.AssemblyAngularVelocity = Vector3.new(999999, 999999, 999999)
            end
            RS.Heartbeat:Wait()
        end
    
        hum.PlatformStand = false
        hrp.AssemblyLinearVelocity = Vector3.new(0,0,0)
        hrp.AssemblyAngularVelocity = Vector3.new(0,0,0)
        hrp.CFrame = oldPos
    end
end

CreateToggle("NPC'LERE KİLİTLEN", _G.TargetNPCs, PagePlayer, function(s) _G.TargetNPCs = s end)

local SelectedPlayerName = ""
local PlayerSelectBtn = Instance.new("TextButton", PagePlayer)
PlayerSelectBtn.Size = UDim2.new(1, 0, 0, 40); PlayerSelectBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
PlayerSelectBtn.TextColor3 = Color3.fromRGB(0, 255, 150); PlayerSelectBtn.Font = Enum.Font.GothamBold
PlayerSelectBtn.TextSize = 13; PlayerSelectBtn.Text = "   1. Oyuncu Seç: Yok"
PlayerSelectBtn.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", PlayerSelectBtn).CornerRadius = UDim.new(0, 6)

local PlayerListFrame = Instance.new("ScrollingFrame", PagePlayer)
PlayerListFrame.Size = UDim2.new(1, 0, 0, 180); PlayerListFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
PlayerListFrame.Visible = false; PlayerListFrame.ScrollBarThickness = 4; PlayerListFrame.BackgroundTransparency = 0.3
Instance.new("UIListLayout", PlayerListFrame).Padding = UDim.new(0, 4)

PlayerSelectBtn.MouseButton1Click:Connect(function()
    PlayerListFrame.Visible = not PlayerListFrame.Visible
    if PlayerListFrame.Visible then
        for _, v in pairs(PlayerListFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP then
                local pBtn = Instance.new("TextButton", PlayerListFrame)
                pBtn.Size = UDim2.new(1, 0, 0, 32); pBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
                pBtn.TextColor3 = Color3.new(1, 1, 1); pBtn.Text = "   " .. p.Name; pBtn.Font = Enum.Font.GothamBold
                pBtn.TextXAlignment = Enum.TextXAlignment.Left
                Instance.new("UICorner", pBtn).CornerRadius = UDim.new(0, 4)
                pBtn.MouseButton1Click:Connect(function()
                    SelectedPlayerName = p.Name; PlayerSelectBtn.Text = "   Seçilen: " .. p.Name; PlayerListFrame.Visible = false
                end)
            end
        end
    end
end)

local GoToBtn = Instance.new("TextButton", PagePlayer)
GoToBtn.Size = UDim2.new(1, 0, 0, 40); GoToBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
GoToBtn.TextColor3 = Color3.new(1, 1, 1); GoToBtn.Font = Enum.Font.GothamBold; GoToBtn.TextSize = 13; GoToBtn.TextXAlignment = Enum.TextXAlignment.Left
GoToBtn.Text = "   Seçili Oyuncuya Işınlan"
Instance.new("UICorner", GoToBtn).CornerRadius = UDim.new(0, 6)
GoToBtn.MouseButton1Click:Connect(function()
    if SelectedPlayerName ~= "" then
        local target = Players:FindFirstChild(SelectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
end)

local BringBtn = Instance.new("TextButton", PagePlayer)
BringBtn.Size = UDim2.new(1, 0, 0, 40); BringBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
BringBtn.TextColor3 = Color3.new(1, 1, 1); BringBtn.Font = Enum.Font.GothamBold; BringBtn.TextSize = 13; BringBtn.TextXAlignment = Enum.TextXAlignment.Left
BringBtn.Text = "   Seçili Oyuncuyu Bana Getir"
Instance.new("UICorner", BringBtn).CornerRadius = UDim.new(0, 6)
BringBtn.MouseButton1Click:Connect(function()
    if SelectedPlayerName ~= "" then
        local target = Players:FindFirstChild(SelectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local oldPos = LP.Character.HumanoidRootPart.CFrame
            local hum = LP.Character:FindFirstChildOfClass("Humanoid")
            local hrp = LP.Character.HumanoidRootPart
     
            _G.LastTargetted = target.Name 
            for i = 1, 150 do
                if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    if hum then hum.PlatformStand = true end
                    local targetHrp = target.Character.HumanoidRootPart
    
                    local dir = (oldPos.Position - targetHrp.Position).Unit
                    hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 1.5)
                    hrp.AssemblyLinearVelocity = dir * 100000
                    hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
     
                end
                RS.Heartbeat:Wait()
            end
            if hum then hum.PlatformStand = false end
            hrp.AssemblyLinearVelocity = Vector3.new(0,0,0); hrp.CFrame = oldPos
        end
    end
end)

local KillBtn = Instance.new("TextButton", PagePlayer)
KillBtn.Size = UDim2.new(1, 0, 0, 40); KillBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
KillBtn.TextColor3 = Color3.fromRGB(255, 60, 60); KillBtn.Font = Enum.Font.GothamBold; KillBtn.TextSize = 13; KillBtn.TextXAlignment = Enum.TextXAlignment.Left
KillBtn.Text = "   Seçili Oyuncuyu anasının amına ısınla"
Instance.new("UICorner", KillBtn).CornerRadius = UDim.new(0, 6)
KillBtn.MouseButton1Click:Connect(function()
    if SelectedPlayerName ~= "" then FlingPlayer(Players:FindFirstChild(SelectedPlayerName)) end
end)

local KillAllBtn = Instance.new("TextButton", PagePlayer)
KillAllBtn.Size = UDim2.new(1, 0, 0, 40); KillAllBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
KillAllBtn.TextColor3 = Color3.fromRGB(255, 60, 60); KillAllBtn.Font = Enum.Font.GothamBold; KillAllBtn.TextSize = 13; KillAllBtn.TextXAlignment = Enum.TextXAlignment.Left
KillAllBtn.Text = "   Tüm Oyuncuları anasınınamına götür"
Instance.new("UICorner", KillAllBtn).CornerRadius = UDim.new(0, 6)
KillAllBtn.MouseButton1Click:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            FlingPlayer(p); task.wait(0.1)
        end
    end
end)

local FreezePlayerBtn = Instance.new("TextButton", PagePlayer)
FreezePlayerBtn.Size = UDim2.new(1, 0, 0, 40)
FreezePlayerBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
FreezePlayerBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
FreezePlayerBtn.Font = Enum.Font.GothamBold
FreezePlayerBtn.TextSize = 13; FreezePlayerBtn.TextXAlignment = Enum.TextXAlignment.Left
FreezePlayerBtn.Text = "   Oyuncuyu Dondur"
Instance.new("UICorner", FreezePlayerBtn).CornerRadius = UDim.new(0, 6)

FreezePlayerBtn.MouseButton1Click:Connect(function()
    if SelectedPlayerName ~= "" then
        local target = Players:FindFirstChild(SelectedPlayerName)
        if target and target.Character then
            local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if tHrp and tHum then
                tHrp.Anchored = true
                tHum.PlatformStand = true
                FreezePlayerBtn.Text = "   Donduruldu: " .. SelectedPlayerName
                task.wait(1.5)
                FreezePlayerBtn.Text = "   Oyuncuyu Dondur"
            end
        end
    end
end)

local function CreateMiscBtn(text, callback)
    local btn = Instance.new("TextButton", PageMisc)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13; btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Text = "   " .. text
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(26, 26, 36) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(18, 18, 25) end)

    btn.MouseButton1Click:Connect(callback)
    return btn
end

CreateToggle("OBS BYPASS", _G.ObsBypass, PageMisc, function(s)
    _G.ObsBypass = s
    pcall(function()
        if setrenderproperty then
            setrenderproperty(Screen, "Visible", not s)
        else
            Screen.Enabled = not s
        end
    end)
end)

local MoneyInput = Instance.new("TextBox", PageMisc)
MoneyInput.Size = UDim2.new(1, 0, 0, 38)
MoneyInput.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
MoneyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
MoneyInput.Font = Enum.Font.GothamBold
MoneyInput.TextSize = 13
MoneyInput.Text = ""
MoneyInput.PlaceholderText = "Eklenecek para miktarını yaz..."
Instance.new("UICorner", MoneyInput).CornerRadius = UDim.new(0, 6)

local AddMoneyBtn = Instance.new("TextButton", PageMisc)
AddMoneyBtn.Size = UDim2.new(1, 0, 0, 40)
AddMoneyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
AddMoneyBtn.TextColor3 = Color3.fromRGB(12, 12, 16)
AddMoneyBtn.Font = Enum.Font.GothamBlack
AddMoneyBtn.TextSize = 13
AddMoneyBtn.Text = "PARA BAS"
Instance.new("UICorner", AddMoneyBtn).CornerRadius = UDim.new(0, 6)

AddMoneyBtn.MouseButton1Click:Connect(function()
    local amount = tonumber(MoneyInput.Text)
    if amount then
        pcall(function()
            local leaderstats = LP:FindFirstChild("leaderstats")
            if leaderstats then
                for _, stat in pairs(leaderstats:GetChildren()) do
                    if stat:IsA("IntValue") or stat:IsA("NumberValue") then
                        if string.lower(stat.Name):find("money") or string.lower(stat.Name):find("cash") or string.lower(stat.Name):find("coin") or string.lower(stat.Name):find("para") then
                            stat.Value = stat.Value + amount
                        end
                    end
                end
            end
        end)
        AddMoneyBtn.Text = "EKLENDİ AMK! (" .. amount .. ")"
        task.wait(1.5)
        AddMoneyBtn.Text = "PARA BAS (CLIENT)"
    else
        AddMoneyBtn.Text = "GEÇERLİ BİR SAYI GİR LAN!"
        AddMoneyBtn.TextColor3 = Color3.fromRGB(255, 60, 60)
        task.wait(1.5)
        AddMoneyBtn.Text = "PARA BAS (CLIENT)"
        AddMoneyBtn.TextColor3 = Color3.fromRGB(12, 12, 16)
    end
end)

CreateMiscBtn("PARAYI FULLE (REMOTE GEREKİR)", function() print("Para Hilesi Butonu: Buraya Remote Event'ini ekle!") end)
CreateMiscBtn("LEVELİ FULLE (REMOTE GEREKİR)", function() print("Level Hilesi Butonu: Buraya Remote Event'ini ekle!") end)
CreateMiscBtn("STATLARI FULLE (REMOTE GEREKİR)", function() print("Stat Hilesi Butonu: Buraya Remote Event'ini ekle!") end)

local function ClearRAMMemory()
    pcall(function()
        if gcinfo then gcinfo() end
        collectgarbage("collect")
        for name, line in pairs(_G.Lines) do
            if not line.Visible then
                pcall(function() line:Remove() end)
                _G.Lines[name] = nil
            end
        end
        for name, textObj in pairs(_G.Names) do
            if not textObj.Visible then
                pcall(function() textObj:Remove() end)
                _G.Names[name] = nil
            end
        end
    end)
end

CreateMiscBtn("RAM TEMİZLE", function()
    ClearRAMMemory()
    print("Hz.Arche: RAM Başarıyla Temizlendi!")
end)

CreateMiscBtn("LİSANSI BİTİR (SIFIRLA)", function()
    local savedData = GetSavedAuth()
    if savedData then
        savedData.Key = nil
        savedData.Expire = 0
        savedData.HWID = nil
        if writefile then
            pcall(function() writefile(AuthFile, HttpService:JSONEncode(savedData)) end)
        end
    end
    _G.Authenticated = false
    _G.ExpireTime = 0
    _G.CurrentKey = ""
    Main.Visible = false
    HUDFrame.Visible = false
    AuthFrame.Visible = true
end)

CreateToggle("ANTI-KICK KALKANI", _G.AntiKick, PageMisc, function(s) _G.AntiKick = s end)

local ConfigVarsList = {
    "Aimbot", "SilentAim", "TriggerBot", "GodMode", "NoRecoil", "NoSpread", "Wallhack", "ESPBox", "SkeletonESP",
    "ShowNames", "ShowHealth", "ShowDistance", "Tracers", "TeamCheck", "Fly",
    "Noclip", "FlySpeed", "SpeedHack", "WalkSpeed", "JumpHack", "JumpPower",
    "Bhop", "FovSize", "TargetPart", "KarmaMode", "ShowFOV", "SpinbotMode",
    "SpinbotSpeed", "Full360Aimbot", "AutoFire", "ThirdPerson", "ChatSpam",
    "ChatText", "ChatDelay", "TurboDelay", "AutoKillChat", "KillMessage",
    "EnableFOVChanger", "CameraFOV", "AntiKick", "HitboxExpander", "HitboxSize",
    "ShiftLock", "WallBang", "TargetNPCs", "ObsBypass", "Invisibility", "PredictionEnabled", "CurveBullet", "AntiCooldown"
}

local cfgLabel = Instance.new("TextLabel", PageMisc)
cfgLabel.Size = UDim2.new(1, 0, 0, 25)
cfgLabel.BackgroundTransparency = 1
cfgLabel.Text = "--- CONFIG SİSTEMİ ---"
cfgLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
cfgLabel.Font = Enum.Font.GothamBold
cfgLabel.TextSize = 12
cfgLabel.TextXAlignment = Enum.TextXAlignment.Left

local CfgNameInput = Instance.new("TextBox", PageMisc)
CfgNameInput.Size = UDim2.new(1, 0, 0, 38)
CfgNameInput.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
CfgNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CfgNameInput.Font = Enum.Font.GothamBold
CfgNameInput.TextSize = 13
CfgNameInput.Text = ""
CfgNameInput.PlaceholderText = "Config İsmi Gir (örn: legit_cfg)..."
Instance.new("UICorner", CfgNameInput).CornerRadius = UDim.new(0, 6)

local CreateConfigBtn = Instance.new("TextButton", PageMisc)
CreateConfigBtn.Size = UDim2.new(1, 0, 0, 40)
CreateConfigBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
CreateConfigBtn.TextColor3 = Color3.fromRGB(12, 12, 16)
CreateConfigBtn.Font = Enum.Font.GothamBlack
CreateConfigBtn.TextSize = 13
CreateConfigBtn.Text = "CONFIG OLUŞTUR (KAYDET)"
Instance.new("UICorner", CreateConfigBtn).CornerRadius = UDim.new(0, 6)

local LoadConfigBtn = Instance.new("TextButton", PageMisc)
LoadConfigBtn.Size = UDim2.new(1, 0, 0, 40)
LoadConfigBtn.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
LoadConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadConfigBtn.Font = Enum.Font.GothamBlack
LoadConfigBtn.TextSize = 13
LoadConfigBtn.Text = "CONFIG YÜKLE (LİSTEDEN SEÇ)"
Instance.new("UICorner", LoadConfigBtn).CornerRadius = UDim.new(0, 6)

local ConfigListFrame = Instance.new("ScrollingFrame", PageMisc)
ConfigListFrame.Size = UDim2.new(1, 0, 0, 140)
ConfigListFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
ConfigListFrame.Visible = false
ConfigListFrame.ScrollBarThickness = 4
ConfigListFrame.BackgroundTransparency = 0.3
Instance.new("UICorner", ConfigListFrame).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", ConfigListFrame).Padding = UDim.new(0, 4)

CreateConfigBtn.MouseButton1Click:Connect(function()
    local name = CfgNameInput.Text ~= "" and CfgNameInput.Text or "default_config"
    local fileName = name .. ".json"
    local cfgData = {}
    for _, vName in ipairs(ConfigVarsList) do
        cfgData[vName] = _G[vName]
    end
    if writefile then
        pcall(function() writefile(fileName, HttpService:JSONEncode(cfgData)) end)
        CreateConfigBtn.Text = "KAYDEDİLDİ! (" .. fileName .. ")"
        task.wait(1.5)
        CreateConfigBtn.Text = "CONFIG OLUŞTUR (KAYDET)"
    end
end)

LoadConfigBtn.MouseButton1Click:Connect(function()
    ConfigListFrame.Visible = not ConfigListFrame.Visible
    if ConfigListFrame.Visible then
        for _, v in pairs(ConfigListFrame:GetChildren()) do 
            if v:IsA("TextButton") then v:Destroy() end 
        end
        
        local files = {}
        if listfiles then
            pcall(function()
                for _, file in ipairs(listfiles("")) do
                    if file:sub(-5) == ".json" and file ~= AuthFile then
                        local cleanName = file:match("^.+[/\\]([^/\\]+)$") or file
                        table.insert(files, cleanName)
                    end
                end
            end)
        end
        
        if #files == 0 then
            local errBtn = Instance.new("TextButton", ConfigListFrame)
            errBtn.Size = UDim2.new(1, 0, 0, 32)
            errBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
            errBtn.TextColor3 = Color3.fromRGB(255, 60, 60)
            errBtn.Font = Enum.Font.GothamBold
            errBtn.Text = "Kayıtlı Config Bulunamadı!"
            Instance.new("UICorner", errBtn).CornerRadius = UDim.new(0, 4)
        else
            for _, fileName in ipairs(files) do
                local fBtn = Instance.new("TextButton", ConfigListFrame)
                fBtn.Size = UDim2.new(1, 0, 0, 32)
                fBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
                fBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                fBtn.Font = Enum.Font.GothamBold
                fBtn.Text = "   " .. fileName
                fBtn.TextXAlignment = Enum.TextXAlignment.Left
                Instance.new("UICorner", fBtn).CornerRadius = UDim.new(0, 4)
                
                fBtn.MouseButton1Click:Connect(function()
                    if isfile and isfile(fileName) then
                        local success, data = pcall(function() return HttpService:JSONDecode(readfile(fileName)) end)
                        if success and data then
                            for k, v in pairs(data) do
                                _G[k] = v
                            end
                            LoadConfigBtn.Text = "YÜKLENDİ! (" .. fileName .. ")"
                            ConfigListFrame.Visible = false
                            task.wait(1.5)
                            LoadConfigBtn.Text = "CONFIG YÜKLE (LİSTEDEN SEÇ)"
                        end
                    end
                end)
            end
        end
    end
end)

local CmdPanel = Instance.new("Frame", PageMisc)
CmdPanel.Size = UDim2.new(1, 0, 0, 170); CmdPanel.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
Instance.new("UICorner", CmdPanel).CornerRadius = UDim.new(0, 6)
local CmdStroke = Instance.new("UIStroke", CmdPanel); CmdStroke.Color = Color3.fromRGB(0, 255, 150); CmdStroke.Thickness = 1.5

local CmdDisplay = Instance.new("ScrollingFrame", CmdPanel)
CmdDisplay.Size = UDim2.new(1, -10, 1, -60); CmdDisplay.Position = UDim2.new(0, 5, 0, 5)
CmdDisplay.BackgroundTransparency = 1; CmdDisplay.ScrollBarThickness = 3; CmdDisplay.CanvasSize = UDim2.new(0, 0, 5, 0)
local CmdListLayout = Instance.new("UIListLayout", CmdDisplay); CmdListLayout.Padding = UDim.new(0, 2)

local function LogToConsole(txt)
    line = Instance.new("TextLabel", CmdDisplay)
    line.Size = UDim2.new(1, 0, 0, 18); line.BackgroundTransparency = 1
    line.TextColor3 = Color3.fromRGB(0, 255, 100); line.Font = Enum.Font.Code; line.TextSize = 12
    line.TextXAlignment = Enum.TextXAlignment.Left; line.Text = "> " .. txt
    CmdDisplay.CanvasPosition = Vector2.new(0, CmdDisplay.AbsoluteWindowSize.Y * 5)
end

LogToConsole("Hz.Arche Admin Console")
LogToConsole("Yardim almak icin '!help' yaziniz.")

local CmdInput = Instance.new("TextBox", CmdPanel)
CmdInput.Size = UDim2.new(1, -10, 0, 32); CmdInput.Position = UDim2.new(0, 5, 1, -38)
CmdInput.BackgroundColor3 = Color3.fromRGB(15, 15, 22); CmdInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdInput.Font = Enum.Font.Code; CmdInput.TextSize = 12; CmdInput.Text = ""; CmdInput.PlaceholderText = "Komut giriniz..."
Instance.new("UICorner", CmdInput).CornerRadius = UDim.new(0, 4)

CmdInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and CmdInput.Text ~= "" then
        local rawText = CmdInput.Text
        local lowerText = string.lower(rawText)
        LogToConsole(rawText)
        CmdInput.Text = ""
        
        if lowerText == "!help" then
            LogToConsole("=== MEVCUT KOMUTLAR ===")
            LogToConsole("!help - Komut listesini gosterir")
            LogToConsole("fly - Ucma hilesini acar/kapatir")
            LogToConsole("godmode - Olumsuzluk hilesini acar/kapatir")
            LogToConsole("speedhack - Hiz hilesini acar/kapatir")
            LogToConsole("bhop - Bunny Hop hilesini acar/kapatir")
            LogToConsole("aimbot - Otomatik nisan hilesini acar")
            LogToConsole("wallhack - Duvarkasini acar/kapatir")
            LogToConsole("=======================")
        elseif lowerText == "fly" then
            _G.Fly = not _G.Fly
            LogToConsole("Fly durumu: " .. (_G.Fly and "ACIK" or "KAPALI"))
        elseif lowerText == "godmode" then
            _G.GodMode = not _G.GodMode
            LogToConsole("GodMode durumu: " .. (_G.GodMode and "ACIK" or "KAPALI"))
        elseif lowerText == "speedhack" then
            _G.SpeedHack = not _G.SpeedHack
            LogToConsole("SpeedHack durumu: " .. (_G.SpeedHack and "ACIK" or "KAPALI"))
        elseif lowerText == "bhop" then
            _G.Bhop = not _G.Bhop
            LogToConsole("Bhop durumu: " .. (_G.Bhop and "ACIK" or "KAPALI"))
        elseif lowerText == "aimbot" then
            _G.Aimbot = not _G.Aimbot; _G.ShowFOV = _G.Aimbot
            LogToConsole("Aimbot durumu: " .. (_G.Aimbot and "ACIK" or "KAPALI"))
        elseif lowerText == "wallhack" then
            _G.Wallhack = not _G.Wallhack
            LogToConsole("Wallhack durumu: " .. (_G.Wallhack and "ACIK" or "KAPALI"))
        else
            LogToConsole("Bilinmeyen komut! Tum komutlar icin '!help' yazin.")
        end
    end
end)

_G.FOVCircle = Drawing.new("Circle"); _G.FOVCircle.Thickness = 2; _G.FOVCircle.Visible = false; _G.FOVCircle.ZIndex = 1
_G.CrosshairDot = Drawing.new("Circle"); _G.CrosshairDot.Filled = true; _G.CrosshairDot.Radius = 4; _G.CrosshairDot.Visible = false; _G.CrosshairDot.ZIndex = 2
_G.Boxes = _G.Boxes or {}
_G.SkeletonDrawings = _G.SkeletonDrawings or {}

local function IsVisible(part)
    local ignore = {LP.Character, Camera}
    SharedRayParams.FilterDescendantsInstances = ignore
    local ray = workspace:Raycast(Camera.CFrame.Position, part.Position - Camera.CFrame.Position, SharedRayParams)
    return ray == nil or ray.Instance:IsDescendantOf(part.Parent)
end

local isTriggerShooting = false 
local ForceTarget = nil

local function CleanupUnusedESP()
    for name, line in pairs(_G.Lines) do
        if not Players:FindFirstChild(name) and not (workspace:FindFirstChild(name)) then
            pcall(function() line:Remove() end)
            _G.Lines[name] = nil
        end
    end
    for name, textObj in pairs(_G.Names) do
        if not Players:FindFirstChild(name) and not (workspace:FindFirstChild(name)) then
            pcall(function() textObj:Remove() end)
            _G.Names[name] = nil
        end
    end
    for name, box in pairs(_G.Boxes) do
        if not Players:FindFirstChild(name) and not (workspace:FindFirstChild(name)) then
            pcall(function() box:Remove() end)
            _G.Boxes[name] = nil
        end
    end
    for name, skelList in pairs(_G.SkeletonDrawings) do
        if not Players:FindFirstChild(name) and not (workspace:FindFirstChild(name)) then
            for _, bone in pairs(skelList) do pcall(function() bone:Remove() end) end
            _G.SkeletonDrawings[name] = nil
        end
    end
end

task.spawn(function()
    while task.wait(3) do
        pcall(CleanupUnusedESP)
    end
end)

RS.RenderStepped:Connect(function()
    FrameSkipCounter = FrameSkipCounter + 1
    if FrameSkipCounter % 2 ~= 0 then return end

    pcall(function() 
        Camera = workspace.CurrentCamera
        if not Camera then return end

        local rainbow = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
        Stroke.Color = rainbow; Watermark.TextColor3 = rainbow
        if AuthStroke then AuthStroke.Color = rainbow end
        if CmdStroke then CmdStroke.Color = rainbow end

        local mLoc = UIS:GetMouseLocation()
        _G.FOVCircle.Position = mLoc; _G.FOVCircle.Radius = _G.FovSize; _G.FOVCircle.Color = rainbow; _G.FOVCircle.Visible = (_G.ShowFOV or _G.SilentAim) and not _G.ObsBypass and not _G.PanicActive
        _G.CrosshairDot.Position = mLoc; _G.CrosshairDot.Color = rainbow; _G.CrosshairDot.Visible = (_G.Aimbot or _G.SilentAim) and not _G.ObsBypass and not _G.PanicActive

        if _G.PanicActive then return end -- Skip heavy processing when panic mode is on to eliminate lag completely

        local lpChar = LP.Character
        if lpChar then
            local hum = lpChar:FindFirstChildOfClass("Humanoid")
            local hrp = lpChar:FindFirstChild("HumanoidRootPart")
            if hum and hrp then
                if _G.ShiftLock then
                    hum.AutoRotate = false
                    local camLook = Camera.CFrame.LookVector
                    hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + Vector3.new(camLook.X, 0, camLook.Z))
                else
                    hum.AutoRotate = true
                end

                if _G.ThirdPerson then
                    LP.CameraMode = Enum.CameraMode.Classic; LP.CameraMaxZoomDistance = 20; LP.CameraMinZoomDistance = 20
                else
                    LP.CameraMode = Enum.CameraMode.Classic; LP.CameraMaxZoomDistance = 128; LP.CameraMinZoomDistance = 0.5
                end
                
                if _G.GodMode then hum.Health = hum.MaxHealth end
                if _G.SpeedHack then 
                    hum.WalkSpeed = _G.WalkSpeed 
                else
                    if hum.WalkSpeed > 100 then hum.WalkSpeed = 16 end
                end
                if _G.JumpHack then hum.UseJumpPower = true; hum.JumpPower = _G.JumpPower end
                if _G.Bhop and UIS:IsKeyDown(Enum.KeyCode.Space) and hum.FloorMaterial ~= Enum.Material.Air then hum.Jump = true end
                
                for _, part in pairs(lpChar:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("Decal") then
                        pcall(function()
                            if _G.Invisibility then
                                part.Transparency = 1
                            else
                                if part.Name == "HumanoidRootPart" then
                                    part.Transparency = 1
                                else
                                    part.Transparency = 0
                                end
                            end
                        end)
                    end
                end

                if _G.SpinbotMode then
                    hum.AutoRotate = false
                    local currentPos = hrp.Position
                    local spinAngle = (tick() * _G.SpinbotSpeed) % 360
                    hrp.CFrame = CFrame.new(currentPos) * CFrame.Angles(0, math.rad(spinAngle), 0)
                elseif not _G.ShiftLock then 
                    hum.AutoRotate = true 
                end
                
                if _G.Fly then
                    local moveVector = Vector3.new(0, 0, 0)
                    if not UIS:GetFocusedTextBox() then
                        if UIS:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + Camera.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - Camera.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - Camera.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + Camera.CFrame.RightVector end
                    end
                    
                    local bv = hrp:FindFirstChild("FlyVelocityHz")
                    if not bv then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "FlyVelocityHz"
                        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                        bv.Parent = hrp
                    end
                    if moveVector.Magnitude > 0 then
                        bv.Velocity = moveVector.Unit * _G.FlySpeed
                    else
                        bv.Velocity = Vector3.new(0, 0, 0)
                    end
                else
                    if hrp:FindFirstChild("FlyVelocityHz") then hrp.FlyVelocityHz:Destroy() end
                end
                
                if _G.Noclip then
                    for _, child in pairs(lpChar:GetDescendants()) do
                        if child:IsA("BasePart") and child.CanCollide then
                            child.CanCollide = false
                        end
                    end
                end

                if _G.AntiCooldown then
                    pcall(function()
                        local tool = lpChar:FindFirstChildOfClass("Tool")
                        if tool then
                            for _, v in pairs(tool:GetDescendants()) do
                                if v:IsA("NumberValue") or v:IsA("IntValue") or v:IsA("BoolValue") then
                                    local vLower = string.lower(v.Name)
                                    if vLower:find("cooldown") or vLower:find("delay") or vLower:find("reload") or vLower:find("speed") or vLower:find("rate") or vLower:find("debounce") then
                                        if v:IsA("BoolValue") then v.Value = false else v.Value = 0 end
                                    end
                                end
                            end
                            if getgc and setupvalue then
                                for _, obj in pairs(getgc(true)) do
                                    if typeof(obj) == "function" and islclosure(obj) then
                                        local env = getfenv(obj)
                                        if env and env.script and env.script:IsDescendantOf(tool) then
                                            for i = 1, 30 do
                                                local name, val = debug.getupvalue(obj, i)
                                                if name and (name:lower():find("cooldown") or name:lower():find("debounce") or name:lower():find("last") or name:lower():find("delay")) then
                                                    setupvalue(obj, i, 0)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
            
            if _G.NoRecoil or _G.NoSpread then
                if tick() - LastRecoilUpdate > 0.25 then 
                    LastRecoilUpdate = tick()
                    for _, v in pairs(lpChar:GetDescendants()) do
                        if v:IsA("NumberValue") or v:IsA("IntValue") or v:IsA("DoubleValue") then
                            local n = v.Name:lower()
                            if _G.NoRecoil and (n:find("recoil") or n:find("kick") or n:find("shake") or n:find("climb")) then v.Value = 0 end
                            if _G.NoSpread and (n:find("spread") or n:find("accuracy") or n:find("deviation") or n:find("sway")) then v.Value = 0 end
                        end
                    end
                end
            end
        end

        if _G.HitboxExpander then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LP and p.Character then
                    local isEnemy = true
                    if _G.TeamCheck and p.Team and LP.Team and p.Team == LP.Team then isEnemy = false end
                    
                    if isEnemy then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                            hrp.Transparency = 0.5
                            hrp.BrickColor = BrickColor.new("Bright red")
                            hrp.CanCollide = false
                        end
                    end
                end
            end
        else
             for _, p in pairs(Players:GetPlayers()) do
                if p ~= LP and p.Character then
                    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if hrp.Size ~= Vector3.new(2, 2, 1) then
                            hrp.Size = Vector3.new(2, 2, 1)
                            hrp.Transparency = 1
                            hrp.CanCollide = true
                        end
                    end
                end
            end
        end

        if _G.TriggerBot then
            local canTrigger = true
            if _G.TriggerKey then
                canTrigger = UIS:IsKeyDown(_G.TriggerKey)
            end
            
            if canTrigger then
                SharedRayParams.FilterDescendantsInstances = {lpChar, Camera}
                local rayResult = workspace:Raycast(Camera.CFrame.Position, Camera.CFrame.LookVector * 1000, SharedRayParams)
                local sawEnemy = false
                
                if rayResult and rayResult.Instance then
                    local tChar = rayResult.Instance:FindFirstAncestorOfClass("Model")
                    if tChar then
                        local tPlayer = Players:GetPlayerFromCharacter(tChar)
                        if tPlayer and tPlayer ~= LP then
                            local tHum = tChar:FindFirstChildOfClass("Humanoid")
                            if tHum and tHum.Health > 0 then
                                local isEnemy = true
                                if _G.TeamCheck and tPlayer.Team and LP.Team and tPlayer.Team == LP.Team then isEnemy = false end
                                if isEnemy then sawEnemy = true end
                            end
                        end
                    end
                end
                
                if sawEnemy then
                    if not isTriggerShooting then
                        isTriggerShooting = true; mouse1press()
                    end
                else
                    if isTriggerShooting then
                        isTriggerShooting = false; mouse1release()
                    end
                end
            else
                if isTriggerShooting then
                    isTriggerShooting = false; mouse1release()
                end
            end
        end

        local closestTarget, dist = nil, 999999
        local isAimKeyDown = _G.Full360Aimbot or UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)

        if isAimKeyDown then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LP then
                    local pChar = p.Character
                    if pChar then
                        local pHum = pChar:FindFirstChildOfClass("Humanoid")
                        if pHum and pHum.Health > 0 then
                            local isEnemy = true
                            if _G.TeamCheck and p.Team and LP.Team and p.Team == LP.Team then isEnemy = false end
                            
                            if isEnemy then
                                local targetName = _G.KarmaMode and ({"Head", "UpperTorso", "HumanoidRootPart"})[math.random(1, 3)] or _G.TargetPart
                                local b = pChar:FindFirstChild(targetName) or pChar:FindFirstChild("Head")
                                if b then
                                    local sP, onS = Camera:WorldToViewportPoint(b.Position)
                                    local canTargetRender = false

                                    if _G.WallBang then
                                        canTargetRender = true
                                    else
                                        if onS and IsVisible(b) then
                                            canTargetRender = true
                                        end
                                    end

                                    if canTargetRender then
                                        if _G.Full360Aimbot then
                                            local d = (b.Position - Camera.CFrame.Position).Magnitude
                                            if d < dist then dist = d; closestTarget = b end
                                        else
                                            local mD = (v2new(sP.X, sP.Y) - mLoc).Magnitude
                                            if onS and mD < _G.FovSize and mD < dist then dist = mD; closestTarget = b end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP then
                local pChar = p.Character
                if pChar then
                    local pHum = pChar:FindFirstChildOfClass("Humanoid")
                    if pHum and pHum.Health > 0 then
                        local l = _G.Lines[p.Name] or Drawing.new("Line"); _G.Lines[p.Name] = l
                        local n = _G.Names[p.Name] or Drawing.new("Text"); _G.Names[p.Name] = n
                        local box = _G.Boxes[p.Name] or Drawing.new("Square"); _G.Boxes[p.Name] = box
                        
                        local p_hrp = pChar:FindFirstChild("HumanoidRootPart") or pChar:FindFirstChildWhichIsA("BasePart")
                        
                        if p_hrp then
                            local hrpPos, onS2 = Camera:WorldToViewportPoint(p_hrp.Position)
                            if onS2 then
                                if _G.Wallhack and not _G.ObsBypass then
                                    local hl = pChar:FindFirstChild("UltimateHL")
                                    if not hl then
                                        hl = Instance.new("Highlight")
                                        hl.Name = "UltimateHL"
                                        hl.FillTransparency = 1
                                        hl.OutlineColor = rainbow
                                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                        hl.Adornee = pChar
                                        hl.Parent = pChar
                                    else
                                        hl.OutlineColor = rainbow
                                        hl.Enabled = true
                                    end
                                else 
                                    if pChar:FindFirstChild("UltimateHL") then pChar.UltimateHL:Destroy() end 
                                end

                                if _G.ESPBox and not _G.ObsBypass then
                                    local cf, size = pChar:GetBoundingBox()
                                    local headPos = Camera:WorldToViewportPoint((cf * cfnew(0, size.Y / 2, 0)).Position)
                                    local legPos = Camera:WorldToViewportPoint((cf * cfnew(0, -size.Y / 2, 0)).Position)
                                    local boxHeight = math.abs(headPos.Y - legPos.Y)
                                    local boxWidth = boxHeight / 2
                                    box.Size = v2new(boxWidth, boxHeight)
                                    box.Position = v2new(headPos.X - boxWidth / 2, headPos.Y)
                                    box.Color = rainbow
                                    box.Thickness = 1
                                    box.Filled = false
                                    box.Visible = true
                                else
                                    box.Visible = false
                                end

                                local skelList = _G.SkeletonDrawings[p.Name]
                                if _G.SkeletonESP and not _G.ObsBypass then
                                    if not skelList then
                                        skelList = {
                                            Head_Torso = Drawing.new("Line"),
                                            Torso_LRA = Drawing.new("Line"),
                                            Torso_LUA = Drawing.new("Line"),
                                            Torso_RRA = Drawing.new("Line"),
                                            Torso_RUA = Drawing.new("Line"),
                                            Torso_LLL = Drawing.new("Line"),
                                            Torso_LUL = Drawing.new("Line"),
                                            Torso_RLL = Drawing.new("Line"),
                                            Torso_RUL = Drawing.new("Line"),
                                        }
                                        _G.SkeletonDrawings[p.Name] = skelList
                                    end
                                    
                                    local headPart = pChar:FindFirstChild("Head")
                                    local upperTorso = pChar:FindFirstChild("UpperTorso") or pChar:FindFirstChild("Torso")
                                    local lowerTorso = pChar:FindFirstChild("LowerTorso") or upperTorso
                                    local la = pChar:FindFirstChild("LeftHand") or pChar:FindFirstChild("Left Arm")
                                    local ra = pChar:FindFirstChild("RightHand") or pChar:FindFirstChild("Right Arm")
                                    local ll = pChar:FindFirstChild("LeftFoot") or pChar:FindFirstChild("Left Leg")
                                    local rl = pChar:FindFirstChild("RightFoot") or pChar:FindFirstChild("Right Leg")
                                    
                                    local function drawBone(lineObj, p1, p2)
                                        if p1 and p2 then
                                            local pos1, on1 = Camera:WorldToViewportPoint(p1.Position)
                                            local pos2, on2 = Camera:WorldToViewportPoint(p2.Position)
                                            if on1 or on2 then
                                                lineObj.From = v2new(pos1.X, pos1.Y)
                                                lineObj.To = v2new(pos2.X, pos2.Y)
                                                lineObj.Color = rainbow
                                                lineObj.Thickness = 1
                                                lineObj.Visible = true
                                                return
                                            end
                                        end
                                        lineObj.Visible = false
                                    end

                                    drawBone(skelList.Head_Torso, headPart, upperTorso)
                                    drawBone(skelList.Torso_LUA, upperTorso, pChar:FindFirstChild("LeftUpperArm") or la)
                                    drawBone(skelList.Torso_RUA, upperTorso, pChar:FindFirstChild("RightUpperArm") or ra)
                                    drawBone(skelList.Torso_LUL, lowerTorso, pChar:FindFirstChild("LeftUpperLeg") or ll)
                                    drawBone(skelList.Torso_RUL, lowerTorso, pChar:FindFirstChild("RightUpperLeg") or rl)
                                else
                                    if skelList then
                                        for _, bone in pairs(skelList) do bone.Visible = false end
                                    end
                                end
   
                                l.Visible = _G.Tracers and not _G.ObsBypass; l.From = v2new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y); l.To = v2new(hrpPos.X, hrpPos.Y); l.Color = rainbow
                                
                                if (_G.ShowNames or _G.ShowHealth or _G.ShowDistance) and not _G.ObsBypass then
                                    local myPos = (lpChar and lpChar:FindFirstChild("HumanoidRootPart")) and lpChar.HumanoidRootPart.Position or Camera.CFrame.Position
                                    local actualDist = math.floor((p_hrp.Position - myPos).Magnitude)
                                    local tag = (_G.ShowNames and p.Name or "") .. (_G.ShowHealth and " [" .. math.floor(pHum.Health) .. "]" or "") .. (_G.ShowDistance and " [" .. actualDist .. "m]" or "")
                                    n.Text = tag; n.Size = 14; n.Center = true; n.Outline = true; n.Color = rainbow; n.Position = v2new(hrpPos.X, hrpPos.Y - 40); n.Visible = true
                                    
                                    local gercekParca = pChar:FindFirstChild("Head") or pChar:FindFirstChild("UpperTorso") or p_hrp
                                    if gercekParca then
                                        local gPos, gOn = Camera:WorldToViewportPoint(gercekParca.Position)
                                        if gOn then
                                            n.Position = v2new(gPos.X, gPos.Y - 65) 
                                            if _G.Tracers then l.To = v2new(gPos.X, gPos.Y) end
                                        end
                                    end
                                else n.Visible = false end
                            else l.Visible = false; n.Visible = false; box.Visible = false; if _G.SkeletonDrawings[p.Name] then for _, b in pairs(_G.SkeletonDrawings[p.Name]) do b.Visible = false end end end
                        end
                    end
                end
            end
        end

        if _G.TargetNPCs and isAimKeyDown then
            for _, v in pairs(workspace:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= lpChar then
                    if not Players:GetPlayerFromCharacter(v) then
                        local pHum = v.Humanoid
                        if pHum.Health > 0 then
                            local targetName = _G.KarmaMode and ({"Head", "UpperTorso", "HumanoidRootPart"})[math.random(1, 3)] or _G.TargetPart
                            local b = v:FindFirstChild(targetName) or v:FindFirstChild("Head")
                            if b then
                                local sP, onS = Camera:WorldToViewportPoint(b.Position)
                                local canTargetNPC = false

                                if _G.WallBang then
                                    canTargetNPC = true
                                else
                                    if onS and IsVisible(b) then canTargetNPC = true end
                                end
          
                                if canTargetNPC then
                                    if _G.Full360Aimbot then
                                        local d = (b.Position - Camera.CFrame.Position).Magnitude
                                        if d < dist then dist = d; closestTarget = b end
                                    else
                                        local mD = (v2new(sP.X, sP.Y) - mLoc).Magnitude
                                        if onS and mD < dist then dist = mD; closestTarget = b end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        ForceTarget = closestTarget
        if closestTarget then _G.LastTargetted = closestTarget.Parent.Name end
        if (_G.Aimbot or _G.Full360Aimbot) and closestTarget and isAimKeyDown then
            local predictedPos = closestTarget.Position
            if _G.PredictionEnabled then
                local targetModel = closestTarget.Parent
                local targetHrp = targetModel and targetModel:FindFirstChild("HumanoidRootPart")
                if targetHrp then
                    predictedPos = predictedPos + (targetHrp.AssemblyLinearVelocity * _G.PredictionFactor)
                end
            end
            Camera.CFrame = cfnew(Camera.CFrame.Position, predictedPos) 
            if _G.AutoFire then mouse1press(); task.delay(0.02, mouse1release) end
        end
    end)
end)

local function SendChatMessage(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if channel then channel:SendAsync(msg) end
    else
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if chatEvent then chatEvent:FireServer(msg, "All") end
    end
end

local function TrackPlayer(p)
    p.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid")
        hum.Died:Connect(function()
            if _G.AutoKillChat and _G.LastTargetted == p.Name then 
                SendChatMessage(_G.KillMessage); _G.LastTargetted = nil 
            end
        end)
    end)
end

for _, p in pairs(Players:GetPlayers()) do if p ~= LP then TrackPlayer(p) end end
Players.PlayerAdded:Connect(TrackPlayer)

task.spawn(function()
    while task.wait() do
        pcall(function() 
            if _G.ChatSpam and _G.ChatText ~= "" then
                local currentWait = UIS:IsKeyDown(_G.TurboKey) and (_G.TurboDelay / 1000) or _G.ChatDelay
                SendChatMessage(_G.ChatText); task.wait(currentWait)
            end
        end)
    end
end)

UIS.InputBegan:Connect(function(k, gpe) 
    if _G.Authenticated then
        if k.KeyCode == Enum.KeyCode.Home then
            Main.Visible = not Main.Visible
        elseif k.KeyCode == Enum.KeyCode.Zero or k.KeyCode == Enum.KeyCode.KeypadZero then
            TogglePanicMode()
        end
    end
end)

task.spawn(function()
    local text = "Hz.Arche"
    for i = 1, #text do IntroText.Text = string.sub(text, 1, i); task.wait(0.04) end
    wait(0.8)
    for i = 0, 1, 0.1 do IntroFrame.BackgroundTransparency = i; IntroText.TextTransparency = i; task.wait(0.03) end
    IntroFrame:Destroy()
    
    local savedData = GetSavedAuth()
    
    if savedData and ValidKeys[savedData.Key] and savedData.Expire > os.time() and savedData.HWID == MyHWID then
        _G.CurrentKey = savedData.Key
        _G.ExpireTime = savedData.Expire
        _G.Authenticated = true
        AuthFrame.Visible = false
        Main.Visible = true
        ShowHUD()
    else
        AuthFrame.Visible = true
        Main.Visible = false
    end
end)

RS:BindToRenderStep("ZorunluAimbotKilidi", Enum.RenderPriority.Camera.Value + 1, function()
    if _G.PanicActive then return end
    local isAimKeyDown = _G.Full360Aimbot or UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
    if ForceTarget and workspace.CurrentCamera and isAimKeyDown then
        if _G.Full360Aimbot or _G.Aimbot then
            local targetPos = ForceTarget.Position
            if _G.PredictionEnabled then
                local targetModel = ForceTarget.Parent
                local targetHrp = targetModel and targetModel:FindFirstChild("HumanoidRootPart")
                if targetHrp then
                    targetPos = targetPos + (targetHrp.AssemblyLinearVelocity * _G.PredictionFactor)
                end
            end
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, targetPos)
        end
    end
end)

RS:BindToRenderStep("ZorunluFOVKilidi", Enum.RenderPriority.Camera.Value + 2, function()
    if _G.PanicActive then return end
    if _G.EnableFOVChanger and workspace.CurrentCamera then
        workspace.CurrentCamera.FieldOfView = _G.CameraFOV
    end
end)

pcall(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if _G.PanicActive then return oldNamecall(self, ...) end
        local method = getnamecallmethod()
        local args = {...}
        
        if (_G.SilentAim or _G.CurveBullet) and not checkcaller() then
            if method == "Raycast" or method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" then
                if ForceTarget then
                    local targetPos = ForceTarget.Position
                    if _G.PredictionEnabled then
                        local targetModel = ForceTarget.Parent
                        local targetHrp = targetModel and targetModel:FindFirstChild("HumanoidRootPart")
                        if targetHrp then
                            targetPos = targetPos + (targetHrp.AssemblyLinearVelocity * _G.PredictionFactor)
                        end
                    end
                    
                    if _G.CurveBullet then
                        local randomOffset = Vector3.new(math.random(-_G.CurveIntensity, _G.CurveIntensity), math.random(2, _G.CurveIntensity * 2), math.random(-_G.CurveIntensity, _G.CurveIntensity))
                        targetPos = targetPos + randomOffset
                    end

                    if method == "Raycast" then
                        local origin = args[1]
                        if typeof(origin) == "Vector3" then
                            args[2] = (targetPos - origin).Unit * 1000
                        end
                    elseif method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" then
                        local ray = args[1]
                        if typeof(ray) == "Ray" then
                            args[1] = Ray.new(ray.Origin, (targetPos - ray.Origin).Unit * 1000)
                        end
                    end
                end
            end
        end
        
        if _G.AntiKick and self == LP and string.lower(method) == "kick" then
            return nil 
        end
        
        if _G.WallBang and not checkcaller() then
            if method == "Raycast" then
                local params = args[3]
                if typeof(params) == "RaycastParams" then
                    params.FilterType = Enum.RaycastFilterType.Exclude
                    local currentIgnore = params.FilterDescendantsInstances or {}
                    table.insert(currentIgnore, workspace)
                    params.FilterDescendantsInstances = currentIgnore
                else
                    local newParams = RaycastParams.new()
                    newParams.FilterType = Enum.RaycastFilterType.Exclude
                    newParams.FilterDescendantsInstances = {workspace}
                    args[3] = newParams
                end
            elseif method == "FindPartOnRayWithIgnoreList" then
                local ignoreList = args[2] or {}
                if typeof(ignoreList) == "table" then
                    table.insert(ignoreList, workspace)
                    args[2] = ignoreList
                end
                return oldNamecall(self, unpack(args))
            elseif method == "FindPartOnRayWithWhitelist" or method == "FindPartOnRay" then
                local ignoreList = {LP.Character, workspace}
                return oldNamecall(self, args[1], unpack(ignoreList))
            end
        end
        
        return oldNamecall(self, unpack(args))
    end)
end)