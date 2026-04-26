local FastAttackModule = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer

local function SafeWaitForChild(parent, childName)
    local success, result = pcall(function()
        return parent:WaitForChild(childName)
    end)
    return success and result
end

local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
local Net = Modules and SafeWaitForChild(Modules, "Net")

local RegisterAttack = Net and SafeWaitForChild(Net, "RE/RegisterAttack")
local RegisterHit = Net and SafeWaitForChild(Net, "RE/RegisterHit")

-- 🔥 Bật sẵn
local Settings = {
    AutoClick = true,
    ClickDelay = 0
}

local FastAttack = {
    Distance = 100
}

local function IsAlive(character)
    return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
end

local function GetEnemies()
    local enemies = {}
    local folders = {
        workspace:FindFirstChild("Enemies"),
        workspace:FindFirstChild("Characters")
    }

    for _, folder in ipairs(folders) do
        if folder then
            for _, enemy in ipairs(folder:GetChildren()) do
                local head = enemy:FindFirstChild("Head")
                if head and IsAlive(enemy) and enemy ~= Player.Character then
                    if Player:DistanceFromCharacter(head.Position) < FastAttack.Distance then
                        table.insert(enemies, {enemy, head})
                    end
                end
            end
        end
    end

    return enemies
end

function FastAttack:Attack()
    local character = Player.Character
    if not character then return end

    local enemies = GetEnemies()
    if #enemies == 0 then return end

    local tool = character:FindFirstChildOfClass("Tool")

    if tool and tool:FindFirstChild("LeftClickRemote") then
        for _, data in ipairs(enemies) do
            local enemy = data[1]
            local hrp = enemy:FindFirstChild("HumanoidRootPart")

            if hrp and character:FindFirstChild("HumanoidRootPart") then
                local dir = (hrp.Position - character.HumanoidRootPart.Position).Unit
                tool.LeftClickRemote:FireServer(dir, 1)
            end
        end
    elseif RegisterAttack and RegisterHit then
        RegisterAttack:FireServer(Settings.ClickDelay)
        RegisterHit:FireServer(enemies[1][2], enemies)
    end
end

-- 🔥 AUTO RUN NGAY KHI LOAD
task.spawn(function()
    while true do
        task.wait(Settings.ClickDelay)
        if Settings.AutoClick then
            pcall(function()
                FastAttack:Attack()
            end)
        end
    end
end)

FastAttackModule.FastAttack = FastAttack

return FastAttackModule
