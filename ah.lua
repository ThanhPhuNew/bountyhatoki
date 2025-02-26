local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Apsarashit/Scripts/main/MythicLib"))()
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicRBX/MythicLib/main/Addons/Fluent.lua"))()
local Window = redzlib:MakeWindow({
  Title = "Apsara Hub",
  SubTitle = "Blox Kid",
  SaveFolder = "Blox Fruits.lua"
})

local AFKOptions = {}

repeat wait() until game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local CommF = Remotes:WaitForChild("CommF_", 9e9)

local Enemies = workspace:WaitForChild("Enemies", 9e9)
local Boats = workspace:WaitForChild("Boats", 9e9)

local Player = Players.LocalPlayer
local PlayerLevel = Player.Data.Level 
local Quest = {CFrame.new(), CFrame.new(), "", "", 1}
local QuestTween = {}
local Sea1, Sea2, Sea3 = game.PlaceId == 2753915549, game.PlaceId == 4442272183, game.PlaceId == 7449423635

local function FireRemote(...)
  return CommF:InvokeServer(...)
end

local block = Instance.new("Part", workspace)
block.Size = Vector3.new(1, 1, 1)
block.Name = "player platform ............."
block.Anchored = true
block.CanCollide = false
block.CanTouch = false
block.Transparency = 1

local blockfind = workspace:FindFirstChild(block.Name)
if blockfind and blockfind ~= block then
  blockfind:Destroy()
end

task.spawn(function()
  while task.wait() do
    if block and block.Parent == workspace then
      if getgenv().AutoFarmNearest
      or getgenv().TeleportToIsland
      or getgenv().AutoFinishTrial
      or getgenv().AutoWoodPlanks
      or getgenv().AutoFarm_Level
      -- or getgenv().AutoGift
      -- or getgenv().AutoCandy
      or getgenv().AutoFarmSea
      or getgenv().AutoEliteHunter
      or getgenv().AutoPiratesSea
      or getgenv().AutoFarmBossSelected
      or getgenv().AutoRengoku
      or getgenv().TeleportToFruit
      or getgenv().AutoFactory
      or getgenv().AutoBartiloQuest
      or getgenv().AutoFarmRaid
      or getgenv().AutoRaceV2
      or getgenv().AutoCakePrince
      or getgenv().AutoDoughKing
      or getgenv().RipIndraLegendaryHaki
      or getgenv().AutoRipIndra
      or getgenv().AutoUnlockSaber
      or getgenv().AutoSawBoss
      or getgenv().AutoEnelBossPole
      or getgenv().AutoMusketeerHat
      or getgenv().AutoKenV2
      or getgenv().AutoFarmKen
      or getgenv().AutoFarmBone
      or getgenv().AutoCursedCaptain
      or getgenv().AutoFarmEctoplasm
      or getgenv().AutoKitsuneIsland
      or getgenv().AutoSoulReaper
      or getgenv().AutoSoulGuitar
      or getgenv().TeleportToMirage
      or getgenv().AutoSecondSea
      or getgenv().AutoThirdSea
      or getgenv().AutoDarkbeard
      or getgenv().AutoKillLawBoss
      or getgenv().AutoChestTween
      or getgenv().AutoRainbowHaki
      or getgenv().AutoFarmMaterial
      or getgenv().AutoSharkmanKarate
      or getgenv().AutoKillDonSwan
      or getgenv().AutoCursedDualKatana
      or getgenv().AutoDeathStep
      or getgenv().AutoDragonTalon
      or getgenv().AutoElectricClaw
      or getgenv().AutoSuperhuman
      or getgenv().AutoMasteryFightingStyle
      or getgenv().AutoGodHuman
      or getgenv().AutoTushita
      or getgenv().AutoFarmMastery
      or getgenv().NPCtween
      or getgenv().KillAllBosses
      or getgenv().TpKitsune
      or getgenv().TpMirage
      or getgenv().AutoBossBisento
      or getgenv().killplayertrain
      or getgenv().GetGear
      or getgenv().TpAdvanced
      or getgenv().AutoChestMirage
      or getgenv().AutoFrozenDimension
      or getgenv().KillLeavia
      or getgenv().AutoPlayerHunter
      or getgenv().ChooseGear
      or getgenv().BringFruit
      or getgenv().AutoMirageIsland
      or getgenv().Aren
      or getgenv().EvoV3
      or getgenv().AutoGhoulRace
      or getgenv().UpAutoObservation then
        getgenv().OnFarm = true
      else
        getgenv().OnFarm = false
      end
    else
      getgenv().OnFarm = false
    end
  end
end)

task.spawn(function()
  repeat task.wait()
  until Player.Character and Player.Character.PrimaryPart
  block.CFrame = Player.Character.PrimaryPart.CFrame
  
  while task.wait() do
    pcall(function()
      if getgenv().OnFarm then
        if block and block.Parent == workspace then
          local plrPP = Player.Character and Player.Character.PrimaryPart
          
          if plrPP and (plrPP.Position - block.Position).Magnitude <= 200 then
            plrPP.CFrame = block.CFrame
          else
            block.CFrame = plrPP.CFrame
          end
        end
        local plrChar = Player.Character
        if plrChar then
          for _,part in pairs(plrChar:GetChildren()) do
            if part:IsA("BasePart") then
              part.CanCollide = false
            end
          end
          if plrChar:FindFirstChild("Stun") and plrChar.Stun.Value ~= 0 then
            plrChar.Stun.Value = 0
          end
          if plrChar:FindFirstChild("Busy") and plrChar.Busy.Value then
            plrChar.Busy.Value = false
          end
        end
      else
        local plrChar = Player.Character
        if plrChar then
          for _,part in pairs(plrChar:GetChildren()) do
            if part:IsA("BasePart") then
              part.CanCollide = true
            end
          end
        end
      end
    end)
  end
end)

local function Get_Fruit(Fruit)
  if Fruit == "Rocket Fruit" then
    return "Rocket-Rocket"
  elseif Fruit == "Spin Fruit" then
    return "Spin-Spin"
  elseif Fruit == "Chop Fruit" then
    return "Chop-Chop"
  elseif Fruit == "Spring Fruit" then
    return "Spring-Spring"
  elseif Fruit == "Bomb Fruit" then
    return "Bomb-Bomb"
  elseif Fruit == "Smoke Fruit" then
    return "Smoke-Smoke"
  elseif Fruit == "Spike Fruit" then
    return "Spike-Spike"
  elseif Fruit == "Flame Fruit" then
    return "Flame-Flame"
  elseif Fruit == "Falcon Fruit" then
    return "Falcon-Falcon"
  elseif Fruit == "Ice Fruit" then
    return "Ice-Ice"
  elseif Fruit == "Sand Fruit" then
    return "Sand-Sand"
  elseif Fruit == "Dark Fruit" then
    return "Dark-Dark"
  elseif Fruit == "Ghost Fruit" then
    return "Ghost-Ghost"
  elseif Fruit == "Diamond Fruit" then
    return "Diamond-Diamond"
  elseif Fruit == "Light Fruit" then
    return "Light-Light"
  elseif Fruit == "Rubber Fruit" then
    return "Rubber-Rubber"
  elseif Fruit == "Barrier Fruit" then
    return "Barrier-Barrier"
  elseif Fruit == "Magma Fruit" then
    return "Magma-Magma"
  elseif Fruit == "Quake Fruit" then
    return "Quake-Quake"
  elseif Fruit == "Buddha Fruit" then
    return "Buddha-Buddha"
  elseif Fruit == "Love Fruit" then
    return "Love-Love"
  elseif Fruit == "Spider Fruit" then
    return "Spider-Spider"
  elseif Fruit == "Sound Fruit" then
    return "Sound-Sound"
  elseif Fruit == "Phoenix Fruit" then
    return "Phoenix-Phoenix"
  elseif Fruit == "Portal Fruit" then
    return "Portal-Portal"
  elseif Fruit == "Rumble Fruit" then
    return "Rumble-Rumble"
  elseif Fruit == "Pain Fruit" then
    return "Pain-Pain"
  elseif Fruit == "Blizzard Fruit" then
    return "Blizzard-Blizzard"
  elseif Fruit == "Gravity Fruit" then
    return "Gravity-Gravity"
  elseif Fruit == "Mammoth Fruit" then
    return "Mammoth-Mammoth"
  elseif Fruit == "T-Rex Fruit" then
    return "T-Rex-T-Rex"
  elseif Fruit == "Dough Fruit" then
    return "Dough-Dough"
  elseif Fruit == "Shadow Fruit" then
    return "Shadow-Shadow"
  elseif Fruit == "Venom Fruit" then
    return "Venom-Venom"
  elseif Fruit == "Control Fruit" then
    return "Control-Control"
  elseif Fruit == "Spirit Fruit" then
    return "Spirit-Spirit"
  elseif Fruit == "Dragon Fruit" then
    return "Dragon-Dragon"
  elseif Fruit == "Leopard Fruit" then
    return "Leopard-Leopard"
  elseif Fruit == "Kitsune Fruit" then
    return "Kitsune-Kitsune"
  end
end

local function GetBossQuest(BossName)
  -- Bosses Sea 1
  if BossName == "The Gorilla King" then
    return true, CFrame.new(-1128, 6, -451), "JungleQuest"
  elseif BossName == "Bobby" then
    return true, CFrame.new(-1131, 14, 4080), "BuggyQuest1"
  elseif BossName == "Yeti" then
    return true, CFrame.new(1185, 106, -1518), "SnowQuest"
  elseif BossName == "Vice Admiral" then
    return true, CFrame.new(-4807, 21, 4360), "MarineQuest2", 2
  elseif BossName == "Swan" then
    return true, CFrame.new(5230, 4, 749), "ImpelQuest"
  elseif BossName == "Chief Warden" then
    return true, CFrame.new(5230, 4, 749), "ImpelQuest", 2
  elseif BossName == "Warden" then
    return true, CFrame.new(5230, 4, 749), "ImpelQuest", 1
  elseif BossName == "Magma Admiral" then
    return true, CFrame.new(-5694, 18, 8735), "MagmaQuest"
  elseif BossName == "Fishman Lord" then
    return true, CFrame.new(61350, 31, 1095), "FishmanQuest"
  elseif BossName == "Wysper" then
    return true, CFrame.new(-7927, 5551, -637), "SkyExp1Quest"
  elseif BossName == "Thunder God" then
    return true, CFrame.new(-7751, 5607, -2315), "SkyExp2Quest"
  elseif BossName == "Cyborg" then
    return true, CFrame.new(6138, 10, 3939), "FountainQuest"
  elseif BossName == "Saber Expert" then
    return false, CFrame.new(-1461, 30, -51)
  elseif BossName == "The Saw" then
    return false, CFrame.new(-690, 15, 1583)
  elseif BossName == "Greybeard" then
    return false, CFrame.new(-4807, 21, 4360)
  -- Bosses Sea 2
  elseif BossName == "Diamond" then
    return true, CFrame.new(-1569, 199, -31), "Area1Quest"
  elseif BossName == "Jeremy" then
    return true, CFrame.new(2316, 449, 787), "Area2Quest"
  elseif BossName == "Fajita" then
    return true, CFrame.new(-2086, 73, -4208), "MarineQuest3"
  elseif BossName == "Smoke Admiral" then
    return true, CFrame.new(-5078, 24, -5352), "IceSideQuest"
  elseif BossName == "Awakened Ice Admiral" then
    return true, CFrame.new(6473, 297, -6944), "FrostQuest"
  elseif BossName == "Tide Keeper" then
    return true, CFrame.new(-3711, 77, -11469), "ForgottenQuest"
  elseif BossName == "Don Swan" then
    return false, CFrame.new(2289, 15, 808)
  elseif BossName == "Cursed Captain" then
    return false, CFrame.new(912, 186, 33591)
  elseif BossName == "Darkbeard" then
    return false, CFrame.new(3695, 13, -3599)
  -- Bosses Sea 3
  elseif BossName == "Longma" then
    return false, CFrame.new(-10218, 333, -9444)
  elseif BossName == "Stone" then
    return true, CFrame.new(-1049, 40, 6791), "PiratePortQuest"
  elseif BossName == "Beautiful Pirate" then
    return true, CFrame.new(5241, 23, 129), "DeepForestIsland2"
  elseif BossName == "Island Empress" then
    return true, CFrame.new(5730, 602, 199), "AmazonQuest2"
  elseif BossName == "Kilo Admiral" then
    return true, CFrame.new(2889, 424, -7233), "MarineTreeIsland"
  elseif BossName == "Captain Elephant" then
    return true, CFrame.new(-13393, 319, -8423), "DeepForestIsland"
  elseif BossName == "Cake Queen" then
    return true, CFrame.new(-710, 382, -11150), "IceCreamIslandQuest"
  elseif BossName == "Dough King" or BossName == "Cake Prince" then
    return false, CFrame.new(-2103, 70, -12165)
  elseif BossName == "rip_indra True Form" then
    return false, CFrame.new(-5333, 424, -2673)
  end
end

local BossListT = {
  -- Sea 1 --
  -- Raid Boss
  "Greybeard",
  "The Saw",
  "Saber Expert",
  
  -- Normal Boss
  "The Gorilla King",
  "Bobby",
  "Yeti",
  "Vice Admiral",
  "Warden",
  "Chief Warden",
  "Swan",
  "Magma Admiral",
  "Fishman Lord",
  "Wysper",
  "Thunder God",
  "Cyborg",
  
  -- Sea 2 --
  -- Raid Boss
  "Darkbeard",
  "Cursed Captain",
  "Order",
  "Don Swan",
  
  -- Normal Blss
  "Diamond",
  "Jeremy",
  "Fajita",
  "Smoke Admiral",
  "Awakened Ice Admiral",
  "Tide Keeper",
  
  -- Sea 3 --
  -- Raid Boss
  "Dough King",
  "Cake Prince",
  "rip_indra True Form",
  "Soul Reaper",
  
  -- Normal Boss
  "Stone",
  "Island Empress",
  "Kilo Admiral",
  "Captain Elephant",
  "Beautiful Pirate",
  "Cake Queen",
  "Longma"
}

task.spawn(function()
  local PortalPos = {}
  
  if Sea1 then
    PortalPos = {
      Vector3.new(-4652, 873, -1754), -- Sky Island 1
      Vector3.new(-7895, 5547, -380), -- Sky Island 2
      Vector3.new(61164, 5, 1820), -- Under Water Island
      Vector3.new(3865, 5, -1926) -- Under Water Island Entrace
    }
  elseif Sea2 then
    PortalPos = {
      Vector3.new(-317, 331, 597), -- Flamingo Mansion
      Vector3.new(2283, 15, 867), -- Flamingo Room
      Vector3.new(923, 125, 32853), -- Cursed Ship
      Vector3.new(-6509, 83, -133) -- Zombie Island0
    }
  elseif Sea3 then
    PortalPos = {
      Vector3.new(-12471, 374, -7551), -- Mansion
      Vector3.new(5756, 610, -282), -- Hydra Island
      Vector3.new(-5092, 315, -3130), -- Castle on the Sea
      Vector3.new(-12001, 332, -8861), -- Floating Turtle
      Vector3.new(5319, 23, -93), -- Beautiful Pirate
      Vector3.new(28286, 14897, 103) -- Temple of Time
    }
  end
  
  function GetTPPos(position)
    local NearPos = math.huge
    local TpPos = Vector3.new()
    
    table.foreach(PortalPos, function(___, pos)
      if (pos - position).Magnitude <= NearPos then
        NearPos = (pos - position).Magnitude
        TpPos = pos
      end
    end)
    return TpPos
  end
end)

local TeleportPos
local function PlayerTP(Tween_Pos)
  TeleportPos = Tween_Pos.p
  local plrPP = Player.Character and Player.Character.PrimaryPart
  if not plrPP then return end
  local Distance = (plrPP.Position - Tween_Pos.p).Magnitude
  local PortalPos = GetTPPos(Tween_Pos.p)
  if (plrPP.Position - Tween_Pos.p).Magnitude > (Tween_Pos.p - PortalPos).Magnitude + 250 then
    plrPP.CFrame = CFrame.new(PortalPos)
    block.CFrame = CFrame.new(PortalPos)
  elseif block then
    if Distance <= 450 then
      local tween = game:GetService("TweenService"):Create(block,
      TweenInfo.new(Distance / tonumber(getgenv().TweenSpeed * 1.8), Enum.EasingStyle.Linear),
      {CFrame = Tween_Pos}):Play()
    else
      local tween = game:GetService("TweenService"):Create(block,
      TweenInfo.new(Distance / getgenv().TweenSpeed, Enum.EasingStyle.Linear),
      {CFrame = Tween_Pos}):Play()
    end
  end
end

local function BoatTP(Boat, pos)
  if Boat then
    local Distance = (Boat.PrimaryPart.Position - pos.p).Magnitude
    game:GetService("TweenService"):Create(Boat.PrimaryPart,
    TweenInfo.new(Distance / getgenv().SeaBoatSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
    {CFrame = pos}):Play()
  end
end

local function KillAura()
  local function Kill(_,Enemie)
    local EnemieH = Enemie:FindFirstChild("Humanoid")
    
    if EnemieH and EnemieH.Health > 0 then
      local PlayerPP = Player.Character and Player.Character.PrimaryPart
      local EnemiePP = Enemie.PrimaryPart
      
      if PlayerPP and EnemiePP and (EnemiePP.Position - PlayerPP.Position).Magnitude < 1500 then
        EnemieH.Health = 0
        EnemiePP.Size = Vector3.new(75, 75, 75)
        EnemiePP.CanCollide = false
        sethiddenproperty(Player, "SimulationRadius", math.huge)
      end
    else
      local EnemieHead = Enemie:FindFirstChild("Head")
      
      if EnemieHead then
        EnemieHead:Destroy()
      end
    end
  end
  
  table.foreach(Enemies:GetChildren(), Kill)
  table.foreach(ReplicatedStorage:GetChildren(), Kill)
end

local function AutoKillAura()
  while getgenv().AutoKillAura do task.wait()
    KillAura()
  end
end

local function VerifyTableNPCs(npcs)
  if typeof(npcs) == "table" then
    for _,npc in pairs(Enemies:GetChildren()) do
      if table.find(npcs, npc.Name) then
        return true
      end
    end
  end
end

local function TweenNPCSpawn(pos, NPC)
  if pos then
    repeat task.wait()
      for _,v in pairs(pos) do
        if VerifyTableNPCs(NPC) or Enemies:FindFirstChild(NPC or Quest[3]) then
          break
        end
        if block then
          local tween = game:GetService("TweenService"):Create(block,
          TweenInfo.new((block.Position - v.p).Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Linear),
          {CFrame = v})tween:Play()tween.Completed:Wait()
        end
      end
    until not getgenv().AutoFarm_Level or Enemies:FindFirstChild(NPC or Quest[3])
    -- or getgenv().TimeToGift < 90
    return
  end
end

local function AddESP(Part, ESPColor)
  if Part and Part:FindFirstChild("ESP_REDzHUB") then
    return
  end
  
  local Folder = Instance.new("Folder", Part)
  Folder.Name = "ESP_REDzHUB"
  
  local BHA = Instance.new("BoxHandleAdornment", Folder)
  BHA.Size = Vector3.new(1, 0, 1, 0)
  BHA.Name = "ESP_REDzHUB"
  BHA.AlwaysOnTop = true
  BHA.ZIndex = 10
  BHA.Transparency = 0
  
  local BBG = Instance.new("BillboardGui", BHA)
  BBG.Adornee = Part
  BBG.Size = UDim2.new(0, 100, 0, 150)
  BBG.StudsOffset = Vector3.new(0, 1, 0)
  BBG.AlwaysOnTop = true
  
  local TL = Instance.new("TextLabel", BBG)
  TL.BackgroundTransparency = 1
  TL.Position = UDim2.new(0, 0, 0, -50)
  TL.Size = UDim2.new(0, 100, 0, 100)
  TL.TextSize = 10
  TL.TextColor3 = Color3.new(1, 1, 1)
  TL.TextStrokeTransparency = 0
  TL.TextYAlignment = Enum.TextYAlignment.Bottom
  TL.Text = "..."
  TL.ZIndex = 15
  TL.TextColor3 = ESPColor or Color3.fromRGB(255, 255, 0)
  
  task.spawn(function()
    while task.wait() do
      pcall(function()
        local plrRP = Player.Character:FindFirstChild("HumanoidRootPart")
        if plrRP and Part and Part.Name == "HumanoidRootPart" and Part.Parent:FindFirstChild("Humanoid") then
          local distance = math.floor((plrRP.Position - Part.Position).Magnitude / 3)
          local Health = math.floor(Part.Parent.Humanoid.Health)
          TL.Text = "Name : " .. Part.Parent.Name .. " | HP : " .. tostring(Health).. " | MAG : " .. tostring(distance)
        elseif plrRP and Part and Part.Name == "Handle" then
          local distance = math.floor((plrRP.Position - Part.Position).Magnitude / 3)
          TL.Text = Part.Parent.Name .. " <" .. tostring(distance) .. ">"
        elseif plrRP and Part then
          local distance = math.floor((plrRP.Position - Part.Position).Magnitude / 3)
          TL.Text = Part.Name .. " <" .. tostring(distance) .. ">"
        end
      end)
    end
  end)
end

local function RemoveESP(Part)
  if Part and Part:FindFirstChild("ESP_REDzHUB") then
    Part.ESP_REDzHUB:Destroy()
  end
end

local function EspPlayer()
  while getgenv().EspPlayer do task.wait()
    for _,player in pairs(game:GetService("Players"):GetPlayers()) do
      if player.Name ~= Player.Name and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        AddESP(player.Character.HumanoidRootPart, Color3.fromRGB(0, 255, 0))
      end
    end
  end
  for _,player in pairs(game:GetService("Players"):GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
      RemoveESP(player.Character.HumanoidRootPart)
    end
  end
end

local function EspFlowers()
  while getgenv().EspFlowers do task.wait()
    for _,Flower in pairs(workspace:GetChildren()) do
      if Flower and Flower:IsA("BasePart") then
        if Flower.Name == "Flower1" then
          AddESP(Flower, Flower.Color)
        end
      end
    end
  end
  for _,Flower in pairs(workspace:GetChildren()) do
    if Flower and Flower:IsA("BasePart") then
      if Flower.Name == "Flower1" or Flower.Name == "Flower2" then
        RemoveESP(Flower)
      end
    end
  end
end

local function EspFruits()
  while getgenv().EspFruits do task.wait()
    for _,Fruit in pairs(workspace:GetChildren()) do
      if Fruit and Fruit:IsA("Tool") and Fruit:FindFirstChild("Handle") or
      Fruit and string.find(Fruit.Name, "Fruit") and Fruit:FindFirstChild("Handle") then
        AddESP(Fruit.Handle, Color3.fromRGB(255, 0, 0))
      end
    end
  end
  for _,Fruit in pairs(workspace:GetChildren()) do
    if Fruit and Fruit:FindFirstChild("Handle") then
      RemoveESP(Fruit.Handle)
    end
  end
end

local function EspIslands()
  while getgenv().EspIslands do task.wait()
    local Locations = workspace:WaitForChild("_WorldOrigin", 9e9):WaitForChild("Locations", 9e9)
    for _,Island in pairs(Locations:GetChildren()) do
      if Island then
        AddESP(Island, Color3.fromRGB(0, 255, 255))
      end
    end
  end
  local Locations = workspace:WaitForChild("_WorldOrigin", 9e9):WaitForChild("Locations", 9e9)
  for _,Island in pairs(Locations:GetChildren()) do
    if Island then
      RemoveESP(Island)
    end
  end
end

local function EspChests()
  while getgenv().EspChests do task.wait()
    for _,Chest in pairs(workspace:GetChildren()) do
      if Chest then
        if Chest.Name == "Chest3" then
          AddESP(Chest, Color3.fromRGB(0, 255, 255))
        elseif Chest.Name == "Chest2" then
          AddESP(Chest, Color3.fromRGB(255, 255, 0))
        elseif Chest.Name == "Chest1" then
          AddESP(Chest, Color3.fromRGB(150, 150, 150))
        end
      end
    end
  end
  for _,Chest in pairs(workspace:GetChildren()) do
    if Chest then
      if Chest.Name == "Chest3" or Chest.Name == "Chest2" or Chest.Name == "Chest1" then
        RemoveESP(Chest)
      end
    end
  end
end

local CameraShaker = require(ReplicatedStorage.Util.CameraShaker)
CameraShaker:Stop()

function GetBladeHit()
  local CombatFrameworkLib = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))
  local CmrFwLib = CombatFrameworkLib[2]
  local p13 = CmrFwLib.activeController
  local weapon = p13.blades[1]
  
  if not weapon then 
    return weapon
  end
  while weapon.Parent ~= Player.Character do task.wait()
    weapon = weapon.Parent
  end
  return weapon
end

function AttackHit()
  local CombatFrameworkLib = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))
  local CmrFwLib = CombatFrameworkLib[2]
  for i = 1, 1 do
    local bladehit = require(ReplicatedStorage.CombatFramework.RigLib).getBladeHits(Player.Character, {
      Player.Character.HumanoidRootPart
    }, 60)
    local cac = {}
    local hash = {}
    for _,v in pairs(bladehit) do
      if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
        table.insert(cac, v.Parent.HumanoidRootPart)
        hash[v.Parent] = true
      end
    end
    bladehit = cac
    if #bladehit > 0 then
      pcall(function()
        ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", tostring(GetBladeHit()))
        ReplicatedStorage.RigControllerEvent:FireServer("hit", bladehit, i, "")
      end)
    end
  end
end

local function AttackDistance()
  while getgenv().AttackDistance do task.wait()
    pcall(function()
      local CF = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2]
      local AC = CF.activeController
      if AC.hitboxMagnitude ~= 60 then AC.hitboxMagnitude = 60 end
    end)
  end
end

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

function CameraShaker()
task.spawn(function()
  local Camera = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
  while wait() do
  pcall(function()
    if _G.Settings.Configs["Camera Shaker"] then
    Camera.CameraShakeInstance.CameraShakeState.Inactive = 0
    else
      Camera.CameraShakeInstance.CameraShakeState.Inactive = 3
    end
    end)
  end
  end)
end

--[Function RmFzdCBBdHRhY2s=]

function CurrentWeapon()
local ac = CombatFrameworkR.activeController
local ret = ac.blades[1]
if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
pcall(function()
  while ret.Parent ~= game.Players.LocalPlayer.Character do ret = ret.Parent end
  end)
if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
return ret
end

function getAllBladeHitsPlayers(Sizes)
local Hits = {}
local Client = game.Players.LocalPlayer
local Characters = game:GetService("Workspace").Characters:GetChildren()
for i = 1,#Characters do local v = Characters[i]
local Human = v:FindFirstChildOfClass("Humanoid")
if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
table.insert(Hits,Human.RootPart)
end
end
return Hits
end

function getAllBladeHits(Sizes)
local Hits = {}
local Client = game.Players.LocalPlayer
local Enemies = game:GetService("Workspace").Enemies:GetChildren()
for i = 1,#Enemies do local v = Enemies[i]
local Human = v:FindFirstChildOfClass("Humanoid")
if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
table.insert(Hits,Human.RootPart)
end
end
return Hits
end

function AttackFunction()
local ac = CombatFrameworkR.activeController
if ac and ac.equipped then
for indexincrement = 1, 1 do
local bladehit = getAllBladeHits(60)
if #bladehit > 0 then
local AcAttack8 = debug.getupvalue(ac.attack, 5)
local AcAttack9 = debug.getupvalue(ac.attack, 6)
local AcAttack7 = debug.getupvalue(ac.attack, 4)
local AcAttack10 = debug.getupvalue(ac.attack, 7)
local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
local NumberAc13 = AcAttack7 * 798405
(function()
  NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
  AcAttack8 = math.floor(NumberAc12 / AcAttack9)
  AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
  end)()
AcAttack10 = AcAttack10 + 1
debug.setupvalue(ac.attack, 5, AcAttack8)
debug.setupvalue(ac.attack, 6, AcAttack9)
debug.setupvalue(ac.attack, 4, AcAttack7)
debug.setupvalue(ac.attack, 7, AcAttack10)
for k, v in pairs(ac.animator.anims.basic) do
v:Play(0.01,0.01,0.01)
end
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
end
end
end
end
end

function AttackPlayers()
local ac = CombatFrameworkR.activeController
if ac and ac.equipped then
for indexincrement = 1, 1 do
local bladehit = getAllBladeHitsPlayers(60)
if #bladehit > 0 then
local AcAttack8 = debug.getupvalue(ac.attack, 5)
local AcAttack9 = debug.getupvalue(ac.attack, 6)
local AcAttack7 = debug.getupvalue(ac.attack, 4)
local AcAttack10 = debug.getupvalue(ac.attack, 7)
local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
local NumberAc13 = AcAttack7 * 798405
(function()
  NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
  AcAttack8 = math.floor(NumberAc12 / AcAttack9)
  AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
  end)()
AcAttack10 = AcAttack10 + 1
debug.setupvalue(ac.attack, 5, AcAttack8)
debug.setupvalue(ac.attack, 6, AcAttack9)
debug.setupvalue(ac.attack, 4, AcAttack7)
debug.setupvalue(ac.attack, 7, AcAttack10)
for k, v in pairs(ac.animator.anims.basic) do
v:Play(0.01,0.01,0.01)
end
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
end
end
end
end
end

coroutine.wrap(function()
  while task.wait(.1) do
  local ac = CombatFrameworkR.activeController
  if ac and ac.equipped then
  if getgenv().FastAttack then
  AttackFunction()
  AttackPlayers()
  if getgenv().FastAttackMethod == "Normal" then
  if tick() - cooldownfastattack > .9 then wait(.1) cooldownfastattack = tick() end
  elseif getgenv().FastAttackMethod == "Fast" then
  if tick() - cooldownfastattack > 1.5 then wait(.01) cooldownfastattack = tick() end
  elseif getgenv().FastAttackMethod == "Slow" then
  if tick() - cooldownfastattack > .3 then wait(.7) cooldownfastattack = tick() end
  end
  elseif getgenv().FastAttack == false then
  if ac.hitboxMagnitude ~= 55 then
  ac.hitboxMagnitude = 55
  end
  ac:attack()
  end
  end
  end
  end)()

local time = tick()
local function PlayerClick()
  local plrPP = Player.Character and Player.Character.PrimaryPart
  if plrPP and TeleportPos and (plrPP.Position - TeleportPos).Magnitude > 25 then return end
  if getgenv().AutoClick and (tick() - time) >= getgenv().AutoClickDelay then
    task.spawn(function()
      VirtualUser:CaptureController()
      VirtualUser:Button1Down(Vector2.new(math.huge, math.huge))
    end)
    time = tick()
  end
end

local function ServerHop()
  local Http = game:GetService("HttpService")
  local TPS = game:GetService("TeleportService")
  local Api = "https://games.roblox.com/v1/games/"
  local _place = game.PlaceId
  local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
  
  function ListServers(cursor)
    local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
    return Http:JSONDecode(Raw)
  end
  local Server, Next
  repeat task.wait()
    local Servers = ListServers(Next)
    Server = Servers.data[1] Next = Servers.nextPageCursor
  until Server TPS:TeleportToPlaceInstance(_place, Server.id, Player)
end

local function VerifyNPC(EnemieName)
  local Stats
  local function Verify(_,Enemie)
    if Enemie.Name == EnemieName then
      local EnemieH = Enemie:FindFirstChild("Humanoid")
      
      if EnemieH and EnemieH.Health > 0 then
        Stats = true
      end
    end
  end
  
  table.foreach(Enemies:GetChildren(), Verify)
  table.foreach(ReplicatedStorage:GetChildren(), Verify)
  return Stats
end

local function ActiveHaki()
  local VerifyHaki = Player.Character and Player.Character:FindFirstChild("HasBuso")
  if getgenv().AutoHaki and not VerifyHaki then
    FireRemote("Buso")
  end
end

local function VerifyTool(ToolName)
  local plrChar = Player and Player.Character
  local plrBag = Player and Player.Backpack
  
  if plrChar then
    return plrChar:FindFirstChild(ToolName) or plrBag:FindFirstChild(ToolName)
  end
end

local function VerifyToolTip(tooltip)
  local plrChar = Player and Player.Character
  local plrBag = Player and Player.Backpack
  
  for _,tool in pairs(plrBag:GetChildren()) do
    if tool and tool:IsA("Tool") and tool.ToolTip == tooltip then
      return tool
    end
  end
  if plrChar then
    for _,tool in pairs(plrChar:GetChildren()) do
      if tool and tool:IsA("Tool") and tool.ToolTip == tooltip then
        return tool
      end
    end
  end
end

local function GetToolLevel(ToolName)
  local Tool = VerifyTool(ToolName)
  
  if Tool and Tool:FindFirstChild("Level") then
    return Tool.Level.Value
  end
end

local function EquipToolName(NameTool)
  local plrBag = Player.Backpack
  local plrChar = Player.Character
  local plrH = plrChar and plrChar:FindFirstChild("Humanoid")
  if plrBag and plrH and plrBag:FindFirstChild(NameTool) then
    plrH:EquipTool(plrBag[NameTool])
  end
end

local function GetEnemies(EnemiesList)
  local Distance, Nearest = math.huge
  local function Verify(_,Enemie)
    if table.find(EnemiesList, Enemie.Name) then
      local EnemieH = Enemie:FindFirstChild("Humanoid")
      
      if EnemieH and EnemieH.Health > 0 then
        local EnemiePP = Enemie.PrimaryPart
        local PlayerPP = Player.Character and Player.Character.PrimaryPart
        
        if EnemiePP and PlayerPP and (PlayerPP.Position - EnemiePP.Position).Magnitude <= Distance then
          Distance = (PlayerPP.Position - EnemiePP.Position).Magnitude
          Nearest = Enemie
        end
      end
    end
  end
  table.foreach(Enemies:GetChildren(), Verify)
  table.foreach(ReplicatedStorage:GetChildren(), Verify)
  return Nearest
end

local AimBotPart
task.spawn(function()
  AimBotPart = function(part, tool)
    local plrChar = Player and Player.Character
    local plrTool = plrChar and plrChar:FindFirstChildOfClass("Tool")
    
    if tool and tool:FindFirstChild("RemoteEvent") and part then
      getgenv().AimbotPos = part.Position
      tool.RemoteEvent:FireServer(part.Position)
    elseif plrTool and plrTool:FindFirstChild("RemoteEvent") and part then
      getgenv().AimbotPos = part.Position
      plrTool.RemoteEvent:FireServer(part.Position)
    end
  end
  
  local oldhook
  oldhook = hookmetamethod(game, "__namecall", function(self, Vector, ...)
    if self.Name == "RemoteEvent" and getnamecallmethod():lower() == "fireserver" then
      if typeof(Vector) == "Vector3" then
        if getgenv().AimbotPos then
          if getgenv().AutoFarmSea or getgenv().AutoWoodPlanks then
            if getgenv().SeaAimBotSkill then
              return oldhook(self, getgenv().AimbotPos, ...)
            end
          elseif getgenv().AutoFarmMastery then
            if getgenv().AimBotSkill then
              return oldhook(self, getgenv().AimbotPos, ...)
            end
          end
        end
      end
    end
    return oldhook(self, Vector, ...)
  end)
end)

local function KeyboardPress(key)
  local VIM = game:GetService("VirtualInputManager")
  VIM:SendKeyEvent(true, key, false, game)
  VIM:SendKeyEvent(false, key, false, game)
end

local function EquipToolTip(tooltip)
  local backpack = Player.Backpack
  for _,tool in pairs(backpack:GetChildren()) do
    if tool and tool.ToolTip == tooltip then
      EquipToolName(tool.Name)return
    end
  end
end

local function EquipTool()
  local backpack = Player.Backpack
  for _,tool in pairs(backpack:GetChildren()) do
    if tool and tool.ToolTip == getgenv().FarmTool then
      EquipToolName(tool.Name)return
    end
  end
end

local function FruitFind()
  local fruits = workspace:GetChildren()
  local FruitDistance = math.huge
  local Fruit = nil
  
  for __,fruit in pairs(fruits) do
    local args1 = Player and Player.Character and Player.Character.PrimaryPart
    local args2 = fruit and fruit:IsA("Tool") and fruit:FindFirstChild("Handle")
    local args3 = fruit and string.find(fruit.Name, "Fruit") and fruit:FindFirstChild("Handle")
    
    if args1 and args2 and (args1.Position - args2.Position).Magnitude <= FruitDistance then
      FruitDistance = (args1.Position - args2.Position).Magnitude
      Fruit = fruit
    elseif args1 and args3 and (args1.Position - args3.Position).Magnitude <= FruitDistance then
      FruitDistance = (args1.Position - args3.Position).Magnitude
      Fruit = fruit
    end
  end
  return Fruit and Fruit:FindFirstChild("Handle")
end

local function BuyFightStyle(Style)
  FireRemote(Style, true)
  FireRemote(Style)
end

