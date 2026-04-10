local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "LanguageUI"

local Selected = nil

-- MAIN
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Size = UDim2.new(0,0,0,0)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundTransparency = 1

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255,60,150)
Stroke.Thickness = 2.5

TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,520,0,340),
    BackgroundTransparency = 0
}):Play()

-- Glow
task.spawn(function()
    while true do
        TweenService:Create(Stroke,TweenInfo.new(1),{
            Color = Color3.fromRGB(255,120,180)
        }):Play()
        task.wait(1)
        TweenService:Create(Stroke,TweenInfo.new(1),{
            Color = Color3.fromRGB(255,60,150)
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
    Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Frame.BackgroundTransparency = 1

    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Color3.fromRGB(255,70,150)

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
    Btn.BackgroundColor3 = Color3.fromRGB(255,70,150)

    Btn.MouseButton1Click:Connect(function()
        Selected = lang
        Stroke.Color = Color3.fromRGB(255,150,200)
    end)

    TweenService:Create(Frame,TweenInfo.new(0.4),{
        BackgroundTransparency = 0
    }):Play()
end

CreateCard(UDim2.new(0.06,0,0.35,0),"VN","🇻🇳")
CreateCard(UDim2.new(0.52,0,0.35,0),"EN","🇬🇧")

-- 🔁 AUTO KAMUI (LUÔN CHẠY LẠI)
task.spawn(function()
    while true do
        task.wait(6)
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/RedzUi/refs/heads/main/Kamui%20Dimension.txt"))()
        end)
    end
end)

-- START
local Start = Instance.new("TextButton", Main)
Start.Size = UDim2.new(0.9,0,0,45)
Start.Position = UDim2.new(0.05,0,0.88,0)
Start.Text = "START"
Start.BackgroundColor3 = Color3.fromRGB(255,70,150)
Start.TextColor3 = Color3.new(1,1,1)
Start.TextScaled = true

Start.MouseButton1Click:Connect(function()

    TweenService:Create(Main,TweenInfo.new(0.25),{
        Size = UDim2.new(0,0,0,0)
    }):Play()

    task.wait(0.25)
    ScreenGui:Destroy()

    -- 🔥 CHẠY KAMUI TRƯỚC
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/RedzUi/refs/heads/main/Kamui%20Dimension.txt"))()

    -- ⏱ ĐỢI
    task.wait(1.5)

    -- 🚀 CHẠY HUB SAU
    if Selected == "EN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/430059241697400.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/516724804519643.lua"))()
    end

end)
-- 🟣 MINI UI KAMUI (DRAG + BUTTON)
local MiniGui = Instance.new("ScreenGui", game.CoreGui)
MiniGui.Name = "MiniKamui"
MiniGui.ResetOnSpawn = false

local MiniFrame = Instance.new("Frame", MiniGui)
MiniFrame.Size = UDim2.new(0,120,0,40)
MiniFrame.Position = UDim2.new(0.8,0,0.7,0)
MiniFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
MiniFrame.Active = true
MiniFrame.Draggable = true

Instance.new("UICorner", MiniFrame).CornerRadius = UDim.new(0,10)

local MiniBtn = Instance.new("TextButton", MiniFrame)
MiniBtn.Size = UDim2.new(1,0,1,0)
MiniBtn.Text = "RIP KAIMUN" -- 🔥 ĐỔI TÊN Ở ĐÂY
MiniBtn.TextColor3 = Color3.new(1,1,1)
MiniBtn.BackgroundColor3 = Color3.fromRGB(255,70,150)
MiniBtn.TextScaled = true

Instance.new("UICorner", MiniBtn).CornerRadius = UDim.new(0,10)

MiniBtn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/RedzUi/refs/heads/main/Kamui%20Dimension.txt"))()
    end)
end)
