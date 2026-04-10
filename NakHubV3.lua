local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "LanguageUI"

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,520,0,340)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)

-- STATE
local Selected = "VN"
local UseFast = false
local RunningKamui = false

-- FAST BUTTON
local FastBtn = Instance.new("TextButton", Main)
FastBtn.Size = UDim2.new(0.5,0,0,35)
FastBtn.Position = UDim2.new(0.5,0,0.2,0)
FastBtn.AnchorPoint = Vector2.new(0.5,0.5)
FastBtn.Text = "⚠️ Super Fast Attack: OFF"
FastBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
FastBtn.TextColor3 = Color3.new(1,1,1)
FastBtn.TextScaled = true

FastBtn.MouseButton1Click:Connect(function()
    UseFast = not UseFast
    FastBtn.Text = UseFast and "⚠️ Super Fast Attack: ON" or "⚠️ Super Fast Attack: OFF"
end)

-- START BUTTON
local Start = Instance.new("TextButton", Main)
Start.Size = UDim2.new(0.9,0,0,45)
Start.Position = UDim2.new(0.05,0,0.85,0)
Start.Text = "START"
Start.BackgroundColor3 = Color3.fromRGB(255,70,150)
Start.TextColor3 = Color3.new(1,1,1)
Start.TextScaled = true

-- LINK
local Kamui = "https://raw.githubusercontent.com/Naknohack/RedzUi/refs/heads/main/Kamui%20Dimension.txt"
local Fast = "https://raw.githubusercontent.com/Naknohack/Fast-Attack-/refs/heads/main/21531857861969.lua"
local HubVN = "https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/516724804519643.lua"
local HubEN = "https://raw.githubusercontent.com/Naknohack/Nakhubredz/refs/heads/main/430059241697400.lua"

-- 🔥 RUN KAMUI (ANTI SPAM)
local function RunKamui()
    if RunningKamui then return end
    RunningKamui = true

    task.spawn(function()
        task.wait(1.5)
        pcall(function()
            loadstring(game:HttpGet(Kamui))()
        end)
        task.wait(5) -- cooldown chống spam
        RunningKamui = false
    end)
end

-- START LOGIC
Start.MouseButton1Click:Connect(function()

    ScreenGui:Destroy()

    task.spawn(function()

        -- 1️⃣ Kamui
        RunKamui()

        task.wait(3)

        -- 2️⃣ Hub
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

        -- 3️⃣ Fast Attack
        if UseFast then
            pcall(function()
                loadstring(game:HttpGet(Fast))()
            end)
        end

    end)

    -- 🔁 AUTO KAMUI KHI CHẾT / RESET
    player.CharacterAdded:Connect(function()
        task.wait(2)
        RunKamui()
    end)

    -- 🔁 ĐỔI TEAM
    player:GetPropertyChangedSignal("Team"):Connect(function()
        task.wait(2)
        RunKamui()
    end)

end)