local function AutoChestBypass()
  local ActiveTick = tick()
  while getgenv().AutoChestBypass do task.wait()
    local plrRP = Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    local Chest3 = workspace:FindFirstChild("Chest3")
    local Chest2 = workspace:FindFirstChild("Chest2")
    local Chest1 = workspace:FindFirstChild("Chest1")
    
    if not VerifyTool("God's Chalice") and not VerifyTool("Fist of Darkness") then
      if plrRP and Chest3 and Chest3.Transparency < 1 then
        plrRP.CFrame = Chest3.CFrame
      elseif plrRP and Chest2 and Chest2.Transparency < 1 then
        plrRP.CFrame = Chest2.CFrame
      elseif plrRP and Chest1 and Chest1.Transparency < 1 then
        plrRP.CFrame = Chest1.CFrame
      end
    end
    for _,ChestVerify2 in pairs(workspace:GetChildren()) do
        if not ChestVerify2.Name == "Chest3" and ChestVerify2.Name == "Chest2" and ChestVerify2.Name == "Chest1" then
        ServerHop()
        end
        end
    if not VerifyTool("God's Chalice") and not VerifyTool("Fist of Darkness") and tick() - ActiveTick > 10 then
      local plrH = Player and Player.Character and Player.Character:FindFirstChild("Humanoid")
      if plrH then
      plrH.Health = 0
        ActiveTick = tick()
      end
    end
  end
end

local function AutoChestTween2()
    local ChestDistance = math.huge
    local Chest = nil
    local plrChar = Player and Player.Character and Player.Character.PrimaryPart
    
    for _,ChestVerify in pairs(workspace:GetChildren()) do
      if ChestVerify:IsA("BasePart") and ChestVerify.Transparency < 1 then
        if ChestVerify.Name == "Chest3" or ChestVerify.Name == "Chest2" or ChestVerify.Name == "Chest1" then
          if plrChar and (plrChar.Position - ChestVerify.Position).Magnitude <= ChestDistance then
            ChestDistance = (plrChar.Position - ChestVerify.Position).Magnitude
            Chest = ChestVerify
          end
        end
      end
    end
    for _,ChestVerify2 in pairs(workspace:GetChildren()) do
        if not ChestVerify2.Name == "Chest3" and ChestVerify2.Name == "Chest2" and ChestVerify2.Name == "Chest1" then
        ServerHop()
        end
        end
    if Chest then
      PlayerTP(Chest.CFrame)
    end
  end

local function AutoChestTween()
  while getgenv().AutoChestTween do task.wait()
    local ChestDistance = math.huge
    local Chest = nil
    local plrChar = Player and Player.Character and Player.Character.PrimaryPart
    
    for _,ChestVerify in pairs(workspace:GetChildren()) do
      if ChestVerify:IsA("BasePart") and ChestVerify.Transparency < 1 then
        if ChestVerify.Name == "Chest3" or ChestVerify.Name == "Chest2" or ChestVerify.Name == "Chest1" then
          if plrChar and (plrChar.Position - ChestVerify.Position).Magnitude <= ChestDistance then
            ChestDistance = (plrChar.Position - ChestVerify.Position).Magnitude
            Chest = ChestVerify
          end
        end
      end
    end
    for _,ChestVerify2 in pairs(workspace:GetChildren()) do
        if not ChestVerify2.Name == "Chest3" and ChestVerify2.Name == "Chest2" and ChestVerify2.Name == "Chest1" then
        ServerHop()
        end
        end
    if Chest then
      PlayerTP(Chest.CFrame)
    end
  end
end

local function StartQuest1(quest, number)
  FireRemote("StartQuest", quest, number)
end

local function StartQuest(quest, number, QuestPos)
  local plrRP = Player.Character:FindFirstChild("HumanoidRootPart")
  if plrRP and (plrRP.Position - QuestPos.p).Magnitude <= 3 then
    FireRemote("StartQuest", quest, number)
    task.wait(0.5)
  else
    PlayerTP(QuestPos)
  end
end

