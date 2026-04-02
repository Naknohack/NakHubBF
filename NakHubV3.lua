local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "LanguageUI"

local Selected = nil
local UseFast = false

-- MAIN
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Size = UDim2.new(0,0,0,0)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)

-- Glow viền
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255,60,150)
Stroke.Thickness = 2.5

-- Animation glow
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

TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,520,0,340)
}):Play()

-- LOGO
local TopImage = Instance.new("ImageLabel", Main)
TopImage.BackgroundTransparency = 1
TopImage.Size = UDim2.new(0,90,0,90)
TopImage.Position = UDim2.new(0.5,-45,-0.15,0)
TopImage.Image = "rbxassetid://100306458933414"
Instance.new("UICorner", TopImage).CornerRadius = UDim.new(0,20)

-- HÀM TẠO CARD
local function CreateCard(pos, lang, flag)
    local Frame = Instance.new("Frame", Main)
    Frame.Size = UDim2.new(0,220,0,170)
    Frame.Position = pos
    Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Color3.fromRGB(255,70,150)
    Stroke.Thickness = 1

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1,0,0,25)
    Title.BackgroundTransparency = 1
    Title.Text = "Naknohack"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.GothamBold

    local Lang = Instance.new("TextLabel", Frame)
    Lang.Size = UDim2.new(1,0,0,20)
    Lang.Position = UDim2.new(0,0,0.18,0)
    Lang.BackgroundTransparency = 1
    Lang.Text = lang
    Lang.TextColor3 = Color3.fromRGB(200,200,200)

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

    -- Hover effect
    Btn.MouseEnter:Connect(function()
        TweenService:Create(Btn,TweenInfo.new(0.15),{
            BackgroundColor3 = Color3.fromRGB(255,120,180)
        }):Play()
    end)

    Btn.MouseLeave:Connect(function()
        TweenService:Create(Btn,TweenInfo.new(0.15),{
            BackgroundColor3 = Color3.fromRGB(255,70,150)
        }):Play()
    end)

    return Frame, Btn, Stroke
end

-- TẠO 2 CARD
local Left, LSelect, LStroke = CreateCard(UDim2.new(0.06,0,0.28,0),"Vietnammes","🇻🇳")
local Right, RSelect, RStroke = CreateCard(UDim2.new(0.52,0,0.28,0),"English","🇬🇧")

-- CHỌN
local function SelectCard(side)
    Selected = side

    LStroke.Color = Color3.fromRGB(255,70,150)
    RStroke.Color = Color3.fromRGB(255,70,150)

    if side == "VN" then
        LStroke.Color = Color3.fromRGB(255,150,200)
    else
        RStroke.Color = Color3.fromRGB(255,150,200)
    end
end

LSelect.MouseButton1Click:Connect(function()
    SelectCard("VN")
end)

RSelect.MouseButton1Click:Connect(function()
    SelectCard("EN")
end)

-- ⚠️ FAST ATTACK
local FastBtn = Instance.new("TextButton", Main)
FastBtn.Size = UDim2.new(0.45,0,0,35)
FastBtn.Position = UDim2.new(0.5,0,0.55,0)
FastBtn.AnchorPoint = Vector2.new(0.5,0.5)
FastBtn.Text = "⚠️ Super Fast Attack: OFF"
FastBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
FastBtn.TextColor3 = Color3.new(1,1,1)
FastBtn.TextScaled = true

Instance.new("UICorner", FastBtn).CornerRadius = UDim.new(0,12)

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

-- START
local Start = Instance.new("TextButton", Main)
Start.Size = UDim2.new(0.9,0,0,45)
Start.Position = UDim2.new(0.05,0,0.88,0)
Start.Text = "START"
Start.BackgroundColor3 = Color3.fromRGB(255,70,150)
Start.TextColor3 = Color3.new(1,1,1)
Start.TextScaled = true

Instance.new("UICorner", Start).CornerRadius = UDim.new(0,12)

-- Hover START
Start.MouseEnter:Connect(function()
    TweenService:Create(Start,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(255,120,180)
    }):Play()
end)

Start.MouseLeave:Connect(function()
    TweenService:Create(Start,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(255,70,150)
    }):Play()
end)

-- START CLICK
Start.MouseButton1Click:Connect(function()

    TweenService:Create(Main,TweenInfo.new(0.25),{
        Size = UDim2.new(0,0,0,0)
    }):Play()

    task.wait(0.25)
    ScreenGui:Destroy()

    -- FAST
    if UseFast then
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Fast-Attack-/refs/heads/main/21531857861969.lua"))()
        end)
        task.wait(1)
    end

    -- SCRIPT
    if Selected == "EN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/NakhubV3%20English.lua"))()
    elseif Selected == "VN" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/NakHubV3%20VietNammess.txt"))()
    end

end)
