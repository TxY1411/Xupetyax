local library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/TxY1411/Xupetyax/main/aimvx.lua"))()

local Main = library:CreateWindow("xyz","Crimson")
local tab = Main:CreateTab("Player")
local tab2 = Main:CreateTab("ESP")
local tab3 = Main:CreateTab("Exploit")
local tab4 = Main:CreateTab("MISC")
local Main = library:CreateWindow("xyz", "Crimson")

-- Aba "Player"
local tab = Main:CreateTab("Player")
local tab1 = Main:CreateTab("ESP")





-- Toggle para ativar/desativar o Aimbot
tab:CreateToggle("Ativar Aimbot", function(enabled)
    _G.AimbotEnabled = enabled
    if enabled then
    
    end
end)

_G.AimbotEnabled = false  -- Inicialmente desativado

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimPart = "Head" -- Parte onde o aimbot mira.
_G.Sensitivity = 0.1 -- Sensibilidade do aimbot.

local function GetClosestPlayer()
    local MaximumDistance = math.huge
    local Target = nil
    
    for _, v in next, Players:GetPlayers() do
        if v ~= LocalPlayer then
            local character = v.Character
            if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild(_G.AimPart) then
                local screenPoint = Camera:WorldToScreenPoint(character.HumanoidRootPart.Position)
                local vectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                
                if vectorDistance < MaximumDistance then
                    Target = character[_G.AimPart]
                    MaximumDistance = vectorDistance
                end
            end
        end
    end
    
    return Target
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding and _G.AimbotEnabled then
        local target = GetClosestPlayer()
        if target then
            TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, target.Position)}):Play()
        end
    end
end)


-- Toggle para ativar/desativar Munição Infinita
local infiniteAmmoToggle = tab:CreateToggle("Munição Infinita", function(enabled)
    _G.InfiniteAmmoEnabled = enabled
    if enabled then
    
    end
end)

_G.InfiniteAmmoEnabled = false  -- Inicialmente desativado

-- Função de exemplo para simular o disparo da arma
local function OnFire()
    if _G.InfiniteAmmoEnabled then
  
    end
end

-- Conectar evento de disparo (exemplo genérico)
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.Button1Down:Connect(OnFire)


-- Toggle para ativar/desativar Rapid Fire
local rapidFireToggle = tab:CreateToggle("Rapid Fire", function(enabled)
    _G.RapidFireEnabled = enabled
    if enabled then
  
    end
end)

_G.RapidFireEnabled = false  -- Inicialmente desativado

-- Função de exemplo para simular o disparo da arma com rapid fire
local function OnFire()
    if _G.RapidFireEnabled then
    
    
    end
end

-- Conectar evento de disparo (exemplo genérico)
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.Button1Down:Connect(OnFire)









-- Toggle para "Reage Bot"
local reageBotToggle = tab:CreateToggle("Reage Bot", function(enabled)
    _G.ReageBotEnabled = enabled
    if enabled then
        print("Reage Bot ativado")
    else
        print("Reage Bot desativado")
    end
end)

_G.ReageBotEnabled = false  -- Inicialmente desativado

-- Função para o aimbot e atirar automaticamente
local function ReageBot()
    local Holding = false
    local Shooting = false

    local function GetClosestPlayer()
        local MaximumDistance = math.huge
        local Target = nil

        coroutine.wrap(function()
            wait(20); MaximumDistance = math.huge -- Redefinir MaximumDistance para que o Aimbot não se lembre disso como uma variável muito pequena e pare de capturar jogadores ...
        end)()

        for _, v in next, Players:GetPlayers() do
            if v.Name ~= Players.LocalPlayer.Name then
                if _G.TeamCheck == true then
                    if v.Team ~= Players.LocalPlayer.Team then
                        if v.Character ~= nil then
                            if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                    local ScreenPoint = game.Workspace.CurrentCamera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                    local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                                    if VectorDistance < MaximumDistance then
                                        Target = v
                                        MaximumDistance = VectorDistance
                                    end
                                end
                            end
                        end
                    end
                else
                    if v.Character ~= nil then
                        if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                            if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                local ScreenPoint = game.Workspace.CurrentCamera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                                if VectorDistance < MaximumDistance then
                                    Target = v
                                    MaximumDistance = VectorDistance
                                end
                            end
                        end
                    end
                end
            end
        end

        return Target
    end

    UserInputService.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Holding = true
        end
    end)

    UserInputService.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Holding = false
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if Holding and _G.ReageBotEnabled then
            local target = GetClosestPlayer()
            if target then
                TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, target.Character[_G.AimPart].Position)}):Play()

                -- Atirar automaticamente
                if not Shooting then
                    Shooting = true
                    -- Coloque aqui o código para atirar automaticamente
                    -- Por exemplo, você pode chamar game:GetService("ReplicatedStorage").ShootEvent:FireServer()
                    -- Ou utilizar o método que o jogo usa para atirar
                    wait(0.1)  -- Aguarde um curto período de tempo para evitar atirar continuamente
                    Shooting = false
                end
            else
                Shooting = false
            end
        else
            Shooting = false
        end
    end)