local function Get_LevelQuest()
  local Level = PlayerLevel.Value
  
  if Sea1 then
    -- Auto Farm Level Sea 1
    if Level < 10 then
      if tostring(Player.Team) == "Pirates" then
        Quest = {CFrame.new(1059, 17, 1546), false, "Bandit", "BanditQuest1", 1}
        QuestTween = {CFrame.new(943, 45, 1562), CFrame.new(1115, 45, 1619), CFrame.new(1265, 45, 1606)}
      else
        Quest = {CFrame.new(-2708, 25, 2103), false, "Trainee", "MarineQuest", 1}
        QuestTween = {CFrame.new(-2754, 50, 2063), CFrame.new(-2950, 70, 2240)}
      end
    elseif Level >= 10 and Level < 15 then
      Quest = {CFrame.new(-1598, 37, 153), false, "Monkey", "JungleQuest", 1}
      QuestTween = {CFrame.new(-1524, 50, 37), CFrame.new(-1424, 50, 216), CFrame.new(-1554, 50, 359), CFrame.new(-1772, 50, 78), CFrame.new(-1715, 50, -61), CFrame.new(-1594, 50, -45)}
    elseif Level >= 15 and Level < 30 then
      if VerifyNPC("The Gorilla King") and Level >= 20 then
        Quest = {CFrame.new(-1598, 37, 153), CFrame.new(-1128, 6, -451), "The Gorilla King", "JungleQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-1598, 37, 153), false, "Gorilla", "JungleQuest", 2}
        QuestTween = {CFrame.new(-1128, 40, -451), CFrame.new(-1313, 40, -546)}
      end
    elseif Level >= 30 and Level < 40 then
      Quest = {CFrame.new(-1140, 4, 3829), false, "Pirate", "BuggyQuest1", 1}
      QuestTween = {CFrame.new(-1262, 40, 3905), CFrame.new(-1167, 40, 3942)}
    elseif Level >= 40 and Level < 60 then
      if VerifyNPC("Bobby") and Level >= 55 then
        Quest = {CFrame.new(-1140, 4, 3829), CFrame.new(-1131, 14, 4080), "Bobby", "BuggyQuest1", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-1140, 4, 3829), false, "Brute", "BuggyQuest1", 2}
        QuestTween = {CFrame.new(-976, 55, 4304), CFrame.new(-1196, 55, 4287), CFrame.new(-1363, 55, 4162)}
      end
    elseif Level >= 60 and Level < 75 then
      Quest = {CFrame.new(897, 6, 4389), CFrame.new(938, 6, 4470), "Desert Bandit", "DesertQuest", 1}
      QuestTween = nil
    elseif Level >= 75 and Level < 90 then
      Quest = {CFrame.new(897, 6, 4389), CFrame.new(1546, 14, 4384), "Desert Officer", "DesertQuest", 2}
      QuestTween = nil
    elseif Level >= 90 and Level < 100 then
      Quest = {CFrame.new(1385, 87, -1298), CFrame.new(1303, 106, -1441), "Snow Bandit", "SnowQuest", 1}
      QuestTween = {CFrame.new(1362, 120, -1531), CFrame.new(1357, 120, -1381), CFrame.new(1228, 120, -1354)}
    elseif Level >= 100 and Level < 120 then
      if VerifyNPC("Yeti") and Level >= 105 then
        Quest = {CFrame.new(1385, 87, -1298), CFrame.new(1185, 106, -1518), "Yeti", "SnowQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(1385, 87, -1298), CFrame.new(1185, 106, -1518), "Snowman", "SnowQuest", 2}
        QuestTween = {CFrame.new(1243, 140, -1437), CFrame.new(1072, 140, -1458), CFrame.new(1076, 140, -1621), CFrame.new(1209, 140, -1644), CFrame.new(1252, 140, -1480)}
      end
    elseif Level >= 120 and Level < 150 then
      if VerifyNPC("Vice Admiral") and Level >= 130 then
        Quest = {CFrame.new(-5035, 29, 4326), CFrame.new(-4807, 21, 4360), "Vice Admiral", "MarineQuest2", 2}
        QuestTween = nil
      else
        Quest = {CFrame.new(-5035, 29, 4326), CFrame.new(-4807, 21, 4360), "Chief Petty Officer", "MarineQuest2", 1}
        QuestTween = nil
      end
    elseif Level >= 150 and Level < 175 then
      Quest = {CFrame.new(-4844, 718, -2621), CFrame.new(-4956, 296, -2901), "Sky Bandit", "SkyQuest", 1}
      QuestTween = nil
    elseif Level >= 175 and Level < 190 then
      Quest = {CFrame.new(-4844, 718, -2621), CFrame.new(-5268, 392, -2213), "Dark Master", "SkyQuest", 2}
      QuestTween = nil
    elseif Level >= 190 and Level < 210 then
      Quest = {CFrame.new(5306, 2, 477), CFrame.new(5288, 2, 470), "Prisoner", "PrisonerQuest", 1}
      QuestTween = nil
    elseif Level >= 210 and Level < 250 then
      if VerifyNPC("Swan") and Level >= 240 then
        Quest = {CFrame.new(5191, 4, 692), CFrame.new(5230, 4, 749), "Swan", "ImpelQuest", 3}
        QuestTween = nil
      elseif VerifyNPC("Chief Warden") and Level >= 230 then
        Quest = {CFrame.new(5191, 4, 692), CFrame.new(5230, 4, 749), "Chief Warden", "ImpelQuest", 2}
        QuestTween = nil
      elseif VerifyNPC("Warden") and Level >= 220 then
        Quest = {CFrame.new(5191, 4, 692), CFrame.new(5230, 4, 749), "Warden", "ImpelQuest", 1}
        QuestTween = nil
      else
        Quest = {CFrame.new(5306, 2, 477), CFrame.new(5282, 2, 1052), "Dangerous Prisoner", "PrisonerQuest", 2}
        QuestTween = nil
      end
    elseif Level >= 250 and Level < 275 then
      Quest = {CFrame.new(-1581, 7, -2982), CFrame.new(-1897, 7, -2796), "Toga Warrior", "ColosseumQuest", 1}
      QuestTween = nil
    elseif Level >= 275 and Level < 300 then
      Quest = {CFrame.new(-1581, 7, -2982), CFrame.new(-1327, 59, -3231), "Gladiator", "ColosseumQuest", 2}
      QuestTween = {CFrame.new(-1268, 30, -2996), CFrame.new(-1472, 30, -3194), CFrame.new(-1387, 30, -3438), CFrame.new(-1198, 30, -3508)}
    elseif Level >= 300 and Level < 325 then
      Quest = {CFrame.new(-5319, 12, 8515), false, "Military Soldier", "MagmaQuest", 1}
      QuestTween = {CFrame.new(-5335, 46, 8638), CFrame.new(-5512, 30, 8366)}
    elseif Level >= 325 and Level < 375 then
      if VerifyNPC("Magma Admiral") and Level >= 350 then
        Quest = {CFrame.new(-5319, 12, 8515), CFrame.new(-5694, 18, 8735), "Magma Admiral", "MagmaQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-5319, 12, 8515), CFrame.new(-5791, 97, 8834), "Military Spy", "MagmaQuest", 2}
        QuestTween = nil
      end
    elseif Level >= 375 and Level < 400 then
      Quest = {CFrame.new(61122, 18, 1567), false, "Fishman Warrior", "FishmanQuest", 1} 
      QuestTween = {CFrame.new(60998, 50, 1534), CFrame.new(60880, 50, 1675), CFrame.new(60785, 50, 1552), CFrame.new(60923, 60, 1262)}
    elseif Level >= 400 and Level < 450 then
      if VerifyNPC("Fishman Lord") and Level >= 425 then
        Quest = {CFrame.new(61122, 18, 1567), CFrame.new(61350, 31, 1095), "Fishman Lord", "FishmanQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(61122, 18, 1567), false, "Fishman Commando", "FishmanQuest", 2}
        QuestTween = {CFrame.new(61866, 55, 1655), CFrame.new(62043, 55, 1510), CFrame.new(61812, 55, 1254)}
      end
    elseif Level >= 450 and Level < 475 then
      Quest = {CFrame.new(-4720, 846, -1951), false, "God's Guard", "SkyExp1Quest", 1}
      QuestTween = {CFrame.new(-4641, 880, -1902), CFrame.new(-4781, 880, -1817)}
    elseif Level >= 475 and Level < 525 then
      if VerifyNPC("Wysper") and Level >= 500 then
        Quest = {CFrame.new(-7861, 5545, -381), CFrame.new(-7927, 5551, -637), "Wysper", "SkyExp1Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-7861, 5545, -381), false, "Shanda", "SkyExp1Quest", 2}
        QuestTween = {CFrame.new(-7741, 5580, -395), CFrame.new(-7591, 5580, -466), CFrame.new(-7643, 5580, -608)}
      end
    elseif Level >= 525 and Level < 550 then
      Quest = {CFrame.new(-7903, 5636, -1412), false, "Royal Squad", "SkyExp2Quest", 1}
      QuestTween = {CFrame.new(-7727, 5650, -1410), CFrame.new(-7522, 5650, -1499)}
    elseif Level >= 525 and Level < 625 then
      if VerifyNPC("Thunder God") and Level >= 575 then
        Quest = {CFrame.new(-7903, 5636, -1412), CFrame.new(-7751, 5607, -2315), "Thunder God", "SkyExp2Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-7903, 5636, -1412), false, "Royal Soldier", "SkyExp2Quest", 2}
        QuestTween = {CFrame.new(-7894, 5640, -1629), CFrame.new(-7678, 5640, -1696), CFrame.new(-7672, 5640, -1903), CFrame.new(-7925, 5640, -1854)}
      end
    elseif Level >= 625 and Level < 650 then
      Quest = {CFrame.new(5258, 39, 4052), false, "Galley Pirate", "FountainQuest", 1}
      QuestTween = {CFrame.new(5391, 70, 4023), CFrame.new(5780, 70, 3969)}
    elseif Level >= 650 then
      if VerifyNPC("Cyborg") and Level >= 675 then
        Quest = {CFrame.new(5258, 39, 4052), CFrame.new(6138, 10, 3939), "Cyborg", "FountainQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(5258, 39, 4052), false, "Galley Captain", "FountainQuest", 2}
        QuestTween = {CFrame.new(5985, 70, 4790), CFrame.new(5472, 70, 4887)}
      end
    end
  elseif Sea2 then
    -- Auto Farm Level Sea 2
    if Level >= 700 and Level < 725 then
      Quest = {CFrame.new(-427, 73, 1835), false, "Raider", "Area1Quest", 1}
      QuestTween = {CFrame.new(-614, 90, 2240), CFrame.new(-894, 90, 2275), CFrame.new(-872, 90, 2481), CFrame.new(-552, 90, 2528)}
    elseif Level >= 725 and Level < 775 then
      if VerifyNPC("Diamond") and Level >= 750 then
        Quest = {CFrame.new(-427, 73, 1835), CFrame.new(-1569, 199, -31), "Diamond", "Area1Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-427, 73, 1835), false, "Mercenary", "Area1Quest", 2}
        QuestTween = {CFrame.new(-867, 110, 1621), CFrame.new(-1047, 110, 1779), CFrame.new(-1025, 110, 1087), CFrame.new(-1204, 110, 1195)}
      end
    elseif Level >= 775 and Level < 800 then
      Quest = {CFrame.new(635, 73, 919), false, "Swan Pirate", "Area2Quest", 1}
      QuestTween = {CFrame.new(778, 110, 1129), CFrame.new(1018, 110, 1128), CFrame.new(1020, 110, 1366), CFrame.new(1016, 110, 1115)}
    elseif Level >= 800 and Level < 875 then
      if VerifyNPC("Jeremy") and Level >= 850 then
        Quest = {CFrame.new(635, 73, 919), CFrame.new(2316, 449, 787), "Jeremy", "Area2Quest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(635, 73, 919), false, "Factory Staff", "Area2Quest", 2}
        QuestTween = {CFrame.new(882, 110, -49), CFrame.new(723, 110, 212), CFrame.new(473, 110, 108), CFrame.new(-115, 110, 39)}
      end
    elseif Level >= 875 and Level < 900 then
      Quest = {CFrame.new(-2441, 73, -3219), false, "Marine Lieutenant", "MarineQuest3", 1}
      QuestTween = {CFrame.new(-2552, 110, -3050), CFrame.new(-2860, 110, -3089), CFrame.new(-3114, 110, -2947), CFrame.new(-2864, 110, -2679)}
    elseif Level >= 900 and Level < 950 then
      if VerifyNPC("Fajita") and Level >= 925 then
        Quest = {CFrame.new(-2441, 73, -3219), CFrame.new(-2086, 73, -4208), "Fajita", "MarineQuest3", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-2441, 73, -3219), false, "Marine Captain", "MarineQuest3", 2}
        QuestTween = {CFrame.new(-1695, 110, -3299), CFrame.new(-1953, 110, -3165), CFrame.new(-2144, 110, -3341)}
      end
    elseif Level >= 950 and Level < 975 then
      Quest = {CFrame.new(-5495, 48, -794), false, "Zombie", "ZombieQuest", 1}
      QuestTween = {CFrame.new(-5715, 90, -917), CFrame.new(-5534, 90, -942), CFrame.new(-5445, 90, -806), CFrame.new(-5485, 90, -663), CFrame.new(-5730, 90, -590), CFrame.new(-5816, 90, -756)}
    elseif Level >= 975 and Level < 1000 then
      Quest = {CFrame.new(-5495, 48, -794), false, "Vampire", "ZombieQuest", 2}
      QuestTween = {CFrame.new(-6027, 50, -1130), CFrame.new(-6248, 50, -1281), CFrame.new(-6120, 50, -1450), CFrame.new(-5951, 50, -1520), CFrame.new(-5803, 50, -1360)}
    elseif Level >= 1000 and Level < 1050 then
      Quest = {CFrame.new(607, 401, -5371), false, "Snow Trooper", "SnowMountainQuest", 1}
      QuestTween = {CFrame.new(445, 440, -5175), CFrame.new(523, 440, -5484), CFrame.new(699, 440, -5612)}
    elseif Level >= 1050 and Level < 1100 then
      Quest = {CFrame.new(607, 401, -5371), false, "Winter Warrior", "SnowMountainQuest", 2}
      QuestTween = {CFrame.new(1224, 460, -5332), CFrame.new(1404, 460, -5323), CFrame.new(1258, 460, -5220), CFrame.new(1145, 460, -5077), CFrame.new(1022, 460, -5139)}
    elseif Level >= 1100 and Level < 1125 then
      Quest = {CFrame.new(-6061, 16, -4904), false, "Lab Subordinate", "IceSideQuest", 1}
      QuestTween = {CFrame.new(-5941, 50, -4322), CFrame.new(-5765, 50, -4304), CFrame.new(-5608, 50, -4445), CFrame.new(-5683, 50, -4629)}
    elseif Level >= 1125 and Level < 1175 then
      if VerifyNPC("Smoke Admiral") and Level >= 1150 then
        Quest = {CFrame.new(-6061, 16, -4904), CFrame.new(-5078, 24, -5352), "Smoke Admiral", "IceSideQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-6061, 16, -4904), false, "Horned Warrior", "IceSideQuest", 2}
        QuestTween = {CFrame.new(-6306, 50, -5752), CFrame.new(-6161, 50, -5979), CFrame.new(-6518, 50, -5795), CFrame.new(-6535, 50, -5640)}
      end
    elseif Level >= 1175 and Level < 1200 then
      Quest = {CFrame.new(-5430, 16, -5298), false, "Magma Ninja", "FireSideQuest", 1}
      QuestTween = {CFrame.new(-5233, 60, -6227), CFrame.new(-5194, 60, -6031), CFrame.new(-5651, 60, -5854)}
    elseif Level >= 1200 and Level < 1250 then
      Quest = {CFrame.new(-5430, 16, -5298), false, "Lava Pirate", "FireSideQuest", 2}
      QuestTween = {CFrame.new(-4955, 60, -4836), CFrame.new(-5119, 60, -4634), CFrame.new(-5389, 60, -4616), CFrame.new(-5342, 60, -4897)}
    elseif Level >= 1250 and Level < 1275 then
      Quest = {CFrame.new(1033, 125, 32909), false, "Ship Deckhand", "ShipQuest1", 1}
      QuestTween = {CFrame.new(1185, 180, 32979), CFrame.new(1204, 180, 33174), CFrame.new(615, 180, 33169), CFrame.new(638, 180, 32962)} 
    elseif Level >= 1275 and Level < 1300 then
      Quest = {CFrame.new(1033, 125, 32909), false, "Ship Engineer", "ShipQuest1", 2}
      QuestTween = {CFrame.new(809, 80, 33090), CFrame.new(751, 80, 32957), CFrame.new(927, 80, 32724), CFrame.new(1040, 80, 32915), CFrame.new(1034, 80, 33058)}
    elseif Level >= 1300 and Level < 1325 then
      Quest = {CFrame.new(973, 125, 33245), false, "Ship Steward", "ShipQuest2", 1}
      QuestTween = {CFrame.new(838, 160, 33408), CFrame.new(1026, 160, 33510)}
    elseif Level >= 1325 and Level < 1350 then
      Quest = {CFrame.new(973, 125, 33245), false, "Ship Officer", "ShipQuest2", 2}
      QuestTween = {CFrame.new(1238, 220, 33148), CFrame.new(1220, 220, 33426), CFrame.new(622, 220, 33435), CFrame.new(593, 220, 33172)}
    elseif Level >= 1350 and Level < 1375 then
      Quest = {CFrame.new(5668, 28, -6484), false, "Arctic Warrior", "FrostQuest", 1}
      QuestTween = {CFrame.new(5836, 80, -6257), CFrame.new(6132, 80, -6098), CFrame.new(6275, 80, -6237), CFrame.new(6095, 80, -6349)}
    elseif Level >= 1375 and Level < 1425 then
      if VerifyNPC("Awakened Ice Admiral") and Level >= 1400 then
        Quest = {CFrame.new(5668, 28, -6484), CFrame.new(6473, 297, -6944), "Awakened Ice Admiral", "FrostQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(5668, 28, -6484), false, "Snow Lurker", "FrostQuest", 2}
        QuestTween = {CFrame.new(5700, 80, -6724), CFrame.new(5542, 80, -6898), CFrame.new(5512, 80, -6641)}
      end
    elseif Level >= 1425 and Level < 1450 then
      Quest = {CFrame.new(-3056, 240, -10145), false, "Sea Soldier", "ForgottenQuest", 1}
      QuestTween = {CFrame.new(-2583, 80, -9821), CFrame.new(-2830, 80, -9809), CFrame.new(-3271, 80, -9729), CFrame.new(-3486, 80, -9813)}
    elseif Level >= 1450 then
      if VerifyNPC("Tide Keeper") and Level >= 1475 then
        Quest = {CFrame.new(-3056, 240, -10145), CFrame.new(-3711, 77, -11469), "Tide Keeper", "ForgottenQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-3056, 240, -10145), false, "Water Fighter", "ForgottenQuest", 2}
        QuestTween = {CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607), CFrame.new(-3345, 280, -10667)}
      end
    end
  elseif Sea3 then
    -- Auto Farm Level Sea 3
    if Level >= 1500 and Level < 1525 then
      Quest = {CFrame.new(-291, 44, 5580), false, "Pirate Millionaire", "PiratePortQuest", 1}
      QuestTween = {CFrame.new(-44, 70, 5623), CFrame.new(-219, 70, 5546), CFrame.new(-574, 70, 5496)}
    elseif Level >= 1525 and Level < 1575 then
      if VerifyNPC("Stone") and Level >= 1550 then
        Quest = {CFrame.new(-291, 44, 5580), CFrame.new(-1049, 40, 6791), "Stone", "PiratePortQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-291, 44, 5580), false, "Pistol Billionaire", "PiratePortQuest", 2}
        QuestTween = {CFrame.new(219, 105, 6018), CFrame.new(-24, 105, 6155), CFrame.new(-312, 105, 6028)}
      end
    elseif Level >= 1575 and Level < 1600 then
      Quest = {CFrame.new(5834, 51, -1103), false, "Dragon Crew Warrior", "AmazonQuest", 1}
      QuestTween = {CFrame.new(5992, 90, -1581), CFrame.new(6364, 90, -1512), CFrame.new(6501, 90, -1104), CFrame.new(6612, 90, -938), CFrame.new(6393, 90, -939)}
    elseif Level >= 1600 and Level < 1625 then
      Quest = {CFrame.new(5834, 51, -1103), false, "Dragon Crew Archer", "AmazonQuest", 2}
      QuestTween = {CFrame.new(6472, 370, -151), CFrame.new(6547, 370, -51), CFrame.new(6539, 410, 72), CFrame.new(6737, 410, 249), CFrame.new(6768, 410, 390), CFrame.new(6625, 410, 371)}
    elseif Level >= 1625 and Level < 1650 then
      Quest = {CFrame.new(5448, 602, 748), false, "Female Islander", "AmazonQuest2", 1}
      QuestTween = {CFrame.new(4836, 740, 928), CFrame.new(4708, 770, 911), CFrame.new(4672, 790, 695), CFrame.new(4657, 800, 498), CFrame.new(4575, 810, 281)}
    elseif Level >= 1650 and Level < 1700 then
      if VerifyNPC("Island Empress") and Level >= 1675 then
        Quest = {CFrame.new(5448, 602, 748), CFrame.new(5730, 602, 199), "Island Empress", "AmazonQuest2", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(5448, 602, 748), false, "Giant Islander", "AmazonQuest2", 2}
        QuestTween = {CFrame.new(4784, 660, 155), CFrame.new(4662, 660, -57), CFrame.new(4869, 660, -178), CFrame.new(5056, 660, -267), CFrame.new(5332, 660, -166)}
      end
    elseif Level >= 1700 and Level < 1725 then
      Quest = {CFrame.new(2180, 29, -6738), false, "Marine Commodore", "MarineTreeIsland", 1}
      QuestTween = {CFrame.new(3156, 120, -7837), CFrame.new(2904, 120, -7863), CFrame.new(2606, 120, -7745), CFrame.new(2409, 120, -7874), CFrame.new(2269, 120, -7416), CFrame.new(2413, 120, -7232), CFrame.new(2284, 120, -6911)}
    elseif Level >= 1725 and Level < 1775 then
      if VerifyNPC("Kilo Admiral") and Level >= 1750 then
        Quest = {CFrame.new(2180, 29, -6738), CFrame.new(2889, 424, -7233), "Kilo Admiral", "MarineTreeIsland", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(2180, 29, -6738), false, "Marine Rear Admiral", "MarineTreeIsland", 2}
        QuestTween = {CFrame.new(3205, 120, -6742), CFrame.new(3345, 120, -6649), CFrame.new(3776, 210, -7254), CFrame.new(3879, 220, -7083), CFrame.new(3887, 210, -6841), CFrame.new(3546, 210, -6809), CFrame.new(3448, 210, -7014), CFrame.new(3504, 210, -7230)}
      end
    elseif Level >= 1775 and Level < 1800 then
      Quest = {CFrame.new(-10581, 332, -8758), false, "Fishman Raider", "DeepForestIsland3", 1}
      QuestTween = {CFrame.new(-10550, 380, -8574), CFrame.new(-10860, 380, -8459), CFrame.new(-10578, 380, -8331), CFrame.new(-10377, 380, -8238), CFrame.new(-10147, 380, -8216), CFrame.new(-10234, 380, -8454)}
    elseif Level >= 1800 and Level < 1825 then
      Quest = {CFrame.new(-10581, 332, -8758), false, "Fishman Captain", "DeepForestIsland3", 2}
      QuestTween = {CFrame.new(-10764, 380, -8799), CFrame.new(-10844, 380, -9030), CFrame.new(-11160, 380, -9166), CFrame.new(-11073, 380, -8846), CFrame.new(-11043, 380, -8619)}
    elseif Level >= 1825 and Level < 1850 then
      Quest = {CFrame.new(-13233, 332, -7626), false, "Forest Pirate", "DeepForestIsland", 1}
      QuestTween = {CFrame.new(-13335, 380, -7660), CFrame.new(-13138, 380, -7713), CFrame.new(-13298, 380, -7876), CFrame.new(-13512, 380, -7983), CFrame.new(-13632, 380, -7815)}
    elseif Level >= 1850 and Level < 1900 then
      if VerifyNPC("Captain Elephant") and Level >= 1875 then
        Quest = {CFrame.new(-13233, 332, -7626), CFrame.new(-13393, 319, -8423), "Captain Elephant", "DeepForestIsland", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-13233, 332, -7626), false, "Mythological Pirate", "DeepForestIsland", 2}
        QuestTween = {CFrame.new(-13844, 520, -7016), CFrame.new(-13710, 520, -6856), CFrame.new(-13482, 520, -6985), CFrame.new(-13224, 580, -6806)}
      end
    elseif Level >= 1900 and Level < 1925 then
      Quest = {CFrame.new(-12682, 391, -9901), false, "Jungle Pirate", "DeepForestIsland2", 1}
      QuestTween = {CFrame.new(-12166, 380, -10375), CFrame.new(-12303, 380, -10639), CFrame.new(-11904, 380, -10469), CFrame.new(-11636, 380, -10511), CFrame.new(-11735, 380, -10687), CFrame.new(-11937, 380, -10713)}
    elseif Level >= 1925 and Level < 1975 then
      if VerifyNPC("Beautiful Pirate") and Level > 1950 then
        Quest = {CFrame.new(-12682, 391, -9901), CFrame.new(5241, 23, 129), "Musketeer Pirate", "DeepForestIsland2", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-12682, 391, -9901), false, "Musketeer Pirate", "DeepForestIsland2", 2}
        QuestTween = {CFrame.new(-13098, 450, -9831), CFrame.new(-13222, 450, -9621), CFrame.new(-13530, 450, -9760), CFrame.new(-13455, 450, -9940)}
      end
    elseif Level >= 1975 and Level < 2000 then
      Quest = {CFrame.new(-9481, 142, 5565), false, "Reborn Skeleton", "HauntedQuest1", 1}
      QuestTween = {CFrame.new(-8680, 190, 5852), CFrame.new(-8879, 190, 5900), CFrame.new(-8865, 190, 6100), CFrame.new(-8774, 170, 6169), CFrame.new(-8649, 190, 6071)}
    elseif Level >= 200 and Level < 2025 then
      Quest = {CFrame.new(-9481, 142, 5565), false, "Living Zombie", "HauntedQuest1", 2}
      QuestTween = {CFrame.new(-10104, 200, 5739), CFrame.new(-10078, 200, 5953), CFrame.new(-10195, 200, 6139), CFrame.new(-10252, 200, 5973)}
    elseif Level >= 2025 and Level < 2050 then
      Quest = {CFrame.new(-9515, 172, 6078), false, "Demonic Soul", "HauntedQuest2", 1}
      QuestTween = {CFrame.new(-9275, 210, 6166), CFrame.new(-9379, 210, 6076), CFrame.new(-9565, 210, 6201), CFrame.new(-9671, 210, 6096)}
    elseif Level >= 2050 and Level < 2075 then
      Quest = {CFrame.new(-9515, 172, 6078), false, "Posessed Mummy", "HauntedQuest2", 2}
      QuestTween = {CFrame.new(-9442, 60, 6304), CFrame.new(-9427, 60, 6148), CFrame.new(-9598, 60, 6121), CFrame.new(-9733, 60, 6119), CFrame.new(-9735, 60, 6336), CFrame.new(-9618, 60, 6323)}
    elseif Level >= 2075 and Level < 2100 then
      Quest = {CFrame.new(-2104, 38, -10194), false, "Peanut Scout", "NutsIslandQuest", 1}
      QuestTween = {CFrame.new(-1870, 100, -10225), CFrame.new(-2143, 100, -10106)}
    elseif Level >= 2100 and Level < 2125 then
      Quest = {CFrame.new(-2104, 38, -10194), false, "Peanut President", "NutsIslandQuest", 2}
      QuestTween = {CFrame.new(-2005, 100, -10585), CFrame.new(-2293, 88, -10512)}
    elseif Level >= 2125 and Level < 2150 then
      Quest = {CFrame.new(-818, 66, -10964), false, "Ice Cream Chef", "IceCreamIslandQuest", 1}
      QuestTween = {CFrame.new(-501, 100, -10883), CFrame.new(-763, 100, -10834), CFrame.new(-990, 100, -11085)}
    elseif Level >= 2150 and Level < 2200 then
      if VerifyNPC("Cake Queen") and Level >= 2175 then
        Quest = {CFrame.new(-818, 66, -10964), CFrame.new(-710, 382, -11150), "Cake Queen", "IceCreamIslandQuest", 3}
        QuestTween = nil
      else
        Quest = {CFrame.new(-818, 66, -10964), false, "Ice Cream Commander", "IceCreamIslandQuest", 2}
        QuestTween = {CFrame.new(-690, 100, -11350), CFrame.new(-534, 100, -11284), CFrame.new(-720, 180, -11162)}
      end
    elseif Level >= 2200 and Level < 2225 then
      Quest = {CFrame.new(-2023, 38, -12028), false, "Cookie Crafter", "CakeQuest1", 1}
      QuestTween = {CFrame.new(-2332, 90, -12049), CFrame.new(-2468, 90, -12121), CFrame.new(-2401, 90, -12224), CFrame.new(-2296, 90, -12114)}
    elseif Level >= 2225 and Level < 2250 then
      Quest = {CFrame.new(-2023, 38, -12028), false, "Cake Guard", "CakeQuest1", 2}
      QuestTween = {CFrame.new(-1514, 90, -12422), CFrame.new(-1455, 90, -12244), CFrame.new(-1674, 90, -12206), CFrame.new(-1707, 90, -12360)}
    elseif Level >= 2250 and Level < 2275 then
      Quest = {CFrame.new(-1931, 38, -12840), false, "Baking Staff", "CakeQuest2", 1}
      QuestTween = {CFrame.new(-1930, 90, -12963), CFrame.new(-1803, 90, -13115), CFrame.new(-1769, 90, -12955), CFrame.new(-1873, 90, -12755)}
    elseif Level >= 2275 and Level < 2300 then
      Quest = {CFrame.new(-1931, 38, -12840), false, "Head Baker", "CakeQuest2", 2}
      QuestTween = {CFrame.new(-2123, 110, -12777), CFrame.new(-2281, 110, -12748), CFrame.new(-2317, 110, -12994), CFrame.new(-2140, 110, -12989)}
    elseif Level >= 2300 and Level < 2325 then
      Quest = {CFrame.new(235, 25, -12199), false, "Cocoa Warrior", "ChocQuest1", 1}
      QuestTween = {CFrame.new(110, 80, -12245), CFrame.new(-71, 80, -12292)}
    elseif Level >= 2325 and Level < 2350 then
      Quest = {CFrame.new(235, 25, -12199), false, "Chocolate Bar Battler", "ChocQuest1", 2}
      QuestTween = {CFrame.new(579, 80, -12413), CFrame.new(735, 80, -12659)}
    elseif Level >= 2350 and Level < 2375 then
      Quest = {CFrame.new(150, 25, -12777), false, "Sweet Thief", "ChocQuest2", 1}
      QuestTween = {CFrame.new(-68, 80, -12692), CFrame.new(90, 80, -12519)}
    elseif Level >= 2375 and Level < 2400 then
      Quest = {CFrame.new(150, 25, -12777), false, "Candy Rebel", "ChocQuest2", 2}
      QuestTween = {CFrame.new(17, 80, -12962), CFrame.new(158, 80, -12961)}
    elseif Level >= 2400 and Level < 2425 then
      Quest = {CFrame.new(-1148, 14, -14446), false, "Candy Pirate", "CandyQuest1", 1}
      QuestTween = {CFrame.new(-1371, 70, -14405), CFrame.new(-1318, 70, -14715)}
    elseif Level >= 2425 and Level < 2450 then
      Quest = {CFrame.new(-1148, 14, -14446), false, "Snow Demon", "CandyQuest1", 2}
      QuestTween = {CFrame.new(-836, 70, -14326), CFrame.new(-884, 70, -14708)}
    elseif Level >= 2450 and Level < 2475 then
      Quest = {CFrame.new(-16547, 56, -172), false, "Isle Outlaw", "TikiQuest1", 1}
      QuestTween = {CFrame.new(-16431, 90, -223), CFrame.new(-16313, 50, -210), CFrame.new(-16160, 35, -156)}
    elseif Level >= 2475 and Level < 2500 then
      Quest = {CFrame.new(-16547, 56, -172), false, "Island Boy", "TikiQuest1", 2}
      QuestTween = {CFrame.new(-16668, 70, -243), CFrame.new(-16744, 60, -195), CFrame.new(-16912, 45, -152)}
    elseif Level >= 2500 and Level < 2525 then
      Quest = {CFrame.new(-16540, 56, 1051), false, "Sun-kissed Warrior", "TikiQuest2", 1}
      QuestTween = {CFrame.new(-16345, 80, 1004), CFrame.new(-16425, 77, 1059), CFrame.new(-16069, 37, 1029)}
    elseif Level >= 2525 then
      Quest = {CFrame.new(-16540, 56, 1051), false, "Isle Champion", "TikiQuest2", 2}
      QuestTween = {CFrame.new(-16634, 85, 1106), CFrame.new(-16735, 60, 1075), CFrame.new(-16888, 35, 1011)}
    end
  end
end

local function QuestVisible()
  local QuestActive = Player.PlayerGui.Main.Quest
  if not QuestActive.Visible then
    local QuestActive = Player.PlayerGui.Main.Quest
    QuestActive.Container.QuestTitle.Title.Text = ""
  end
  return QuestActive.Visible
end

local function VerifyQuest(EnemieName)
  local QuestActive = Player.PlayerGui.Main.Quest
  local Text1 = QuestActive.Container.QuestTitle.Title.Text:gsub("-", ""):lower()
  local Text2 = EnemieName:gsub("-", ""):lower()
  return QuestActive.Visible and Text1:find(Text2)
end

PlayerLevel.Changed:Connect(Get_LevelQuest)
task.spawn(function()while task.wait(1) do pcall(Get_LevelQuest)end;end)
Get_LevelQuest()

local function BringNPC(Enemie, MultBring)

  if not BringMobs or not BringMobsDistance then
    local EnemiePP = Enemie.PrimaryPart
    if EnemiePP then
      EnemiePP.CFrame = EnePP2.CFrame
      EnemiePP.CanCollide = false
      EnemiePP.Size = Vector3.new(50, 50, 50)
    end
    return
  end
  local function Bring(_,NPC)
    if MultBring or NPC.Name == Enemie.Name then
      local EnemieH = NPC:FindFirstChild("Humanoid")
      
      if EnemieH and EnemieH.Health > 0 then
        local EnePP1, EnePP2 = NPC.PrimaryPart, Enemie.PrimaryPart
        
        if EnePP1 and EnePP2 then
          local Mag = (EnePP1.Position - EnePP2.Position).Magnitude
          if Mag < BringMobsDistance and Mag >= 1 then
            EnePP1.CFrame = EnePP2.CFrame
            EnePP1.CanCollide = false
            EnePP1.Size = Vector3.new(50, 50, 50)
            EnemieH.WalkSpeed = 0
            EnemieH.JumpPower = 0
            EnemieH:ChangeState(14)
            if EnemieH:FindFirstChild("Animator") then
              EnemieH.Animator:Destroy()
            end
            if NPC:FindFirstChild("Head") and NPC.Head.CanCollide then
              NPC.Head.CanCollide = false
            end
            sethiddenproperty(Player, "SimulationRadius",  math.huge)
          end
        end
      end
    end
  end
  
  table.foreach(Enemies:GetChildren(), Bring)
end

local PirateTime = tick()
task.spawn(function()
  local function VerifyPos(_,Enemie)
    if Enemie.Name ~= "rip_indra True Form" then
      local EnemieRP = Enemie and Enemie:FindFirstChild("HumanoidRootPart")
      
      if EnemieRP and (EnemieRP.Position - Vector3.new(-5556, 314, -2988)).Magnitude < 700 then
        PirateTime = tick()
      end
    end
  end
  
  while task.wait() do
    table.foreach(Enemies:GetChildren(), VerifyPos)
    table.foreach(ReplicatedStorage:GetChildren(), VerifyPos)
  end
end)

local function VerifyRaidPirate()
  return getgenv().AutoPiratesSea and (tick() - PirateTime) <= 10
end

local function VerifyEliteBoss()
  return getgenv().AutoEliteHunter and VerifyNPC("Urban")
  or getgenv().AutoEliteHunter and VerifyNPC("Deandre")
  or getgenv().AutoEliteHunter and VerifyNPC("Diablo")
end

local function VerifyBosses()
  for _,boss in pairs(BossListT) do
    if VerifyNPC(boss) then
      return true
    end
  end
end

local function GetButton()
  local Summoner = workspace.Map["Boat Castle"].Summoner
  local Circle = Summoner:FindFirstChild("Circle")
  if Circle then
    for _,part in pairs(Circle:GetChildren()) do
      if part and part.Name == "Part" and part:FindFirstChild("Part") and part.Part.BrickColor ~= BrickColor.new("Lime green") then
        return part.Part
      end
    end
  end
end

local TimerG = Player:WaitForChild("PlayerGui", 9e9):WaitForChild("Main", 9e9):WaitForChild("Timer", 9e9)
local function Configure(Farm)
  if Farm == "Level" then
    if VerifyEliteBoss() then return true
    elseif VerifyRaidPirate() then return true
    elseif getgenv().TeleportToFruit and FruitFind() then return true
    elseif getgenv().AutoSecondSea and PlayerLevel.Value >= 700 then return true
    elseif getgenv().AutoThirdSea and PlayerLevel.Value >= 1500 then return true
    elseif VerifyNPC("Awakened Ice Admiral") and getgenv().AutoRengoku then return true
    elseif VerifyNPC("Darkbeard") and getgenv().AutoDarkbeard then return true
    elseif VerifyNPC("rip_indra True Form") and getgenv().AutoRipIndra then return true
    elseif VerifyTool("God's Chalice") and getgenv().AutoRipIndra then return true
    elseif VerifyNPC("Cake Prince") and getgenv().AutoCakePrince then return true
    elseif VerifyNPC("Dough King") and getgenv().AutoCakePrince then return true
    elseif VerifyNPC("Don Swan") and getgenv().AutoKillDonSwan then return true
    elseif VerifyNPC("Soul Reaper") and getgenv().AutoSoulReaper then return true
    elseif VerifyTool("Hallow Essence") and getgenv().AutoSoulReaper then return true
    end
  elseif Farm == "Raid Pirate" then
    if not VerifyRaidPirate() and getgenv().AutoFarmBone then return true
    elseif not VerifyRaidPirate() and getgenv().AutoFarm_Level then return true
    elseif not VerifyRaidPirate() and getgenv().AutoEliteHunter then return true
    elseif not VerifyRaidPirate() and getgenv().TeleportToFruit then return true
    end
  elseif Farm == "All Bosses" then
    if getgenv().KillAllBosses and VerifyBosses() then
    end
  elseif Farm == "Candy" then
    if VerifyEliteBoss() then return true
    elseif getgenv().TeleportToFruit and FruitFind() then return true
    elseif VerifyNPC("rip_indra True Form") and getgenv().AutoRipIndra then return true
    elseif VerifyTool("God's Chalice") and getgenv().AutoRipIndra then return true
    elseif VerifyNPC("Cake Prince") and getgenv().AutoCakePrince then return true
    elseif VerifyNPC("Soul Reaper") and getgenv().AutoSoulReaper then return true
    elseif VerifyTool("Hallow Essence") and getgenv().AutoSoulReaper then return true
    end
  elseif Farm == "Elite Hunter" then
    if getgenv().TeleportToFruit and FruitFind() then return true
    elseif VerifyRaidPirate() then return true
    elseif not VerifyEliteBoss() and getgenv().AutoCandy then return true
    elseif getgenv().AutoFarm_Level and not VerifyEliteBoss() then return true
    elseif getgenv().AutoFarmBone and not VerifyEliteBoss() then return true
    elseif VerifyNPC("rip_indra True Form") and getgenv().AutoRipIndra then return true
    elseif VerifyNPC("Cake Prince") and getgenv().AutoCakePrince then return true
    elseif VerifyNPC("Dough King") and getgenv().AutoCakePrince then return true
    elseif VerifyNPC("Soul Reaper") and getgenv().AutoSoulReaper then return true
    elseif VerifyTool("Hallow Essence") and getgenv().AutoSoulReaper then return true
    elseif VerifyTool("God's Chalice") and getgenv().AutoRipIndra then return true
    end
  elseif Farm == "Fruit" then
    if getgenv().AutoSecondSea and PlayerLevel.Value >= 700 then return true
    elseif VerifyRaidPirate() then return true
    elseif getgenv().AutoFarmRaid and TimerG.Visible then return true
    elseif VerifyNPC("Awakened Ice Admiral") and getgenv().AutoRengoku then return true
    elseif VerifyNPC("Darkbeard") and getgenv().AutoDarkbeard then return true
    elseif VerifyNPC("Soul Reaper") and getgenv().AutoSoulReaper then return true
    elseif VerifyTool("Hallow Essence") and getgenv().AutoSoulReaper then return true
    elseif VerifyNPC("Cake Prince") and getgenv().AutoCakePrince then return true
    elseif VerifyNPC("Dough King") and getgenv().AutoCakePrince then return true
    elseif VerifyTool("God's Chalice") and getgenv().AutoRipIndra then return true
    elseif not FruitFind() then return true
    end
  elseif Farm == "Bone" then
    if getgenv().AutoFarm_Level then return true
    elseif VerifyRaidPirate() then return true
    elseif VerifyEliteBoss() then return true
    elseif VerifyTool("Hallow Essence") and getgenv().AutoSoulReaper then return true
    elseif VerifyNPC("Soul Reaper") and getgenv().AutoSoulReaper then return true
    elseif VerifyNPC("rip_indra True Form") and getgenv().AutoRipIndra then return true
    elseif getgenv().TeleportToFruit and FruitFind() then return true
    end
  elseif Farm == "Ectoplasm" then
    if getgenv().TeleportToFruit and FruitFind() then return true
    elseif getgenv().AutoCursedCaptain and VerifyNPC("Cursed Captain") then return true
    end
  elseif Farm == "Hallow Boss" then
    if getgenv().AutoFarmBone and not VerifyNPC("Soul Reaper") and not VerifyTool("Hallow Essence") then return true
    elseif getgenv().AutoRipIndra and VerifyNPC("rip_indra True Form") then
    end
  elseif Farm == "Raid" then
    if getgenv().TeleportToFruit and FruitFind() and not TimerG.Visible then return true
    end
  elseif Farm == "Don Swan" then
    if getgenv().AutoFarm_Level and not VerifyNPC("Don Swan") then return true
    elseif getgenv().AutoFarmEctoplasm and not VerifyNPC("Don Swan") then return true
    elseif getgenv().AutoDarkbeard and VerifyNPC("Darkbeard") then return true
    elseif getgenv().AutoCursedCaptain and VerifyNPC("Cursed Captain") then return true
    end
  elseif Farm == "Saw Boss" then
    
  elseif Farm == "Bartilo Quest" then
    
  elseif Farm == "Enel Boss" then
  
  elseif Farm == "Greybeard Boss" then
    
  elseif Farm == "Cake Prince" then
    if VerifyEliteBoss() then
    elseif not VerifyNPC("Cake Prince") and getgenv().TeleportToFruit and FruitFind() then return true
    elseif not VerifyNPC("Dough King") and getgenv().TeleportToFruit and FruitFind() then return true
    elseif VerifyNPC("Soul Reaper") and getgenv().AutoSoulReaper then return true
    elseif VerifyNPC("rip_indra True Form") and getgenv().AutoRipIndra then return true
    elseif VerifyTool("God's Chalice") and getgenv().AutoRipIndra then return true
    end
  elseif Farm == "Rip Indra" then
    if not VerifyTool("God's Chalice") and not VerifyNPC("rip_indra True Form") and getgenv().AutoFarm_Level then return true
    elseif not VerifyNPC("rip_indra True Form") and getgenv().RipIndraLegendaryHaki and GetButton() then
    elseif not VerifyTool("God's Chalice") and not VerifyNPC("rip_indra True Form") and getgenv().AutoEliteHunter then return true
    elseif not VerifyTool("God's Chalice") and not VerifyNPC("rip_indra True Form") and getgenv().TeleportToFruit then return true
    elseif not VerifyTool("God's Chalice") and not VerifyNPC("rip_indra True Form") and getgenv().AutoFarmBone then return true
    elseif not VerifyTool("God's Chalice") and not VerifyNPC("rip_indra True Form") and getgenv().AutoCakePrince then return true
    elseif not VerifyTool("God's Chalice") and not VerifyNPC("rip_indra True Form") and getgenv().AutoCakePrince then return true
    end
  end
end

local function AutoFarm_Level()
  while getgenv().AutoFarm_Level do task.wait()
    if Configure("Level") then
    else
      local Enemie = GetEnemies({Quest[3]})QuestVisible()
      
      -- if not VerifyQuest(Quest[3]) then FireRemote("AbandonQuest")end
      if not VerifyQuest(Quest[3]) then
        StartQuest(Quest[4], Quest[5], Quest[1])
      elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie)end)
      else
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if QuestTween and QuestTween[1] and plrPP and (plrPP.Position - QuestTween[1].p).Magnitude < 1200 then
          TweenNPCSpawn(QuestTween)
        elseif Quest[2] then
          PlayerTP(Quest[2])
        else
          PlayerTP(Quest[1])
        end
      end
    end
  end
end

local function AutoFarmMastery()
  local Quest = {CFrame.new(-16540, 56, 1051), false, NPCs = {"Isle Champion", "Sun-kissed Warrior"}, "TikiQuest2", 2, true}
  local QuestTween = {
    CFrame.new(-16521, 90, 1095),
    CFrame.new(-16891, 60, 1003),
    CFrame.new(-16521, 90, 1095),
    CFrame.new(-16891, 60, 1003)
  }
  
  if Sea1 then
    Quest = {CFrame.new(5258, 39, 4052), false, NPCs = {"Galley Captain"}, "FountainQuest", 2}
    QuestTween = {
      CFrame.new(5985, 70, 4790),
      CFrame.new(5472, 70, 4887)
    }
  elseif Sea2 then
    Quest = {CFrame.new(-3056, 240, -10145), false, NPCs = {"Water Fighter"}, "ForgottenQuest", 2}
    QuestTween = {
      CFrame.new(-3339, 290, -10412),
      CFrame.new(-3518, 290, -10419),
      CFrame.new(-3536, 290, -10607),
      CFrame.new(-3345, 280, -10667)
    }
  end
  
  while getgenv().AutoFarmMastery do task.wait()
    local SkillHealth = getgenv().HealthSkill
    local Tool = getgenv().ToolMastery
    
    local Enemie = GetEnemies(Quest.NPCs)
    
    pcall(function()DestroySkillWarn()end)
    
    if not QuestVisible() and not VerifyQuest(Quest[3]) then
      StartQuest(Quest[3], Quest[4], Quest[1])
    elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
      local Health = Enemie and Enemie:FindFirstChild("Humanoid") and Enemie.Humanoid.Health
      if Health and Health < Enemie.Humanoid.MaxHealth * SkillHealth / 100 then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + Vector3.new(0, getgenv().FarmDistance, 0))
        pcall(function()PlayerClick()ActiveHaki()EquipToolTip(Tool)BringNPC(Enemie, true)end)
        if getgenv().AimBotSkill then
          AimBotPart(Enemie.HumanoidRootPart)
        end
        if getgenv().SkillZ then
          KeyboardPress("Z")
        end
        if getgenv().SkillX then
          KeyboardPress("X")
        end
        if getgenv().SkillC then
          KeyboardPress("C")
        end
        if getgenv().SkillV then
          KeyboardPress("V")
        end
        if getgenv().SkillF then
          KeyboardPress("F")
        end
      elseif Health and Health >= Enemie.Humanoid.MaxHealth * SkillHealth / 100 then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipToolTip("Melee")BringNPC(Enemie)end)
      end
    else
      TweenNPCSpawn(QuestTween, Quest.NPCs)
    end
  end
end

local function VerifyEnemie(enemie)
  return Enemies and Enemies:FindFirstChild(enemie)
end

local function BuyNewBoat()
  local Boats = workspace:WaitForChild("Boats", 9e9)
  for _,boat in pairs(Boats:GetChildren()) do
    if boat:FindFirstChild("Owner") and boat.Owner.Value.Name == Player.Name then
      boat:Destroy()
    end
  end
end

local function AutoKitsuneIsland()
  local Boat = nil
  local Boats = workspace:WaitForChild("Boats", 9e9)
  local Map = workspace:WaitForChild("Map", 9e9)
  
  local function GetBoat()
    for _,boat in pairs(Boats:GetChildren()) do
      if boat:FindFirstChild("Humanoid") and boat.Humanoid.Value > 0 then
        if boat:FindFirstChild("Owner") and boat.Owner.Value.Name == Player.Name then
          Boat = boat
          return boat
        end
      end
    end
  end
  
  local function GetFireflies()
    local Nearest, Fire = math.huge
    for _,fire in pairs(workspace:GetChildren()) do
      if fire.Name == "EmberTemplate" and fire:FindFirstChild("Part") then
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if plrPP and (plrPP.Position - fire.Part.Position).Magnitude <= Nearest then
          Nearest = (plrPP.Position - fire.Part.Position).Magnitude
          Fire = fire.Part
        end
      end
    end
    return Fire
  end
  
local toPos11, toPos22, toPos33, toPos44 = true
  while getgenv().AutoMirageIsland do task.wait()
    local plrChar = Player.Character
    local Boat = GetBoat()
    
    if Boat then
      if not Boat:FindFirstChild("BodyVelocity") then
        local BV = Instance.new("BodyVelocity", Boat)
        BV.Velocity = Vector3.new()
      end
      for _,part in pairs(Boat:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("MeshPart") and part.Name ~= "VehicleSeat" then
          part.CanCollide = false
        end
      end
    end
    
    local Mirage = Map:FindFirstChild("MysticIsland")
    
    if Mirage then
      local plrChar = Player.Character
      local plrPP = plrChar and plrChar.PrimaryPart
      local plrH = plrChar and plrChar:FindFirstChild("Humanoid")
     
      if plrH and plrH.Sit then plrH.Sit = false end
     PlayerTP(workspace.Map.MysticIsland.PrimaryPart.CFrame*CFrame.new(0,250,0))
    elseif not Boat then
      local BuyBoatDistance = (plrChar.PrimaryPart.Position - Vector3.new(-6123, 16, -2247)).Magnitude
      if BuyBoatDistance <= 5 then
        FireRemote("BuyBoat", "Guardian")
      else
        PlayerTP(CFrame.new(-6123, 16, -2247))
      end
    elseif Boat:FindFirstChild("VehicleSeat") then
      local plrChar = Player.Character
      local plrH = plrChar and plrChar:FindFirstChild("Humanoid")
      
      if plrH and plrH.SeatPart ~= Boat.VehicleSeat then
        PlayerTP(Boat.VehicleSeat.CFrame)plrH.Sit = false
        if Boat.PrimaryPart then
          BoatTP(Boat, Boat.PrimaryPart.CFrame)
        end
      elseif Boat.PrimaryPart then
        local BoatPP = Boat.PrimaryPart
        if toPos11 then
          BoatTP(Boat, CFrame.new(-42000, 21, 500))
          if (BoatPP.Position - Vector3.new(-42000, 21, 500)).Magnitude < 25 then
            toPos11, toPos22 = false, true
          end
        elseif toPos22 then
          BoatTP(Boat, CFrame.new(-50000, 21, 500))
          if (BoatPP.Position - Vector3.new(-50000, 21, 500)).Magnitude < 25 then
            toPos22, toPos33 = false, true
          end
        elseif toPos33 then
          BoatTP(Boat, CFrame.new(-50000, 21, 2000))
          if (BoatPP.Position - Vector3.new(-50000, 21, 2000)).Magnitude < 25 then
            toPos33, toPos44 = false, true
          end
        elseif toPos44 then
          BoatTP(Boat, CFrame.new(-42000, 21, -1000))
          if (BoatPP.Position - Vector3.new(-42000, 21, -1000)).Magnitude < 25 then
            toPos44, toPos11 = false, true
          end
        end
      end
    end
  end
  if Boat and Boat.PrimaryPart then
    BoatTP(Boat, Boat.PrimaryPart.CFrame)
  end
  
  local toPos1, toPos2, toPos3, toPos4 = true
  while getgenv().AutoKitsuneIsland do task.wait()
    local plrChar = Player.Character
    local Boat = GetBoat()

    if Boat then
      if not Boat:FindFirstChild("BodyVelocity") then
        local BV = Instance.new("BodyVelocity", Boat)
        BV.Velocity = Vector3.new()
      end
      for _,part in pairs(Boat:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("MeshPart") and part.Name ~= "VehicleSeat" then
          part.CanCollide = false
        end
      end
    end
    
    local KitsuneIsland = Map:FindFirstChild("KitsuneIsland")
    
    if KitsuneIsland then
      local plrChar = Player.Character
      local plrPP = plrChar and plrChar.PrimaryPart
      local plrH = plrChar and plrChar:FindFirstChild("Humanoid")
      local Stone = KitsuneIsland:FindFirstChild("ShrineDialogPart")
      local AzureEmber = GetFireflies()
      if plrH and plrH.Sit then plrH.Sit = false end
      if not AzureEmber then
        if plrPP and Stone and (plrPP.Position - Stone.Position).Magnitude < 5 then
          if Stone:FindFirstChild("ProximityPrompt") then
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()      
          end
        elseif Stone then
          PlayerTP(Stone.CFrame)
        end
      elseif AzureEmber then
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if plrPP and block and (AzureEmber.Position - plrPP.Position).Magnitude < 100 then
          plrPP.CFrame = AzureEmber.CFrame
          block.CFrame = AzureEmber.CFrame
        else
          PlayerTP(AzureEmber.CFrame)
        end
      else
        PlayerTP(KitsuneIsland.WorldPivot)
      end
    elseif not Boat then
      local BuyBoatDistance = (plrChar.PrimaryPart.Position - Vector3.new(-6123, 16, -2247)).Magnitude
      if BuyBoatDistance <= 5 then
        FireRemote("BuyBoat", "Guardian")
      else
        PlayerTP(CFrame.new(-6123, 16, -2247))
      end
    elseif Boat:FindFirstChild("VehicleSeat") then
      local plrChar = Player.Character
      local plrH = plrChar and plrChar:FindFirstChild("Humanoid")
      
      if plrH and plrH.SeatPart ~= Boat.VehicleSeat then
        PlayerTP(Boat.VehicleSeat.CFrame)plrH.Sit = false
        if Boat.PrimaryPart then
          BoatTP(Boat, Boat.PrimaryPart.CFrame)
        end
      elseif Boat.PrimaryPart then
        local BoatPP = Boat.PrimaryPart
        if toPos1 then
          BoatTP(Boat, CFrame.new(-42000, 21, 500))
          if (BoatPP.Position - Vector3.new(-42000, 21, 500)).Magnitude < 25 then
            toPos1, toPos2 = false, true
          end
        elseif toPos2 then
          BoatTP(Boat, CFrame.new(-50000, 21, 500))
          if (BoatPP.Position - Vector3.new(-50000, 21, 500)).Magnitude < 25 then
            toPos2, toPos3 = false, true
          end
        elseif toPos3 then
          BoatTP(Boat, CFrame.new(-50000, 21, 2000))
          if (BoatPP.Position - Vector3.new(-50000, 21, 2000)).Magnitude < 25 then
            toPos3, toPos4 = false, true
          end
        elseif toPos4 then
          BoatTP(Boat, CFrame.new(-42000, 21, -1000))
          if (BoatPP.Position - Vector3.new(-42000, 21, -1000)).Magnitude < 25 then
            toPos4, toPos1 = false, true
          end
        end
      end
    end
  end
  if Boat and Boat.PrimaryPart then
    BoatTP(Boat, Boat.PrimaryPart.CFrame)
  end
end

local function AutoFarmSea()
  local Boat, InPanicMode, TeleportPos
  local RandomEquip = ""
  
  task.spawn(function()
    local Distance, toPos1, toPos2, toPos3, toPos4 = true, 0
    
    task.spawn(function()
      while getgenv().AutoFarmSea do task.wait()
        local BoatPP = Boat and Boat.PrimaryPart
        if BoatPP then
          if toPos1 then
            TeleportPos = CFrame.new(Distance, 21, 500)
            if (BoatPP.Position - Vector3.new(Distance, 21, 500)).Magnitude < 50 then
              toPos1, toPos2 = false, true
            end
          elseif toPos2 then
            TeleportPos = CFrame.new(Distance - 3000, 21, 500)
            if (BoatPP.Position - Vector3.new(Distance - 3000, 21, 500)).Magnitude < 50 then
              toPos2, toPos3 = false, true
            end
          elseif toPos3 then
            TeleportPos =  CFrame.new(Distance - 3000, 21, 2000)
            if (BoatPP.Position - Vector3.new(Distance - 3000, 21, 2000)).Magnitude < 50 then
              toPos3, toPos4 = false, true
            end
          elseif toPos4 then
            TeleportPos = CFrame.new(Distance, 21, -1000)
            if (BoatPP.Position - Vector3.new(Distance, 21, -1000)).Magnitude < 50 then
              toPos4, toPos1 = false, true
            end
          end
        end
      end
    end)
    
    while getgenv().AutoFarmSea do task.wait()
      if getgenv().SeaLevelTP == "inf" then
        Distance = -100000000
      elseif getgenv().SeaLevelTP == "6" then
        Distance = -42700
      elseif getgenv().SeaLevelTP == "5" then
        Distance = -38000
      elseif getgenv().SeaLevelTP == "4" then
        Distance = -34000
      elseif getgenv().SeaLevelTP == "3" then
        Distance = -30000
      elseif getgenv().SeaLevelTP == "2" then
        Distance = -26000
      elseif getgenv().SeaLevelTP == "1" then
        Distance = -22000
      end
    end
  end)
  
  task.spawn(function()
    while getgenv().AutoFarmSea do task.wait()
      local plrChar = Player.Character
      local plrH = plrChar and plrChar:FindFirstChild("Humanoid")
      
      if plrH then
        if plrH.Health < plrH.MaxHealth * getgenv().HealthPanic / 100 then
          InPanicMode = true
          repeat task.wait()
            if Boat and plrH then
              if not plrH.SeatPart or Boat:FindFirstChild("VehicleSeat") and plrH.SeatPart ~= Boat.VehicleSeat then
                PlayerTP(Boat.VehicleSeat.CFrame)
                if Boat.PrimaryPart then
                  BoatTP(Boat, Boat.PrimaryPart.CFrame)
                end
              elseif Boat.PrimaryPart then
                local vector3 = Vector3.new(0, math.clamp(Boat.PrimaryPart.Position.Y + 5, 0, 600), 0)
                Boat.PrimaryPart.CFrame = Boat.PrimaryPart.CFrame + vector3
              end
            end
          until not getgenv().AutoFarmSea
          or not getgenv().PanicMode
          or not Boat
          or not plrChar
          or not plrH
          or plrH.Health > plrH.MaxHealth * math.clamp(getgenv().HealthPanic, 20, 75) / 100
          
          InPanicMode = false
        end
      else
        InPanicMode = false
      end
    end
  end)
  
  task.spawn(function()
    while getgenv().AutoFarmSea do
      if VerifyToolTip("Melee") then
        RandomEquip = "Melee"task.wait(2)
      end
      if VerifyToolTip("Blox Fruit") then
        RandomEquip = "Blox Fruit"task.wait(3)
      end
      if VerifyToolTip("Sword") then
        RandomEquip = "Sword"task.wait(2)
      end
      if VerifyToolTip("Gun") then
        RandomEquip = "Gun"task.wait(2)
      end
    end
  end)
  
  local function GetBoat()
    for _,boat in pairs(Boats:GetChildren()) do
      if boat:FindFirstChild("Humanoid") and boat.Humanoid.Value > 0 then
        if boat:FindFirstChild("Owner") and boat.Owner.Value.Name == Player.Name then
          Boat = boat
          return boat
        end
      end
    end
  end
  
  local function GetKillBoat(BoatName)
    local Distance, Nearest = 2500
    local function Verify(_,Kill)
      if Kill.Name == BoatName then
        if Kill:FindFirstChild("Health") and Kill.Health.Value > 0 then
          local KillPP = Kill and Kill.PrimaryPart
          local BoatPP = Boat and Boat.PrimaryPart
          
          if BoatPP and KillPP and (BoatPP.Position - KillPP.Position).Magnitude < Distance then
            Distance = (BoatPP.Position - KillPP.Position).Magnitude
            Nearest = Kill
          end
        end
      end
    end
    
    table.foreach(Enemies:GetChildren(), Verify)
    table.foreach(ReplicatedStorage:GetChildren(), Verify)
    return Nearest
  end
  
  local function GetSeaEnemie(EnemieName)
    local Distance, Nearest = 2500
    local function Verify(_,Enemie)
      if Enemie.Name == EnemieName then
        local EnemieH = Enemie:FindFirstChild("Humanoid")
        
        if EnemieH and EnemieH.Health > 0 then
          local EnemiePP = Enemie and Enemie.PrimaryPart
          local BoatPP = Boat and Boat.PrimaryPart
          
          if BoatPP and EnemiePP and (BoatPP.Position - EnemiePP.Position).Magnitude < Distance then
            Distance = (BoatPP.Position - EnemiePP.Position).Magnitude
            Nearest = Enemie
          end
        end
      end
    end
    
    table.foreach(Enemies:GetChildren(), Verify)
    table.foreach(ReplicatedStorage:GetChildren(), Verify)
    return Nearest
  end
  
  task.spawn(function()
    while getgenv().AutoFarmSea do task.wait()
      if Boat then
        if not Boat:FindFirstChild("BodyVelocity") then
          local BV = Instance.new("BodyVelocity", Boat)
          BV.Velocity = Vector3.new()
        end
        for _,part in pairs(Boat:GetDescendants()) do
          if part:IsA("BasePart") or part:IsA("MeshPart") and part.Name ~= "VehicleSeat" then
            part.CanCollide = false
          end
        end
      end
    end
  end)
  
  while getgenv().AutoFarmSea do task.wait()
    local plrChar = Player.Character
    local Boat = GetBoat()
    
    local Terrorshark = GetSeaEnemie("Terrorshark")
    local Shark = GetSeaEnemie("Shark")
    local Piranha = GetSeaEnemie("Piranha")
    local FishCrewMember = GetSeaEnemie("Fish Crew Member")
    
    local Boat1 = GetKillBoat("PirateGrandBrigade")
    local Boat2 = GetKillBoat("PirateBrigade")
    local Boat3 = GetKillBoat("FishBoat")
    
    if getgenv().PanicMode and InPanicMode and Boat then
    elseif not Boat then
      local BuyBoatDistance = (plrChar.PrimaryPart.Position - Vector3.new(-6123, 16, -2247)).Magnitude
      if BuyBoatDistance <= 5 then
        FireRemote("BuyBoat", "Guardian")
      else
        PlayerTP(CFrame.new(-6123, 16, -2247))
      end
      
    elseif getgenv().Terrorshark and Terrorshark and Terrorshark:FindFirstChild("HumanoidRootPart") then
      
      PlayerTP(Terrorshark.HumanoidRootPart.CFrame * CFrame.new(0, 40, 50))
      pcall(function()PlayerClick()ActiveHaki()EquipTool()plrChar.Humanoid.Sit = false end)
      
      if Terrorshark:FindFirstChild("Humanoid") and Terrorshark.Humanoid.Health <= 0 then
        Terrorshark:Destroy()
      end
      
    elseif getgenv().Piranha and Piranha and Piranha:FindFirstChild("HumanoidRootPart") then
      
      PlayerTP(Piranha.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Piranha)plrChar.Humanoid.Sit = false end)
      
    elseif getgenv().FishCrewMember and FishCrewMember and FishCrewMember:FindFirstChild("HumanoidRootPart") then
      
      PlayerTP(FishCrewMember.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(FishCrewMember)plrChar.Humanoid.Sit = false end)
      
    elseif getgenv().Shark and Shark and Shark:FindFirstChild("HumanoidRootPart") then
      
      PlayerTP(Shark.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function()PlayerClick()ActiveHaki()EquipTool()plrChar.Humanoid.Sit = false end)
      
      if Shark:FindFirstChild("Humanoid") and Shark.Humanoid.Health <= 0 then
        Shark:Destroy()
      end
      
    elseif getgenv().PirateGrandBrigade and Boat1 and Boat1.PrimaryPart then
      
      PlayerTP(Boat1.PrimaryPart.CFrame + getgenv().FarmPos)
      pcall(function()ActiveHaki()plrChar.Humanoid.Sit = false end)
      
      EquipToolTip(RandomEquip)
      
      if Boat1:FindFirstChild("Humanoid") and Boat1.Humanoid.Value <= 0 then
        Boat1:Destroy()
      end
      
      if plrChar and plrChar.PrimaryPart and (plrChar.PrimaryPart.Position - Boat1.PrimaryPart.Position).Magnitude < 60 then
        if getgenv().SeaAimBotSkill then
          AimBotPart(Boat1.PrimaryPart)
        end
        
        if getgenv().SeaSkillZ then
          KeyboardPress("Z")
        end
        if getgenv().SeaSkillX then
          KeyboardPress("X")
        end
        if getgenv().SeaSkillC then
          KeyboardPress("C")
        end
        if getgenv().SeaSkillV then
          KeyboardPress("V")
        end
        if getgenv().SeaSkillF then
          KeyboardPress("F")
        end
      end
      
    elseif getgenv().PirateBrigade and Boat2 and Boat2.PrimaryPart then
      
      PlayerTP(Boat2.PrimaryPart.CFrame + getgenv().FarmPos)
      pcall(function()ActiveHaki()plrChar.Humanoid.Sit = false end)
      
      EquipToolTip(RandomEquip)
      
      if Boat2:FindFirstChild("Humanoid") and Boat2.Humanoid.Value <= 0 then
        Boat2:Destroy()
      end
      
      if plrChar and plrChar.PrimaryPart and (plrChar.PrimaryPart.Position - Boat2.PrimaryPart.Position).Magnitude < 60 then
        if getgenv().SeaAimBotSkill then
          AimBotPart(Boat2.PrimaryPart)
        end
        
        if getgenv().SeaSkillZ then
          KeyboardPress("Z")
        end
        if getgenv().SeaSkillX then
          KeyboardPress("X")
        end
        if getgenv().SeaSkillC then
          KeyboardPress("C")
        end
        if getgenv().SeaSkillV then
          KeyboardPress("V")
        end
        if getgenv().SeaSkillF then
          KeyboardPress("F")
        end
      end
      
    elseif getgenv().FishBoat and Boat3 and Boat3.PrimaryPart then
      
      PlayerTP(Boat3.PrimaryPart.CFrame + getgenv().FarmPos)
      pcall(function()ActiveHaki()plrChar.Humanoid.Sit = false end)
      
      EquipToolTip(RandomEquip)
      
      if Boat3:FindFirstChild("Humanoid") and Boat3.Humanoid.Value <= 0 then
        Boat3:Destroy()
      end
      
      if plrChar and plrChar.PrimaryPart and (plrChar.PrimaryPart.Position - Boat3.PrimaryPart.Position).Magnitude < 60 then
        if getgenv().SeaAimBotSkill then
          AimBotPart(Boat3.PrimaryPart)
        end
        
        if getgenv().SeaSkillZ then
          KeyboardPress("Z")
        end
        if getgenv().SeaSkillX then
          KeyboardPress("X")
        end
        if getgenv().SeaSkillC then
          KeyboardPress("C")
        end
        if getgenv().SeaSkillV then
          KeyboardPress("V")
        end
        if getgenv().SeaSkillF then
          KeyboardPress("F")
        end
      end
      
    elseif Boat and Boat:FindFirstChild("VehicleSeat") then
      PlayerTP(Boat.VehicleSeat.CFrame)
    end
    
    local plrH = Player.Character and Player.Character:FindFirstChild("Humanoid")
    local BoatSit = Boat and Boat:FindFirstChild("VehicleSeat")
    if plrH and BoatSit and plrH.Sit and plrH.SeatPart ~= BoatSit then
      plrChar.Humanoid.Sit = false BoatTP(Boat, Boat.PrimaryPart.CFrame)
    elseif BoatSit then
      if plrH and plrH.SeatPart and plrH.SeatPart == BoatSit then
        if TeleportPos then
          BoatTP(Boat, TeleportPos)
        end
      end
    end
  end
  if Boat and Boat.PrimaryPart then
    BoatTP(Boat, Boat.PrimaryPart.CFrame)
  end
end

local function AutoEliteHunter()
  while getgenv().AutoEliteHunter do task.wait()
    if Configure("Elite Hunter") then
    else
      local NPC = "EliteHunterVerify"QuestVisible()
      
      if VerifyQuest("Diablo") then
        NPC = "Diablo"
      elseif VerifyQuest("Deandre") then
        NPC = "Deandre"
      elseif VerifyQuest("Urban") then
        NPC = "Urban"
      else
        task.spawn(function()FireRemote("EliteHunter")end)
      end
      
      local EliteBoss = GetEnemies({NPC})
      
      if EliteBoss and EliteBoss:FindFirstChild("HumanoidRootPart") then
        PlayerTP(EliteBoss.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      elseif not VerifyNPC("Deandre") and not VerifyNPC("Diablo") and not VerifyNPC("Urban") then
        if getgenv().AutoEliteHunterHop then
          ServerHop()
        else
          PlayerTP(CFrame.new(-5119, 315, -2964))
        end
      end
    end
  end
end

local function AutoBisentoBoss()
  while getgenv().AutoBossBisento do task.wait()
    if Configure("Greybeard Boss") then
    else
      local Greybeard = GetEnemies({"Greybeard"})
      
      if Greybeard and Greybeard:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Greybeard.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-4807, 21, 4360))
      end
    end
  end
end

local function AutoSawBoss()
  while getgenv().AutoSawBoss do task.wait()
    if Configure("Saw Boss") then
    else
      local TheSaw = GetEnemies({"The Saw"})
      
      if TheSaw and TheSaw:FindFirstChild("HumanoidRootPart") then
        PlayerTP(TheSaw.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-690, 15, 1583))
      end
    end
  end
end

local function AutoKenV2()
  local QuestActive = Player.PlayerGui.Main.Quest
  
  local BossProgress = false
  local BanditProgress = false
  local QuestProgress = 0
  
  local Remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("CommF_", 9e9)
  task.spawn(function()
    while getgenv().AutoKenV2 do task.wait()
      BossProgress = Remote:InvokeServer("CitizenQuestProgress").KilledBoss
      BanditProgress = Remote:InvokeServer("CitizenQuestProgress").KilledBandits
      QuestProgress = Remote:InvokeServer("CitizenQuestProgress", "Citizen")
    end
  end)
  
  while getgenv().AutoKenV2 do task.wait()
    local plrLevel = PlayerLevel.Value
    local QuestTitle = QuestActive.Container.QuestTitle.Title
    
    if plrLevel < 1800 then
    elseif QuestProgress == 3 then
      if VerifyTool("") then
      elseif VerifyTool("Pineapple") and VerifyTool("Apple") and VerifyTool("Banana") then
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if plrPP and (plrPP.Position - Vector3.new(-12445, 332, -7676)).Magnitude < 5 then
          Remote:InvokeServer("CitizenQuestProgress", "Citizen")
        else
          PlayerTP(CFrame.new(-12445, 332, -7676))
        end
      else
        local AplleS = workspace:WaitForChild("AppleSpawner", 9e9)
        local BananaS = workspace:WaitForChild("BananaSpawner", 9e9)
        local PineappleS = workspace:WaitForChild("PineappleSpawner", 9e9)
        local plrPP = Player.Character and Player.Character.PrimaryPart
        
        if plrPP then
          if PineappleS:FindFirstChild("Pineapple") and not VerifyTool("Pineapple") then
            if PineappleS.Pineapple:FindFirstChild("Handle") then
              PineappleS.Pineapple.Handle.CFrame = plrPP.CFrame
            end
          elseif AplleS:FindFirstChild("Apple") and not VerifyTool("Apple") then
            if AplleS.Apple:FindFirstChild("Handle") then
              AplleS.Aplle.Handle.CFrame = plrPP.CFrame
            end
          elseif BananaS:FindFirstChild("Banana") and not VerifyTool("Banana") then
            if BananaS.Banana:FindFirstChild("Handle") then
              BananaS.Banana.Handle.CFrame = plrPP.CFrame
            end
          end
        end
      end
    elseif not BanditProgress then QuestVisible()
      local Enemie = GetEnemies({"Forest Pirate"})
      
      if QuestActive.Visible and not string.find(QuestTitle.Text, "Forest Pirate") and not string.find(QuestTitle.Text, "50") then
        FireRemote("AbandonQuest")
      end
      if not VerifyQuest("Forest Pirate") and not string.find(QuestTitle.Text, "50") then
        StartQuest1("CitizenQuest", 1)
        FireRemote("CitizenQuestProgress", "Citizen")
      elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie)end)
      end
    elseif not BossProgress then
      local CaptainElephant = GetEnemies({"Captain Elephant"})QuestVisible()
      
      if QuestActive.Visible and not string.find(QuestTitle.Text, "Captain Elephant") then
        FireRemote("AbandonQuest")
      end
      if not QuestActive.Visible and not string.find(QuestTitle.Text, "Captain Elephant") then
        FireRemote("CitizenQuestProgress", "Citizen")
      elseif CaptainElephant and CaptainElephant:FindFirstChild("HumanoidRootPart") then
        PlayerTP(CaptainElephant.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-13393, 319, -8423))
      end
    elseif QuestProgress == 2 then
      PlayerTP(CFrame.new(-12512, 340, -9872))
    end
  end
