local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "LanguageUI"

local Selected = nil
local UseFast = false
local RunningKamui = false

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

-- FAST BUTTON
local FastBtn = Instance.new("TextButton", Main)
FastBtn.Size = UDim2.new(0.5,0,0,35)
FastBtn.Position = UDim2.new(0.5,0,0.18,0)
FastBtn.AnchorPoint = Vector2.new(0.5,0.5)
FastBtn.Text = "⚠️ Super Fast Attack: OFF"
FastBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
FastBtn.TextColor3 = Color3.new(1,1,1)
FastBtn.TextScaled = true
FastBtn.BackgroundTransparency = 1

Instance.new("UICorner", FastBtn).CornerRadius = UDim.new(0,12)

TweenService:Create(FastBtn,TweenInfo.new(0.4),{
    BackgroundTransparency = 0
}):Play()

FastBtn.MouseButton1Click:Connect(function()
    UseFast = not UseFast

    if UseFast then
        FastBtn.Text = "⚠️ Super Fast Attack: ON"
        TweenService:Create(FastBtn,TweenInfo.new(0.2),{
            BackgroundColor3 = Color3.fromRGB(255,120,180)
        }):Play()
    else
        FastBtn.Text = "⚠️ Super Fast Attack: OFF"
        TweenService:Create(FastBtn,TweenInfo.new(0.2),{
            BackgroundColor3 = Color3.fromRGB(50,50,50)
        }):Play()
    end
end)

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
    Btn.Text = (lang == "English") and "SELECT" or "Chọn"
    Btn.BackgroundColor3 = Color3.fromRGB(255,70,150)

    return Frame, Btn, Stroke
end

local Left, LSelect, LStroke = CreateCard(UDim2.new(0.06,0,0.35,0),"Vietnammes","🇻🇳")
local Right, RSelect, RStroke = CreateCard(UDim2.new(0.52,0,0.35,0),"English","🇬🇧")

local function SelectCard(side)
    Selected = side
    LStroke.Color = side == "VN" and Color3.fromRGB(255,150,200) or Color3.fromRGB(255,70,150)
    RStroke.Color = side == "EN" and Color3.fromRGB(255,150,200) or Color3.fromRGB(255,70,150)
end

LSelect.MouseButton1Click:Connect(function() SelectCard("VN") end)
RSelect.MouseButton1Click:Connect(function() SelectCard("EN") end)

-- LINK
local Kamui = "https://raw.githubusercontent.com/Naknohack/RedzUi/refs/heads/main/Kamui%20Dimension.txt"
local Fast = "https://raw.githubusercontent.com/Naknohack/Fast-Attack-/refs/heads/main/21531857861969.lua"
local HubVN = "https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/516724804519643.lua"
local HubEN = "https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/430059241697400.lua"

-- RUN KAMUI (ANTI SPAM)
local function RunKamui()
    if RunningKamui then return end
    RunningKamui = true

    task.spawn(function()
        task.wait(2)
        pcall(function()
            loadstring(game:HttpGet(Kamui))()
        end)
        task.wait(5)
        RunningKamui = false
    end)
end

-- START
local Start = Instance.new("TextButton", Main)
Start.Size = UDim2.new(0.9,0,0,45)
Start.Position = UDim2.new(0.05,0,0.88,0)
Start.Text = "START"
Start.BackgroundColor3 = Color3.fromRGB(255,70,150)
Start.TextColor3 = Color3.new(1,1,1)
Start.TextScaled = true

Instance.new("UICorner", Start)

Start.MouseButton1Click:Connect(function()

    TweenService:Create(Main,TweenInfo.new(0.25),{
        Size = UDim2.new(0,0,0,0)
    }):Play()

    task.wait(0.25)
    ScreenGui:Destroy()

    task.spawn(function()

        -- 1️⃣ HUB
        if Selected == "EN" then
            pcall(function()
                loadstring(game:HttpGet(HubEN))()
            end)
        else
            pcall(function()
                loadstring(game:HttpGet(HubVN))()
            end)
        end

        task.wait(3)

        -- 2️⃣ FAST ATTACK
        if UseFast then
            pcall(function()
                loadstring(game:HttpGet(Fast))()
            end)
        end

        task.wait(3)

        -- 3️⃣ KAMUI
        RunKamui()

    end)

    -- AUTO KAMUI
    player.CharacterAdded:Connect(function()
        task.wait(2)
        RunKamui()
    end)

    player:GetPropertyChangedSignal("Team"):Connect(function()
        task.wait(2)
        RunKamui()
    end)

end)