end

-- Inicializar a função Reage Bot
ReageBot()









-- Toggle para evitar mirar em quem está usando aimbot
local avoidAimbotToggle = tab:CreateToggle("Evitar Aimbot", function(enabled)
    _G.AvoidAimbotEnabled = enabled
    if enabled then
        print("Evitar mirar em quem está usando aimbot ativado")
    else
        print("Evitar mirar em quem está usando aimbot desativado")
    end
end)

_G.AvoidAimbotEnabled = false  -- Inicialmente desativado

-- Função para verificar se um jogador está usando aimbot
local function IsUsingAimbot(player)
    -- Implemente sua lógica para detectar aimbot aqui
    -- Exemplo: verificar se o jogador está travando mira rapidamente e com precisão anormal
    return false  -- Retornar verdadeiro se estiver usando aimbot, caso contrário, falso
end

-- Conectar evento para ajustar o comportamento da mira do jogador
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        local target = IsUsingAimbot(Players:GetPlayerFromCharacter(input.Target.Parent))
        if target and _G.AvoidAimbotEnabled then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position), 0.1)  -- Ajuste suave da mira para não grudar
        end
    end
end)















local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Shortcuts
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

--// Variables
local OldNameCall = nil

--// Settings
getgenv().SilentAimEnabled = true
getgenv().AvoidAimbotEnabled = true  -- Variável global para controlar se deve evitar mirar em quem está usando aimbot

--// Functions

local function GetClosestPlayer()
    local MaximumDistance = math.huge
    local Target

    local Thread = coroutine.wrap(function()
        wait(20)
        MaximumDistance = math.huge
    end)

    Thread()

    for _, v in next, Players:GetPlayers() do
        if v.Name ~= LocalPlayer.Name then
            if v.TeamColor ~= LocalPlayer.TeamColor then
                if workspace:FindFirstChild(v.Name) ~= nil then
                    if workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        if workspace[v.Name]:FindFirstChild("Humanoid") ~= nil and workspace[v.Name]:FindFirstChild("Humanoid").Health ~= 0 then
                            local ScreenPoint = Camera:WorldToScreenPoint(workspace[v.Name]:WaitForChild("HumanoidRootPart", math.huge).Position)
                            local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                            
                            if VectorDistance < MaximumDistance then
                                Target = v
                                MaximumDistance = VectorDistance
                            end
                        end
                    end
                end
            end
        end
    end

    return Target
end