end

local function AutoMusketeerHat()
  local QuestActive = Player.PlayerGui.Main.Quest
  
  local BossProgress = false
  local BanditProgress = false
  local QuestProgress = 0
  
  task.spawn(function()
    while getgenv().AutoMusketeerHat do task.wait()
      BossProgress = FireRemote("CitizenQuestProgress").KilledBoss
      BanditProgress = FireRemote("CitizenQuestProgress").KilledBandits
      QuestProgress = FireRemote("CitizenQuestProgress", "Citizen")
    end
  end)
  
  while getgenv().AutoMusketeerHat do task.wait()
    local plrLevel = PlayerLevel.Value
    local QuestTitle = QuestActive.Container.QuestTitle.Title
    
    if plrLevel < 1800 then
    elseif not BanditProgress then
      local Enemie = GetEnemies({"Forest Pirate"})
      
      if not QuestActive.Visible then
        QuestTitle.Text = ""
      end
      
      if QuestActive.Visible and not string.find(QuestTitle.Text, "Forest Pirate") and not string.find(QuestTitle.Text, "50") then
        FireRemote("AbandonQuest")
      end
      
      if not QuestActive.Visible and not string.find(QuestTitle.Text, "Forest Pirate") and not string.find(QuestTitle.Text, "50") then
        StartQuest1("CitizenQuest", 1)
        FireRemote("CitizenQuestProgress", "Citizen")
      elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemies1)end)
      end
    elseif not BossProgress then
      local CursedCaptain = GetEnemies({"Captain Elephant"})
      
      if not QuestActive.Visible then
        QuestTitle.Text = ""
      end
      
      if QuestActive.Visible and not string.find(QuestTitle.Text, "Captain Elephant") then
        FireRemote("AbandonQuest")
      end
      
      if not QuestActive.Visible and not string.find(QuestTitle.Text, "Captain Elephant") then
        FireRemote("CitizenQuestProgress", "Citizen")
      elseif CursedCaptain and CursedCaptain:FindFirstChild("HumanoidRootPart") then
        PlayerTP(CursedCaptain.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemies1)end)
      else
        PlayerTP(CFrame.new(-13393, 319, -8423))
      end
    elseif QuestProgress == 2 then
      PlayerTP(CFrame.new(-12512, 340, -9872))
    end
  end
end

local function AutoEnelBossPole()
  while getgenv().AutoEnelBossPole do task.wait()
    if Configure("Enel Boss") then
    else
      local Enel = GetEnemies({"Thunder God"})
      
      if Enel and Enel:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enel.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-7739, 5657, -2289))
      end
    end
  end
end

local function AutoCursedDualKatana()
  local Cursed, DoorProgress = WaitPart(Map, "Turtle", "Cursed")
  
  local function MasterySwords()
    local TushitaM, YamaM = ItemMastery("Tushita"), ItemMastery("Yama")
    
    if TushitaM and TushitaM < 350 then
      if not VerifyTool("Tushita") then
        FireRemote("LoadItem", "Tushita")
      end
    elseif YamaM and YamaM < 350 then
      if not VerifyTool("Yama") then
        FireRemote("LoadItem", "Yama")
      end
    else
      return false
    end;EquipToolTip("Sword")
    
    local Enemie = GetEnemies({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
    if Enemie then
      PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function()ActiveHaki()BringNPC(Enemie, true)end)
    else
      PlayerTP(CFrame.new(-9513, 164, 5786))
    end
    return true
  end
  
  local function IndentifyQuest()
    if VerifyItem("Cursed Dual Katana") then return {"Finished"} end -- Virefica se o jogador possui a CDK
    if MasterySwords() then return {"MasterySwords"} end -- Verifica a maestria da Yama e a Tushita
    
    local Door = Cursed:FindFirstChild("Breakable")
    if Door and Door.CanCollide then
      local Prog = FireRemote("CDKQuest", "OpenDoor")
      if type(Prog) == "string" and Prog == "opened" then
        return {"OpenDoor"}
      else
        Door.CanCollide = false
      end
    end -- Verifica se a porta está aberta
    
    local Count = GetMaterial("Alucard Fragment") -- Pega a quantidade de material atual
    
    if Count == 6 then -- Verifica se é a ultima missão
      return {"FinalQuest"}
    elseif Count == 0 then
      FireRemote("CDKQuest", "Progress", "Evil")FireRemote("CDKQuest", "StartTrial", "Evil")
      return {"Yama", 1} -- Retorna a primeira missão
    elseif Map:FindFirstChild("HellDimension") then
      return {"Yama", 3} -- Retorna a dimensão da Yama
    elseif Map:FindFirstChild("HeavenlyDimension") then
      return {"Tushita", 3} -- Retorna a dimensão da Tushita
    elseif Player:FindFirstChild("QuestHaze") then
      return {"Yama", 2} -- Retorna a névoa da miseria
    end
    
    local Progress = FireRemote("CDKQuest", "Progress")
    local Good = Progress.Good
    local Evil = Progress.Evil
    
    if Evil and Evil >= 0 and Evil < 3 then
      FireRemote("CDKQuest", "Progress", "Evil")FireRemote("CDKQuest", "StartTrial", "Evil")
      if Evil == 0 then
        return {"Yama", 1}
      elseif Evil == 1 then
        return {"Yama", 2}
      elseif Evil == 2 then
        return {"Yama", 3}
      end
    elseif Good and Good >= 0 and Good < 3 then
      FireRemote("CDKQuest", "Progress", "Good")FireRemote("CDKQuest", "StartTrial", "Good")
      if Good == 0 then
        return {"Tushita", 1}
      elseif Good == 1 then
        return {"Tushita", 2}
      elseif Good == 2 then
        return {"Tushita", 3}
      end
    end
  end
  
  local function KillHazeEnemies()
    local QuestHaze = Player:FindFirstChild("QuestHaze")
    if QuestHaze then
      local Nearest, Enemie = math.huge
      for _,v in pairs(QuestHaze:GetChildren()) do
        if v.Value > 0 then
          local plrPP = Player.Character and Player.Character.PrimaryPart
          local EnemiePos = v:GetAttribute("Position")
          if v.Name == "Dragon Crew Warrior" then EnemiePos = Vector3.new(6431, 51, -1043)end
          if plrPP and EnemiePos and (EnemiePos - plrPP.Position).Magnitude <= Nearest then
            Nearest, Enemie = (EnemiePos - plrPP.Position).Magnitude, ({Name = v.Name, Position = EnemiePos})
          end
        end
      end
      
      if Enemie then
        local Enemies = GetEnemies({Enemie.Name})
        if Enemies and Enemies:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemies.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()ActiveHaki()EquipTool()BringNPC(Enemies)end)
        else
          if Enemie.Position then
            PlayerTP(CFrame.new(Enemie.Position))
          end
        end;getgenv().CursedDualKatana = true
      else
        getgenv().CursedDualKatana = false
      end
    end
  end
  
  local function GetTorch(Dimension)
    if Dimension then
      local Torch1 = Dimension:FindFirstChild("Torch1")
      local Torch2 = Dimension:FindFirstChild("Torch2")
      local Torch3 = Dimension:FindFirstChild("Torch3")
      
      if Torch1 and Torch1:FindFirstChild("ProximityPrompt") then
        if Torch1.ProximityPrompt.Enabled then
          return Torch1
        end
      end
      if Torch2 and Torch2:FindFirstChild("ProximityPrompt") then
        if Torch2.ProximityPrompt.Enabled then
          return Torch2
        end
      end
      if Torch3 and Torch3:FindFirstChild("ProximityPrompt") then
        if Torch3.ProximityPrompt.Enabled then
          return Torch3
        end
      end
      return Dimension:FindFirstChild("Exit")
    end
  end
  
  local function InvokeSoulReaper()
    local HellDimension = Map:FindFirstChild("HellDimension")
    if HellDimension then
      local plrPP = Player.Character and Player.Character.PrimaryPart
      if plrPP and (plrPP.Position - HellDimension.WorldPivot.p).Magnitude < 2500 then
        local Enemies = GetEnemies({"Hell's Messenger", "Cursed Skeleton"}, 2500)
        local Torch = GetTorch(HellDimension)
        
        if Enemies then
          PlayerTP(Enemies.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()ActiveHaki()EquipTool()BringNPC(Enemies, true)end)
        elseif Torch then
          PlayerTP(Torch.CFrame)
          if (plrPP.Position - Torch.Position).Magnitude < 10 then
            if Torch:FindFirstChild("ProximityPrompt") and fireproximityprompt then
              fireproximityprompt(Torch.ProximityPrompt)task.wait(0.5)
            end
          end
        end;getgenv().CursedDualKatana = true
      else
        getgenv().CursedDualKatana = false
      end
    else
      local SoulReaper = GetEnemies({"Soul Reaper"})
      
      if SoulReaper and SoulReaper:FindFirstChild("HumanoidRootPart") then
        PlayerTP(SoulReaper.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0))DisableTools()
      elseif VerifyTool("Hallow Essence") then
        EquipToolName("Hallow Essence")
        pcall(function()PlayerTP(Map["Haunted Castle"].Summoner.Detection.CFrame)end)
      else
        if GetMaterial("Bones") >= 50 then
          FireRemote("Bones", "Buy", 1, 1)
        end
        local Enemie = GetEnemies({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
        if Enemie then
          PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
        else
          PlayerTP(CFrame.new(-9513, 164, 5786))
        end
      end;getgenv().CursedDualKatana = true
    end
  end
  
  local function DieGhost()
    if not VerifyTool("Yama") then
      FireRemote("LoadItem", "Yama")
    else
      local NPC = GetEnemies({"Forest Pirate"})EquipToolName("Yama")
      
      if NPC and NPC:FindFirstChild("HumanoidRootPart") then
        PlayerTP(NPC.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
      else
        PlayerTP(CFrame.new(-13350, 332, -7645))
      end;getgenv().CursedDualKatana = true
    end
  end
  
  local function GetPirateRaidNPC()
    for _,npc in pairs(Enemies:GetChildren()) do
      if npc.Name ~= "rip_indra True Form" and IsAlive(npc) then
        if npc.PrimaryPart and (npc.PrimaryPart.Position - Vector3.new(-5556, 314, -2988)).Magnitude < 700 then
          return npc
        end
      end
    end
  end
  
  local function PirateRaid()
    if VerifyRaidPirate(true) then
      local Enemie = GetPirateRaidNPC()
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(-5556, 314, -2988))
      end;getgenv().CursedDualKatana = true
    else
      getgenv().CursedDualKatana = false
    end
  end
  
  local function BigMoon()
    local HeavenlyDimension = Map:FindFirstChild("HeavenlyDimension")
    if HeavenlyDimension then
      local plrPP = Player.Character and Player.Character.PrimaryPart
      if plrPP and (plrPP.Position - HeavenlyDimension.WorldPivot.p).Magnitude < 2500 then
        local Enemies = GetEnemies({"Heaven's Guardian", "Cursed Skeleton"}, 2500)
        local Torch = GetTorch(HeavenlyDimension)
        
        if Enemies then
          PlayerTP(Enemies.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()ActiveHaki()EquipTool()BringNPC(Enemies, true)end)
        elseif Torch then
          PlayerTP(Torch.CFrame)
          if (plrPP.Position - Torch.Position).Magnitude < 10 then
            if Torch:FindFirstChild("ProximityPrompt") and fireproximityprompt then
              fireproximityprompt(Torch.ProximityPrompt)task.wait(0.5)
            end
          end
        end;getgenv().CursedDualKatana = true
      else
        getgenv().CursedDualKatana = false
      end
    else
      local Boss = GetEnemies({"Cake Queen"})
      
      if Boss and Boss:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Boss.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-710, 382, -11150))
      end;getgenv().CursedDualKatana = true
    end
  end
  
  local Boat1, Boat2, Boat3
  local function TalkBoatsDealer()
    local plrPP = Player.Character and Player.Character.PrimaryPart
    local BoatDealer = NPCS:FindFirstChild("Luxury Boat Dealer")
    
    if plrPP then
      if not Boat1 then
        PlayerTP(CFrame.new(-9550, 21, 4638))getgenv().CursedDualKatana = true
        if BoatDealer and (plrPP.Position - Vector3.new(-9550, 21, 4638)).Magnitude < 5 then
          FireRemote("CDKQuest", "BoatQuest", BoatDealer)FireRemote("CDKQuest", "BoatQuest", BoatDealer, "Check")task.wait(1)Boat1 = true
        end
      elseif not Boat2 then
        PlayerTP(CFrame.new(-9531, 7, -8376))getgenv().CursedDualKatana = true
        if BoatDealer and (plrPP.Position - Vector3.new(-9531, 7, -8376)).Magnitude < 5 then
          FireRemote("CDKQuest", "BoatQuest", BoatDealer)FireRemote("CDKQuest", "BoatQuest", BoatDealer, "Check")task.wait(1)Boat2 = true
        end
      elseif not Boat3 then
        PlayerTP(CFrame.new(-4602, 16, -2880))getgenv().CursedDualKatana = true
        if BoatDealer and (plrPP.Position - Vector3.new(-4602, 16, -2880)).Magnitude < 5 then
          FireRemote("CDKQuest", "BoatQuest", BoatDealer)FireRemote("CDKQuest", "BoatQuest", BoatDealer, "Check")task.wait(1)Boat3 = true
        end
      else
        getgenv().CursedDualKatana = false
      end
    end
  end
  
  task.spawn(function()
    while getgenv().AutoCursedDualKatana do task.wait()
      local Quest = IndentifyQuest()
      if Quest then
        getgenv().CurrentQuest = Quest
      end
    end
  end)
  
  while getgenv().AutoCursedDualKatana do task.wait()
    if MyLevel.Value >= 2200 then
      local Quest = CurrentQuest
      if Quest then
        if Quest[1] == "Finished" then
          getgenv().CursedDualKatana = false
        elseif Quest[1] == "MasterySwords" then
          getgenv().CursedDualKatana = true
        elseif Quest[1] == "OpenDoor" then
          local plrPP = Player.Character and Player.Character.PrimaryPart
          if plrPP and (plrPP.Position - Vector3.new(-12131, 578, -6707)).Magnitude < 5 then
            FireRemote("CDKQuest", "OpenDoor")FireRemote("CDKQuest", "OpenDoor", true)
          else
            PlayerTP(CFrame.new(-12131, 578, -6707))getgenv().CursedDualKatana = true
          end
        elseif Quest[1] == "FinalQuest" then
          if not VerifyTool("Tushita") and not VerifyTool("Yama") then
            FireRemote("LoadItem", "Tushita")
          else
            if VerifyNPC("Cursed Skeleton Boss") then
              local Enemie = GetEnemies({"Cursed Skeleton Boss"})
              if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
                PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
                pcall(function()ActiveHaki()end)
              end;EquipToolTip("Sword")
            else
              local Pedestal1 = Cursed:FindFirstChild("Pedestal1")
              local Pedestal2 = Cursed:FindFirstChild("Pedestal2")
              local Pedestal3 = Cursed:FindFirstChild("Pedestal3")
              
              local Pedestal, Prompt
              if Pedestal3 and Pedestal3:FindFirstChild("ProximityPrompt") then
                if Pedestal3.ProximityPrompt.Enabled then
                  Pedestal, Prompt = Pedestal3, Pedestal3.ProximityPrompt
                end
              end
              if Pedestal2 and Pedestal2:FindFirstChild("ProximityPrompt") then
                if Pedestal2.ProximityPrompt.Enabled then
                  Pedestal, Prompt = Pedestal2, Pedestal2.ProximityPrompt
                end
              end
              if Pedestal1 and Pedestal1:FindFirstChild("ProximityPrompt") then
                if Pedestal1.ProximityPrompt.Enabled then
                  Pedestal, Prompt = Pedestal1, Pedestal1.ProximityPrompt
                end
              end
              
              if DialogVisible() then
                VirtualUser:ClickButton1(Vector2.new(1e4, 1e4))
              else
                if Pedestal then
                  local plrPP = Player.Character and Player.Character.PrimaryPart
                  if plrPP and (plrPP.Position - Pedestal.Position).Magnitude < 10 then
                    if Prompt and fireproximityprompt then
                      fireproximityprompt(Prompt)task.wait(0.5)
                    end
                  else
                    PlayerTP(Pedestal.CFrame)
                  end
                else
                  PlayerTP(CFrame.new(-12344, 603, -6551))
                end
              end
            end
          end;getgenv().CursedDualKatana = true
        elseif Quest[1] == "Tushita" then
          getgenv().ClickRequest = true
          if Quest[2] == 1 then
            TalkBoatsDealer()
          elseif Quest[2] == 2 then
            PirateRaid()
          else BigMoon() end
        elseif Quest[1] == "Yama" then
          if Quest[2] == 1 then
            DieGhost()getgenv().ClickRequest = false
          elseif Quest[2] == 2 then
            KillHazeEnemies()getgenv().ClickRequest = true
          else InvokeSoulReaper() end
        else
          getgenv().CursedDualKatana = false
        end
      end
    else
      getgenv().CursedDualKatana = false
    end
  end
  
  getgenv().ClickRequest = true
  getgenv().CursedDualKatana = false
end

local function AutoRainbowHaki()
  while getgenv().AutoRainbowHaki do task.wait()
    if VerifyQuest("Stone") then
      local Enemie = GetEnemies({"Stone"})
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-1049, 40, 6791))
        if getgenv().RainbowHakiHop then
          ServerHop()
        end
      end
    elseif VerifyQuest("Island Empress") then
      local Enemie = GetEnemies({"Island Empress"})
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(5730, 602, 199))
        if getgenv().RainbowHakiHop then
          ServerHop()
        end
      end
    elseif VerifyQuest("Kilo Admiral") then
      local Enemie = GetEnemies({"Kilo Admiral"})
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(2889, 424, -7233))
        if getgenv().RainbowHakiHop then
          ServerHop()
        end
      end
    elseif VerifyQuest("Captain Elephant") then
      local Enemie = GetEnemies({"Captain Elephant"})
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(-13393, 319, -8423))
        if getgenv().RainbowHakiHop then
          ServerHop()
        end
      end
    elseif VerifyQuest("Beautiful Pirate") then
      local Enemie = GetEnemies({"Beautiful Pirate"})
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(5241, 23, 129))
        if getgenv().RainbowHakiHop then
          ServerHop()
        end
      end
    else
      FireRemote("HornedMan", "Bet")
    end
  end
end

local function AutoSoulGuitar()
  local NPCs = workspace:WaitForChild("NPCs", 9e9)
  local Map = workspace:WaitForChild("Map", 9e9)
  local Castle = Map:WaitForChild("Haunted Castle", 9e9)
  
  local function BringZombie()
    local plrChar = Player and Player.Character
    local plrPP = plrChar and plrChar.PrimaryPart
    local EnemiesNumber = 0
    
    for _,npc in pairs(Enemies:GetChildren()) do
      if npc and npc.Name == "Living Zombie" and npc.PrimaryPart and plrPP
      and (npc.PrimaryPart.Position - plrPP.Position).Magnitude < 1000 then
        npc:SetPrimaryPartCFrame(plrPP.CFrame * CFrame.new(0, -15, -15))
        if npc:FindFirstChild("HumanoidRootPart") then
				  npc.HumanoidRootPart.CanCollide = false
				  npc.HumanoidRootPart.Size = Vector3.new(40, 40, 40)
				end
				if npc:FindFirstChild("Humanoid") and npc.Humanoid:FindFirstChild("Animator") then
					npc.Humanoid.Animator:Destroy()
				end
				if npc:FindFirstChild("Humanoid") and npc.Humanoid.Health <= 0 then
				  npc:Destroy()
				end
				sethiddenproperty(Player, "SimulationRadius",  math.huge)
				EnemiesNumber = EnemiesNumber + 1
      end
    end
    return EnemiesNumber
  end
  
  while getgenv().AutoSoulGuitar do task.wait()
    if VerifyTool("Soul Guitar") then
    elseif NPCs:FindFirstChild("Skeleton Machine") then
      FireRemote("soulGuitarBuy",true)
    elseif NPCs:FindFirstChild("Ghost") then
      FireRemote("GuitarPuzzleProgress", "Ghost")
    else
    end
    game:GetService("Workspace").Map["Haunted Castle"].ElevatorDoor.Left
    game:GetService("Workspace").NPCs["Skeleton Machine"].HumanoidRootPart
    game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.Part
    
    local plrChar = Player and Player.Character
    local plrPP = plrChar and plrChar.PrimaryPart
    
    PlayerTP(CFrame.new(-10129, 154, 5928))
    
    if plrPP and (plrPP.Position - Vector3.new(-10129, 154, 5928)).Magnitude < 5 and BringZombie() > 5 then
      pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
    end
  end
end

local function AutoUnlockSaber()
  local RichSonProgress = 0
  local SickManProgress = 0
  
  task.spawn(function()
    while getgenv().AutoUnlockSaber do task.wait()
      RichSonProgress = FireRemote("ProQuestProgress","RichSon")
      SickManProgress = FireRemote("ProQuestProgress", "SickMan")
    end
  end)
  while getgenv().AutoUnlockSaber do task.wait()
    if PlayerLevel.Value > 200 then
      local plrChar = Player and Player.Character
      local plrBag = Player.Backpack
      local plrRP = plrChar:FindFirstChild("HumanoidRootPart")
      local Plates = game:GetService("Workspace").Map.Jungle.QuestPlates
      
      if not workspace.Map.Jungle.Final.Part.CanCollide then
        local Enemie = GetEnemies({"Saber Expert"})
        
        if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        else
          PlayerTP(CFrame.new(-1461, 30, -51))
        end
        
      elseif plrChar and VerifyTool("Relic") then
        PlayerTP(CFrame.new(-1408, 30, 3))
        EquipToolName("Relic")
      elseif SickManProgress == 1 and RichSonProgress == 0 and not workspace.Map.Desert.Burn.Part.CanCollide then
        local Enemie = GetEnemies({"Mob Leader"})
        
        if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        end
      elseif plrChar:FindFirstChild("Cup") and not plrChar["Cup"].Handle:FindFirstChild("TouchInterest") then
        FireRemote("ProQuestProgress", "SickMan")
      elseif plrChar:FindFirstChild("Cup") and plrChar["Cup"].Handle:FindFirstChild("TouchInterest") then
        PlayerTP(CFrame.new(1393, 37, -1324, -0.408640295, 0, -0.912695527, 0, 1, 0, 0.912695527, 0, -0.408640295))
      elseif plrBag:FindFirstChild("Cup") then
        EquipToolName("Cup")
      elseif not workspace.Map.Desert.Burn.Part.CanCollide then
        PlayerTP(workspace.Map.Desert.Cup.CFrame)
      elseif plrChar:FindFirstChild("Torch") then
        PlayerTP(CFrame.new(1113, 5, 4352))
      elseif plrBag:FindFirstChild("Torch") then
        EquipToolName("Torch")
      elseif Plates:FindFirstChild("Door") and Plates.Door.CanCollide then
        if Plates then
          local Plate1 = Plates:FindFirstChild("Plate1")
          local Plate2 = Plates:FindFirstChild("Plate2")
          local Plate3 = Plates:FindFirstChild("Plate3")
          local Plate4 = Plates:FindFirstChild("Plate4")
          local Plate5 = Plates:FindFirstChild("Plate5")
          
          if Plate1 and Plate1:FindFirstChild("Button") and Plate1.Button.BrickColor ~= BrickColor.new("Camo") then
            PlayerTP(Plate1.Button.CFrame)
          elseif Plate2 and Plate2:FindFirstChild("Button") and Plate2.Button.BrickColor ~= BrickColor.new("Camo") then
            PlayerTP(Plate2.Button.CFrame)
          elseif Plate3 and Plate3:FindFirstChild("Button") and Plate3.Button.BrickColor ~= BrickColor.new("Camo") then
            PlayerTP(Plate3.Button.CFrame)
          elseif Plate4 and Plate4:FindFirstChild("Button") and Plate4.Button.BrickColor ~= BrickColor.new("Camo") then
            PlayerTP(Plate4.Button.CFrame)
          elseif Plate5 and Plate5:FindFirstChild("Button") and Plate5.Button.BrickColor ~= BrickColor.new("Camo") then
            PlayerTP(Plate5.Button.CFrame)
          end
        end
      elseif plrRP and Plates:FindFirstChild("Door") and not Plates.Door.CanCollide then
        PlayerTP(workspace.Map.Jungle.Torch.CFrame)
      end
    end
  end
end

local function AutoFarmEctoplasm()
  while getgenv().AutoFarmEctoplasm do task.wait()
    if Configure("Ectoplasm") then
    else
      local Enemie = GetEnemies({"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"})
      
      if Enemie then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ShipQuest2", 2)
end
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(912, 186, 33591))
      end
    end
  end
end

local function AutoFarmMaterial()
  local EnemiesList, NPCPos = {}
  
  task.spawn(function()
    while getgenv().AutoFarmMaterial do task.wait()
      local Material = getgenv().MaterialSelected
      if Sea1 then
        if Material == "Angel Wings" then
          EnemiesList, NPCPos = {"Royal Soldier", "Royal Squad"}, CFrame.new(-7742, 5634, -1564)
        elseif Material == "Leather + Scrap Metal" then
          EnemiesList, NPCPos = {"Pirate", "Brute"}, CFrame.new(-1257, 54, 4091)
        elseif Material == "Magma Ore" then
          EnemiesList, NPCPos = {"Military Soldier"}, CFrame.new(-5408, 11, 8456)
        elseif Material == "Fish Tail" then
          EnemiesList, NPCPos = {"Fishman Warrior"}, CFrame.new(60931, 19, 1574)
        end
      elseif Sea2 then
        if Material == "Leather + Scrap Metal" then
          EnemiesList, NPCPos =  {"Scrap Metal"}, CFrame.new(-1026, 73, 1375)
        elseif Material == "Magma Ore" then
          EnemiesList, NPCPos = {"Lava Pirate"}, CFrame.new(-5241, 50, -4713)
        elseif Material == "Mystic Droplet" then
          EnemiesList, NPCPos = {"Water Fighter"}, CFrame.new(-3350, 282, -10527)
        elseif Material == "Radiactive Material" then
          EnemiesList, NPCPos = {"Factory Staff"}, CFrame.new(-73, 149, -112)
        elseif Material == "Vampire Fang" then
          EnemiesList, NPCPos = {"Vampire"}, CFrame.new(-6030, 6, -1281)
        end
      elseif Sea3 then
        if Material == "Leather + Scrap Metal" then
          EnemiesList, NPCPos = {"Pirate Millionaire"}, CFrame.new(-364, 116, 5692)
        elseif Material == "Fish Tail" then
          EnemiesList, NPCPos = {"Fishman Captain", "Fishman Raider"}, CFrame.new(-10679, 398, -8975)
        elseif Material == "Gunpowder" then
          EnemiesList, NPCPos = {"Pistol Billionaire"}, CFrame.new(-394, 135, 5981)
        elseif Material == "Mini Tusk" then
          EnemiesList, NPCPos = {"Mythological Pirate"}, CFrame.new(-13510, 584, -6986)
        elseif Material == "Conjured Cocoa" then
          EnemiesList, NPCPos = {"Cocoa Warrior", "Chocolate Bar Battler"}, CFrame.new(400, 81, -12257)
        elseif Material == "Dragon Scale" then
          EnemiesList, NPCPos = {"Dragon Crew Archer"}, CFrame.new(6689, 378, 331)
        end
      end
    end
  end)
  
  while getgenv().AutoFarmMaterial do task.wait()
    if Configure("Material") then
    else
      local Enemie = GetEnemies(EnemiesList)
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      elseif NPCPos then
        PlayerTP(NPCPos)
      end
    end
  end
end

local function AutoFarmBone()
  while getgenv().AutoFarmBone do task.wait()
    if Configure("Bone") then
    else
      local Enemie = GetEnemies({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
      if Enemie then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(-9513, 164, 5786))
      end
    end
  end
end

local function AutoPiratesSea()
  while getgenv().AutoPiratesSea do task.wait()
    if Configure("Raid Pirate") then
    else
      local Enemie = nil
      for _,npc in pairs(Enemies:GetChildren()) do
        if npc.Name ~= "rip_indra True Form" then
          local npcH = npc:FindFirstChild("Humanoid")
          
          if npcH and npcH.Health > 0 then
            if npc and npc.PrimaryPart and (npc.PrimaryPart.Position - Vector3.new(-5556, 314, -2988)).Magnitude < 700 then
              Enemie = npc
            end
          end
        end
      end
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(-5556, 314, -2988))
      end
    end
  end
end

local function AutoFactory()
  while getgenv().AutoFactory do task.wait()
    PlayerTP(CFrame.new(410, 200, -414))
    pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
  end
end

