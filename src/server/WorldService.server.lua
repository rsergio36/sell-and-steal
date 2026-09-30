local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local world = Workspace:FindFirstChild("SellAndStealWorld")
if world then
	world:Destroy()
end

world = Instance.new("Folder")
world.Name = "SellAndStealWorld"
world.Parent = Workspace

local function part(name, size, position, material)
	local p = Instance.new("Part")
	p.Name = name
	p.Size = size
	p.Position = position
	p.Anchored = true
	p.Material = material or Enum.Material.SmoothPlastic
	p.Parent = world
	return p
end

local ground = part("Island", Vector3.new(180, 2, 180), Vector3.new(0, -1, 0), Enum.Material.Grass)

local spawn = Instance.new("SpawnLocation")
spawn.Name = "MainSpawn"
spawn.Size = Vector3.new(8, 1, 8)
spawn.Position = Vector3.new(0, 1, 0)
spawn.Anchored = true
spawn.Neutral = true
spawn.Parent = world

local center = part("Market", Vector3.new(26, 2, 26), Vector3.new(0, 1, 0), Enum.Material.Wood)

local positions = {
	Vector3.new(-55, 2, -55),
	Vector3.new(55, 2, -55),
	Vector3.new(-55, 2, 55),
	Vector3.new(55, 2, 55),
	Vector3.new(0, 2, -65),
	Vector3.new(0, 2, 65),
}

for i, position in ipairs(positions) do
	local plot = part("Plot_" .. i, Vector3.new(28, 1, 28), position, Enum.Material.SmoothPlastic)
	plot:SetAttribute("PlotId", i)

	local sign = part("PlotSign_" .. i, Vector3.new(10, 4, 1), position + Vector3.new(0, 3, -14), Enum.Material.Wood)
	sign:SetAttribute("PlotId", i)
end