--// Silent Aim

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local NameCallMethod = getnamecallmethod()
    local Arguments = {...}

    if not checkcaller() and tostring(Self) == "HitPart" and tostring(NameCallMethod) == "FireServer" then
        if getgenv().SilentAimEnabled == true then
            Arguments[1] = GetClosestPlayer().Character.Hitbox
        end

        return Self.FireServer(Self, unpack(Arguments))
    elseif not checkcaller() and tostring(Self) == "Trail" and tostring(NameCallMethod) == "FireServer" then
        if getgenv().SilentAimEnabled == true then
            if type(Arguments[1][5]) == "string" then
                Arguments[1][6] = GetClosestPlayer().Character.Hitbox
                Arguments[1][2] = GetClosestPlayer().Character.Hitbox.Position
            end
        end

        return Self.FireServer(Self, unpack(Arguments))
    elseif not checkcaller() and tostring(Self) == "CreateProjectile" and tostring(NameCallMethod) == "FireServer" then    
        if getgenv().SilentAimEnabled == true then
            Arguments[18] = GetClosestPlayer().Character.Hitbox
            Arguments[19] = GetClosestPlayer().Character.Hitbox.Position
            Arguments[17] = GetClosestPlayer().Character.Hitbox.Position
            Arguments[4] = GetClosestPlayer().Character.Hitbox.CFrame
            Arguments[10] = GetClosestPlayer().Character.Hitbox.Position
            Arguments[3] = GetClosestPlayer().Character.Hitbox.Position
        end

        return Self.FireServer(Self, unpack(Arguments))
    elseif not checkcaller() and tostring(Self) == "Flames" and tostring(NameCallMethod) == "FireServer" then -- DOESNT WORK
        if getgenv().SilentAimEnabled == true then
            Arguments[1] = GetClosestPlayer().Character.Hitbox.CFrame
            Arguments[2] = GetClosestPlayer().Character.Hitbox.Position
            Arguments[5] = GetClosestPlayer().Character.Hitbox.Position
        end

        return Self.FireServer(Self, unpack(Arguments))
    elseif not checkcaller() and tostring(Self) == "Fire" and tostring(NameCallMethod) == "FireServer" then
        if getgenv().SilentAimEnabled == true then
            Arguments[1] = GetClosestPlayer().Character.Hitbox.Position
        end

        return Self.FireServer(Self, unpack(Arguments))
    elseif not checkcaller() and tostring(Self) == "ReplicateProjectile" and tostring(NameCallMethod) == "FireServer" then
        if getgenv().SilentAimEnabled == true then
            Arguments[1][3] = GetClosestPlayer().Character.Hitbox.Position
            Arguments[1][4] = GetClosestPlayer().Character.Hitbox.Position
            Arguments[1][10] = GetClosestPlayer().Character.Hitbox.Position
        end

        return Self.FireServer(Self, unpack(Arguments))
    elseif not checkcaller() and tostring(Self) == "RemoteEvent" and tostring(NameCallMethod) == "FireServer" then
        if getgenv().SilentAimEnabled == true then
            if Arguments[1][1] == "createparticle" and Arguments[1][2] == "muzzle" then
                if Arguments[3] == LocalPlayer.Character.Gun then
                    if ReplicatedStorage.Weapons(LocalPlayer.Character.Gun.Boop.Value).Melee then
                        local KnifeArguments1 = {
                            [1] = "createparticle",
                            [2] = "bullethole",
                            [3] = GetClosestPlayer().Character.Hitbox,
                            [4] = GetClosestPlayer().Character.Hitbox.Position,
                            [5] = Vector3.new(0, 0, 0),
                            [6] = ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.Gun.Boop.Value),
                            [7] = false,
                            [8] = GetClosestPlayer().Character.Hitbox.Position,
                            [9] = true,
                            [12] = LocalPlayer,
                            [13] = 1
                        }
                        
                        local KnifeArguments = {
                            GetClosestPlayer().Character.Hitbox,
                            GetClosestPlayer().Character.Hitbox.Position,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).Name,
                            1,
                            5,
                            false,
                            false,
                            false,
                            1,
                            false,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).FireRate.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).ReloadTime.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).Ammo.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).StoredAmmo.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).Bullets.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).EquipTime.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).RecoilControl.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value).Auto.Value,
                            ReplicatedStorage.Weapons:FindFirstChild(LocalPlayer.Character.EquippedTool.Value)["Speed%"].Value,
                            ReplicatedStorage:WaitForChild("wkspc").DistributedTime.Value,
                            215,
                            1,
                            false,
                            true
                        }

                        ReplicatedStorage.Events.RemoteEvent:FireServer(KnifeArguments1)
                        ReplicatedStorage.Events.HitPart:FireServer(unpack(KnifeArguments))
                    end
                end
            end
        end

        return Self.FireServer(Self, unpack(Arguments))
    end

    return OldNameCall(Self, ...)
end)


local silentAimToggle = tab:CreateToggle("Silent Aim", function(enabled)
    getgenv().SilentAimEnabled = enabled
    if enabled then
   
    end
end)

