local function AutoSecondSea()
  local Map = workspace:WaitForChild("Map", 9e9)
  local IceMap = Map:WaitForChild("Ice", 9e9)
  
  while getgenv().AutoSecondSea do task.wait()
    if PlayerLevel.Value < 700 then
    else
      local plrChar = Player and Player.Character
      local plrPP = Player and Player.Character and Player.Character.PrimaryPart
      local DoorArgs = IceMap:FindFirstChild("Door") and IceMap.Door.CanCollide and IceMap.Door.Transparency < 1
      
      if not VerifyTool("Key") and DoorArgs then
        PlayerTP(CFrame.new(4852, 6, 719))
        if plrPP and (plrPP.Position - Vector3.new(4852, 6, 719)).Magnitude < 5 then
          FireRemote("DressrosaQuestProgress","Detective")
        end
      elseif VerifyTool("Key") and DoorArgs then
        EquipToolName("Key")
        PlayerTP(CFrame.new(1346, 37, -1329))
      elseif VerifyNPC("Ice Admiral") and IceMap:FindFirstChild("Door") and not IceMap.Door.CanCollide and IceMap.Door.Transparency > 0 then
        local IceAdmiral = GetEnemies({"Ice Admiral"})
        
        if IceAdmiral and IceAdmiral:FindFirstChild("HumanoidRootPart") then
          PlayerTP(IceAdmiral.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        end
      else
        PlayerTP(CFrame.new(1280, 27, -1380))
        FireRemote("TravelDressrosa")
      end
    end
  end
end

local function AutoThirdSea()
  local QuestProgress = 0
  
  local function GetProxyNPC()
    local Distance = 2000
    local NPC = nil
    local plrChar = Player and Player.Character and Player.Character.PrimaryPart
    
    for _,npc in pairs(Enemies:GetChildren()) do
      if npc.Name == "rip_indra" then
        if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
          Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
          NPC = npc
        end
      end
    end
    return NPC
  end
  
  task.spawn(function()
    while getgenv().AutoThirdSea do task.wait()
      QuestProgress = FireRemote("ZQuestProgress", "Check")
      FireRemote("TravelZou")
    end
  end)
  
  while getgenv().AutoThirdSea do task.wait()
    if PlayerLevel.Value < 1500 then
    else
      local RipIndra = GetProxyNPC()
      if RipIndra and RipIndra:FindFirstChild("HumanoidRootPart") then
        PlayerTP(RipIndra.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      elseif QuestProgress == 0 then
        if boss and boss:FindFirstChild("HumanoidRootPart") then
          PlayerTP(boss.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        else
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          if plrChar and (plrChar.Position - Vector3.new(-1926, 13, 1738)).Magnitude < 5 then
            FireRemote("ZQuestProgress", "Begin")
            task.wait(2)
          else
            PlayerTP(CFrame.new(-1926, 13, 1738))
          end
        end
      end
    end
  end
end

local function AutoBartiloQuest()
  local BartiloQuestLevel = 0
  task.spawn(function()
    while getgenv().AutoBartiloQuest do task.wait()
      BartiloQuestLevel = FireRemote("BartiloQuestProgress", "Bartilo")
      FireRemote("BartiloQuestProgress", "Bartilo")
    end
  end)
  
  local QuestActive = Player.PlayerGui.Main.Quest
  
  while getgenv().AutoBartiloQuest do task.wait()
    if PlayerLevel.Value >= 850 then
      local QuestTitle = QuestActive.Container.QuestTitle.Title
      if BartiloQuestLevel == 0 then
        
        local Enemie = GetEnemies({"Swan Pirate"})
        
        if not QuestActive.Visible then
          QuestTitle.Text = ""
        end
        
        if QuestActive.Visible and not string.find(QuestTitle.Text, "Swan Pirate") and not string.find(QuestTitle.Text, "50") then
          FireRemote("AbandonQuest")
        end
        
        if not QuestActive.Visible and not string.find(QuestTitle.Text, "Swan Pirate") and not string.find(QuestTitle.Text, "50") then
          StartQuest1("BartiloQuest", 1)
          elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie)end)
        else
          TweenNPCSpawn({CFrame.new(778, 110, 1129), CFrame.new(1018, 110, 1128), CFrame.new(1020, 110, 1366), CFrame.new(1016, 110, 1115)}, "Swan Pirate")
        end
      elseif BartiloQuestLevel == 1 then
        local Enemie1 = GetEnemies({"Jeremy"})
        
        if Enemie1 and Enemie1:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemie1.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie1)end)
        else
          PlayerTP(CFrame.new(2316, 449, 787))
        end
      
      elseif BartiloQuestLevel == 2 then
        local Plates = game:GetService("Workspace").Map.Dressrosa:FindFirstChild("BartiloPlates")
        if Plates and Plates:FindFirstChild("Plate1") and Plates.Plate1.Color.G ~= 1 then
          PlayerTP(Plates.Plate1.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate2") and Plates.Plate2.Color.G ~= 1 then
          PlayerTP(Plates.Plate2.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate3") and Plates.Plate3.Color.G ~= 1 then
          PlayerTP(Plates.Plate3.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate4") and Plates.Plate4.Color.G ~= 1 then
          PlayerTP(Plates.Plate4.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate5") and Plates.Plate5.Color.G ~= 1 then
          PlayerTP(Plates.Plate5.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate6") and Plates.Plate6.Color.G ~= 1 then
          PlayerTP(Plates.Plate6.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate7") and Plates.Plate7.Color.G ~= 1 then
          PlayerTP(Plates.Plate7.CFrame)
        elseif Plates and Plates:FindFirstChild("Plate8") and Plates.Plate8.Color.G ~= 1 then
          PlayerTP(Plates.Plate8.CFrame)
        end
      end
    end
  end
end

local function AutoRipIndra()
  while getgenv().AutoRipIndra do task.wait()
    if Configure("Rip Indra") then
    else
      local RipIndra1 = GetEnemies({"rip_indra True Form"})
 
if not RipIndra1 and not VerifyTool("God's Chalice") then
AutoChestTween2()
end

      if RipIndra1 and RipIndra1:FindFirstChild("HumanoidRootPart") then
        PlayerTP(RipIndra1.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      elseif VerifyTool("God's Chalice") then
        EquipToolName("God's Chalice")
        PlayerTP(CFrame.new(-5561, 314, -2663))
      end
    end
  end
end

local function AutoKillLawBoss()
  while getgenv().AutoKillLawBoss do task.wait()
    local OrderBoss1 = GetEnemies({"Order"})
    
    if OrderBoss1 and OrderBoss1:FindFirstChild("HumanoidRootPart") then
      PlayerTP(OrderBoss1.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
    else
      PlayerTP(CFrame.new(-6300, 16, -4997))
    end
  end
end

local function AutoDarkbeard()
  while getgenv().AutoDarkbeard do task.wait()
    local Darkbeard1 = GetEnemies({"Darkbeard"})
  
if not Darkbeard1 and not VerifyTool("Fist of Darkness") then
AutoChestTween2()
end

    if Darkbeard1 and Darkbeard1:FindFirstChild("HumanoidRootPart") then
      PlayerTP(Darkbeard1.HumanoidRootPart.CFrame + getgenv().FarmPos)
      pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
    elseif VerifyTool("Fist of Darkness") then
      EquipToolName("Fist of Darkness")
      PlayerTP(CFrame.new(3779, 16, -3500))
    end
  end
end

local function AutoKillDonSwan()
  while getgenv().AutoKillDonSwan do task.wait()
    if Configure("Don Swan") then
    else
      local Enemie1 = GetEnemies({"Don Swan"})
      
      if Enemie1 and Enemie1:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie1.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        if getgenv().AutoDonSwanHop then
          ServerHop()
        else
          PlayerTP(CFrame.new(2272, 15, 759))
        end
      end
    end
  end
end

local function AutoCursedCaptain()
  while getgenv().AutoCursedCaptain do task.wait()
    if getgenv().AutoFarm_Level and not VerifyNPC("Cursed Captain") then
    elseif getgenv().AutoFarmEctoplasm and not VerifyNPC("Cursed Captain") then
    else
      local Enemie1 = GetEnemies({"Cursed Captain"})
      
      if Enemie1 and Enemie1:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie1.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
        PlayerTP(CFrame.new(912, 186, 33591))
      end
    end
  end
end

local function AutoCakePrince()
  task.spawn(function()
    while getgenv().AutoCakePrince do task.wait(1)
      FireRemote("CakePrinceSpawner")
    end
  end)
  
  while getgenv().AutoCakePrince do task.wait()
    if Configure("Cake Prince") then
    else
      if VerifyNPC("Dough King") then
        local DoughKing = GetEnemies({"Dough King"})
        
        if DoughKing and DoughKing:FindFirstChild("HumanoidRootPart") then
          PlayerTP(DoughKing.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        end
      elseif VerifyNPC("Cake Prince") then
        local CakePrince = GetEnemies({"Cake Prince"})
        
        if CakePrince and CakePrince:FindFirstChild("HumanoidRootPart") then
          PlayerTP(CakePrince.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        end
      else
        if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone then
          local Enemie = GetEnemies({"Head Baker", "Baking Staff", "Cake Guard", "Cookie Crafter"})
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 2)
end
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          else
            PlayerTP(CFrame.new(-2103, 70, -12165))
          end
        end
      end
    end
  end
end

local function AutoDoughKing()
  local CocoaStats = ""
  task.spawn(function()
    while getgenv().AutoDoughKing do task.wait()
      CocoaStats = FireRemote("SweetChaliceNpc")
      if VerifyTool("Sweet Chalice") then
        FireRemote("CakePrinceSpawner")
      end
    end
  end)
  
  while getgenv().AutoDoughKing do task.wait()
    if VerifyTool("Red Key") then
      FireRemote("CakeScientist", "Check")
    elseif VerifyNPC("Dough King") then
      local DoughKing = GetEnemies({"Dough King"})
      
      if DoughKing and DoughKing:FindFirstChild("HumanoidRootPart") then
        PlayerTP(DoughKing.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      end
    else
      if VerifyTool("God's Chalice") and not VerifyTool("Sweet Chalice") then
        if string.find(CocoaStats, "Where") then
          local Enemie = GetEnemies({"Chocolate Bar Battler", "Cocoa Warrior"})
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ChocQuest1", 2)
end
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          else
            PlayerTP(CFrame.new(400, 81, -12257))
          end
        end
      elseif VerifyNPC("Urban") and not VerifyTool("God's Chalice") and not VerifyTool("Sweet Chalice")
      or VerifyNPC("Deandre") and not VerifyTool("God's Chalice") and not VerifyTool("Sweet Chalice")
      or VerifyNPC("Diablo") and not VerifyTool("God's Chalice") and not VerifyTool("Sweet Chalice") then
        local NPC = "EliteHunterVerify"QuestVisible()
        
        if VerifyQuest("Diablo") then
          NPC = "Diablo"
        elseif VerifyQuest("Deandre") then
          NPC = "Deandre"
        elseif VerifyQuest("Urban") then
          NPC = "Urban"
        else
          task.spawn(function()FireRemote("EliteHunter")end)
        end
        
        local EliteBoss = GetEnemies({NPC})
        
        if EliteBoss and EliteBoss:FindFirstChild("HumanoidRootPart") then
          PlayerTP(EliteBoss.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        end
      else
        if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone then
          local Enemie = GetEnemies({"Head Baker", "Baking Staff", "Cake Guard", "Cookie Crafter"})
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 2)
end
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          else
            PlayerTP(CFrame.new(-2103, 70, -12165))
          end
        end
      end
    end
  end
end

local function KillAllBosses()
  local SelectedBoss
  
  task.spawn(function()
    while getgenv().KillAllBosses do task.wait()
      local BossTable = {}
      local function Verify(_,Boss)
        if table.find(BossListT, Boss.Name) then
          local BossH = Boss:FindFirstChild("Humanoid")
          
          if BossH and BossH.Health > 0 then
            table.insert(BossTable, Boss)
          end
        end
      end
      
      table.foreach(Enemies:GetChildren(), Verify)
      table.foreach(ReplicatedStorage:GetChildren(), Verify)
      if BossTable[1] then
        SelectedBoss = BossTable[1]
      end
    end
  end)
  
  while getgenv().KillAllBosses do task.wait()
    if SelectedBoss then
      local GetQuest, NotBossPos, Quest, QuestNun = GetBossQuest(SelectedBoss.Name)
      local Boss = SelectedBoss
      
      if Boss and QuestVisible() and not VerifyQuest(Boss.Name) then
        FireRemote("AbandonQuest")
      end
      if Boss and GetQuest and getgenv().TakeQuestBoss and not QuestVisible() and not VerifyQuest(Boss.Name) then
        StartQuest1(Quest, QuestNun or 3)
      elseif Boss and Boss:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Boss.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      elseif NotBossPos then
        PlayerTP(NotBossPos)
      end
    end
  end
end

local function AutoFarmBossSelected()
  local GetQuest, GetQuestPos, Quest, NotBossPos, BossName = false, nil, nil, nil, getgenv().BossSelected or ""
  local QuestActive = Player.PlayerGui.Main.Quest
  
  while getgenv().AutoFarmBossSelected do task.wait()
    BossName = getgenv().BossSelected or ""
    local plrChar = Player.Character and Player.Character.PrimaryPart
    if plrChar then
      
      local GetQuest, NotBossPos, Quest, QuestNun = GetBossQuest(BossName)
      
      if VerifyNPC(BossName) then
        local Boss1 = GetEnemies({BossName})
        
        if not QuestActive.Visible then
          QuestActive.Container.QuestTitle.Title.Text = ""
        end
        if QuestActive.Visible and not string.find(QuestActive.Container.QuestTitle.Title.Text, BossName) then
          FireRemote("AbandonQuest")
        end
        if GetQuest and getgenv().TakeQuestBoss and not QuestActive.Visible and not string.find(QuestActive.Container.QuestTitle.Title.Text, BossName) then
          StartQuest1(Quest, QuestNun or 3)
        elseif Boss1 and Boss1:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Boss1.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Boss1)end)
        end
      elseif NotBossPos then
        PlayerTP(NotBossPos)
      end
    end
  end
end

local function AutoFarmBone2()
    if Configure("Bone") then
    else
      local Enemie = GetEnemies({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
      if Enemie then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
if not SoulReaper and not VerifyTool("Hallow Essence") then
FireRemote("Bones", "Buy", 1, 1)
end
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(-9513, 164, 5786))
      end
    end
  end
  
local function AutoSoulReaper()
  while getgenv().AutoSoulReaper do task.wait()
    if Configure("Hallow Boss") then
    else
      local SoulReaper = GetEnemies({"Soul Reaper"})
      
if not SoulReaper and not VerifyTool("Hallow Essence") then
AutoFarmBone2()
        end
      
      if SoulReaper and SoulReaper:FindFirstChild("HumanoidRootPart") then
        PlayerTP(SoulReaper.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      elseif VerifyTool("Hallow Essence") then
        EquipToolName("Hallow Essence")
        pcall(function()PlayerTP(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame)end)
      end
    end
  end
end

local function AutoFarmNearest()
  local SavePos = Vector3.new()
  repeat task.wait()until Player.Character and Player.Character.PrimaryPart
  SavePos = Player.Character.PrimaryPart.Position
  
  local function GetNearest()
    local Distance, Nearest = 2500
    local function Verify(_,Enemie)
      local EnemieH = Enemie:FindFirstChild("Humanoid")
      
      if EnemieH and EnemieH.Health > 0 then
        local EnemiePP = Enemie.PrimaryPart
        local PlayerPP = Player.Character and Player.Character.PrimaryPart
        
        if EnemiePP and PlayerPP and (PlayerPP.Position - EnemiePP.Position).Magnitude <= Distance then
          Distance = (PlayerPP.Position - EnemiePP.Position).Magnitude
          Nearest = Enemie
        end
      end
    end
    table.foreach(Enemies:GetChildren(), Verify)
    table.foreach(ReplicatedStorage:GetChildren(), Verify)
    return Nearest
  end
  
  while getgenv().AutoFarmNearest do task.wait()
    if getgenv().AutoFarm_Level or getgenv().AutoRipIndra or getgenv().AutoCakePrince then
    else
      local Enemie = GetNearest()
      
      if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(SavePos))
      end
    end
  end
end

local function AutoGhoulRace()
  while getgenv().AutoGhoulRace do task.wait()
  PlayerRace = Player.Data.Race.Value
  if PlayerRace ~= "Ghoul" then
if GetMaterial("Ectoplasm") <= 100 then
local Enemie = GetEnemies({"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"})
      
      if Enemie then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ShipQuest2", 2)
end
        PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
      else
        PlayerTP(CFrame.new(912, 186, 33591))
      end
      end
      if GetMaterial("Ectoplasm") >= 100 then
    if getgenv().AutoFarm_Level and not VerifyNPC("Cursed Captain") then
    elseif getgenv().AutoFarmEctoplasm and not VerifyNPC("Cursed Captain") then
    else
      local Enemie1 = GetEnemies({"Cursed Captain"})
      
      if Enemie1 and Enemie1:FindFirstChild("HumanoidRootPart") then
        PlayerTP(Enemie1.HumanoidRootPart.CFrame + getgenv().FarmPos)
        pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      else
      if VerifyTool("Hellfire Torch") then
        local args = {
                            [1] = "Ectoplasm",
                            [2] = "BuyCheck",
                            [3] = 4
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        local args = {
                            [1] = "Ectoplasm",
                            [2] = "Change",
                            [3] = 4
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        PlayerTP(CFrame.new(912, 186, 33591))
      end
      end
      end
    end
  end
end

local function AutoRaceV2()
  local QuestProgress = 0
  task.spawn(function()
    while getgenv().AutoRaceV2 do task.wait()
      QuestProgress = FireRemote("Alchemist", "1")
    end
  end)
  
  while getgenv().AutoRaceV2 do task.wait()
    if not Player.Data.Race:FindFirstChild("Evolved") then
      if QuestProgress == 0 then
        local plrChar = Player and Player.Character and Player.Character.PrimaryPart
        
        if plrChar and (plrChar.Position - Vector3.new(-2777, 73, -3570)).Magnitude < 5 then
          FireRemote("Alchemist", "2")
        else
          PlayerTP(CFrame.new(-2777, 73, -3570))
        end
      elseif QuestProgress == 1 then
        
        local plrBag = Player:FindFirstChild("Backpack")
        local plrChar = Player.Character
        
        if plrChar:FindFirstChild("Flower 1") then
          plrChar["Flower 1"].Parent = plrBag
        elseif plrChar:FindFirstChild("Flower 2") then
          plrChar["Flower 2"].Parent = plrBag
        elseif plrChar:FindFirstChild("Flower 3") then
          plrChar["Flower 3"].Parent = plrBag
        end
        
        if not plrBag:FindFirstChild("Flower 1") and workspace:FindFirstChild("Flower1") and workspace["Flower1"].Transparency ~= 1 then
          PlayerTP(workspace["Flower1"].CFrame)
        elseif not plrBag:FindFirstChild("Flower 2") and workspace:FindFirstChild("Flower2") and workspace["Flower2"].Transparency ~= 1 then
          PlayerTP(workspace["Flower2"].CFrame)
        elseif not plrBag:FindFirstChild("Flower 3") then
          local Enemie = GetEnemies({"Swan Pirate"})
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie)end)
          else
            TweenNPCSpawn({CFrame.new(778, 110, 1129), CFrame.new(1018, 110, 1128), CFrame.new(1020, 110, 1366), CFrame.new(1016, 110, 1115)}, "Swan Pirate")
          end
        elseif not plrBag:FindFirstChild("Flower 1") and workspace:FindFirstChild("Flower1") then
          PlayerTP(workspace["Flower1"].CFrame)
        elseif not plrBag:FindFirstChild("Flower 2") and workspace:FindFirstChild("Flower2") then
          PlayerTP(workspace["Flower2"].CFrame)
        end
      elseif QuestProgress == 2 then
        local plrChar = Player and Player.Character and Player.Character.PrimaryPart
        
        if plrChar and (plrChar.Position - Vector3.new(-2777, 73, -3570)).Magnitude < 5 then
          FireRemote("Alchemist","3")
        else
          PlayerTP(CFrame.new(-2777, 73, -3570))
        end
      end
    end
  end
end

local function AutoRengoku()
  while getgenv().AutoRengoku do task.wait()
    if VerifyNPC("Darkbeard") and getgenv().AutoDarkbeard then
    else
      if VerifyTool("Hidden Key") then
        EquipToolName("Hidden Key")PlayerTP(CFrame.new(6571, 299, -6968))
      elseif VerifyTool("Library Key") then
        EquipToolName("Library Key")PlayerTP(CFrame.new(6373, 293, -6839))
      elseif VerifyNPC("Awakened Ice Admiral") then
        local AwakenedIceAdmiral = GetEnemies({"Awakened Ice Admiral"})
        if AwakenedIceAdmiral and AwakenedIceAdmiral:FindFirstChild("HumanoidRootPart") then
          PlayerTP(AwakenedIceAdmiral.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
        end
      else
        local Enemie = GetEnemies({"Arctic Warrior", "Snow Lurker"})
        if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone then
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          else
            PlayerTP(CFrame.new(5707, 28, -6402))
          end
        end
      end
      local EnemieBossW = Enemies:FindFirstChild("Awakened Ice Admiral")
      local EnemieBossR = ReplicatedStorage:FindFirstChild("Awakened Ice Admiral")
      local Enemie = GetProxyNPC()
    end
  end
end

local Inicio = Window:MakeTab({Title = "Home", Icon = "home"})
local Agradecimentos = Inicio:AddSection({Name = "Thanks"})
local Mensagem = Inicio:AddParagraph({Title = "Message", Text = "Make With ❤️"})

local Agradecimentos = Inicio:AddSection({Name = "Apsara Hub"})
local DiscordLink = Inicio:AddDiscordInvite({
	Name = "Discord Link",
	Logo = "",
	Invite = "https://discord.gg/TAAfRBGVeg"
})
local MainFarm = Window:MakeTab({"Farm", "Home"})
if Sea3 then
  local AutoSea = Window:MakeTab({"Sea", "Waves"})
  AutoSea:AddSection({"Kitsune"})
  local KILabel = AutoSea:AddParagraph({"Kitsune Island : Not Spawned"})
  local FullMoon = AutoSea:AddParagraph({""})
  spawn(function()
    while task.wait() do
        pcall(function()
             if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                        FullMoon:SetTitle("🌑 : Full Moon 100%")
            elseif game:GetService("Lighting").Sky.MoonTextureId=="rbxassetid://15493317929" then
                        FullMoon:SetTitle("🌌 : Blue Moon 100%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                        FullMoon:SetTitle("🌒 : Full Moon 75%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                        FullMoon:SetTitle("🌓 : Full Moon 50%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                        FullMoon:SetTitle("🌗 : Full Moon 25%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                        FullMoon:SetTitle("🌖 : Full Moon 15%")
                    else
                        FullMoon:SetTitle("🌚 : Full Moon 0%")
                    end
                end)
            end
end)
  local TimeKitsune = AutoSea:AddParagraph({"🧭 Waiting For Kitsune Island"})
spawn(function()
        pcall(function()
            while wait() do
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    TimeKitsune:SetTitle(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
                else
                    TimeKitsune:SetTitle("🧭 Waiting For Kitsune Island")
                end
            end
        end)
    end)
  AutoSea:AddToggle({Name = "Auto Kitsune Island",Callback = function(Value)
    getgenv().AutoKitsuneIsland = Value;AutoKitsuneIsland()
  end})
AutoSea:AddSlider({
	Name = "Set To Trade Azure Ember",
	Min = 0,
	Max = 30,
	Increase = 1,
	Default = 20,
	Flag = "Nahtradea26SafemqaaRaid6",
	Callback = function(Value)
     _G.SetToTradeAureEmber = Value
	end
})
function GetCountMaterials(MaterialName)
		local Inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
		for i, v in pairs(Inventory) do
			if v.Name == MaterialName then
				return v.Count
			end
		end
	end
  AutoSea:AddToggle({Name = "Auto Trade Azure Ember",Callback = function(Value)
    getgenv().TradeAzureEmber = Value
    task.spawn(function()
      local Modules = ReplicatedStorage:WaitForChild("Modules", 9e9)
      local Net = Modules:WaitForChild("Net", 9e9)
      local KitsuneRemote = Net:WaitForChild("RF/KitsuneStatuePray", 9e9)
      
      while getgenv().TradeAzureEmber do task.wait()
      local AzureAvilable = GetCountMaterials("Azure Ember")
					if AzureAvilable >= _G.SetToTradeAureEmber then
        KitsuneRemote:InvokeServer()
        end
      end
    end)
  end})
  AutoSea:AddToggle({
	Name = "Teleport to Kitsune Island",
	Default = false,
	Callback = function(Value)
		getgenv().TpKitsune = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().TpKitsune then

pcall(function()


if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
PlayerTP(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame*CFrame.new(0,250,0))
end


 end)

end

end

end)

end)
AutoSea:AddToggle({
	Name = "Auto Collect Azure Ember",
	Default = false,
	Callback = function(Value)
		getgenv().CollectAzure = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().CollectAzure then

pcall(function()


local Players = game.Players

local Player = Players.LocalPlayer



local toMe = game:GetService("Workspace").EmberTemplate.Part



function telePlr()

   

   Player.Character.HumanoidRootPart.CFrame = CFrame.new(toMe.Position)

   

   end



telePlr()



 end)

end

end

end)

end)
  AutoSea:AddToggle({
	Name = "Esp Kitsune",
	Default = false,
	Callback = function(Value)
		getgenv().EspKitsune = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EspKitsune then

pcall(function()


UpdateIslandKisuneESP() 


 end)

end

end

end)

end)

function UpdateIslandKisuneESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if getgenv().EspKitsune then 
                    if v.Name == "Kitsune Island" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                    v['NameEsp'].TextLabel.Text = ('Kitsune Island Here!!')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end
  task.spawn(function()
    local Map = workspace:WaitForChild("Map", 9e9)
    task.spawn(function()
      while task.wait() do
        if Map:FindFirstChild("KitsuneIsland") then
          local plrPP = Player.Character and Player.Character.PrimaryPart
          if plrPP then
            Distance = tostring(math.floor((plrPP.Position - Map.KitsuneIsland.WorldPivot.p).Magnitude / 3))
          end
        end
      end
    end)
    
    while task.wait() do
      if Map:FindFirstChild("KitsuneIsland") then
        KILabel:SetTitle("🎇 Check Kitsune Island : Spawned✅ | Distance : " .. Distance)
      else
        KILabel:SetTitle("🎇 Check Kitsune Island : Not Spawned❌")
      end
    end
  end)
  AutoSea:AddSection({"Sea"})
  AutoSea:AddToggle({Name = "Auto Farm Sea",Callback = function(Value)
    getgenv().AutoFarmSea = Value;AutoFarmSea()
  end})
  AutoSea:AddButton({Name = "Buy New Boat",Callback = function()
    BuyNewBoat()
  end})
  AutoSea:AddSection({"Material"})
  AutoSea:AddToggle({"Auto Wood Planks", false, function(Value)
    getgenv().AutoWoodPlanks = Value
    task.spawn(function()
      local Map = workspace:WaitForChild("Map", 9e9)
      local BoatCastle = Map:WaitForChild("Boat Castle", 9e9)
      
      local function TreeModel()
        for _,Model in pairs(BoatCastle["IslandModel"]:GetChildren()) do
          if Model.Name == "Model" and Model:FindFirstChild("Tree") then
            return Model
          end
        end
      end
      
      local function GetTree()
        local Tree = TreeModel()
        if Tree then
          local Nearest = math.huge
          local selected
          for _,tree in pairs(Tree:GetChildren()) do
            local plrPP = Player.Character and Player.Character.PrimaryPart
            if tree and tree.PrimaryPart and tree.PrimaryPart.Anchored then
              if plrPP and (plrPP.Position - tree.PrimaryPart.Position).Magnitude < Nearest then
                Nearest = (plrPP.Position - tree.PrimaryPart.Position).Magnitude
                selected = tree
              end
            end
          end
          return selected
        end
      end
      
      local RandomEquip = ""
      task.spawn(function()
        while getgenv().AutoWoodPlanks do
          if VerifyToolTip("Melee") then
            RandomEquip = "Melee"task.wait(2)
          end
          if VerifyToolTip("Blox Fruit") then
            RandomEquip = "Blox Fruit"task.wait(3)
          end
          if VerifyToolTip("Sword") then
            RandomEquip = "Sword"task.wait(2)
          end
          if VerifyToolTip("Gun") then
            RandomEquip = "Gun"task.wait(2)
          end
        end
      end)
      
      while getgenv().AutoWoodPlanks do task.wait()
        local Tree = GetTree()EquipToolTip(RandomEquip)
        
        if Tree and Tree.PrimaryPart then
          PlayerTP(Tree.PrimaryPart.CFrame)
          local plrPP = Player.Character and Player.Character.PrimaryPart
          if plrPP and (plrPP.Position - Tree.PrimaryPart.Position).Magnitude < 10 then
            if getgenv().SeaSkillZ then
              KeyboardPress("Z")
            end
            if getgenv().SeaSkillX then
              KeyboardPress("X")
            end
            if getgenv().SeaSkillC then
              KeyboardPress("C")
            end
            if getgenv().SeaSkillV then
              KeyboardPress("V")
            end
            if getgenv().SeaSkillF then
              KeyboardPress("F")
            end
            if getgenv().SeaAimBotSkill then
              AimBotPart(Tree.PrimaryPart)
            end
          end
        end
      end
    end)
  end})
  AutoSea:AddSection({"Panic Mode"})
  AutoSea:AddSlider({Name = "Select Health",Min = 20,Max = 70,Default = 25,Callback = function(Value)
    getgenv().HealthPanic = Value
  end})
  AutoSea:AddToggle({"Panic Mode", true, function(Value)
    getgenv().PanicMode = Value
  end, "Sea/PanicMode"})
  AutoSea:AddSection({"Farm Select"})
  AutoSea:AddParagraph({"Fish"})
  AutoSea:AddToggle({Name = "Terrorshark", Flag = "Sea/TerrorShark", Default = true,Callback = function(Value)
    getgenv().Terrorshark = Value
  end})
  AutoSea:AddToggle({Name = "Piranha", Flag = "Sea/Piranha", Default = true,Callback = function(Value)
    getgenv().Piranha = Value
  end})
  AutoSea:AddToggle({Name = "Fish Crew Member", Flag = "Sea/FishCrewMember", Default = true,Callback = function(Value)
    getgenv().FishCrewMember = Value
  end})
  AutoSea:AddToggle({Name = "Shark", Flag = "Sea/Shark", Default = true,Callback = function(Value)
    getgenv().Shark = Value
  end})
  AutoSea:AddParagraph({"Boats"})
  AutoSea:AddToggle({Name = "Pirate Brigade", Flag = "Sea/PirateBrigade", Default = true,Callback = function(Value)
    getgenv().PirateBrigade = Value
  end})
  AutoSea:AddToggle({Name = "Pirate Grand Brigade", Flag = "Sea/PirateGrandBrigade", Default = true,Callback = function(Value)
    getgenv().PirateGrandBrigade = Value
  end})
  AutoSea:AddToggle({Name = "Fish Boat", Flag = "Sea/FishBoat", Default = true,Callback = function(Value)
    getgenv().FishBoat = Value
  end})
AutoSea:AddSection({"Frozen Dimension"})
local FrozenIsland = AutoSea:AddParagraph({""})
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenIsland:SetTitle("♾️ Check Frozen Dimension : Spawned✅")
      else
        FrozenIsland:SetTitle("♾️ Check Frozen Dimensiin : Not Spawned❌")
            end
        end
    end)
end)
local Spy = AutoSea:AddParagraph({""})
spawn(function()
            while wait() do
                pcall(function()
                    BribeLevel = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan","1")
                end)
            end
        end)
        spawn(function()
            while wait() do
                pcall(function()
                    if BribeLevel == -1 then
                        Spy:SetTitle("Bribe: Complete 20 Sea Events")
                    else
                        Spy:SetTitle("Bribe: " .. tostring(BribeLevel) .. '/5')
                    end
                end)
            end
        end)        

AutoSea:AddToggle({
	Name = "Auto Kill Leviathan",
	Default = false,
	Callback = function(Value)
		getgenv().KillLeavia = Value
	end
})

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)
Skillz = true
Skillx = true
Skillc = true
Skillv = true
spawn(function()
    while wait() do
        pcall(function()
            if AutoSkill then
                if Skillz then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if Skillx then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                if Skillc then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if Skillv then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if getgenv().KillLeavia then
            pcall(function()
for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                        if v.Name == "Leviathan" and v:FindFirstChild("HumanoidRootPart") then
                            repeat wait()
                                PlayerTP(v.HumanoidRootPart.CFrame * CFrame.new(0,500,0))
                                pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
                                AutoSkill = true
                                AimBotSkillPosition = v.HumanoidRootPart
                                Skillaimbot = true
                            until not v:FindFirstChild("HumanoidRootPart") or getgenv().KillLeavia == false
                            AutoSkill = false
                            Skillaimbot = false
                        end
                    end
            end)
        end
    end
end)

AutoSea:AddToggle({
	Name = "Auto Bribe",
	Default = false,
	Callback = function(Value)
		getgenv().Spy = Value
	end
})

spawn(function()
    while wait() do
        if getgenv().Spy then
            pcall(function()
            if BribeLevel < 5 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan","2")
                end
            end)
        end
    end
end)

AutoSea:AddToggle({
	Name = "Teleport to Frozen Dimension",
	Default = false,
	Callback = function(Value)
		getgenv().AutoFrozenDimension = Value
	end
})

spawn(function()
    while wait() do
        if getgenv().AutoFrozenDimension then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                    PlayerTP(workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension").CFrame*CFrame.new(0,250,0))
                end
            end)
        end
    end
end)

AutoSea:AddToggle({
	Name = "Esp Frozen Dimension",
	Default = false,
	Callback = function(Value)
		getgenv().EspFrozen = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EspFrozen then

pcall(function()


UpdateIslandFrozenESP() 


 end)

end

end

end)

end)

function UpdateIslandFrozenESP() 
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if getgenv().EspFrozen then 
                    if v.Name == "Frozen Dimension" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                    v['NameEsp'].TextLabel.Text = ('Frozen Dimension Here!!')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end
  AutoSea:AddSection({"Skill"})
  AutoSea:AddToggle({Name = "AimBot Skill Enemie", Flag = "Mastery/Aimbot", Default = true,Callback = function(Value)
    getgenv().SeaAimBotSkill = Value
  end})
  AutoSea:AddToggle({Name = "Skill Z", Flag = "Mastery/Z", Default = true,Callback = function(Value)
    getgenv().SeaSkillZ = Value
  end})
  AutoSea:AddToggle({Name = "Skill X", Flag = "Mastery/X", Default = true,Callback = function(Value)
    getgenv().SeaSkillX = Value
  end})
  AutoSea:AddToggle({Name = "Skill C", Flag = "Mastery/C", Default = true,Callback = function(Value)
    getgenv().SeaSkillC = Value
  end})
  AutoSea:AddToggle({Name = "Skill V", Flag = "Mastery/V", Default = true,Callback = function(Value)
    getgenv().SeaSkillV = Value
  end})
  AutoSea:AddToggle({Name = "Skill F", Flag = "Mastery/F", Callback = function(Value)
    getgenv().SeaSkillF = Value
  end})
  AutoSea:AddSection({"NPCs"})
  AutoSea:AddToggle({Name = "Teleport To Shark Hunter",Callback = function(Value)
    getgenv().NPCtween = Value
    task.spawn(function()
      while getgenv().NPCtween do task.wait()
        PlayerTP(CFrame.new(-16526, 108, 752))
      end
    end)
  end})
  AutoSea:AddToggle({Name = "Teleport To Beast Hunter",Callback = function(Value)
    getgenv().NPCtween = Value
    task.spawn(function()
      while getgenv().NPCtween do task.wait()
        PlayerTP(CFrame.new(-16281, 73, 263))
      end
    end)
  end})
  AutoSea:AddToggle({Name = "Teleport To Spy",Callback = function(Value)
    getgenv().NPCtween = Value
    task.spawn(function()
      while getgenv().NPCtween do task.wait()
        PlayerTP(CFrame.new(-16471, 528, 539))
      end
    end)
  end})
  AutoSea:AddSection({"Configs"})
  AutoSea:AddDropdown({
    Name = "Tween Sea Level",
    Options = {"1", "2", "3", "4", "5", "6", "inf"},
    Default = {"6"},
    Flag = "Sea/SeaLevel",
    Callback = function(Value)
      getgenv().SeaLevelTP = Value
    end
  })
  AutoSea:AddSlider({
    Name = "Boat Tween Speed",
    Min = 100,
    Max = 300,
    Increase = 10,
    Default = 250,
    Flag = "Sea/BoatSpeed",
    Callback = function(Value)
      getgenv().SeaBoatSpeed = Value
    end
  })
end
if Sea3 then
  local MirageTab = Window:MakeTab({"Race V4", "User"})
MirageTab:AddSection({"Mirage"})
  local FullMoon = MirageTab:AddParagraph({""})
  spawn(function()
    while task.wait() do
        pcall(function()
             if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                        FullMoon:SetTitle("🌑 : Full Moon 100%")
            elseif game:GetService("Lighting").Sky.MoonTextureId=="rbxassetid://15493317929" then
                        FullMoon:SetTitle("🌌 : Blue Moon 100%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                        FullMoon:SetTitle("🌒 : Full Moon 75%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                        FullMoon:SetTitle("🌓 : Full Moon 50%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                        FullMoon:SetTitle("🌗 : Full Moon 25%")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                        FullMoon:SetTitle("🌖 : Full Moon 15%")
                    else
                        FullMoon:SetTitle("🌚 : Full Moon 0%")
                    end
                end)
            end
end)
local Mirragecheck = MirageTab:AddParagraph({""})
spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
                Mirragecheck:SetTitle("🏝️: Mirage Island is Spawned✅️")
            else
                Mirragecheck:SetTitle('❌: Mirage Island Not Found')
            end
        end
    end)
end)
MirageTab:AddToggle({Name = "Auto Mirage Island",Callback = function(Value)
    getgenv().AutoMirageIsland = Value;AutoKitsuneIsland()
  end})
MirageTab:AddToggle({
	Name = "Auto Teleport to Mirage",
	Default = false,
	Callback = function(Value)
		getgenv().TpMirage = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().TpMirage then

pcall(function()

	   if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                PlayerTP(workspace.Map.MysticIsland.PrimaryPart.CFrame*CFrame.new(0,250,0))
end



 end)

end

end

end)

end)

MirageTab:AddToggle({
	Name = "Auto Pull Lever",
	Default = false,
	Callback = function(Value)
	   getgenv().PullLever = Value
	end
})

spawn(function()

pcall(function()

while wait(0.1) do

if getgenv().PullLever then

pcall(function()


if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") == true and game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt").Enabled == true then
					fireproximityprompt(game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt"),0)
				end

 end)

end

end

end)

end)

MirageTab:AddToggle({
	Name = "Auto Teleport To Advanced Fruit Dealer",
	Default = false,
	Callback = function(Value)
	   getgenv().TpAdvanced = Value
	end
})

spawn(function()

pcall(function()

while wait(0.1) do

if getgenv().TpAdvanced then

pcall(function()


 if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
							if v.Name == "Advanced Fruit Dealer" then
								PlayerTP(v.HumanoidRootPart.CFrame* CFrame.new(0,0,0))
							end
						end
                end

 end)

end

end

end)

end)

MirageTab:AddToggle({
	Name = "Esp Mirage Island",
	Default = false,
	Callback = function(Value)
		getgenv().EspMirage = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EspMirage then

pcall(function()


UpdateIslandMirageESP() 


 end)

end

end

end)

end)

function UpdateIslandMirageESP() 
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if getgenv().EspMirage then 
                    if v.Name == "Mirage Island" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                    v['NameEsp'].TextLabel.Text = ('Mirage Here!!')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function CamToMoon()
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
end


MirageTab:AddToggle({
	Name = "Auto Collect Blue Gear",
	Default = false,
	Callback = function(Value)
		getgenv().GetGear = Value
	end
})

spawn(function()

pcall(function()

while wait(0.1) do

if getgenv().GetGear then

pcall(function()


if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
						for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
							if v:IsA("MeshPart") then
								if v.Material == Enum.Material.Neon then
									PlayerTP(v.CFrame)
									end
									end
									end
									end

 end)

end

end

end)

end)

MirageTab:AddToggle({
	Name = "Auto Lock Cam to Moon+Enable Race Ability",
	Default = false,
	Callback = function(Value)
	   getgenv().LockCam = Value
	end
})

spawn(function()

pcall(function()

while wait(0.1) do

if getgenv().LockCam then

pcall(function()


game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
CamToMoon()

 end)

end

end

end)

end)

MirageTab:AddToggle({
	Name = "Auto Collect Chest Mirage",
	Default = false,
	Callback = function(Value)
	   getgenv().AutoChestMirage = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoChestMirage then

pcall(function()

if game.Workspace.Map:FindFirstChild("MysticIsland") then
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland.Chests:GetChildren()) do 
				if v.Name == "DiamondChest" or v.Name == "FragChest" then
				if v:IsA("BasePart") and v.Transparency < 1 then
			PlayerTP(v.CFrame)
					end
				end
				end
				end


 end)

end

end

end)

end)

MirageTab:AddButton({
	Name = "Check Moon [Image]",
	Callback = function()
local ScreenGui = Instance.new("ScreenGui")
		local MoonImg = Instance.new("ImageLabel")

		ScreenGui.Name = "FullMoonLibrary"
		ScreenGui.Parent = game:GetService("CoreGui")
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		MoonImg.Name = "MoonImg"
		MoonImg.Parent = ScreenGui
		MoonImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MoonImg.BackgroundTransparency = 1.000
		MoonImg.Size = UDim2.new(0, 100, 0, 100)
		MoonImg.Image = game:GetService("Lighting").Sky.MoonTextureId

		wait(5)

		game:GetService("CoreGui"):FindFirstChild("FullMoonLibrary"):Destroy() 
	end
})

  MirageTab:AddSection({"Race V4"})
  function CheckAcientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local v227 = nil
    local v228 = nil
    local v229 = nil
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
      else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end

local V4 = MirageTab:AddParagraph({""})
spawn(function()
    while wait() do
        pcall(function()
            V4:SetTitle("Ancient One Status : " .. tostring(CheckAcientOneStatus()))
        end)
    end
end)
local Race = MirageTab:AddParagraph({""})
spawn(function()
    while wait() do
        pcall(function()
            Race:SetTitle("Your Race: "..(game:GetService("Players").LocalPlayer.Data.Race.Value))
        end)
    end
end)
MirageTab:AddDropdown({
	Name = "Select Gear",
	Options = {"Gear1", "Gear2" , "Gear3","Gear4","Gear5"},
	Default = "",
	Flag = "NahGearj",
	Callback = function(Value)
		getgenv().SelectGear = Value
	end
})
MirageTab:AddToggle({
	Name = "Auto Choose Gear (Select Gear)",
	Default = false,
	Callback = function(Value)
		getgenv().ChooseGear = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().ChooseGear then

pcall(function()

InstantChooseGear()

 end)

end

end

end)

end)
function fireremotechoosegear()
        if getgenv().SelectGear == "Gear1" then
            print("Gear3")
            local args = {[1] = "TempleClock", [2] = "SpendPoint"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif getgenv().SelectGear == "Gear2" then
            print("Gear2")
            local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear2", [4] = "Omega"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif getgenv().SelectGear == "Gear4" then
            print("Gear4")
            if condimemeaymeci.B == 2 then
                print("Gear 4 Omega")
                local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Omega"}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            elseif condimemeaymeci.A == 2 then
                print("Gear 4 Alpha")
                local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Alpha"}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            elseif condimemeaymeci.A < 2 then
                v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
                condimemeaymeci = v14.RaceDetails
                print("Gear 4 Alpha")
                local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear4", [4] = "Alpha"}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            end
        elseif getgenv().SelectGear == "Gear3" then
            print("Gear3")
            local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear3", [4] = "Alpha"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        elseif getgenv().SelectGear == "Gear5" then
            print("Gear5")
            local args = {[1] = "TempleClock", [2] = "SpendPoint", [3] = "Gear5", [4] = "Default"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                unpack(args)
            )
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Select Gear", Text = v, Duration = 30})
    end
function CheckAndTweenTemple()
TempleOfTimeCFrame = CFrame.new(28734.3945,14888.2324,-109.071777,-0.650207579,4.1780531e-08,-0.759756625,1.97876595e-08,1,3.80575109e-08,0.759755,9.71147784e-09,-0.650207579)
    if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
        TweenTemple()
    end
    if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
        TweenTemple()
    end
end
function TweenTemple()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
        "requestEntrance",
        Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
    )
end
function InstantChooseGear()
        v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
        if v14 and v14.HadPoint then
            condimemeaymeci = v14.RaceDetails
            CheckAndTweenTemple()
            PlayerTP(workspace.Map["Temple of Time"].Prompt.CFrame)
            if
                (workspace.Map["Temple of Time"].Prompt.Position -
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 3
             then
                wait(1)
                fireproximityprompt(workspace.Map["Temple of Time"].Prompt.ProximityPrompt)
                wait(5)
                for r, v in pairs(workspace.Map["Temple of Time"].InnerClock:GetChildren()) do
                    if v:FindFirstChild("Highlight") and v.Highlight.Enabled then
                        print(v.Name)
                        spawn(
                            function()
                                fireremotechoosegear()
                            end
                        )
                    end
                end
            end
            task.wait(300)
        else
            game:GetService("StarterGui"):SetCore(
                "SendNotification",
                {Title = "You hadnt point", Text = "You hadnt point to choose", Duration = 30}
            )
            task.wait(30)
        end
    end
  MirageTab:AddToggle({"Auto Finish Trial", false, function(Value)
    getgenv().AutoFinishTrial = Value
    task.spawn(function()
      local PlayerRace
      task.spawn(function()
        while getgenv().AutoFinishTrial do task.wait()
          PlayerRace = Player.Data.Race.Value
        end
      end)
      
      while getgenv().AutoFinishTrial do task.wait()
        if PlayerRace and typeof(PlayerRace) == "string" then
          if PlayerRace == "Cyborg" then
            PlayerTP(CFrame.new(28654, 14898, -30))
          elseif PlayerRace == "Ghoul" then
            KillAura()
          elseif PlayerRace == "Human" then
            KillAura()
          elseif PlayerRace == "Mink" then
            for _,part in pairs(workspace:GetDescendants()) do
              if part.Name == "StartPoint" then
                PlayerTP(part.CFrame)
              end
            end
            elseif PlayerRace == "Fishman" then
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
           for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do 
						if v.Name ==  "SeaBeast" and v:FindFirstChild("HumanoidRootPart") then
							PlayerTP(v.HumanoidRootPart.CFrame)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end
					end
					end
          elseif PlayerRace == "Skypiea" then
            pcall(function()
              for _,part in pairs(workspace.Map.SkyTrial.Model:GetDescendants()) do
                if part.Name ==  "snowisland_Cylinder.081" then
                  PlayerTP(part.CFrame)
                end
              end
            end)
          end
        end
      end
    end)
  end})
MirageTab:AddToggle({
	Name = "Auto Kill Player",
	Default = false,
	Callback = function(Value)
		getgenv().killplayertrain = Value
	end
})

spawn(function()
	while wait() do
		if getgenv().killplayertrain then
			if game:GetService("Workspace").Map["Temple of Time"].FFABorder.Forcefield.Transparency < 1 then
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
			for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
			    if v.Name ~= game.Players.LocalPlayer.Name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
			        if v.Humanoid.Health > 0 then
			            repeat wait()
			              pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
			                PlayerTP(v.HumanoidRootPart.CFrame)
			                UseskillKill = true
			                v.HumanoidRootPart.CanCollide = false
			                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
			            until not getgenv().killplayertrain or not v.Parent or v.Humanoid.Health <= 0 
			            UseskillKill = false
			        end
			    end
			end
		end
		end
		end
	end
end)
spawn(function()
    while wait() do
		pcall(function()
			if UseskillKill then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
			end
		end)
    end
end)
MirageTab:AddToggle({
	Name = "Auto Die After Trial",
	Default = false,
	Callback = function(Value)
	   getgenv().DieTrial = Value
	end
})

spawn(function()

pcall(function()

while wait(0.1) do

if getgenv().DieTrial then

pcall(function()


if game:GetService("Workspace").Map["Temple of Time"].FFABorder.Forcefield.Transparency < 1 then
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
					local Humn = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
					if Humn then
						Humn.Health = 0
					end
				end
			end

 end)

end

end

end)

end)
MirageTab:AddToggle({
	Name = "Auto Upgrade Race",
	Default = false,
	Callback = function(Value)
		getgenv().BuyGear = Value
	end
})

spawn(function()

pcall(function()

while wait(0.1) do

if getgenv().BuyGear then

pcall(function()


local args = {
    [1] = "UpgradeRace",
    [2] = "Buy"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))


 end)

end

end

end)

end)

MirageTab:AddSection({"Temple Of Time"})
MirageTab:AddButton({"Teleport To Temple of Time", function()
    for i = 1, 5 do task.wait()
      Player.Character:SetPrimaryPartCFrame(CFrame.new(28286, 14897, 103))
    end
  end})
end

local QuestsTabs = Window:MakeTab({"Quests/Items", "Swords"})
local FruitAndRaid = Window:MakeTab({"Fruit/Raid", "Cherry"})
local StatsTab = Window:MakeTab({"Stats", "signal"})
StatsTab:AddSection({"Stats"})
local Pointstat = StatsTab:AddParagraph({""})
local Melee = StatsTab:AddParagraph({""})
local Defense = StatsTab:AddParagraph({""})
local Sword = StatsTab:AddParagraph({""})
local Gun = StatsTab:AddParagraph({""})
local Fruit = StatsTab:AddParagraph({""})

spawn(function()
	while wait() do
		pcall(function()
			Pointstat:SetTitle("Stat Points : " .. tostring((game:GetService("Players")).LocalPlayer.Data.Points.Value));
		end);
	end;
end);

spawn(function()
	while wait() do
		pcall(function()
			Melee:SetTitle("Melee : " .. game.Players.localPlayer.Data.Stats.Melee.Level.Value);
		end);
	end;
end);

spawn(function()
	while wait() do
		pcall(function()
			Defense:SetTitle("Defense : " .. game.Players.localPlayer.Data.Stats.Defense.Level.Value);
		end);
	end;
end);

spawn(function()
	while wait() do
		pcall(function()
			Sword:SetTitle("Sword : " .. game.Players.localPlayer.Data.Stats.Sword.Level.Value);
		end);
	end;
end);

spawn(function()
	while wait() do
		pcall(function()
			Gun:SetTitle("Gun : " .. game.Players.localPlayer.Data.Stats.Gun.Level.Value);
		end);
	end;
end);

spawn(function()
	while wait() do
		pcall(function()
			Fruit:SetTitle("Fruit : " .. game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value);
		end);
	end;
end);
  
StatsTab:AddToggle({
	Name = "Auto Stats Melee",
	Default = false,
	Callback = function(Value)
		getgenv().AutoStats1 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoStats1 then

pcall(function()


local a = {[1] = "AddPoint", [2] = "Melee", [3] = 5}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))


 end)

end

end

end)

end)

StatsTab:AddToggle({
	Name = "Auto Stats Defense",
	Default = false,
	Callback = function(Value)
		getgenv().AutoStats2 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoStats2 then

pcall(function()


local a = {[1] = "AddPoint", [2] = "Defense", [3] = 5}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))


 end)

end

end

end)

end)

StatsTab:AddToggle({
	Name = "Auto Stats Sword",
	Default = false,
	Callback = function(Value)
		getgenv().AutoStats3 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoStats3 then

pcall(function()


local a = {[1] = "AddPoint", [2] = "Sword", [3] = 5}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))


 end)

end

end

end)

end)

StatsTab:AddToggle({
	Name = "Auto Stats Gun",
	Default = false,
	Callback = function(Value)
		getgenv().AutoStats4 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoStats4 then

pcall(function()


local a = {[1] = "AddPoint", [2] = "Gun", [3] = 5}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))


 end)

end

end

end)

end)

StatsTab:AddToggle({
	Name = "Auto Stats Demon Fruit",
	Default = false,
	Callback = function(Value)
		getgenv().AutoStats5 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoStats5 then

pcall(function()


local a = {[1] = "AddPoint", [2] = "Demon Fruit", [3] = 5}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))


 end)

end

end

end)

end)
  
