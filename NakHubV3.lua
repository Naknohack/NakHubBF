local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "LanguageUI"

local Selected = nil

-- MAIN UI
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Size = UDim2.new(0,0,0,0)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BorderSizePixel = 0

local Stroke = Instance.new("UIStroke")
Stroke.Parent = Main
Stroke.Color = Color3.fromRGB(255,60,150)
Stroke.Thickness = 3

-- ANIMATION MỞ UI
TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,520,0,300)
}):Play()

-- ẢNH TRÊN
local TopImage = Instance.new("ImageLabel")
TopImage.Parent = Main
TopImage.BackgroundTransparency = 1
TopImage.Size = UDim2.new(0,90,0,90)
TopImage.Position = UDim2.new(0.5,-45,-0.15,0)
TopImage.Image = "rbxassetid://100306458933414"

-- BO GÓC ẢNH
local ImgCorner = Instance.new("UICorner")
ImgCorner.Parent = TopImage
ImgCorner.CornerRadius = UDim.new(0,20)

-- KHUNG VIETNAM
local Left = Instance.new("Frame")
Left.Parent = Main
Left.BackgroundColor3 = Color3.fromRGB(30,30,30)
Left.Size = UDim2.new(0,220,0,160)
Left.Position = UDim2.new(0.06,0,0.28,0)

local LTitle = Instance.new("TextLabel")
LTitle.Parent = Left
LTitle.BackgroundTransparency = 1
LTitle.Size = UDim2.new(1,0,0,30)
LTitle.Text = "Naknohack"
LTitle.Font = Enum.Font.GothamBold
LTitle.TextSize = 16
LTitle.TextColor3 = Color3.new(1,1,1)

local LLang = Instance.new("TextLabel")
LLang.Parent = Left
LLang.BackgroundTransparency = 1
LLang.Size = UDim2.new(1,0,0,25)
LLang.Position = UDim2.new(0,0,0.2,0)
LLang.Text = "Vietnammes"
LLang.Font = Enum.Font.Gotham
LLang.TextSize = 14
LLang.TextColor3 = Color3.fromRGB(200,200,200)

local LFlag = Instance.new("TextLabel")
LFlag.Parent = Left
LFlag.BackgroundTransparency = 1
LFlag.Size = UDim2.new(0,90,0,90)
LFlag.Position = UDim2.new(0.5,-45,0.45,-30)
LFlag.Text = "🇻🇳"
LFlag.TextScaled = true

local LSelect = Instance.new("TextButton")
LSelect.Parent = Left
LSelect.Size = UDim2.new(0.8,0,0,28)
LSelect.Position = UDim2.new(0.1,0,0.82,0)
LSelect.Text = "Chọn"
LSelect.Font = Enum.Font.GothamBold
LSelect.TextSize = 14
LSelect.BackgroundColor3 = Color3.fromRGB(255,70,150)
LSelect.TextColor3 = Color3.new(1,1,1)

-- KHUNG ENGLISH
local Right = Instance.new("Frame")
Right.Parent = Main
Right.BackgroundColor3 = Color3.fromRGB(30,30,30)
Right.Size = UDim2.new(0,220,0,160)
Right.Position = UDim2.new(0.52,0,0.28,0)

local RTitle = Instance.new("TextLabel")
RTitle.Parent = Right
RTitle.BackgroundTransparency = 1
RTitle.Size = UDim2.new(1,0,0,30)
RTitle.Text = "Naknohack"
RTitle.Font = Enum.Font.GothamBold
RTitle.TextSize = 16
RTitle.TextColor3 = Color3.new(1,1,1)

local RLang = Instance.new("TextLabel")
RLang.Parent = Right
RLang.BackgroundTransparency = 1
RLang.Size = UDim2.new(1,0,0,25)
RLang.Position = UDim2.new(0,0,0.2,0)
RLang.Text = "English"
RLang.Font = Enum.Font.Gotham
RLang.TextSize = 14
RLang.TextColor3 = Color3.fromRGB(200,200,200)

local RFlag = Instance.new("TextLabel")
RFlag.Parent = Right
RFlag.BackgroundTransparency = 1
RFlag.Size = UDim2.new(0,90,0,90)
RFlag.Position = UDim2.new(0.5,-45,0.45,-30)
RFlag.Text = "🇬🇧"
RFlag.TextScaled = true

local RSelect = Instance.new("TextButton")
RSelect.Parent = Right
RSelect.Size = UDim2.new(0.8,0,0,28)
RSelect.Position = UDim2.new(0.1,0,0.82,0)
RSelect.Text = "SELECT"
RSelect.Font = Enum.Font.GothamBold
RSelect.TextSize = 14
RSelect.BackgroundColor3 = Color3.fromRGB(255,70,150)
RSelect.TextColor3 = Color3.new(1,1,1)

-- START BUTTON
local Start = Instance.new("TextButton")
Start.Parent = Main
Start.Size = UDim2.new(0.9,0,0,40)
Start.Position = UDim2.new(0.05,0,0.85,0)
Start.Text = "START"
Start.Font = Enum.Font.GothamBold
Start.TextSize = 18
Start.BackgroundColor3 = Color3.fromRGB(255,70,150)
Start.TextColor3 = Color3.new(1,1,1)

-- HOVER ANIMATION
Start.MouseEnter:Connect(function()
TweenService:Create(Start,TweenInfo.new(0.15),{
BackgroundColor3 = Color3.fromRGB(255,100,180)
}):Play()
end)

Start.MouseLeave:Connect(function()
TweenService:Create(Start,TweenInfo.new(0.15),{
BackgroundColor3 = Color3.fromRGB(255,70,150)
}):Play()
end)

-- SELECT EFFECT
local function Select(btn)
TweenService:Create(btn,TweenInfo.new(0.2),{
BackgroundColor3 = Color3.fromRGB(255,120,180)
}):Play()
end

LSelect.MouseButton1Click:Connect(function()
Selected = "VN"
Select(LSelect)
end)

RSelect.MouseButton1Click:Connect(function()
Selected = "EN"
Select(RSelect)
end)

-- START CLICK
Start.MouseButton1Click:Connect(function()

TweenService:Create(Main,TweenInfo.new(0.25),{
Size = UDim2.new(0,0,0,0)
}):Play()

task.wait(0.25)
ScreenGui:Destroy()

if Selected == "EN" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/NakhubV3%20English.lua"))()

elseif Selected == "VN" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/NakHubV3%20VietNammess.txt"))()

end

end)