local LocalPlayer = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Função para encontrar o jogador mais próximo
local function closest()
    local dist = math.huge
    local closest
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Torso.BrickColor ~= LocalPlayer.Character.Torso.BrickColor then
            local mousePos = UserInputService:GetMouseLocation()
            local cast, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            local calc = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(cast.X, cast.Y)).Magnitude
            if onScreen and calc < dist then
                dist = calc
                closest = player
            end
        end
    end
    return closest
end

-- Hook para modificar o comportamento do mouse
local mouse = LocalPlayer:GetMouse()
local __namecall
__namecall = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if self == mouse and not checkcaller() then
        local player = closest()
        if player then
            local cast = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if key == "X" then
                return cast.X
            elseif key == "Y" then
                return cast.Y
            end
        end
    end
    return __namecall(self, key)
end))








tab:CreateToggle("Find Closest Player", function(enabled)
    if enabled then
        -- Hook de indexação ativo
        __namecall:Unbind()
    else
        -- Hook de indexação desativado
        __namecall = hookmetamethod(game, "__index", newcclosure(function(self, key)
            if self == mouse and not checkcaller() then
                local player = closest()
                if player then
                    local cast = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                    if key == "X" then
                        return cast.X
                    elseif key == "Y" then
                        return cast.Y
                    end
                end
            end
            return __namecall(self, key)
        end))
    end
end)


























































---------------------------ESP--------------------------------------------

local function API_Check()
    if Drawing == nil then
        return "No"
    else
        return "Yes"
    end
end

local Find_Required = API_Check()

if Find_Required == "No" then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "xyz";
        Text = "xyz";
        Duration = math.huge;
        Button1 = "OK"
    })

    return
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local UserInputService = game:GetService("UserInputService")
local TestService = game:GetService("TestService")

local Typing = false

_G.SendNotifications = true   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
_G.DefaultSettings = false   -- If set to true then the tracer script would run with default settings regardless of any changes you made.

_G.TeamCheck = false   -- If set to true then the script would create tracers only for the enemy team members.

--[!]-- ONLY ONE OF THESE VALUES SHOULD BE SET TO TRUE TO NOT ERROR THE SCRIPT --[!]--

_G.FromMouse = false   -- If set to true, the tracers will come from the position of your mouse curson on your screen.
_G.FromCenter = false   -- If set to true, the tracers will come from the center of your screen.
_G.FromBottom = true   -- If set to true, the tracers will come from the bottom of your screen.

_G.TracersVisible = true   -- If set to true then the tracers will be visible and vice versa.
_G.TracerColor = Color3.fromRGB(79, 29, 117)   -- The color that the tracers would appear as.
_G.TracerThickness = 1   -- The thickness of the tracers.
_G.TracerTransparency = 0.7   -- The transparency of the tracers.

_G.ModeSkipKey = Enum.KeyCode.E   -- The key that changes between modes that indicate where will the tracers come from.
_G.DisableKey = Enum.KeyCode.Q   -- The key that disables / enables the tracers.

