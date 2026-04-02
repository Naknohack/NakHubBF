local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "LanguageUI"

local Selected = nil
local UseFast = false

-- MAIN
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Size = UDim2.new(0,0,0,0)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)

Instance.new("UIStroke", Main).Color = Color3.fromRGB(255,60,150)

TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,520,0,330)
}):Play()

-- IMAGE
local TopImage = Instance.new("ImageLabel", Main)
TopImage.BackgroundTransparency = 1
TopImage.Size = UDim2.new(0,90,0,90)
TopImage.Position = UDim2.new(0.5,-45,-0.15,0)
TopImage.Image = "rbxassetid://100306458933414"
Instance.new("UICorner", TopImage)

-- 🇻🇳 LEFT
local Left = Instance.new("Frame", Main)
Left.BackgroundColor3 = Color3.fromRGB(30,30,30)
Left.Size = UDim2.new(0,220,0,170)
Left.Position = UDim2.new(0.06,0,0.28,0)

-- Title
local LTitle = Instance.new("TextLabel", Left)
LTitle.Size = UDim2.new(1,0,0,25)
LTitle.BackgroundTransparency = 1
LTitle.Text = "Naknohack"
LTitle.TextColor3 = Color3.new(1,1,1)

-- Language
local LLang = Instance.new("TextLabel", Left)
LLang.Size = UDim2.new(1,0,0,20)
LLang.Position = UDim2.new(0,0,0.18,0)
LLang.BackgroundTransparency = 1
LLang.Text = "Vietnammes"
LLang.TextColor3 = Color3.fromRGB(200,200,200)

-- FLAG 🇻🇳
local LFlag = Instance.new("TextLabel", Left)
LFlag.Size = UDim2.new(0,90,0,90)
LFlag.Position = UDim2.new(0.5,-45,0.4,-30)
LFlag.BackgroundTransparency = 1
LFlag.Text = "🇻🇳"
LFlag.TextScaled = true

-- BUTTON
local LSelect = Instance.new("TextButton", Left)
LSelect.Size = UDim2.new(0.8,0,0,28)
LSelect.Position = UDim2.new(0.1,0,0.82,0)
LSelect.Text = "Chọn"
LSelect.BackgroundColor3 = Color3.fromRGB(255,70,150)

-- 🇬🇧 RIGHT
local Right = Instance.new("Frame", Main)
Right.BackgroundColor3 = Color3.fromRGB(30,30,30)
Right.Size = UDim2.new(0,220,0,170)
Right.Position = UDim2.new(0.52,0,0.28,0)

local RTitle = Instance.new("TextLabel", Right)
RTitle.Size = UDim2.new(1,0,0,25)
RTitle.BackgroundTransparency = 1
RTitle.Text = "Naknohack"
RTitle.TextColor3 = Color3.new(1,1,1)

local RLang = Instance.new("TextLabel", Right)
RLang.Size = UDim2.new(1,0,0,20)
RLang.Position = UDim2.new(0,0,0.18,0)
RLang.BackgroundTransparency = 1
RLang.Text = "English"
RLang.TextColor3 = Color3.fromRGB(200,200,200)

-- FLAG 🇬🇧
local RFlag = Instance.new("TextLabel", Right)
RFlag.Size = UDim2.new(0,90,0,90)
RFlag.Position = UDim2.new(0.5,-45,0.4,-30)
RFlag.BackgroundTransparency = 1
RFlag.Text = "🇬🇧"
RFlag.TextScaled = true

local RSelect = Instance.new("TextButton", Right)
RSelect.Size = UDim2.new(0.8,0,0,28)
RSelect.Position = UDim2.new(0.1,0,0.82,0)
RSelect.Text = "SELECT"
RSelect.BackgroundColor3 = Color3.fromRGB(255,70,150)

-- ⚠️ FAST ATTACK (GIỮA)
local FastBtn = Instance.new("TextButton", Main)
FastBtn.Size = UDim2.new(0.4,0,0,30)
FastBtn.Position = UDim2.new(0.3,0,0.72,0)
FastBtn.Text = "⚠️ Super Fast Attack: OFF"
FastBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)

FastBtn.MouseButton1Click:Connect(function()
    UseFast = not UseFast
    if UseFast then
        FastBtn.Text = "⚠️ Super Fast Attack: ON"
        FastBtn.BackgroundColor3 = Color3.fromRGB(255,120,180)
    else
        FastBtn.Text = "⚠️ Super Fast Attack: OFF"
        FastBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    end
end)

-- START
local Start = Instance.new("TextButton", Main)
Start.Size = UDim2.new(0.9,0,0,40)
Start.Position = UDim2.new(0.05,0,0.88,0)
Start.Text = "START"
Start.BackgroundColor3 = Color3.fromRGB(255,70,150)

-- SELECT
LSelect.MouseButton1Click:Connect(function()
    Selected = "VN"
end)

RSelect.MouseButton1Click:Connect(function()
    Selected = "EN"
end)

-- START CLICK
Start.MouseButton1Click:Connect(function()

    TweenService:Create(Main,TweenInfo.new(0.25),{
        Size = UDim2.new(0,0,0,0)
    }):Play()

    task.wait(0.25)
    ScreenGui:Destroy()

    -- FAST ATTACK
    if UseFast then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Fast-Attack-/refs/heads/main/21531857861969.lua"))()
        task.wait(1)
    end

    -- LANGUAGE
    if Selected == "EN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/NakhubV3%20English.lua"))()
    elseif Selected == "VN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/NakHubV3%20VietNammess.txt"))()
    end

end)