local Teleport = Window:MakeTab({"Teleport", "Locate"})
local Visual = Window:MakeTab({"Visual", "User"})
local Shop = Window:MakeTab({"Shop", "ShoppingCart"})
local Misc = Window:MakeTab({"Misc", "Settings"})

MainFarm:AddSection({"Farm"})
MainFarm:AddDropdown({
  Name = "Select Weapon",
  Options = {"Melee", "Sword", "Blox Fruit"},
  Default = {"Melee"},
  Flag = "Main/FarmTool",
  Callback = function(Value)
    getgenv().FarmTool = Value
  end
})

MainFarm:AddToggle({"Auto Farm Level", false, function(Value)
  getgenv().AutoFarm_Level = Value;AutoFarm_Level()
end, Description = "Ez <font color='rgb(253, 218, 13)'>Max Level</font>"})
if PlayerLevel.Value >= 2400 and Sea3 then
  MainFarm:AddToggle({
    Name = "Start Multi Farm",
    Callback = function(Value)
      table.foreach(AFKOptions, function(_,Val)
        task.spawn(function()
          Val:Set(Value)
        end)
      end)
    end
  })
end
if PlayerLevel.Value <= 400 and Sea1 then
MainFarm:AddToggle({
	Name = "Fast Level Farm",
	Default = false,
	Callback = function(Value)
		getgenv().AutoPlayerHunter = Value
	end
})
spawn(function()
        pcall(function()
            while wait(.1) do
                if getgenv().AutoPlayerHunter then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)
	spawn(function()
		while wait() do
			if getgenv().AutoPlayerHunter then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
				else
					for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
							repeat wait()	pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
								game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
								PlayerTP(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							until getgenv().AutoPlayerHunter == false or v.Humanoid.Health <= 0
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
					end
				end
			end
		end
	end)
end
MainFarm:AddToggle({
	Name = "Auto Use Skills",
	Default = false,
	Callback = function(Value)
		getgenv().AutoVojo = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().AutoVojo then

pcall(function()

SkillKey = {
        Z = true,
        V = true,
        C = true,
        X = true
    }
local VirtualInputManager = game:GetService("VirtualInputManager")
local function AutoSkill()
    for key, isEnabled in pairs(SkillKey) do
        if isEnabled then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[key], false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[key], false, game)
        end
    end
end
            AutoSkill()


 end)

end

end

end)

end)
MainFarm:AddToggle({"Auto Farm Nearest", false, function(Value)
  getgenv().AutoFarmNearest = Value;AutoFarmNearest()
end})
if Sea3 then
  table.insert(AFKOptions, MainFarm:AddToggle({"Auto Pirates Sea", false, function(Value)
    getgenv().AutoPiratesSea = Value;AutoPiratesSea()
  end}))
elseif Sea2 then
  MainFarm:AddToggle({"Auto Factory", false, function(Value)
    getgenv().AutoFactory = Value;AutoFactory()
  end})
end

--[[MainFarm:AddSection({"Christmas"})

local TimeLabel = MainFarm:AddLabel({"Text", "Time for next gift : nil"})

task.spawn(function()
  local Counter = workspace:WaitForChild("Countdown", 9e9)
  local SurfaceGui = Counter:WaitForChild("SurfaceGui", 9e9)
  local TextLabel = SurfaceGui:WaitForChild("TextLabel", 9e9)
  
  while task.wait() do
    TimeLabel:SetTitle("Time to Next gift : " .. TextLabel.Text)
    
    if TextLabel.Text ~= "STARTING!" then
      local TimerL, Timer = TextLabel.Text:split(":"), 0
      if tonumber(TimerL[2]) >= 1 then
        Timer = tonumber(TimerL[2]) * 60
      end
      Timer = Timer + tonumber(TimerL[3])
      
      getgenv().TimeToGift = Timer
    else
      getgenv().TimeToGift = 0
    end
  end
end)

if PlayerLevel.Value >= MaxLavel and Sea3 then
  MainFarm:AddToggle({"Auto Farm Candy", false, function(Value)
    getgenv().AutoCandy = Value
    task.spawn(function()
      local Enemies1 = workspace:WaitForChild("Enemies", 9e9)
      local Enemies2 = ReplicatedStorage
      
      local function GetProxyNPC()
        local Distance = math.huge
        local NPC = nil
        local plrChar = Player and Player.Character and Player.Character.PrimaryPart
        
        for _,npc in pairs(Enemies1:GetChildren()) do
          if npc.Name == "Isle Champion" or npc.Name == "Sun-kissed Warrior" or npc.Name == "Island Boy" or npc.Name == "Isle Outlaw" then
            if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
              Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
              NPC = npc
            end
          end
        end
        for _,npc in pairs(Enemies2:GetChildren()) do
          if npc.Name == "Isle Champion" or npc.Name == "Sun-kissed Warrior" or npc.Name == "Island Boy" or npc.Name == "Isle Outlaw" then
            if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
              Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
              NPC = npc
            end
          end
        end
        return NPC
      end
      
      while getgenv().AutoCandy do task.wait()
        if Configure("Candy") then
        else
          local Enemie = GetProxyNPC()
          if Enemie then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          end
        end
      end
    end)
  end})
end

MainFarm:AddToggle({"Auto Gift", false, function(Value)
  getgenv().AutoGift = Value
  task.spawn(function()
    local function GetGift()
      for _,part in pairs(workspace["_WorldOrigin"]:GetChildren()) do
        if part.Name == "Present" then
          if part:FindFirstChild("Box") and part.Box:FindFirstChild("ProximityPrompt") then
            return part, part.Box.ProximityPrompt
          end
        end
      end
    end
    
    while getgenv().AutoGift do task.wait()
      local Gift, Prompt = GetGift()
      
      if Gift and Gift.PrimaryPart then
        PlayerTP(Gift.PrimaryPart.CFrame)
        if Prompt then
          fireproximityprompt(Prompt)
        end
      elseif getgenv().TimeToGift < 90 then
        if Sea3 then
          PlayerTP(CFrame.new(-1076, 14, -14437))
        elseif Sea2 then
          PlayerTP(CFrame.new(-5219, 15, 1532))
        elseif Sea1 then
          PlayerTP(CFrame.new(1007, 15, -3805))
        end
      end
    end
  end)
end})]]

if Sea3 then
  MainFarm:AddSection({"Bone"})
local BoneCheck = MainFarm:AddParagraph({""})
spawn(function()
    while wait() do
        pcall(function()
            BoneCheck:SetTitle("Bones : "..(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check")))
        end)
    end
end)
  table.insert(AFKOptions, MainFarm:AddToggle({
    Name = "Auto Farm Bone",
    Callback = function(Value)
      getgenv().AutoFarmBone = Value
      AutoFarmBone()
    end
  }))
  
  table.insert(AFKOptions, MainFarm:AddToggle({
    Name = "Auto Soul Reaper Fully",
    Callback = function(Value)
      getgenv().AutoSoulReaper = Value
      AutoSoulReaper()
    end
  }))

MainFarm:AddToggle({
	Name = "Auto Try Lucky",
	Default = false,
	Callback = function(Value)
		getgenv().Trylucky = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().Trylucky then

pcall(function()


game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2)



 end)

end

end

end)

end)

MainFarm:AddToggle({
	Name = "Auto Pray",
	Default = false,
	Callback = function(Value)
		getgenv().Pray = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().Pray then

pcall(function()


game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 1)



 end)

end

end

end)

end)

MainFarm:AddToggle({
	Name = "Auto Trade Bone Until Get Hallow Essence",
	Default = false,
	Callback = function(Value)
		getgenv().TradeBone2 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().TradeBone2 then

pcall(function()


if not VerifyTool("Hallow Essence") then
        FireRemote("Bones", "Buy", 1, 1)
        end



 end)

end

end

end)

end)

  table.insert(AFKOptions, MainFarm:AddToggle({
    Name = "Auto Trade Bone",
    Callback = function(Value)
      getgenv().AutoTradeBone = Value
      while getgenv().AutoTradeBone do task.wait()
        FireRemote("Bones", "Buy", 1, 1)
      end
    end
  }))
  
elseif Sea2 then
  
  MainFarm:AddSection({"Ectoplasm"})
local EctoCheck = MainFarm:AddParagraph({""})
spawn(function()
    while wait() do
        pcall(function()
            EctoCheck:SetTitle("Ectoplasm : "..(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Check")))
        end)
    end
end)
  MainFarm:AddToggle({
    Name = "Auto Farm Ectoplasm",
    Callback = function(Value)
      getgenv().AutoFarmEctoplasm = Value
      AutoFarmEctoplasm()
    end
  })
end

MainFarm:AddSection({"Chest"})

MainFarm:AddToggle({
  Name = "Auto Chest < Tween >",
  Callback = function(Value)
    getgenv().AutoChestTween = Value
    AutoChestTween()
  end
})

MainFarm:AddToggle({
  Name = "Auto Chest < Bypass >",
  Callback = function(Value)
    getgenv().AutoChestBypass = Value
    AutoChestBypass()
  end
})

MainFarm:AddSection({"Bosses"})
local BossList = MainFarm:AddDropdown({
  Name = "Boss List",
  Callback = function(Value)
    getgenv().BossSelected = Value
  end
})
MainFarm:AddButton({
  Name = "Update Boss List",
  Callback = function()
    pcall(function()UpdateBossList()end)
  end
})

function UpdateBossList()
  local NewOptions = {}
  for ___,NameBoss in pairs(BossListT) do
    if VerifyNPC(NameBoss) then
      table.insert(NewOptions, NameBoss)
    end
  end
  BossList:Set(NewOptions, true)
end
UpdateBossList()

MainFarm:AddToggle({
  Name = "Auto Farm Boss Selected",
  Callback = function(Value)
    getgenv().AutoFarmBossSelected = Value
    AutoFarmBossSelected()
  end
})

MainFarm:AddToggle({
  Name = "Auto Farm All Boss",
  Callback = function(Value)
    getgenv().KillAllBosses = Value
    KillAllBosses()
  end
})

MainFarm:AddToggle({
  Name = "Auto Get Quest",
  Default = true,
  Callback = function(Value)
    getgenv().TakeQuestBoss = Value
  end
})

MainFarm:AddSection({"Material"})

local MaterialList = {}

if Sea1 then
  MaterialList = {
    "Angel Wings",
    "Leather + Scrap Metal",
    "Magma Ore",
    "Fish Tail"
  }
elseif Sea2 then
  MaterialList = {
    "Leather + Scrap Metal",
    "Magma Ore",
    "Mystic Droplet",
    "Radiactive Material",
    "Vampire Fang"
  }
elseif Sea3 then
  MaterialList = {
    "Leather + Scrap Metal",
    "Fish Tail",
    "Gunpowder",
    "Mini Tusk",
    "Conjured Cocoa",
    "Dragon Scale"
  }
end

MainFarm:AddDropdown({
  Name = "Material List",
  Options = MaterialList,
  Flag = "Material/Selected",
  Callback = function(Value)
    getgenv().MaterialSelected = Value
  end
})

MainFarm:AddToggle({
  Name = "Auto Farm Material",
  Callback = function(Value)
    getgenv().AutoFarmMaterial = Value
    AutoFarmMaterial()
  end
})

MainFarm:AddSection({"Mastery"})

MainFarm:AddSlider({
  Name = "Select Health",
  Min = 10,
  Max = 100,
  Default = 25,
  Callback = function(Value)
    getgenv().HealthSkill = Value
  end
})

MainFarm:AddDropdown({
  Name = "Select Weapon",
  Options = {"Melee", "Sword" , "Gun", "Blox Fruit"},
  Default = {"Blox Fruit"},
  Callback = function(Value)
    getgenv().ToolMastery = Value
  end
})

MainFarm:AddToggle({
  Name = "Auto Farm Mastery",
  Callback = function(Value)
    getgenv().AutoFarmMastery = Value
    AutoFarmMastery()
  end
})

MainFarm:AddSection({"Skill"})

MainFarm:AddToggle({
  Name = "AimBot Skill Enemie",
  Flag = "Sea/Aimbot",
  Default = true,
  Callback = function(Value)
    getgenv().AimBotSkill = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill Z",
  Flag = "Sea/Z",
  Default = true,
  Callback = function(Value)
    getgenv().SkillZ = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill X",
  Flag = "Sea/X",
  Default = true,
  Callback = function(Value)
    getgenv().SkillX = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill C",
  Flag = "Sea/C",
  Default = true,
  Callback = function(Value)
    getgenv().SkillC = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill V",
  Flag = "Sea/V",
  Default = true,
  Callback = function(Value)
    getgenv().SkillV = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill F",
  Flag = "Sea/F",
  Callback = function(Value)
    getgenv().SkillF = Value
  end
})

FruitAndRaid:AddSection({"Fruits"})
local Fruit_BlackList = {}

FruitAndRaid:AddToggle({
  Name = "Auto Random Fruit",
  Flag = "Fruits/AutoRandom",
  Callback = function(Value)
    getgenv().AutoRandomFruit = Value
    task.spawn(function()
      while getgenv().AutoRandomFruit do task.wait(1)
        FireRemote("Cousin", "Buy")
      end
    end)
  end
})

FruitAndRaid:AddToggle({
  Name = "Auto Store Fruits",
  Flag = "Fruits/AutoStore",
  Callback = function(Value)
    getgenv().AutoStoreFruits = Value
    task.spawn(function()
      local Remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("CommF_", 9e9)
      
      while getgenv().AutoStoreFruits do task.wait()
        local plrBag = Player.Backpack
        local plrChar = Player.Character
        if plrChar then
          for _,Fruit in pairs(plrChar:GetChildren()) do
            if not table.find(Fruit_BlackList, Fruit.Name) and Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
              if Remote:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit) ~= true then
                table.insert(Fruit_BlackList, Fruit.Name)
              end
            end
          end
        end
        for _,Fruit in pairs(plrBag:GetChildren()) do
          if not table.find(Fruit_BlackList, Fruit.Name) and Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
            if Remote:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit) ~= true then
              table.insert(Fruit_BlackList, Fruit.Name)
            end
          end
        end
      end
    end)
  end
})

table.insert(AFKOptions, FruitAndRaid:AddToggle({
  Name = "Teleport to Fruits",
  Flag = "Fruits/Teleport",
  Callback = function(Value)
    getgenv().TeleportToFruit = Value
    task.spawn(function()
      while getgenv().TeleportToFruit do task.wait()
        if Configure("Fruit") then getgenv().TeleportingToFruit = false
        else
          local Fruit = FruitFind()
          if Fruit then
            PlayerTP(Fruit.CFrame)
            getgenv().TeleportingToFruit = true
          else
            getgenv().TeleportingToFruit = false
          end
        end
      end
    end)
  end
}))

FruitAndRaid:AddToggle({
	Name = "Bring Fruits",
	Default = false,
	Callback = function(Value)
	   getgenv().BringFruit = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().BringFruit then

pcall(function()


for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if string.find(v.Name, "Fruit") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
    end
    end

 end)

end

end

end)

end)

FruitAndRaid:AddToggle({
	Name = "Hop When No Fruits",
	Default = false,
	Callback = function(Value)
		_G.HopWhenNoFruits = Value
	end
})

local LP = Players.LocalPlayer
local Players = game:GetService("Players")

local function isFruitsOnServer() 
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v.Name ~= 'Blox Fruit Dealer' then
                if string.find(v.Name, 'Fruit') then
                    return true
                end
            end
        end
        return false
    end

local function isWorthFruitInInventory()
        for i,v in pairs(LP.Backpack:GetChildren()) do 
            if string.find(v.Name, ' Fruit') then
                if getFruitWorth(v.Name) >= 1000000 then return true end
            end
        end
        for i,v in pairs(LP.Character:GetChildren()) do 
            if string.find(v.Name, ' Fruit') then
                if getFruitWorth(v.Name) >= 1000000 then return true end
            end
        end
        return false
    end
    
    
    local function isFruitsInInventory()
        for i,v in pairs(LP.Backpack:GetChildren()) do 
            if string.find(v.Name, ' Fruit') then
                return true
            end
        end
        for i,v in pairs(LP.Character:GetChildren()) do 
            if string.find(v.Name, ' Fruit') then
                return true
            end
        end
        return false
    end

local function getFruitWorth(fruitName)
        worth = {
            ["Quake Fruit"] = 1000000,
            ["Buddha Fruit"] = 1200000,
            ["Love Fruit"] = 1300000,
            ["Spider Fruit"] = 1500000,
            ["Sound Fruit"] = 1700000,
            ["Phoenix Fruit"] = 1800000,
            ["Portal Fruit"] = 1900000,
            ["Rumble Fruit"] = 2100000,
            ["Pain Fruit"] = 2300000,
            ["Blizzard Fruit"] = 2400000,
            ["Gravity Fruit"] = 2500000,
            ["Mammoth Fruit"] = 2700000,
            ["T-Rex Fruit"] = 2700000,
            ["Dough Fruit"] = 2800000,
            ["Shadow Fruit"] = 2900000,
            ["Venom Fruit"] = 3000000,
            ["Control Fruit"] = 3200000,
            ["Spirit Fruit"] = 3400000,
            ["Dragon Fruit"] = 3500000,
            ["Leopard Fruit"] = 5000000,
            ["Kitsune Fruit"] = 8000000,
        }
        return worth[fruitName] or 0
    end

spawn(function()

pcall(function()

while wait() do

if _G.HopWhenNoFruits then

pcall(function()

wait(5)
if not isFruitsOnServer() and _G.HopWhenNoFruits then
                            ServerHop()
                    end
                        if not isWorthFruitInInventory() and not isFruitsInInventory() and not isFruitsOnServer() and _G.HopWhenNoFruits then
                            ServerHop()
                        end

 end)

end

end

end)

end)

FruitAndRaid:AddButton({
	Name = "Check Stock Normal Dealer",
	Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage.Remotes

local result = Remotes.CommF_:InvokeServer("GetFruits")

local fruitsOnSale = {}

local function addCommas(number)

    local formatted = tostring(number)
    while true do  
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

for _, fruitData in pairs(result) do
    if fruitData["OnSale"] == true then
        local priceWithCommas = addCommas(fruitData["Price"])
        local fruitInfo = fruitData["Name"] .. " - " .. priceWithCommas
        table.insert(fruitsOnSale, fruitInfo)
    end
end

-- Tampilkan daftar buah yang ["OnSale"] = true dengan \n di awal

print("\n" .. table.concat(fruitsOnSale, "\n"))

local gui = Instance.new("ScreenGui")

gui.Parent = game.Players.LocalPlayer.PlayerGui

gui.Name = "MyGUI"

local frame = Instance.new("Frame")

frame.Parent = gui

frame.Size = UDim2.new(0, 200, 0, 300)

frame.Position = UDim2.new(0.1, 0, 0.1, 0)


frame.BackgroundColor3 = Color3.new(0, 0, 0)

local textLabel = Instance.new("TextLabel")

textLabel.Parent = frame

textLabel.Size = UDim2.new(1, 0, 1, 0)

textLabel.Text = table.concat(fruitsOnSale, "\n")

textLabel.TextColor3 = Color3.new(1, 1, 1)

-- Fungsi untuk menutup GUI

local function closeGUI()
    gui:Destroy()
end
local isDragging = false
local dragInput = nil
local dragStart = nil

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        dragInput = input
        frame.CaptureInput = true
    end
end)
frame.InputChanged:Connect(function(input)
    if input == dragInput and isDragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(0, frame.Position.X.Offset + delta.X, 0, frame.Position.Y.Offset + delta.Y)

        dragStart = input.Position
    end

end)

frame.InputEnded:Connect(function(input)

    if input == dragInput and isDragging then

        isDragging = false

        frame.CaptureInput = false

    end

end)

local closeButton = Instance.new("TextButton")

closeButton.Parent = frame

closeButton.Size = UDim2.new(0, 20, 0, 20)

closeButton.Position = UDim2.new(1, -20, 0, 0)

closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.Text = "X"
closeButton.MouseButton1Click:Connect(closeGUI)
	end
})
FruitAndRaid:AddButton({
	Name = "Check Stock Advanced Dealer",
	Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage.Remotes

local Event = Remotes["CommF_"]

local result = Event:InvokeServer("GetFruits", true)

local fruitsOnSale = {}

local function addCommas(number)
    local formatted = tostring(number)
    while true do  
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

for _, fruitData in pairs(result) do
    if fruitData["OnSale"] == true then
        local priceWithCommas = addCommas(fruitData["Price"])
        local fruitInfo = fruitData["Name"] .. " - " .. priceWithCommas
        table.insert(fruitsOnSale, fruitInfo)
    end
end

-- Tampilkan daftar buah yang ["OnSale"] = true dengan \n di awal

print("\n" .. table.concat(fruitsOnSale, "\n"))

local gui = Instance.new("ScreenGui")

gui.Parent = game.Players.LocalPlayer.PlayerGui

gui.Name = "MyGUI"

local frame = Instance.new("Frame")

frame.Parent = gui

frame.Size = UDim2.new(0, 200, 0, 300)

frame.Position = UDim2.new(0.1, 0, 0.1, 0)

frame.BackgroundColor3 = Color3.new(0, 0, 0)

local textLabel = Instance.new("TextLabel")

textLabel.Parent = frame

textLabel.Size = UDim2.new(1, 0, 1, 0)

textLabel.Text = table.concat(fruitsOnSale, "\n")

textLabel.TextColor3 = Color3.new(1, 1, 1)

-- Fungsi untuk menutup GUI

local function closeGUI()
    gui:Destroy()
end

-- Fungsi untuk mengatur drag

local isDragging = false

local dragInput = nil

local dragStart = nil

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        dragInput = input
        frame.CaptureInput = true
    end
end)

frame.InputChanged:Connect(function(input)
    if input == dragInput and isDragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(0, frame.Position.X.Offset + delta.X, 0, frame.Position.Y.Offset + delta.Y)
        dragStart = input.Position
    end
end)

frame.InputEnded:Connect(function(input)
    if input == dragInput and isDragging then
        isDragging = false
        frame.CaptureInput = false
    end
end)


-- Atur tombol tutup

local closeButton = Instance.new("TextButton")

closeButton.Parent = frame

closeButton.Size = UDim2.new(0, 20, 0, 20)

closeButton.Position = UDim2.new(1, -20, 0, 0)

closeButton.BackgroundColor3 = Color3.new(1, 0, 0)

closeButton.Text = "X"

closeButton.MouseButton1Click:Connect(closeGUI)
	end
})

local NotifiFruits = false
local NotifiTime = 15

workspace.ChildAdded:Connect(function(part)
  if NotifiFruits then
    if part:IsA("Tool") or string.find(part.Name, "Fruit") then
  Fluent:Notify({
		Title = "Fruit Notifier",
		Content = "The " .. part.Name .. " Spawned on the Map",
		SubContent = "",
		Duration = NotifiTime
	})
    end
  end
end)

FruitAndRaid:AddSection({"Notifications"})
FruitAndRaid:AddSlider({Name = "Nofication Time",Max = 120, Min = 5, Increase = 1, Default = 15, Callback = function(Value)
  NotifiTime = Value
end, Flag = "Notify/Time"})
FruitAndRaid:AddToggle({Name = "Fruit Spawn",Callback = function(Value)
  NotifiFruits = Value
end, Flag = "Notify/Fruit"})

FruitAndRaid:AddSection({"Raid"})
if Sea1 then FruitAndRaid:AddParagraph({"Only on Sea 2 and 3"})
elseif Sea2 or Sea3 then
  Raids_Chip = {}
  local Raids = require(ReplicatedStorage.Raids)
  
  table.foreach(Raids.advancedRaids, function(a, b)table.insert(Raids_Chip, b)end)
  table.foreach(Raids.raids, function(a, b)table.insert(Raids_Chip, b)end)

local TimeRaid = FruitAndRaid:AddParagraph({"🧭 Waiting For Dungeon"})

local Island1 = FruitAndRaid:AddParagraph({": lsland 1"})

local Island2 = FruitAndRaid:AddParagraph({": lsland 2"})

local Island3 = FruitAndRaid:AddParagraph({": lsland 3"})

local Island4 = FruitAndRaid:AddParagraph({": lsland 4"})

local Island5 = FruitAndRaid:AddParagraph({": lsland 5"})

spawn(function()
        pcall(function()
            while wait() do
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                if not game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                    TimeRaid:SetTitle(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
                else
                    TimeRaid:SetTitle("🧭 Waiting For Dungeon")
                end
                end
            end
        end)
    end)
    
spawn(function()
        pcall(function()
            while wait() do
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 1') then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
    Island1:SetTitle('✅: Island 1')
    else
      Island1:SetTitle('❌: Island 1' )end
            end
            end
        end)
    end)

spawn(function()
        pcall(function()
            while wait() do
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 2') then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
    Island2:SetTitle('✅: Island 2')
    else
      Island2:SetTitle('❌: Island 2' )end
            end
            end
        end)
    end)

spawn(function()
        pcall(function()
            while wait() do
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 3') then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
    Island3:SetTitle('✅: Island 3')
    else
      Island3:SetTitle('❌: Island 3' )end
            end
            end
        end)
    end)
    
spawn(function()
        pcall(function()
            while wait() do
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 4') then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
    Island4:SetTitle('✅: Island 4')
    else
      Island4:SetTitle('❌: Island 4' )end
            end
            end
        end)
    end)
    
spawn(function()
        pcall(function()
            while wait() do
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 5') then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
    Island5:SetTitle('✅: Island 5')
    else
      Island5:SetTitle('❌: Island 5' )end
            end
            end
        end)
    end)

  FruitAndRaid:AddDropdown({
    Name = "Select Raid",
    Options = Raids_Chip,
    Flag = "Raid/SelectedChip",
    Callback = function(Value)
      getgenv().SelectRaidChip = Value
    end
  })
  
  FruitAndRaid:AddToggle({
    Name = "Auto Farm Raid",
    Callback = function(Value)
      getgenv().AutoFarmRaid = Value
      task.spawn(function()
        local Islands = workspace:WaitForChild("_WorldOrigin", 9e9):WaitForChild("Locations", 9e9)
        
        local function GetIsland(Island)
          local plrChar = Player and Player.Character
          local plrPP = plrChar and plrChar.PrimaryPart
          
          for _,island in pairs(Islands:GetChildren()) do
            if island and island.Name == Island and plrPP and (island.Position - plrPP.Position).Magnitude < 3000 then
              return island
            end
          end
        end
        
        task.spawn(function()
          while getgenv().AutoFarmRaid do task.wait(0.5)
            if Configure("Raid") then
            else   
              FireRemote("Awakener", "Check")FireRemote("Awakener", "Awaken")
            end
          end
        end)
        
        task.spawn(function()
          while getgenv().AutoFarmRaid do task.wait(0.5)
            if getgenv().SelectRaidChip == "Rumble" then
              FireRemote("ThunderGodTalk", true)
              FireRemote("ThunderGodTalk")
            end
          end
        end)
        
        task.spawn(function()
          while getgenv().AutoFarmRaid do task.wait()
            if Configure("Raid") then
              getgenv().FarmingRaid = false
            else
              if Player.PlayerGui.Main.Timer.Visible then
                local Island1 = GetIsland("Island 1")
                local Island2 = GetIsland("Island 2")
                local Island3 = GetIsland("Island 3")
                local Island4 = GetIsland("Island 4")
                local Island5 = GetIsland("Island 5")
                
                if Island5 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island5.CFrame + Vector3.new(0, 70, 0))
                elseif Island4 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island4.CFrame + Vector3.new(0, 70, 0))
                elseif Island3 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island3.CFrame + Vector3.new(0, 70, 0))
                elseif Island2 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island2.CFrame + Vector3.new(0, 70, 0))
                elseif Island1 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island1.CFrame + Vector3.new(0, 70, 0))
                else
                  getgenv().FarmingRaid = false
                end
              else
                getgenv().FarmingRaid = false
              end
            end
          end
        end)
        
        while getgenv().AutoFarmRaid do task.wait()
          if Configure("Raid") then
          else
            if not Player.PlayerGui.Main.Timer.Visible and VerifyTool("Special Microchip") then
              if not GetIsland("Island 1")
              and not GetIsland("Island 2")
              and not GetIsland("Island 3")
              and not GetIsland("Island 4")
              and not GetIsland("Island 5") then
                pcall(function()
                  if Sea2 then
                    fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    repeat task.wait()until GetIsland("Island 1")task.wait(1)
                  elseif Sea3 then
                    fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    repeat task.wait()until GetIsland("Island 1")task.wait(1)
                  end
                end)
              end
            end
          end
        end
      end)
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
      getgenv().AutoKillAura = Value
      AutoKillAura()
      end
    end
  })