local function CreateTracers()
    for _, v in next, Players:GetPlayers() do
        if v.Name ~= game.Players.LocalPlayer.Name then
            local TracerLine = Drawing.new("Line")
    
            RunService.RenderStepped:Connect(function()
                if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                    local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * 1
                    local Vector, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(0, -HumanoidRootPart_Size.Y, 0).p)
                    
                    TracerLine.Thickness = _G.TracerThickness
                    TracerLine.Transparency = _G.TracerTransparency
                    TracerLine.Color = _G.TracerColor

                    if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false then
                        TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                    elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false then
                        TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true then
                        TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    end

                    if OnScreen == true  then
                        TracerLine.To = Vector2.new(Vector.X, Vector.Y)
                        if _G.TeamCheck == true then 
                            if Players.LocalPlayer.Team ~= v.Team then
                                TracerLine.Visible = _G.TracersVisible
                            else
                                TracerLine.Visible = false
                            end
                        else
                            TracerLine.Visible = _G.TracersVisible
                        end
                    else
                        TracerLine.Visible = false
                    end
                else
                    TracerLine.Visible = false
                end
            end)

            Players.PlayerRemoving:Connect(function()
                TracerLine.Visible = false
            end)
        end
    end

    Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(function(v)
            if v.Name ~= game.Players.LocalPlayer.Name then
                local TracerLine = Drawing.new("Line")
        
                RunService.RenderStepped:Connect(function()
                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * 1
                    	local Vector, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(0, -HumanoidRootPart_Size.Y, 0).p)
                        
                        TracerLine.Thickness = _G.TracerThickness
                        TracerLine.Transparency = _G.TracerTransparency
                        TracerLine.Color = _G.TracerColor

                        if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false then
                            TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                        elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false then
                            TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                        elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true then
                            TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        end

                        if OnScreen == true  then
                            TracerLine.To = Vector2.new(Vector.X, Vector.Y)
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= Player.Team then
                                    TracerLine.Visible = _G.TracersVisible
                                else
                                    TracerLine.Visible = false
                                end
                            else
                                TracerLine.Visible = _G.TracersVisible
                            end
                        else
                            TracerLine.Visible = false
                        end
                    else
                        TracerLine.Visible = false
                    end
                end)

                Players.PlayerRemoving:Connect(function()
                    TracerLine.Visible = false
                end)
            end
        end)
    end)
end

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == _G.ModeSkipKey and Typing == false then
        if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false and _G.TracersVisible == true then
            _G.FromCenter = false
            _G.FromBottom = true
            _G.FromMouse = false

            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "ESP";
                    Text = "esp";
                    Duration = 5;
                })
            end
        elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true and _G.TracersVisible == true then
            _G.FromCenter = true
            _G.FromBottom = false
            _G.FromMouse = false

            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "xyz";
                    Text = "xyz";
                    Duration = 5;
                })
            end
        elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false and _G.TracersVisible == true then
            _G.FromCenter = false
            _G.FromBottom = false
            _G.FromMouse = true

            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "xyz";
                    Text = "xyz";
                    Duration = 5;
                })
            end
        end
    elseif Input.KeyCode == _G.DisableKey and Typing == false then
        _G.TracersVisible = not _G.TracersVisible
        
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "xyz";
                Text = "The tracers' visibility is now set to "..tostring(_G.TracersVisible)..".";
                Duration = 5;
            })
        end
    end
end)

if _G.DefaultSettings == true then
    _G.TeamCheck = false
    _G.FromMouse = false
    _G.FromCenter = false
    _G.FromBottom = true
    _G.TracersVisible = true
    _G.TracerColor = Color3.fromRGB(40, 90, 255)
    _G.TracerThickness = 1
    _G.TracerTransparency = 0.5
    _G.ModeSkipKey = Enum.KeyCode.E
    _G.DisableKey = Enum.KeyCode.Q
end

local Success, Errored = pcall(function()
    CreateTracers()
end)

if Success and not Errored then
    if _G.SendNotifications == true then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "xyz";
            Text = "Tracer script has successfully loaded.";
            Duration = 5;
        })
    end
elseif Errored and not Success then
    if _G.SendNotifications == true then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "xyz";
            Text = "xyz";
            Duration = 5;
        })
    end
    TestService:Message("The tracer script has errored, please notify Exunys with the following information :")
    warn(Errored)
    print("Load")
end




-- Substitua esta linha na sua parte de criação de GUI:
tab1:CreateToggle("ESP Line", function(enabled)
    _G.TracersVisible = enabled
end)








local function API_Check()
    if Drawing == nil then
        return "No"
    else
        return "Yes"
    end
end

local Find_Required = API_Check()

if Find_Required == "No" then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "xyz";
        Text = "ESP script could not be loaded because your exploit is unsupported.";
        Duration = math.huge;
        Button1 = "OK"
    })

    return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local Typing = false

_G.SendNotifications = true   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
_G.DefaultSettings = false   -- If set to true then the ESP script would run with default settings regardless of any changes you made.

_G.TeamCheck = false   -- If set to true then the script would create ESP only for the enemy team members.

