local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ===== FUNCTION KAMUI =====
local function RunKamui()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/RedzUi/refs/heads/main/Kamui%20Dimension.txt"))()
    end)
end

-- ===== UI CHÍNH =====
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "LanguageUI"
ScreenGui.ResetOnSpawn = false

local Selected = nil

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(30,0,40)
Main.Size = UDim2.new(0,0,0,0)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundTransparency = 1

-- 🌈 Gradient đẹp
local UIGradient = Instance.new("UIGradient", Main)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120,0,255))
}

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255,255,255)
Stroke.Thickness = 2

TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,520,0,340),
    BackgroundTransparency = 0
}):Play()

-- Glow
task.spawn(function()
    while true do
        TweenService:Create(Stroke,TweenInfo.new(1),{
            Color = Color3.fromRGB(255,120,200)
        }):Play()
        task.wait(1)
        TweenService:Create(Stroke,TweenInfo.new(1),{
            Color = Color3.fromRGB(180,120,255)
        }):Play()
        task.wait(1)
    end
end)

-- LOGO
local TopImage = Instance.new("ImageLabel", Main)
TopImage.BackgroundTransparency = 1
TopImage.Size = UDim2.new(0,90,0,90)
TopImage.Position = UDim2.new(0.5,-45,-0.15,0)
TopImage.Image = "rbxassetid://100306458933414"
TopImage.ImageTransparency = 1
Instance.new("UICorner", TopImage).CornerRadius = UDim.new(0,20)

TweenService:Create(TopImage,TweenInfo.new(0.5),{
    ImageTransparency = 0
}):Play()

-- CARD
local function CreateCard(pos, lang, flag)
    local Frame = Instance.new("Frame", Main)
    Frame.Size = UDim2.new(0,220,0,170)
    Frame.Position = pos
    Frame.BackgroundColor3 = Color3.fromRGB(40,0,60)
    Frame.BackgroundTransparency = 0.2

    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,12)

    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Color3.fromRGB(255,120,200)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1,0,0,25)
    Title.BackgroundTransparency = 1
    Title.Text = "Naknohack"
    Title.TextColor3 = Color3.new(1,1,1)

    local Lang = Instance.new("TextLabel", Frame)
    Lang.Size = UDim2.new(1,0,0,20)
    Lang.Position = UDim2.new(0,0,0.18,0)
    Lang.BackgroundTransparency = 1
    Lang.Text = lang
    Lang.TextColor3 = Color3.fromRGB(255,200,255)

    local Flag = Instance.new("TextLabel", Frame)
    Flag.Size = UDim2.new(0,90,0,90)
    Flag.Position = UDim2.new(0.5,-45,0.4,-30)
    Flag.BackgroundTransparency = 1
    Flag.Text = flag
    Flag.TextScaled = true

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0.8,0,0,28)
    Btn.Position = UDim2.new(0.1,0,0.82,0)
    Btn.Text = "SELECT"
    Btn.BackgroundColor3 = Color3.fromRGB(255,0,120)
    Btn.TextColor3 = Color3.new(1,1,1)

    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)

    Btn.MouseButton1Click:Connect(function()
        Selected = lang
        Stroke.Color = Color3.fromRGB(255,255,255)
    end)
end

CreateCard(UDim2.new(0.06,0,0.35,0),"VN","🇻🇳")
CreateCard(UDim2.new(0.52,0,0.35,0),"EN","🇬🇧")

-- AUTO KAMUI LOOP
task.spawn(function()
    while true do
        task.wait(6)
        RunKamui()
    end
end)

-- START
local Start = Instance.new("TextButton", Main)
Start.Size = UDim2.new(0.9,0,0,45)
Start.Position = UDim2.new(0.05,0,0.88,0)
Start.Text = "START"
Start.BackgroundColor3 = Color3.fromRGB(255,0,120)
Start.TextColor3 = Color3.new(1,1,1)
Start.TextScaled = true

Instance.new("UICorner", Start).CornerRadius = UDim.new(0,10)

Start.MouseButton1Click:Connect(function()
    TweenService:Create(Main,TweenInfo.new(0.25),{
        Size = UDim2.new(0,0,0,0)
    }):Play()

    task.wait(0.25)
    ScreenGui:Destroy()

    RunKamui()
    task.wait(1.5)

    if Selected == "EN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/430059241697400.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/516724804519643.lua"))()
    end
end)

-- ===== MINI UI RIP KAIMUN (FIX FULL) =====
local MiniGui = Instance.new("ScreenGui", game.CoreGui)
MiniGui.Name = "RipKaimunUI"
MiniGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", MiniGui)
Frame.Size = UDim2.new(0,150,0,50)
Frame.Position = UDim2.new(0.75,0,0.6,0)
Frame.BackgroundColor3 = Color3.fromRGB(30,0,40)
Frame.Active = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,12)

local Gradient = Instance.new("UIGradient", Frame)
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120,0,255))
}

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(1,0,1,0)
Button.BackgroundTransparency = 1
Button.Text = "RIP KAIMUN: OFF"
Button.TextColor3 = Color3.new(1,1,1)
Button.TextScaled = true

-- 🔥 FIX: không chặn drag
Button.Active = false

-- ===== TOGGLE =====
local ON = false

Button.MouseButton1Click:Connect(function()
    ON = not ON
    
    if ON then
        Button.Text = "RIP KAIMUN: ON"
        
        -- chạy loop riêng
        task.spawn(function()
            while ON do
                RunKamui()
                task.wait(6)
            end
        end)
        
    else
        Button.Text = "RIP KAIMUN: OFF"
    end
end)

-- ===== DRAG FOLLOW NGÓN TAY =====
local UIS = game:GetService("UserInputService")

local dragging = false
local offset = Vector2.new(0,0)

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        offset = input.Position - Frame.AbsolutePosition
    end
end)

Frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local pos = input.Position - offset
        Frame.Position = UDim2.new(0, pos.X, 0, pos.Y)
    end
end)