FruitAndRaid:AddSlider({
    Name = "Set Price Devil Fruit",
    Min = 0,
    Max = 10000000,
    Increase = 10,
    Default = 1000000,
    Flag = "FruitUns",
    Callback = function(Value)
      _G.UnstoreFruitPrice = Value
    end
  })

FruitAndRaid:AddToggle({
	Name = "Auto Unstore Fruit",
	Default = false,
	Flag = "i90",
	Callback = function(Value)
		_G.UnstoreBadFruit = Value
	end
})

    function GetFruitsInfo()
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                return true
            end
        end
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                return true
            end
        end
        return false
    end

    spawn(function()
        while wait(1) do
            pcall(function()
                if _G.UnstoreBadFruit then
                if not VerifyTool("Special Microchip") then
                    fruit = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
                    for i,v in pairs(fruit) do
                        if v["Price"] < _G.UnstoreFruitPrice then
                            if not GetFruitsInfo() then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v["Name"])
                            end
                            end
                        end
                    end
                end
            end)
        end
    end)

  FruitAndRaid:AddToggle({"Auto Buy Chip", false, function(Value)
    getgenv().AutoBuyChip = Value
    task.spawn(function()
      while getgenv().AutoBuyChip do task.wait()
        if not VerifyTool("Special Microchip") then
          FireRemote("RaidsNpc", "Select", getgenv().SelectRaidChip)task.wait(1)
        end
      end
    end)
  end})
end

if Sea1 then
  QuestsTabs:AddSection({"Second Sea"})
  QuestsTabs:AddToggle({
    Name = "Auto Second Sea",
    Callback = function(Value)
      getgenv().AutoSecondSea = Value
      AutoSecondSea()
    end
  })
  
  QuestsTabs:AddSection({"Saber"})
  QuestsTabs:AddToggle({
    Name = "Auto Unlock Saber < Level +200 >",
    Callback = function(Value)
      getgenv().AutoUnlockSaber = Value
      AutoUnlockSaber()
    end
  })
  
  QuestsTabs:AddSection({"God Boss"})
  QuestsTabs:AddToggle({
    Name = "Auto Pole V1",
    Callback = function(Value)
      getgenv().AutoEnelBossPole = Value
      AutoEnelBossPole()
    end
  })
  
  QuestsTabs:AddSection({"The Saw"})
  QuestsTabs:AddToggle({
    Name = "Auto Saw Sword",
    Callback = function(Value)
      getgenv().AutoSawBoss = Value
      AutoSawBoss()
    end
  })

QuestsTabs:AddSection({"Greybeard"})
  QuestsTabs:AddToggle({
    Name = "Auto Greybeard",
    Callback = function(Value)
      getgenv().AutoBossBisento = Value
      AutoBisentoBoss()
    end
  })
  
elseif Sea2 then
  QuestsTabs:AddSection({"Third Sea"})
  QuestsTabs:AddToggle({
    Name = "Auto Third Sea",
    Callback = function(Value)
      getgenv().AutoThirdSea = Value
      AutoThirdSea()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Kill Don Swan",
    Callback = function(Value)
      getgenv().AutoKillDonSwan = Value
      AutoKillDonSwan()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Don Swan Hop",
    Callback = function(Value)
      getgenv().AutoDonSwanHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Bartilo Quest"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Bartilo Quest",
    Callback = function(Value)
      getgenv().AutoBartiloQuest = Value
      AutoBartiloQuest()
    end
  })
  
  QuestsTabs:AddSection({"Rengoku"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Rengoku",
    Callback = function(Value)
      getgenv().AutoRengoku = Value
      AutoRengoku()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Rengoku Hop",
    Callback = function(Value)
      getgenv().AutoRengokuHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Legendary Sword"})
local LegendSwords = QuestsTabs:AddParagraph({""})
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
                LegendSwords:SetTitle("Legendary Sword Spawned: Saddi")
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2") then
                LegendSwords:SetTitle("Legendary Sword Spawned: Wando")
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3") then
                LegendSwords:SetTitle("Legendary Sword Spawned: Shisui")
            else
                LegendSwords:SetTitle("Not Found Legend Swords")
            end
        end
    end)
end)
  QuestsTabs:AddToggle({"Auto Buy Legendary Sword", false, function(Value)
    getgenv().AutoLegendarySword = Value
    task.spawn(function()
      while getgenv().AutoLegendarySword do task.wait(0.5)
        FireRemote("LegendarySwordDealer", "1")
        FireRemote("LegendarySwordDealer", "2")
        FireRemote("LegendarySwordDealer", "3")
      end
    end)
  end, "Buy/LegendarySword",})
  
  QuestsTabs:AddToggle({
    Name = "Auto Buy True Triple Katana",
    Flag = "Buy/TTK",
    Callback = function(Value)
      getgenv().AutoTTK = Value
      task.spawn(function()
        while getgenv().AutoTTK do task.wait()
          FireRemote("MysteriousMan", "1")
          FireRemote("MysteriousMan", "2")
        end
      end)
    end
  })
  
  QuestsTabs:AddSection({"Race"})
  QuestsTabs:AddToggle({
	Name = "Auto Evo Race V3 < BETA >",
	Default = false,
	Callback = function(Value)
		getgenv().EvoV3 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EvoV3 then

pcall(function()

task.spawn(function()
    while getgenv().EvoV3 do task.wait()
      QuestProgress = FireRemote("Wenlocktoad", "1")
    end
  end)

PlayerRace = Player.Data.Race.Value
if Player.Data.Race:FindFirstChild("Evolved") then
if PlayerRace == "Human" then
if QuestProgress == 0 then
FireRemote("Wenlocktoad", "2")
elseif QuestProgress == 1 then
local Enemie1 = GetEnemies({"Jeremy", "Fajita", "Diamond"})       
        if Enemie1 and Enemie1:FindFirstChild("HumanoidRootPart") then
          PlayerTP(Enemie1.HumanoidRootPart.CFrame + getgenv().FarmPos)
          pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie1)end)
          end
          end
          elseif QuestProgress == 2 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
          end
          end
if Player.Data.Race:FindFirstChild("Evolved") then
if PlayerRace == "Skypiea" then
if QuestProgress == 0 then
FireRemote("Wenlocktoad", "2")
elseif QuestProgress == 1 then
for i,v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name and tostring(v.Data.Race.Value) == "Skypiea" then
		pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerTP(game.Players[v.Name].Character.HumanoidRootPart.CFrame)
		end
	end
	if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
          end
          elseif QuestProgress == 2 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
          end
          end
if Player.Data.Race:FindFirstChild("Evolved") then
if PlayerRace == "Mink" then
if QuestProgress == 0 then
FireRemote("Wenlocktoad", "2")
elseif QuestProgress == 1 then
AutoChestTween2()
          end
          elseif QuestProgress == 2 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
          end
          end
if Player.Data.Race:FindFirstChild("Evolved") then
if PlayerRace == "Ghoul" then
if QuestProgress == 0 then
FireRemote("Wenlocktoad", "2")
elseif QuestProgress == 1 then
for i,v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name and v.PlayerGui.Main.PvpDisabled.Visible == false then
		pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerTP(game.Players[v.Name].Character.HumanoidRootPart.CFrame)
		end
	end
	if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
          end
          elseif QuestProgress == 2 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
          end
          end
if Player.Data.Race:FindFirstChild("Evolved") then
if PlayerRace == "Cyborg" then
if QuestProgress == 0 then
FireRemote("Wenlocktoad", "2")
elseif QuestProgress == 1 then
local cheapest = getCheapestFruit()
                                if cheapest then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", cheapest)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1")
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
                                end
          end      
          end
          end


 end)

end

end

end)

end)