_G.ESPVisible = true   -- If set to true then the ESP will be visible and vice versa.
_G.TextColor = Color3.fromRGB(177, 10, 255)   -- The color that the boxes would appear as.
_G.TextSize = 14   -- The size of the text.
_G.Center = true   -- If set to true then the script would be located at the center of the label.
_G.Outline = true   -- If set to true then the text would have an outline.
_G.OutlineColor = Color3.fromRGB(0, 0, 0)   -- The outline color of the text.
_G.TextTransparency = 0.7   -- The transparency of the text.
_G.TextFont = Drawing.Fonts.UI   -- The font of the text. (UI, System, Plex, Monospace) 

_G.DisableKey = Enum.KeyCode.Q   -- The key that disables / enables the ESP.

local function CreateESP()
    for _, v in next, Players:GetPlayers() do
        if v.Name ~= Players.LocalPlayer.Name then
            local ESP = Drawing.new("Text")

            RunService.RenderStepped:Connect(function()
                if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                    local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)

                    ESP.Size = _G.TextSize
                    ESP.Center = _G.Center
                    ESP.Outline = _G.Outline
                    ESP.OutlineColor = _G.OutlineColor
                    ESP.Color = _G.TextColor
                    ESP.Transparency = _G.TextTransparency
                    ESP.Font = _G.TextFont

                    if OnScreen == true then
                        local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                        local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                        local Dist = (Part1 - Part2).Magnitude
                        ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                        ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                        if _G.TeamCheck == true then 
                            if Players.LocalPlayer.Team ~= v.Team then
                                ESP.Visible = _G.ESPVisible
                            else
                                ESP.Visible = false
                            end
                        else
                            ESP.Visible = _G.ESPVisible
                        end
                    else
                        ESP.Visible = false
                    end
                else
                    ESP.Visible = false
                end
            end)

            Players.PlayerRemoving:Connect(function()
                ESP.Visible = false
            end)
        end
    end

    Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(function(v)
            if v.Name ~= Players.LocalPlayer.Name then 
                local ESP = Drawing.new("Text")
    
                RunService.RenderStepped:Connect(function()
                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
    
                        ESP.Size = _G.TextSize
                        ESP.Center = _G.Center
                        ESP.Outline = _G.Outline
                        ESP.OutlineColor = _G.OutlineColor
                        ESP.Color = _G.TextColor
                        ESP.Transparency = _G.TextTransparency
    
                        if OnScreen == true then
                            local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                        local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                            local Dist = (Part1 - Part2).Magnitude
                            ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                            ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= Player.Team then
                                    ESP.Visible = _G.ESPVisible
                                else
                                    ESP.Visible = false
                                end
                            else
                                ESP.Visible = _G.ESPVisible
                            end
                        else
                            ESP.Visible = false
                        end
                    else
                        ESP.Visible = false
                    end
                end)
    
                Players.PlayerRemoving:Connect(function()
                    ESP.Visible = false
                end)
            end
        end)
    end)
end

if _G.DefaultSettings == true then
    _G.TeamCheck = false
    _G.ESPVisible = true
    _G.TextColor = Color3.fromRGB(40, 90, 255)
    _G.TextSize = 14
    _G.Center = true
    _G.Outline = false
    _G.OutlineColor = Color3.fromRGB(0, 0, 0)
    _G.DisableKey = Enum.KeyCode.Q
    _G.TextTransparency = 0.75
end

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == _G.DisableKey and Typing == false then
        _G.ESPVisible = not _G.ESPVisible
        
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "xyz";
                Text = "The ESP's visibility is now set to "..tostring(_G.ESPVisible)..".";
                Duration = 5;
            })
        end
    end
end)

local Success, Errored = pcall(function()
    CreateESP()
end)

if Success and not Errored then
    if _G.SendNotifications == true then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "xyz";
            Text = "ESP script has successfully loaded.";
            Duration = 5;
        })
    end
elseif Errored and not Success then
    if _G.SendNotifications == true then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "xyz";
            Text = "xyz";
            Duration = 5;
        })
    end
    TestService:Message("The ESP script has errored, please notify Exunys with the following information :")
    warn(Errored)
    print("xyz")
end

















-- Substitua esta linha na sua parte de criação de GUI:
tab1:CreateToggle("ESP Name", function(enabled)
    _G.ESPVisible = enabled
end)

----------------------------------------------------------------EXPLOIT--------------------
local tab2 = Main:CreateTab("EXPLOIT")
