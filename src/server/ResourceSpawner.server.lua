local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Config"))

local world = Workspace:WaitForChild("SellAndStealWorld")
local resources = Instance.new("Folder")
resources.Name = "Resources"
resources.Parent = world

local positions = {
	Vector3.new(-20, 3, -20), Vector3.new(20, 3, -20),
	Vector3.new(-20, 3, 20), Vector3.new(20, 3, 20),
	Vector3.new(-35, 3, 0), Vector3.new(35, 3, 0),
	Vector3.new(0, 3, -35), Vector3.new(0, 3, 35),
}

local function spawnResource(index, position)
	local rarity = "Common"
	local p = Instance.new("Part")
	p.Name = "Loot_" .. index
	p.Shape = Enum.PartType.Ball
	p.Size = Vector3.new(4, 4, 4)
	p.Position = position
	p.Anchored = true
	p.CanCollide = false
	p.Material = Enum.Material.Neon
	p:SetAttribute("Rarity", rarity)
	p.Parent = resources

	local prompt = Instance.new("ProximityPrompt")
	p.ActionText = "Recoger"
	p.ObjectText = "Loot Común"
	p.HoldDuration = 0
	p.MaxActivationDistance = 10
	p.Parent = p

	prompt.Triggered:Connect(function(player)
		local event = ReplicatedStorage:WaitForChild("CollectResource")
		event:FireServer()
	end)
end

for i, position in ipairs(positions) do
	spawnResource(i, position)
end