function getCheapestFruit()
        local fruits = {
            "Rocket-Rocket",
            "Spin-Spin",
            "Chop-Chop",
            "Spring-Spring",
            "Bomb-Bomb",
            "Smoke-Smoke",
            "Spike-Spike",
            "Flame-Flame",
            "Falcon-Falcon",
            "Ice-Ice",
            "Sand-Sand",
            "Dark-Dark",
            "Diamond-Diamond",
            "Light-Light",
            "Rubber-Rubber",
            "Barrier-Barrier",
            "Ghost-Ghost",
            "Magma-Magma"
        }
        myFruits = {}
        for i,v in pairs(ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
            table.insert(myFruits, v.Name)
        end
        for _, fr in pairs(fruits) do
            for _, f in pairs(myFruits) do
                if fr == f then return fr end
            end
        end
        return 0
    end

  QuestsTabs:AddToggle({
    Name = "Auto Evo Race V2",
    Callback = function(Value)
      getgenv().AutoRaceV2 = Value
      AutoRaceV2()
    end
  })
  
QuestsTabs:AddSection({"Get Race"})
  QuestsTabs:AddToggle({
    Name = "Auto Ghoul Race",
    Callback = function(Value)
      getgenv().AutoGhoulRace = Value
      AutoGhoulRace()
    end
  })
  
  QuestsTabs:AddSection({"Cursed Captain"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Cursed Captain",
    Callback = function(Value)
      getgenv().AutoCursedCaptain = Value
      AutoCursedCaptain()
    end
  })
  
  QuestsTabs:AddSection({"Dark Beard"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Dark Beard",
    Callback = function(Value)
      getgenv().AutoDarkbeard = Value
      AutoDarkbeard()
    end
  })
  
  QuestsTabs:AddSection({"Law"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Buy Law Chip",
    Callback = function(Value)
      getgenv().AutoBuyLawChip = Value
      task.spawn(function()
        while getgenv().AutoBuyLawChip do task.wait()
          if not VerifyNPC("Order") and not VerifyTool("Microchip") then
					  FireRemote("BlackbeardReward", "Microchip", "2")
					end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Start Law Raid",
    Callback = function(Value)
      getgenv().AutoStartLawRaid = Value
      task.spawn(function()
        while getgenv().AutoStartLawRaid do task.wait()
          if not VerifyNPC("Order") and VerifyTool("Microchip") then
            pcall(function()
					    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					  end)
					end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Kill Law Boss",
    Callback = function(Value)
      getgenv().AutoKillLawBoss = Value
      AutoKillLawBoss()
    end
  })
  
elseif Sea3 then
  QuestsTabs:AddSection({"Elite Hunter"})
  
  local LabelElite = QuestsTabs:AddParagraph({"Elite Stats : Not Spawned"})
  local LabelElit3 = QuestsTabs:AddParagraph({"Elite Hunter Progress: 0"})
  
  task.spawn(function()
    while task.wait() do
      if VerifyNPC("Urban") or VerifyNPC("Deandre") or VerifyNPC("Diablo") then
        LabelElite:SetTitle("Elite Stats : Spawned")
      else
        LabelElite:SetTitle("Elite Stats : Not Spawned")
      end
    end
  end)
  
  if not IsOwner then
    task.spawn(function()
      while task.wait(1) do
        LabelElit3:SetTitle("Elite Hunter Progress : " .. FireRemote("EliteHunter", "Progress"))
      end
    end)
  end
  
  table.insert(AFKOptions, QuestsTabs:AddToggle({
    Name = "Auto Elite Hunter",
    Callback = function(Value)
      getgenv().AutoEliteHunter = Value
      AutoEliteHunter()
    end
  }))

QuestsTabs:AddToggle({
	Name = "Auto Kill Player Hunter Quest",
	Default = false,
	Callback = function(Value)
		getgenv().AutoPlayerHunter = Value
	end
})
spawn(function()
        pcall(function()
            while wait(.1) do
                if getgenv().AutoPlayerHunter then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)
	spawn(function()
		while wait() do
			if getgenv().AutoPlayerHunter then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
				else
					for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
							repeat wait()	pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
								game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
								PlayerTP(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							until getgenv().AutoPlayerHunter == false or v.Humanoid.Health <= 0
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
					end
				end
			end
		end
	end)

  table.insert(AFKOptions, QuestsTabs:AddToggle({
    Name = "Auto Collect Yama < Need 30 >",
    Flag = "Collect/Yama",
    Callback = function(Value)
      getgenv().AutoCollectYama = Value
      task.spawn(function()
        while getgenv().AutoCollectYama do task.wait()
          pcall(function()
            if FireRemote("EliteHunter", "Progress") >= 30 then
              fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
            end
          end)
        end
      end)
    end
  }))
  
  QuestsTabs:AddToggle({
    Name = "Auto Elite Hunter Hop",
    Callback = function(Value)
      getgenv().AutoEliteHunterHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Tushita"})
  
  local LabelRipIndra = QuestsTabs:AddParagraph({"Rip Indra Stats : Not Spawned"})
  
  task.spawn(function()
    while task.wait(0.5) do
      if VerifyNPC("rip_indra True Form") then
        LabelRipIndra:SetTitle("Rip Indra Stats : Spawned")
      else
        LabelRipIndra:SetTitle("Rip Indra Stats : Not Spawned")
      end
    end
  end)
  
  QuestsTabs:AddToggle({
    Name = "Auto Tushita",
    Callback = function(Value)
      getgenv().AutoTushita = Value
      task.spawn(function()
        local Map = workspace:WaitForChild("Map", 9e9)
        local Turtle = Map:WaitForChild("Turtle", 9e9)
        local QuestTorches = Turtle:WaitForChild("QuestTorches", 9e9)
        
        local Active1 = false
        local Active2 = false
        local Active3 = false
        local Active4 = false
        local Active5 = false
        
        while getgenv().AutoTushita do task.wait()
          if not Turtle:FindFirstChild("TushitaGate") then
            local Enemie = Enemies:FindFirstChild("Longma")
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
            else
              PlayerTP(CFrame.new(-10218, 333, -9444))
            end
          elseif VerifyNPC("rip_indra True Form") then
            if not VerifyTool("Holy Torch") then
              PlayerTP(CFrame.new(5152, 142, 912))
            else
              local Torch1 = QuestTorches:FindFirstChild("Torch1")
              local Torch2 = QuestTorches:FindFirstChild("Torch2")
              local Torch3 = QuestTorches:FindFirstChild("Torch3")
              local Torch4 = QuestTorches:FindFirstChild("Torch4")
              local Torch5 = QuestTorches:FindFirstChild("Torch5")
              
              local args1 = Torch1 and Torch1:FindFirstChild("Particles")
              and Torch1.Particles:FindFirstChild("PointLight") and not Torch1.Particles.PointLight.Enabled
              local args2 = Torch2 and Torch2:FindFirstChild("Particles")
              and Torch2.Particles:FindFirstChild("PointLight") and not Torch2.Particles.PointLight.Enabled
              local args3 = Torch3 and Torch3:FindFirstChild("Particles")
              and Torch3.Particles:FindFirstChild("PointLight") and not Torch3.Particles.PointLight.Enabled
              local args4 = Torch4 and Torch4:FindFirstChild("Particles")
              and Torch4.Particles:FindFirstChild("PointLight") and not Torch4.Particles.PointLight.Enabled
              local args5 = Torch5 and Torch5:FindFirstChild("Particles")
              and Torch5.Particles:FindFirstChild("PointLight") and not Torch5.Particles.PointLight.Enabled
              
              if not Active1 and args1 then
                PlayerTP(Torch1.CFrame)
              elseif not Active2 and args2 then
                PlayerTP(Torch2.CFrame)Active1 = true
              elseif not Active3 and args3 then
                PlayerTP(Torch3.CFrame)Active2 = true
              elseif not Active4 and args4 then
                PlayerTP(Torch4.CFrame)Active3 = true
              elseif not Active5 and args5 then
                PlayerTP(Torch5.CFrame)Active4 = true
              else
                Active5 = true
              end
            end
          else
            if VerifyTool("God's Chalice") then
              EquipToolName("God's Chalice")
              PlayerTP(CFrame.new(-5561, 314, -2663))
            else
              local NPC = "EliteBossVerify"QuestVisible()
              
              if VerifyQuest("Diablo") then
                NPC = "Diablo"
              elseif VerifyQuest("Deandre") then
                NPC = "Deandre"
              elseif VerifyQuest("Urban") then
                NPC = "Urban"
              else
                task.spawn(function()FireRemote("EliteHunter")end)
              end
              
              local EliteBoss = GetEnemies({NPC})
              
              if EliteBoss and EliteBoss:FindFirstChild("HumanoidRootPart") then
                PlayerTP(EliteBoss.HumanoidRootPart.CFrame + getgenv().FarmPos)
                pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
              elseif not VerifyNPC("Deandre") and not VerifyNPC("Diablo") and not VerifyNPC("Urban") then
                if getgenv().AutoTushitaHop then
                  ServerHop()
                end
              end
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Tushita Hop",
    Callback = function(Value)
      getgenv().AutoTushitaHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Cake Prince + Dough King"}) 
  
  local CakeLabel = QuestsTabs:AddParagraph({"Stats : 0"})
  
  if not IsOwner then
    task.spawn(function()
      while task.wait(1) do
        if VerifyNPC("Dough King") then
          CakeLabel:SetTitle("Stats : Spawned | Dough King")
        elseif VerifyNPC("Cake Prince") then
          CakeLabel:SetTitle("Stats : Spawned | Cake Prince")
        else
          local EnemiesCake = FireRemote("CakePrinceSpawner", true)
          CakeLabel:SetTitle("Stats : " .. string.gsub(tostring(EnemiesCake), "%D", ""))
        end
      end
    end)
  end
  
  local CakePrinceToggle = QuestsTabs:AddToggle({"Auto Cake Prince", false, function(Value)
    getgenv().AutoCakePrince = Value
    AutoCakePrince()
  end})
  
  local DoughKingToggle = QuestsTabs:AddToggle({"Auto Dough King", false, function(Value)
    getgenv().AutoDoughKing = Value
    AutoDoughKing()
  end})
  
  CakePrinceToggle:Callback(function()DoughKingToggle:Set(false)end)
  DoughKingToggle:Callback(function()CakePrinceToggle:Set(false)end)
  
  QuestsTabs:AddSection({"Rip Indra"})
  local RipIndraToggle = QuestsTabs:AddToggle({"Auto Rip Indra (Active Button Haki Color Yourself)", false, function(Value)
    getgenv().AutoRipIndra = Value
    AutoRipIndra()
  end})
  
local ActiveButtonToggle = QuestsTabs:AddToggle({"Auto Active Button Haki Color", false, function(Value)
    getgenv().RipIndraLegendaryHaki = Value
    task.spawn(function()
      while getgenv().RipIndraLegendaryHaki do task.wait()
        local plrChar = Player and Player.Character and Player.Character.PrimaryPart
        if (plrChar.Position - Vector3.new(-5415, 314, -2212)).Magnitude < 5 then
          FireRemote("activateColor", "Pure Red")
        elseif (plrChar.Position - Vector3.new(-4972, 336, -3720)).Magnitude < 5 then
          FireRemote("activateColor", "Snow White")
        elseif (plrChar.Position - Vector3.new(-5420, 1089, -2667)).Magnitude < 5 then
          FireRemote("activateColor", "Winter Sky")
        end
      end
    end)
    
    task.spawn(function()
      while getgenv().RipIndraLegendaryHaki do task.wait()
        if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone and not getgenv().AutoCakePrince then
          if GetButton() then
            PlayerTP(GetButton().CFrame)
          elseif not GetButton() and not getgenv().AutoRipIndra then
            PlayerTP(CFrame.new(-5119, 315, -2964))
          end
        end
      end
    end)
  end})
  
  RipIndraToggle:Callback(function()ActiveButtonToggle:Set(false)end)
  ActiveButtonToggle:Callback(function()RipIndraToggle:Set(false)end)
end

if Sea2 or Sea3 then
  QuestsTabs:AddSection({"Fighting Style"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Death Step",
    Callback = function(Value)
      getgenv().AutoDeathStep = Value
      task.spawn(function()
        local MasteryBlackLeg = 0
        local KeyFind = false
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        while getgenv().AutoDeathStep do task.wait()
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          end
          
          if MasteryBlackLeg >= 400 and Sea3 then
            FireRemote("TravelDressrosa")
          end
            
          if KeyFind then
            FireRemote("BuyDeathStep")
          end
          
          if VerifyTool("Death Step") then
            EquipToolName("Death Step")
          elseif MasteryBlackLeg >= 400 then
            local Enemie = Enemies:FindFirstChild("Awakened Ice Admiral")
            
            if VerifyTool("Library Key") then
              KeyFind = true
              EquipToolName("Library Key")
              PlayerTP(CFrame.new(6373, 293, -6839))
            elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
            else
              PlayerTP(CFrame.new(6473, 297, -6944))
            end
          elseif not VerifyTool("Black Leg") and MasteryBlackLeg < 400 then
            FireRemote("BuyBlackLeg")
          elseif VerifyTool("Black Leg") and MasteryBlackLeg < 400 then
            EquipToolName("Black Leg")
            
            local Enemie = GetProxyNPC()
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            if Sea3 then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
end
if Sea2 then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ForgottenQuest", 2)
end
end
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
            else
              if Sea3 then
                PlayerTP(CFrame.new(-9513, 164, 5786))
              else
                PlayerTP(CFrame.new(-3350, 282, -10527))
              end
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Electric Claw",
    Callback = function(Value)
      getgenv().AutoElectricClaw = Value
      task.spawn(function()
        local MasteryElectro = 0
        local MasteryElectricClaw = 0
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        while getgenv().AutoElectricClaw do task.wait()
          if VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Electric Claw") then
            MasteryElectricClaw = GetToolLevel("Electric Claw")
          end
          
          if MasteryElectro < 400 then
            if not VerifyTool("Electro") then
              FireRemote("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryElectricClaw < 600 then
            if not VerifyTool("Electric Claw") then
              FireRemote("BuyElectricClaw")
            else
              EquipToolName("Electric Claw")
            end
          end
          
          local Enemie = GetProxyNPC()
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          if Sea3 then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
end
if Sea2 then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ForgottenQuest", 2)
end
end
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
          else
            if Sea3 then
              PlayerTP(CFrame.new(-9513, 164, 5786))
            else
              PlayerTP(CFrame.new(-3350, 282, -10527))
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Sharkman Karate",
    Callback = function(Value)
      getgenv().AutoSharkmanKarate = Value
      task.spawn(function()
        local MasteryFishmanKarate = 0
        local MasterySharkmanKarate = 0
        local SharkmanStats = 0
        
        task.spawn(function()
          while getgenv().AutoSharkmanKarate do task.wait()
            SharkmanStats = FireRemote("BuySharkmanKarate", true)
          end
        end)
        
        while getgenv().AutoSharkmanKarate do task.wait()
          if VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Sharkman Karate") then
            MasterySharkmanKarate = GetToolLevel("Sharkman Karate")
          end
          
          if SharkmanStats == 1 then
            FireRemote("BuySharkmanKarate")
          elseif VerifyTool("Sharkman Karate") then
            EquipToolName("Sharkman Karate")
            local Enemie = Enemies:FindFirstChild("Water Fighter")
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie, true)end)
            else
              TweenNPCSpawn({CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607), CFrame.new(-3345, 280, -10667)}, "Water Fighter")
            end
          elseif VerifyTool("Water Key") and MasteryFishmanKarate >= 400 then
            FireRemote("BuySharkmanKarate", true)
          elseif not VerifyTool("Water Key") and MasteryFishmanKarate >= 400 then
            local Enemie = Enemies:FindFirstChild("Water Fighter")
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
            else
              TweenNPCSpawn({CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607), CFrame.new(-3345, 280, -10667)}, "Water Fighter")
            end
          elseif not VerifyTool("Fishman Karate") and MasteryFishmanKarate < 400 then
            FireRemote("BuyFishmanKarate")
          elseif VerifyTool("Fishman Karate") and MasteryFishmanKarate < 400 then
            EquipToolName("Fishman Karate")
            local Enemie = Enemies:FindFirstChild("Water Fighter")
          
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
if Sea2 then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ForgottenQuest", 2)
end
end
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie, true)end)
            else
              TweenNPCSpawn({CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607),CFrame.new(-3345, 280, -10667)}, "Water Fighter")
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Dragon Talon",
    Callback = function(Value)
      getgenv().AutoDragonTalon = Value
      task.spawn(function()
        local MasteryDragonClaw = 0
        local FireEssence = false
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        task.spawn(function()
          while getgenv().AutoDragonTalon do task.wait()
            if not VerifyTool("Fire Essence") then
              FireRemote("Bones", "Buy", 1, 1)
            else
              FireRemote("BuyDragonTalon", true)
              FireEssence = true
            end
          end
        end)
        
        while getgenv().AutoDragonTalon do task.wait()
          if VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          end
          
          if MasteryDragonClaw >= 400 and Sea2 then
            FireRemote("TravelZou")
          end
          
          if FireEssence and MasteryDragonClaw >= 400 then
            FireRemote("BuyDragonTalon")
          elseif not VerifyTool("Dragon Claw") and MasteryDragonClaw < 400 or not FireEssence and not VerifyTool("Dragon Claw") then
            FireRemote("BlackbeardReward", "DragonClaw", "1")
            FireRemote("BlackbeardReward", "DragonClaw", "2")
          elseif VerifyTool("Dragon Claw") and MasteryDragonClaw < 400 or not FireEssence and VerifyTool("Dragon Claw") then
            EquipToolName("Dragon Claw")
            
            local Enemie = GetProxyNPC()
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            if Sea3 then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
end
if Sea2 then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ForgottenQuest", 2)
end
end
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
            else
              if Sea3 then
                PlayerTP(CFrame.new(-9513, 164, 5786))
              else
                PlayerTP(CFrame.new(-3350, 282, -10527))
              end
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Superhuman",
    Callback = function(Value)
      getgenv().AutoSuperhuman = Value
      task.spawn(function()
        local MasteryBlackLeg = 0
        local MasteryElectro = 0
        local MasteryFishmanKarate = 0
        local MasteryDragonClaw = 0
        local MasterySuperhuman = 0
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        while getgenv().AutoSuperhuman do task.wait()
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          elseif VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          elseif VerifyTool("Superhuman") then
            MasterySuperhuman = GetToolLevel("Superhuman")
          end
          
          if MasteryBlackLeg < 300 then
            if not VerifyTool("Black Leg") then
              FireRemote("BuyBlackLeg")
            else
              EquipToolName("Black Leg")
            end
          elseif MasteryElectro < 300 then
            if not VerifyTool("Electro") then
              FireRemote("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryFishmanKarate < 300 then
            if not VerifyTool("Fishman Karate") then
              FireRemote("BuyFishmanKarate")
            else
              EquipToolName("Fishman Karate")
            end
          elseif MasteryDragonClaw < 300 then
            if not VerifyTool("Dragon Claw") then
              FireRemote("BlackbeardReward","DragonClaw","1")
              FireRemote("BlackbeardReward","DragonClaw","2")
            else
              EquipToolName("Dragon Claw")
            end
          elseif MasterySuperhuman < 600 then
            if not VerifyTool("Superhuman") then
              FireRemote("BuySuperhuman")
            else
              EquipToolName("Superhuman")
            end
          end
          
          local Enemie = GetProxyNPC()
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
          if Sea3 then
          if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
end
if Sea2 then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "ForgottenQuest", 2)
end
end
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
          else
            if Sea3 then
              PlayerTP(CFrame.new(-9513, 164, 5786))
            else
              PlayerTP(CFrame.new(-3350, 282, -10527))
            end
          end
        end
      end)
    end
  })
  
if Sea3 then
  QuestsTabs:AddToggle({
    Name = "Auto God Human",
    Callback = function(Value)
      getgenv().AutoGodHuman = Value
      task.spawn(function()
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        -- V1
        local MasteryBlackLeg = 0
        local MasteryElectro = 0
        local MasteryFishmanKarate = 0
        local MasteryDragonClaw = 0
        local MasterySuperhuman = 0
        
        -- V2
        local MasteryElectricClaw = 0
        local MasteryDragonTalon = 0
        local MasterySharkmanKarate = 0
        local MasteryDeathStep = 0
        local MasteryGodHuman = 0
        
        while getgenv().AutoGodHuman do task.wait()
          if Sea2 then
            FireRemote("TravelZou")
          end
          
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          elseif VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          elseif VerifyTool("Superhuman") then
            MasterySuperhuman = GetToolLevel("Superhuman")
          elseif VerifyTool("Death Step") then
            MasteryDeathStep = GetToolLevel("Death Step")
          elseif VerifyTool("Electric Claw") then
            MasteryElectricClaw = GetToolLevel("Electric Claw")
          elseif VerifyTool("Sharkman Karate") then
            MasterySharkmanKarate = GetToolLevel("Sharkman Karate")
          elseif VerifyTool("Dragon Talon") then
            MasteryDragonTalon = GetToolLevel("Dragon Talon")
          elseif VerifyTool("Godhuman") then
            MasteryGodHuman = GetToolLevel("Godhuman")
          end
          
          if MasteryBlackLeg < 400 then
            if not VerifyTool("Black Leg") then
              BuyFightStyle("BuyBlackLeg")
            else
              EquipToolName("Black Leg")
            end
          elseif MasteryElectro < 400 then
            if not VerifyTool("Electro") then
              BuyFightStyle("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryFishmanKarate < 400 then
            if not VerifyTool("Fishman Karate") then
              BuyFightStyle("BuyFishmanKarate")
            else
              EquipToolName("Fishman Karate")
            end
          elseif MasteryDragonClaw < 400 then
            if not VerifyTool("Dragon Claw") then
              FireRemote("BlackbeardReward","DragonClaw","1")
              FireRemote("BlackbeardReward","DragonClaw","2")
            else
              EquipToolName("Dragon Claw")
            end
          elseif MasterySuperhuman < 400 then
            if not VerifyTool("Superhuman") then
              BuyFightStyle("BuySuperhuman")
            else
              EquipToolName("Superhuman")
            end
          elseif MasteryDeathStep < 400 then
            if not VerifyTool("Death Step") then
              BuyFightStyle("BuyDeathStep")
            else
              EquipToolName("Death Step")
            end
          elseif MasteryElectricClaw < 400 then
            if not VerifyTool("Electric Claw") then
              BuyFightStyle("BuyElectricClaw")
            else
              EquipToolName("Electric Claw")
            end
          elseif MasterySharkmanKarate < 400 then
            if not VerifyTool("Sharkman Karate") then
              BuyFightStyle("BuySharkmanKarate")
            else
              EquipToolName("Sharkman Karate")
            end
          elseif MasteryDragonTalon < 400 then
            if not VerifyTool("Dragon Talon") then
              BuyFightStyle("BuyDragonTalon")
            else
              EquipToolName("Dragon Talon")
            end
          else
            if not VerifyTool("Godhuman") then
              BuyFightStyle("BuyGodhuman")
            else
              EquipToolName("Godhuman")
            end
          end
          
          local Enemie = GetProxyNPC()
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
               if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
          else
            PlayerTP(CFrame.new(-9513, 164, 5786))
          end
        end
      end)
    end
  })
  end
end

if Sea3 then
  QuestsTabs:AddSection({"Auto Mastery All"})
  
  QuestsTabs:AddSlider({
    Name = "Select Mastery",
    Min = 100,
    Max = 600,
    Default = 600,
    Flag = "FMastery/Selected",
    Callback = function(Value)
      getgenv().AutoMasteryValue = Value
    end
  })
  
  table.insert(AFKOptions, QuestsTabs:AddToggle({
    Name = "Auto Mastery All Fighting Style",
    Callback = function(Value)
      getgenv().AutoMasteryFightingStyle = Value
      task.spawn(function()
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        -- V1
        local MasteryBlackLeg = 0
        local MasteryElectro = 0
        local MasteryFishmanKarate = 0
        local MasteryDragonClaw = 0
        local MasterySuperhuman = 0
        
        -- V2
        local MasteryElectricClaw = 0
        local MasteryDragonTalon = 0
        local MasterySharkmanKarate = 0
        local MasteryDeathStep = 0
        local MasteryGodHuman = 0
        
        -- New
        local MasterySanguineArt = 0
        
        while getgenv().AutoMasteryFightingStyle do task.wait()
          local MaxMastery = getgenv().AutoMasteryValue
          
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          elseif VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          elseif VerifyTool("Superhuman") then
            MasterySuperhuman = GetToolLevel("Superhuman")
          elseif VerifyTool("Death Step") then
            MasteryDeathStep = GetToolLevel("Death Step")
          elseif VerifyTool("Electric Claw") then
            MasteryElectricClaw = GetToolLevel("Electric Claw")
          elseif VerifyTool("Sharkman Karate") then
            MasterySharkmanKarate = GetToolLevel("Sharkman Karate")
          elseif VerifyTool("Dragon Talon") then
            MasteryDragonTalon = GetToolLevel("Dragon Talon")
          elseif VerifyTool("Godhuman") then
            MasteryGodHuman = GetToolLevel("Godhuman")
          elseif VerifyTool("Sanguine Art") then
            MasterySanguineArt = GetToolLevel("Sanguine Art")
          end
          
          if MasteryBlackLeg < MaxMastery then
            if not VerifyTool("Black Leg") then
              BuyFightStyle("BuyBlackLeg")
            else
              EquipToolName("Black Leg")
            end
          elseif MasteryElectro < MaxMastery then
            if not VerifyTool("Electro") then
              BuyFightStyle("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryFishmanKarate < MaxMastery then
            if not VerifyTool("Fishman Karate") then
              BuyFightStyle("BuyFishmanKarate")
            else
              EquipToolName("Fishman Karate")
            end
          elseif MasteryDragonClaw < MaxMastery then
            if not VerifyTool("Dragon Claw") then
              FireRemote("BlackbeardReward","DragonClaw","1")
              FireRemote("BlackbeardReward","DragonClaw","2")
            else
              EquipToolName("Dragon Claw")
            end
          elseif MasterySuperhuman < MaxMastery then
            if not VerifyTool("Superhuman") then
              BuyFightStyle("BuySuperhuman")
            else
              EquipToolName("Superhuman")
            end
          elseif MasteryDeathStep < MaxMastery then
            if not VerifyTool("Death Step") then
              BuyFightStyle("BuyDeathStep")
            else
              EquipToolName("Death Step")
            end
          elseif MasteryElectricClaw < MaxMastery then
            if not VerifyTool("Electric Claw") then
              BuyFightStyle("BuyElectricClaw")
            else
              EquipToolName("Electric Claw")
            end
          elseif MasterySharkmanKarate < MaxMastery then
            if not VerifyTool("Sharkman Karate") then
              BuyFightStyle("BuySharkmanKarate")
            else
              EquipToolName("Sharkman Karate")
            end
          elseif MasteryDragonTalon < MaxMastery then
            if not VerifyTool("Dragon Talon") then
              BuyFightStyle("BuyDragonTalon")
            else
              EquipToolName("Dragon Talon")
            end
          elseif MasteryGodHuman < MaxMastery then
            if not VerifyTool("Godhuman") then
              BuyFightStyle("BuyGodhuman")
            else
              EquipToolName("Godhuman")
            end
          elseif MasterySanguineArt < MaxMastery then
            if not VerifyTool("Sanguine Art") then
              BuyFightStyle("BuySanguineArt")
            else
              EquipToolName("Sanguine Art")
            end
          end
          
          if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone and not getgenv().AutoFarmEctoplasm then
            local Enemie = GetProxyNPC()
         
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
               if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
end
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
            else
              PlayerTP(CFrame.new(-9513, 164, 5786))
            end
          end
        end
      end)
    end
  }))
end

if Sea1 or Sea2 or Sea3 then
QuestsTabs:AddSection({"Observation"})
local ObservationRange = QuestsTabs:AddParagraph({""})
spawn(function()
	while wait() do
		pcall(function()
			ObservationRange:SetTitle("Observation Range : " .. math.floor((game:GetService("Players")).LocalPlayer.VisionRadius.Value));
		end);
	end;
end);

QuestsTabs:AddToggle({
    Name = "Auto Farm Observation",
    Callback = function(Value)
      getgenv().UpAutoObservation = Value
    end
  })
  
spawn(function()
	while wait() do
		pcall(function()
			if getgenv().UpAutoObservation then
				repeat task.wait()
					if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
						game:GetService('VirtualUser'):CaptureController()
						game:GetService('VirtualUser'):SetKeyDown('0x65')
						wait(2)
						game:GetService('VirtualUser'):SetKeyUp('0x65')
					end
				until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not getgenv().UpAutoObservation
			end
		end)
	end
end)

spawn(function()
	pcall(function()
		while wait() do
			if getgenv().UpAutoObservation then
				if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
	Fluent:Notify({
		Title = "Apsara Hub",
		Content = "You Got Max Already!",
		SubContent = "",
		Duration = 3
	})
					wait(2)
				else
					if Sea2 then
						if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
							if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat task.wait()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
								until getgenv().UpAutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							else
								repeat task.wait()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
								until getgenv().UpAutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							PlayerTP(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
						end
					elseif Sea1 then
						if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
							if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat task.wait()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
								until getgenv().UpAutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							else
								repeat task.wait()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
								until getgenv().UpAutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							PlayerTP(CFrame.new(5533.29785, 88.1079102, 4852.3916))
						end
					elseif Sea3 then
						if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
							if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								repeat task.wait()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
								until getgenv().UpAutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							else
								repeat task.wait()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
								until getgenv().UpAutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
							end
						else
							PlayerTP(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
						end
					end
				end
			end
		end
	end)
end)
end

if Sea3 then
QuestsTabs:AddToggle({
    Name = "Auto Ken Haki V2",
    Callback = function(Value)
      getgenv().AutoKenV2 = Value
      AutoKenV2()
    end
  })
  
QuestsTabs:AddSection({"Musketeer Hat"})
  QuestsTabs:AddToggle({
    Name = "Auto Musketeer Hat",
    Callback = function(Value)
      getgenv().AutoMusketeerHat = Value
      AutoMusketeerHat()
    end
  })

QuestsTabs:AddSection({"Arena Trainer"})
QuestsTabs:AddToggle({
	Name = "Auto Arena Trainer",
	Default = false,
	Callback = function(Value)
		getgenv().Aren = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().Aren then

pcall(function()

if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ArenaTrainer")
end
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Training Dummy" then
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
PlayerTP(v.HumanoidRootPart.CFrame)
end
end
end
if not game.Workspace.Enemies:FindFirstChild("Training Dummy") then
PlayerTP(CFrame.new(3758, 92, 254))
end
end


 end)

end

end

end)

end)
  end

if Sea3 or Sea2 then
QuestsTabs:AddSection({"Haki Color"})
local ColorHaki = QuestsTabs:AddParagraph({""})
local KuyMassDa = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1")
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1") then
                ColorHaki:SetTitle("Haki Dealer is Selling : "..(KuyMassDa))
            else
                ColorHaki:SetTitle("Not Found Haki Dealer")
            end
        end
    end)
end)
table.insert(AFKOptions, QuestsTabs:AddToggle({
  Name = "Auto Buy Haki Color",
  Flag = "Buy/HakiColor",
  Callback = function(Value)
    getgenv().AutoBuyHakiColor = Value
    task.spawn(function()
      while getgenv().AutoBuyHakiColor do task.wait(0.5)
        pcall(function()
          FireRemote("ColorsDealer", "1")
          FireRemote("ColorsDealer", "2")
        end)
      end
    end)
  end
}))
end

if Sea3 then
  QuestsTabs:AddToggle({
    Name = "Auto Rainbow Haki",
    Callback = function(Value)
      getgenv().AutoRainbowHaki = Value
      AutoRainbowHaki()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Rainbow Haki HOP",
    Callback = function(Value)
      getgenv().RainbowHakiHop = Value
    end
  })
end

Teleport:AddSection({"Teleport to Sea"})

Teleport:AddButton({
  Name = "Teleport to Sea 1",
  Callback = function()
    FireRemote("TravelMain")
  end
})

Teleport:AddButton({
  Name = "Teleport to Sea 2",
  Callback = function()
    FireRemote("TravelDressrosa")
  end
})

Teleport:AddButton({
  Name = "Teleport to Sea 3",
  Callback = function()
    FireRemote("TravelZou")
  end
})

Teleport:AddSection({"Islands"})

local IslandsList = {}

if Sea1 then
  IslandsList = {
    "WindMill",
    "Marine",
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Snow Island",
    "MarineFord",
    "Colosseum",
    "Sky Island 1",
    "Sky Island 2",
    "Sky Island 3",
    "Prison",
    "Magma Village",
    "Under Water Island",
    "Fountain City"
  }
elseif Sea2 then
  IslandsList = {
    "The Cafe",
    "Frist Spot",
    "Dark Area",
    "Flamingo Mansion",
    "Flamingo Room",
    "Green Zone",
    "Zombie Island",
    "Two Snow Mountain",
    "Punk Hazard",
    "Cursed Ship",
    "Ice Castle",
    "Forgotten Island",
    "Ussop Island"
  }
elseif Sea3 then
  IslandsList = {
    "Mansion",
    "Port Town",
    "Great Tree",
    "Castle On The Sea",
    "Hydra Island",
    "Floating Turtle",
    "Haunted Castle",
    "Ice Cream Island",
    "Peanut Island",
    "Cake Island",
    "Candy Cane Island",
    "Tiki Outpost"
  }
end

Teleport:AddDropdown({
  Name = "Select Island",
  Options = IslandsList,
  Default = "",
  Callback = function(Value)
    getgenv().TeleportIslandSelect = Value
  end
})
local TPToggle = Teleport:AddToggle({Name = "Teleport To Island",Callback = function(Value)
  getgenv().TeleportToIsland = Value
  task.spawn(function()
    while getgenv().TeleportToIsland do task.wait()
      local Island = getgenv().TeleportIslandSelect
      if Sea1 then
        -- Sea 1 Teleports
        if Island == "Middle Town" then
          PlayerTP(CFrame.new(-688, 15, 1585))
        elseif Island == "MarineFord" then
          PlayerTP(CFrame.new(-4810, 21, 4359))
        elseif Island == "Marine" then
          PlayerTP(CFrame.new(-2728, 25, 2056))
        elseif Island == "WindMill" then
          PlayerTP(CFrame.new(889, 17, 1434))
        elseif Island == "Desert" then
          PlayerTP(CFrame.new(1191, 11, 4302))
        elseif Island == "Snow Island" then
          PlayerTP(CFrame.new(1298, 87, -1344))
        elseif Island == "Pirate Village" then
          PlayerTP(CFrame.new(-1173, 45, 3837))
        elseif Island == "Jungle" then
          PlayerTP(CFrame.new(-1614, 37, 146))
        elseif Island == "Prison" then
          PlayerTP(CFrame.new(4870, 6, 736))
        elseif Island == "Under Water Island" then
          PlayerTP(CFrame.new(61164, 5, 1820))
        elseif Island == "Colosseum" then
          PlayerTP(CFrame.new(-1535, 7, -3014))
        elseif Island == "Magma Village" then
          PlayerTP(CFrame.new(-5290, 9, 8349))
        elseif Island == "Sky Island 1" then
          PlayerTP(CFrame.new(-4814, 718, -2551))
        elseif Island == "Sky Island 2" then
          PlayerTP(CFrame.new(-4652, 873, -1754))
        elseif Island == "Sky Island 3" then
          PlayerTP(CFrame.new(-7895, 5547, -380))
        elseif Island == "Fountain City" then
          PlayerTP(CFrame.new(5226, 39, 4055))
        end
      elseif Sea2 then
        -- Sea 2 Teleports
        if Island == "The Cafe" then
          PlayerTP(CFrame.new(-382, 73, 290))
        elseif Island == "Frist Spot" then
          PlayerTP(CFrame.new(-11, 29, 2771))
        elseif Island == "Dark Area" then
          PlayerTP(CFrame.new(3494, 13, -3259))
        elseif Island == "Flamingo Mansion" then
          PlayerTP(CFrame.new(-317, 331, 597))
        elseif Island == "Flamingo Room" then
          PlayerTP(CFrame.new(2285, 15, 905))
        elseif Island == "Green Zone" then
          PlayerTP(CFrame.new(-2258, 73, -2696))
        elseif Island == "Zombie Island" then
          PlayerTP(CFrame.new(-5552, 194, -776))
        elseif Island == "Two Snow Mountain" then
          PlayerTP(CFrame.new(752, 408, -5277))
        elseif Island == "Punk Hazard" then
          PlayerTP(CFrame.new(-5897, 18, -5096))
        elseif Island == "Cursed Ship" then
          PlayerTP(CFrame.new(919, 125, 32869))
        elseif Island == "Ice Castle" then
          PlayerTP(CFrame.new(5505, 40, -6178))
        elseif Island == "Forgotten Island" then
          PlayerTP(CFrame.new(-3050, 240, -10178))
        elseif Island == "Ussop Island" then
          PlayerTP(CFrame.new(4816, 8, 2863))
        end
      elseif Sea3 then
        -- Sea 3 Teleports
        if Island == "Mansion" then
          PlayerTP(CFrame.new(-12471, 374, -7551))
        elseif Island == "Port Town" then
          PlayerTP(CFrame.new(-334, 7, 5300))
        elseif Island == "Castle On The Sea" then
          PlayerTP(CFrame.new(-5073, 315, -3153))
        elseif Island == "Hydra Island" then
          PlayerTP(CFrame.new(5756, 610, -282))
        elseif Island == "Great Tree" then
          PlayerTP(CFrame.new(2681, 1682, -7190))
        elseif Island == "Floating Turtle" then
          PlayerTP(CFrame.new(-12528, 332, -8658))
        elseif Island == "Haunted Castle" then
          PlayerTP(CFrame.new(-9517, 142, 5528))
        elseif Island == "Ice Cream Island" then
          PlayerTP(CFrame.new(-902, 79, -10988))
        elseif Island == "Peanut Island" then
          PlayerTP(CFrame.new(-2062, 50, -10232))
        elseif Island == "Cake Island" then
          PlayerTP(CFrame.new(-1897, 14, -11576))
        elseif Island == "Candy Cane Island" then
          PlayerTP(CFrame.new(-1038, 10, -14076))
        elseif Island == "Tiki Outpost" then
          PlayerTP(CFrame.new(-16224, 9, 439))
        end
      end
    end
  end)
end})

TPToggle:Callback(function(Value)
  if Value then
    local Mag = math.huge
    repeat task.wait()
      local plrPP = Player.Character and Player.Character.PrimaryPart
      if plrPP then
        Mag = (plrPP.Position - TeleportPos).Magnitude
      end
    until not getgenv().TeleportToIsland or Mag < 15
    TPToggle:Set(false)
  end
end)

local Temas = Misc:AddSection({Name = "Themes"})
local Tema = Misc:AddDropdown({
	Name = "Select",
	Description = "Select <font color='rgb(253, 218, 13)'>Theme</font>",
	Options = {"Dark +", "Dark", "Clear", "Purple", "Red", "Yellow", "Green", "Pink", "Blue"},
	Default = "",
	Flag = "Tema",
	Callback = function(Value)
		redzlib:SetTheme(Value)
	end
})

Misc:AddSection({"Configs"})
Misc:AddDropdown({
	Name = "Select Fast Attack Type",
	Options = {"Slow", "Normal" , "Fast"},
	Default = "Normal",
	Flag = "NahMakmafadtkwmlaakfnkr",
	Callback = function(Value)
		getgenv().FastAttackMethod = Value
	end
})
Misc:AddSlider({"Farm Distance", 5, 30, 1, 20, function(Value)
  getgenv().FarmPos = Vector3.new(0, Value or 15, Value or 10)getgenv().FarmDistance = Value
end, "Misc/FarmDistance"})
Misc:AddSlider({"Tween Speed", 50, 400, 5, 170, function(Value)
  getgenv().TweenSpeed = Value
end, "Misc/TweenSpeed"})
Misc:AddSlider({"Bring Mobs Distance", 50, 500, 10, 250, function(Value)
  getgenv().BringMobsDistance = Value or 250
end, "Misc/BringMobsDistance"})
Misc:AddSlider({"Auto Click Delay", 0.1, 1, 0.01, 0.2, function(Value)
  getgenv().AutoClickDelay = Value
end, "Misc/AutoClickDelay"})
Misc:AddToggle({"Fast Attack", true, function(Value)
  getgenv().FastAttack = Value
end, "Misc/FastAttack"})
Misc:AddToggle({"Increase Attack Distance", true, function(Value)
  getgenv().AttackDistance = Value
  task.spawn(AttackDistance)
end, "Misc/IncreaseAttackDistance"})
Misc:AddToggle({"Auto Click", true, function(Value)
  getgenv().AutoClick = Value
end, "Misc/AutoClick"})
Misc:AddToggle({"Bring Mobs", true, function(Value)
  getgenv().BringMobs = Value
end, "Misc/BringMobs"})
Misc:AddToggle({"Auto Haki", true, function(Value)
  getgenv().AutoHaki = Value
end, "Misc/AutoHaki"})
Misc:AddToggle({
	Name = "Auto Ken",
	Default = true,
	Callback = function(Value)
		getgenv().EnableKen = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EnableKen then

pcall(function()


if
                                game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and
                                    game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                             then
                            else
                                wait(1)
                                game:service("VirtualUser"):CaptureController()
                                game:service("VirtualUser"):SetKeyDown("0x65")
                                wait(2)
                                game:service("VirtualUser"):SetKeyUp("0x65")
                            end


 end)

end

end

end)

end)

Misc:AddToggle({
	Name = "Auto Turn On V3",
	Default = false,
	Callback = function(Value)
		getgenv().EnableV3 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EnableV3 then

pcall(function()


game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")



 end)

end

end

end)

end)

Misc:AddToggle({
	Name = "Auto Turn On V4",
	Default = false,
	Callback = function(Value)
		getgenv().EnableV4 = Value
	end
})

spawn(function()

pcall(function()

while wait() do

if getgenv().EnableV4 then

pcall(function()


local args = {
    [1] = true
}

game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack(args))



 end)

end

end

end)

end)

Misc:AddSection({"Codes"})
Misc:AddButton({
  Name = "Redeem all Codes",
  Callback = function()
    local Codes = {
      "REWARDFUN",
      "Chandler",
      "NEWTROLL",
      "KITT_RESET",
      "Sub2CaptainMaui",
      "DEVSCOOKING",
      "kittgaming",
      "Sub2Fer999",
      "Enyu_is_Pro",
      "Magicbus",
      "JCWK",
      "Starcodeheo",
      "Bluxxy",
      "fudd10_v2",
      "SUB2GAMERROBOT_EXP1",
      "Sub2NoobMaster123",
      "Sub2UncleKizaru",
      "Sub2Daigrock",
      "Axiore",
      "TantaiGaming",
      "StrawHatMaine",
      "Sub2OfficialNoobie",
      "Fudd10",
      "Bignews",
      "TheGreatAce",
      "DRAGONABUSE",
      "SECRET_ADMIN",
      "ADMIN_TROLL",
      "STAFFBATTLE",
      "ADMIN_STRENGTH",
      "JULYUPDATE_RESET",
      "NOOB_REFUND",
      "15B_BESTBROTHERS",
      "CINCODEMAYO_BOOST",
      "ADMINGIVEAWAY",
      "GAMER_ROBOT_1M",
      "SUBGAMERROBOT_RESET",
      "SUB2GAMERROBOT_RESET1",
      "GAMERROBOT_YT",
      "TY_FOR_WATCHING",
      "EXP_5B",
      "RESET_5B",
      "UPD16",
      "3BVISITS",
      "2BILLION",
      "UPD15",
      "THIRDSEA",
      "1MLIKES_RESET",
      "UPD14",
      "1BILLION",
      "ShutDownFix2",
      "XmasExp",
      "XmasReset",
      "Update11",
      "PointsReset",
      "Update10",
      "Control",
      "SUB2OFFICIALNOOBIE",
      "AXIORE",
      "BIGNEWS",
      "BLUXXY",
      "CHANDLER",
      "ENYU_IS_PRO",
      "FUDD10",
      "FUDD10_V2",
      "KITTGAMING",
      "MAGICBUS",
      "STARCODEHEO",
      "STRAWHATMAINE",
      "SUB2CAPTAINMAUI",
      "SUB2DAIGROCK",
      "SUB2FER999",
      "SUB2NOOBMASTER123",
      "SUB2UNCLEKIZARU",
      "TANTAIGAMING",
      "THEGREATACE",
      "CONTROL",
      "UPDATE11",
      "XMASEXP",
      "Colosseum"
    }
    
    for _,code in pairs(Codes) do
      task.spawn(function()ReplicatedStorage.Remotes.Redeem:InvokeServer(code)end)
    end
  end
})

Misc:AddSection({"Team"})
Misc:AddButton({"Join Pirates Team", function()
  FireRemote("SetTeam", "Pirates")
end})
Misc:AddButton({"Join Marines Team", function()
  FireRemote("SetTeam", "Marines")
end})
Misc:AddSection({"Menu"})

Misc:AddButton({"Devil Fruit Shop", function()
  FireRemote("GetFruits")
	Player.PlayerGui.Main.FruitShop.Visible = true
end})

Misc:AddButton({"Titles", function()
  FireRemote("getTitles")
  Player.PlayerGui.Main.Titles.Visible = true
end})

Misc:AddButton({"Haki Color", function()
  Player.PlayerGui.Main.Colors.Visible = true
end})

Misc:AddSection({"Player"})
local Slider = Misc:AddSlider({
  Name = "Jump",
  MinValue = 50,
  MaxValue = 300,
  Default = 0,
  Increase = 1,
  Callback = function(value)
    getgenv().Jumppower = value
    pcall(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
    end)
  end
})

Misc:AddToggle({
  Name = "Loop Jump",
  Callback = function(state)
getgenv().loopJ = state
    game:GetService("RunService").Heartbeat:Connect(function()
        if loopJ == true then
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Jumppower
            end)
        end
    end)
 end
})

Misc:AddSection({"Visual"})
Misc:AddButton({"Remove Fog", function()
game:GetService("Lighting").LightingLayers:Destroy()
	game:GetService("Lighting").Sky:Destroy()
	game.Lighting.FogEnd = 9000000000
end})
Misc:AddButton({"Remove Lava", function()
	for i, v in pairs(game.Workspace:GetDescendants()) do
		if v.Name == "Lava" then
			v:Destroy()
		end
	end
	for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
		if v.Name == "Lava" then
			v:Destroy()
		end
	end
end})

Misc:AddSection({"Server"})
local JobAiDee = Misc:AddParagraph({"Job ID"})
spawn(function()
        while wait() do
            pcall(function()
                JobAiDee:Set("Job ID :".." "..game.JobId)
            end)
        end
    end)
Misc:AddTextBox({Name = "Input Job Id",Default = "",PlaceholderText = "Job ID",Callback = function(Value)
  ServerId = Value
end})
Misc:AddButton({
	Name = "Join Server",
	Callback = function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,ServerId, game.Players.LocalPlayer)
	end
})
Misc:AddButton({
	Name = "Copy JobID",
	Callback = function()
		setclipboard(tostring(game.JobId))
	end
})
Misc:AddButton({
	Name = "Rejoin",
	Callback = function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)  
	end
})
Misc:AddButton({
  Name = "Server Hop",
  Callback = function()
    ServerHop()
  end
})

Misc:AddSection({"More FPS"})
Misc:AddToggle({"Remove Damage", true, function(Value)
  ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = not Value
end, "Misc/RemoveDamage"})
table.insert(AFKOptions, Misc:AddToggle({"Remove Notifications", false, function(Value)
  Player.PlayerGui.Notifications.Enabled = not Value
end, "Misc/RemoveNotifications"}))

Misc:AddSection({"Others"})

Misc:AddToggle({"Walk On Water", true, function(Value)
  getgenv().WalkOnWater = Value
  task.spawn(function()
    local Map = workspace:WaitForChild("Map", 9e9)
    
    while getgenv().WalkOnWater do task.wait(0.1)
      Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 113, 1000)
    end
    Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 80, 1000)
  end)
end, "Misc/WalkOnWater"})
Misc:AddToggle({"Anti AFK", true, function(Value)
  getgenv().AntiAFK = Value
  task.spawn(function()
    while getgenv().AntiAFK do
      VirtualUser:CaptureController()
      VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))task.wait(600)
    end
  end)
end, "Misc/AntiAFK"})

--[[Shop:AddSection({"Christmas"})
Shop:AddButton({"Buy 2x EXP (15 mins.) < 50 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 1, 1)end})
Shop:AddButton({"Stats Refund < 75 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 1, 2)end})
Shop:AddButton({"Race Reroll < 100 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 1, 3)end})
Shop:AddSection({""})
Shop:AddButton({"Buy 200 Frags < 50 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 2, 2)end})
Shop:AddButton({"Buy 500 Frags < 100 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 2, 2)end})]]
--[[Shop:AddSection({"Bones"})
Shop:AddButton({"Buy Surprise < 50 Bones >", function()FireRemote("Bones", "Buy", 1, 1)end})
Shop:AddButton({"Stats Refund < 150 Bones >", function()FireRemote("Bones", "Buy", 1, 2)end})
Shop:AddButton({"Race Reroll < 300 Bones >", function()FireRemote("Bones", "Buy", 1, 3)end})]]
Shop:AddSection({"Ectoplasm"})
Shop:AddButton({"Midnight Blade", function()end})
Shop:AddButton({"Bizarre Rifle", function()end})
Shop:AddButton({"Midnight Blade", function()end})
Shop:AddSection({"Frags"})
Shop:AddButton({"Race Rerol", function()
FireRemote("BlackbeardReward", "Reroll", "1")FireRemote("BlackbeardReward", "Reroll", "2")end})
Shop:AddButton({"Reset Stats", function()
FireRemote("BlackbeardReward", "Refund", "1")FireRemote("BlackbeardReward", "Refund", "2")end})
Shop:AddSection({"Fighting Style"})
Shop:AddButton({"Buy Black Leg", function()FireRemote("BuyBlackLeg")end})
Shop:AddButton({"Buy Electro", function()FireRemote("BuyElectro")end})
Shop:AddButton({"Buy Fishman Karate", function()FireRemote("BuyFishmanKarate")end})
Shop:AddButton({"Buy Dragon Claw", function()
FireRemote("BlackbeardReward","DragonClaw","1")FireRemote("BlackbeardReward","DragonClaw","2")end})
Shop:AddButton({"Buy Superhuman", function()FireRemote("BuySuperhuman")end})
Shop:AddButton({"Buy Death Step", function()FireRemote("BuyDeathStep")end})
Shop:AddButton({"Buy Sharkman Karate", function()FireRemote("BuySharkmanKarate")end})
Shop:AddButton({"Buy Electric Claw", function()FireRemote("BuyElectricClaw")end})
Shop:AddButton({"Buy Dragon Talon", function()FireRemote("BuyDragonTalon")end})
Shop:AddButton({"Buy GodHuman", function()FireRemote("BuyGodhuman")end})
Shop:AddButton({"Buy Sanguine Art", function()FireRemote("BuySanguineArt")end})
Shop:AddSection({"Ability Teacher"})
Shop:AddButton({"Buy Geppo", function()FireRemote("BuyHaki", "Geppo")end})
Shop:AddButton({"Buy Buso", function()FireRemote("BuyHaki", "Buso")end})
Shop:AddButton({"Buy Soru", function()FireRemote("BuyHaki", "Soru")end})
Shop:AddSection({"Sword"})
Shop:AddButton({"Buy Katana", function()FireRemote("BuyItem", "Katana")end})
Shop:AddButton({"Buy Cutlass", function()FireRemote("BuyItem", "Cutlass")end})
Shop:AddButton({"Buy Dual Katana", function()FireRemote("BuyItem", "Dual Katana")end})
Shop:AddButton({"Buy Iron Mace", function()FireRemote("BuyItem", "Iron Mace")end})
Shop:AddButton({"Buy Triple Katana", function()FireRemote("BuyItem", "Triple Katana")end})
Shop:AddButton({"Buy Pipe", function()FireRemote("BuyItem", "Pipe")end})
Shop:AddButton({"Buy Dual-Headed Blade", function()FireRemote("BuyItem", "Dual-Headed Blade")end})
Shop:AddButton({"Buy Soul Cane", function()FireRemote("BuyItem", "Soul Cane")end})
Shop:AddButton({"Buy Bisento", function()FireRemote("BuyItem", "Bisento")end})
Shop:AddSection({"Gun"})
Shop:AddButton({"Buy Musket", function()FireRemote("BuyItem", "Musket")end})
Shop:AddButton({"Buy Slingshot", function()FireRemote("BuyItem", "Slingshot")end})
Shop:AddButton({"Buy Flintlock", function()FireRemote("BuyItem", "Flintlock")end})
Shop:AddButton({"Buy Refined Slingshot", function()FireRemote("BuyItem", "Refined Slingshot")end})
Shop:AddButton({"Buy Refined Flintlock", function()FireRemote("BuyItem", "Refined Flintlock")end})
Shop:AddButton({"Buy Cannon", function()FireRemote("BuyItem", "Cannon")end})
Shop:AddButton({"Buy Kabucha", function()
FireRemote("BlackbeardReward", "Slingshot", "1")FireRemote("BlackbeardReward", "Slingshot", "2")end})
Shop:AddSection({"Accessories"})
Shop:AddButton({"Buy Black Cape", function()FireRemote("BuyItem", "Black Cape")end})
Shop:AddButton({"Buy Swordsman Hat", function()FireRemote("BuyItem", "Swordsman Hat")end})
Shop:AddButton({"Buy Tomoe Ring", function()FireRemote("BuyItem", "Tomoe Ring")end})
Shop:AddSection({"Race"})
Shop:AddButton({"Ghoul Race", function()FireRemote("Ectoplasm", "Change", 4)end})
Shop:AddButton({"Cyborg Race", function()FireRemote("CyborgTrainer", "Buy")end})

Visual:AddSection({"ESP"})
if Sea2 then
Visual:AddToggle({Name = "ESP Flowers",Callback = function(Value)
  getgenv().EspFlowers = Value;EspFlowers()
end})end
Visual:AddToggle({Name = "ESP Players",Callback = function(Value)
  getgenv().EspPlayer = Value;EspPlayer()
end})
Visual:AddToggle({Name = "ESP Fruits",Callback = function(Value)
  getgenv().EspFruits = Value;EspFruits()
end, Flag = "ESP/Fruits"})
Visual:AddToggle({Name = "ESP Chests",Callback = function(Value)
  getgenv().EspChests = Value;EspChests()
end})
Visual:AddToggle({Name = "ESP Islands",Callback = function(Value)
  getgenv().EspIslands = Value;EspIslands()
end})
  Visual:AddSection({"Troll"})
  Visual:AddButton({"Rain Fruit", function(value)
  for L_639_forvar0, L_640_forvar1 in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
			L_640_forvar1.Parent = game.Workspace.Map
			L_640_forvar1:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
			if L_640_forvar1.Fruit:FindFirstChild("AnimationController") then
				L_640_forvar1.Fruit:FindFirstChild("AnimationController"):LoadAnimation(L_640_forvar1.Fruit:FindFirstChild("Idle")):Play()
			end
			L_640_forvar1.Handle.Touched:Connect(function(L_641_arg0)
				if L_641_arg0.Parent == game.Players.LocalPlayer.Character then
					L_640_forvar1.Parent = game.Players.LocalPlayer.Backpack
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(L_640_forvar1)
				end
			end)
		end
  end})
Visual:AddButton({"INF Level", function(value)
local plr = game:GetService("Players").LocalPlayer
local Notification = require(game:GetService("ReplicatedStorage").Notification)
local Data = plr:WaitForChild("Data")
local EXPFunction = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
local LevelUp = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp)
local Sound = require(game:GetService("ReplicatedStorage").Util.Sound)
local LevelUpSound = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")
function v129(p15)
    local v130 = p15;
    while true do
        local v131, v132 = string.gsub(v130, "^(-?%d+)(%d%d%d)", "%1,%2");
        v130 = v131;
        if v132 == 0 then
            break;
        end;
    end;
    return v130;
end;

Notification.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
Notification.new("Earned <Color=Yellow>1,000,000,000,000 Exp.<Color=/> (+ None)"):Display()
Notification.new("Earned <Color=Green>$999,999,999,999<Color=/>"):Display()
plr.Data.Exp.Value = 999999999999
plr.Data.Beli.Value = plr.Data.Beli.Value + 999999999999

delay = 0
count = 0
while plr.Data.Exp.Value - EXPFunction(Data.Level.Value) > 0 do
    plr.Data.Exp.Value = plr.Data.Exp.Value - EXPFunction(Data.Level.Value)
    plr.Data.Level.Value = plr.Data.Level.Value + 1
    plr.Data.Points.Value = plr.Data.Points.Value + 3
    LevelUp({ plr })
    Sound.Play(Sound, LevelUpSound.Value)
    Notification.new("<Color=Green>LEVEL UP!<Color=/> (" .. plr.Data.Level.Value .. ")"):Display()
    count = count + 1
    if count >= 5 then
        delay = tick()
        count = 0
        wait()
    end
end
  end})
Visual:AddSection({"Divine Art"})
Visual:AddDropdown({
	Name = "Select Quest",
	Options = {"AngelQuest1", "AngelQuest2", "AngelQuest3", "AngelQuest4", "AngelQuest5", "AngelQuest6", "AngelQuest7", "AngelQuest8", "AngelQuest9"},
	Default = "",
	Flag = "Dialogangel",
	Callback = function(Value)
		getgenv().Dialog = Value 
	end
})
Visual:AddButton({
	Name = "Show Dialog Quest",
	Callback = function()
local function StartDialog(DialogName)
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local DialogueController = require(ReplicatedStorage.DialogueController)
  local DialoguesList = require(ReplicatedStorage.DialoguesList)
  
  for Index,Dialog in pairs(DialoguesList) do
    if tostring(Index) == DialogName then
      DialogueController.Start(DialogueController, Dialog)
    end
  end
end

StartDialog(getgenv().Dialog)
	end
})
Visual:AddButton({
	Name = "M1 Divine Art",
	Callback = function()
getupvalue(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework), 2).activeController.data = require(game:GetService("ReplicatedStorage").ClientWeapons).divineart
	end
})
Visual:AddSection({"Fake Race V4"})
Visual:AddButton({
	Name = "Mink Fake Transform",
	Callback = function()
require(game:GetService("ReplicatedStorage").Notification).new("Mink V4!"):Display();
 wait()
 setthreadcontext(5)
 local ReplicatedStorage = game:GetService("ReplicatedStorage")

 local Player = game:GetService("Players").LocalPlayer
 local ArgsTransform = {
  Character = game.Players.LocalPlayer.Character,
  CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
  Color1 = Color3.fromRGB(102, 255, 153),
  Color2 = Color3.fromRGB(102, 255, 153),
  Color3 = Color3.fromRGB(102, 255, 153),
 }
 Player.Character.Humanoid:LoadAnimation(ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform):Play()
 delay(1, function()

  pcall(function() require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(ArgsTransform) end)
  end)
	end
})
Visual:AddButton({
	Name = "Fishman Fake Transform",
	Callback = function()
require(game:GetService("ReplicatedStorage").Notification).new("Fishman V4!"):Display();

 wait()

 setthreadcontext(5)

 local ReplicatedStorage = game:GetService("ReplicatedStorage")

 local Player = game:GetService("Players").LocalPlayer

 local ArgsTransform = {
  Character = game.Players.LocalPlayer.Character,
  CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
  Color1 = Color3.fromRGB(5, 115, 166),
  Color2 = Color3.fromRGB(5, 115, 166),
  Color3 = Color3.fromRGB(5, 115, 166),
 }
 Player.Character.Humanoid:LoadAnimation(ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform):Play()
 delay(1, function()
  pcall(function() require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(ArgsTransform) end)
  end)
	end
})
Visual:AddButton({
	Name = "Skypeian Fake Transform",
	Callback = function()
require(game:GetService("ReplicatedStorage").Notification).new("Skypeian V4!"):Display();

 wait()

 setthreadcontext(5)

 local ReplicatedStorage = game:GetService("ReplicatedStorage")

 local Player = game:GetService("Players").LocalPlayer

 local ArgsTransform = {
  Character = game.Players.LocalPlayer.Character,
  CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
  Color1 = Color3.fromRGB(222, 222, 0),
  Color2 = Color3.fromRGB(222, 222, 0),
  Color3 = Color3.fromRGB(222, 222, 0),
 }

 Player.Character.Humanoid:LoadAnimation(ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform):Play()

 delay(1, function()

  pcall(function() require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(ArgsTransform) end)
  end)
	end
})
Visual:AddButton({
	Name = "Ghoul Fake Transform",
	Callback = function()
require(game:GetService("ReplicatedStorage").Notification).new("Ghoul V4!"):Display();

 wait()

 setthreadcontext(5)

 local ReplicatedStorage = game:GetService("ReplicatedStorage")

 local Player = game:GetService("Players").LocalPlayer

 local ArgsTransform = {
  Character = game.Players.LocalPlayer.Character,
  CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
  Color1 = Color3.fromRGB(155, 155, 155),
  Color2 = Color3.fromRGB(0, 0, 0),
  Color3 = Color3.fromRGB(155, 155, 155),
 }
 Player.Character.Humanoid:LoadAnimation(ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform):Play()
 delay(1, function()
  pcall(function() require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(ArgsTransform) end)
  end)
	end
})
Visual:AddButton({
	Name = "Cyborg Fake Transform",
	Callback = function()
require(game:GetService("ReplicatedStorage").Notification).new("Cyborg V4!"):Display();

 wait()

 setthreadcontext(5)

 local ReplicatedStorage = game:GetService("ReplicatedStorage")

 local Player = game:GetService("Players").LocalPlayer

 local ArgsTransform = {
  Character = game.Players.LocalPlayer.Character,
  CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
  Color1 = Color3.fromRGB(166, 0, 111),
  Color2 = Color3.fromRGB(166, 0, 111),
  Color3 = Color3.fromRGB(166, 0, 111),
 }
 Player.Character.Humanoid:LoadAnimation(ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform):Play()

 delay(1, function()

  pcall(function() require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(ArgsTransform) end)
  end)
	end
})
Visual:AddButton({
	Name = "Human Fake Transform",
	Callback = function()
require(game:GetService("ReplicatedStorage").Notification).new("Human V4!"):Display();

 wait()

 setthreadcontext(5)

 local ReplicatedStorage = game:GetService("ReplicatedStorage")

 local Player = game:GetService("Players").LocalPlayer

 local ArgsTransform = {
  Character = game.Players.LocalPlayer.Character,
  CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,
  Color1 = Color3.fromRGB(166, 0, 0),
  Color2 = Color3.fromRGB(166, 0, 0),
  Color3 = Color3.fromRGB(166, 0, 0),
 }

 Player.Character.Humanoid:LoadAnimation(ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform):Play()

 delay(1, function()

  pcall(function() require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(ArgsTransform) end)
  end)
	end
})
Visual:AddSection({"Fake"})
Visual:AddParagraph({"Fake Stats"})
Visual:AddTextBox({Name = "Fake Defense",Default = "",PlaceholderText = "Defense",Callback = function(Value)
  Player.Data.Stats.Defense.Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Fruit",Default = "",PlaceholderText = "Fruit",Callback = function(Value)
  Player.Data.Stats["Demon Fruit"].Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Gun",Default = "",PlaceholderText = "Gun",Callback = function(Value)
  Player.Data.Stats.Gun.Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Melee",Default = "",PlaceholderText = "Melee",Callback = function(Value)
  Player.Data.Stats.Melee.Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Sword",Default = "",PlaceholderText = "Sword",Callback = function(Sword)
  Player.Data.Stats.Sword.Level.Value = Value
end})
Visual:AddParagraph({"Fake Mode"})
Visual:AddTextBox({Name = "Fake Level",Default = "",PlaceholderText = "Level",Callback = function(Value)
  PlayerLevel.Value = Value
end})
Visual:AddTextBox({Name = "Fake Points",Default = "",PlaceholderText = "Points",Callback = function(Value)
  Player.Data.Points.Value = Value
end})
Visual:AddTextBox({Name = "Fake Bounty",Default = "",PlaceholderText = "Bounty",Callback = function(Value)
  Player.leaderstats["Bounty/Honor"].Value = Value
end})
Visual:AddTextBox({Name = "Fake Energy",Default = "",PlaceholderText = "Energy",Callback = function(Value)
  local plrEnergy = Player and Player.Character and Player.Character:FindFirstChild("Energy")
  if plrEnergy then
    plrEnergy.Max = Value
    plrEnergy.Value = Value
  end
end})
Visual:AddTextBox({Name = "Fake Health",Default = "",PlaceholderText = "Health",Callback = function(Value)
  local plrHealth = Player and Player.Character and Player.Character:FindFirstChild("Humanoid")
  if plrHealth then
    plrHealth.MaxHealth = Value
    plrHealth.Health = Value
  end
end})
Visual:AddTextBox({Name = "Fake Money",Default = "",PlaceholderText = "Money",Callback = function(Value)
  Player.Data.Beli.Value = Value
end})
Visual:AddTextBox({Name = "Fake Fragments",Default = "",PlaceholderText = "Fragments",Callback = function(Value)
  Player.Data.Fragments.Value = Value
end})

task.spawn(function()
  local EffectContainer = ReplicatedStorage:WaitForChild("Effect", 9e9):WaitForChild("Container", 9e9)
  
  RunService.RenderStepped:Connect(function()
    local DeathEffect = EffectContainer:FindFirstChild("Death")
    
    if DeathEffect then
      DeathEffect:Destroy()
    end
  end)
  
  hookfunction(error, function()end)
  hookfunction(warn, function()end)
end)

_G.ResetFlags = true
spawn(function()
	while wait() do
		pcall(function()
			if _G.ResetFlags then
				for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
					if v:IsA("LocalScript") then
						if v.Name == "General" or v.Name == "Shiftlock" or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
							v:Destroy();
						end;
					end;
				end;
				for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
					if v:IsA("LocalScript") then
						if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans" or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp" or v.Name == "PlayerList" then
							v:Destroy();
						end;
					end;
				end;
			end;
		end);
	end;
end);

task.spawn(function()
	Fluent:Notify({
		Title = "Apsara Hub",
		Content = "Apsara Hub Loaded!",
		SubContent = "",
		Duration = 3
	})
end)
